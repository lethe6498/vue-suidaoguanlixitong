import requests
import os
import re
from urllib.parse import urljoin, urlparse
import json
from bs4 import BeautifulSoup

def download_video(url, output_dir="videos"):
    """下载视频的主函数"""
    
    # 创建输出目录
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    
    # 设置请求头和cookies
    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Language': 'zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3',
        'Accept-Encoding': 'gzip, deflate',
        'Connection': 'keep-alive',
        'Upgrade-Insecure-Requests': '1',
        'Referer': 'https://www.itbaizhan.com/',
    }
    
    # 设置cookies
    cookies = {
        'revisit': '1761487563945',
        '_uab_collina': '176148797937495566927866',
        'PHPSESSID': '91hnaeppmegdsq7dIrqaiep3g5',
        'token': 'BA6C5F56DA1FABB288132D5835549F6C',
        'user': 'a%3A6%3A%7Bs%3A2%3A%22id%22%3Bs%3A32%3A%221f6a8f5c97cb7abdd641db8d34d0ecd4%22%3Bs%3A5%3A%22phone%22%3Bs%3A11%3А%2218669753323%22%3Bs%3A5%3A%22local%22%3Bs%3А1%3A%220%22%3Bs%3A8%3A%22nickname%22%3Bs%3А3%3А%22%E8%B6%85%22%3Bs%3A3%3A%22vip%22%3Bs%3A1%3A%220%22%3Bs%3A7%3A%22message%22%3Bi%3A0%3B%7D'
    }
    
    print(f"正在获取页面: {url}")
    
    try:
        # 创建session来保持cookies
        session = requests.Session()
        session.headers.update(headers)
        session.cookies.update(cookies)
        
        # 获取页面内容
        response = session.get(url)
        response.raise_for_status()
        
        print(f"页面获取成功，状态码: {response.status_code}")
        
        # 使用BeautifulSoup解析HTML
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # 查找视频相关的元素
        video_elements = []
        
        # 查找video标签
        videos = soup.find_all('video')
        for video in videos:
            src = video.get('src')
            if src:
                video_elements.append(src)
        
        # 查找source标签
        sources = soup.find_all('source')
        for source in sources:
            src = source.get('src')
            if src:
                video_elements.append(src)
        
        # 查找可能包含视频链接的script标签
        scripts = soup.find_all('script')
        for script in scripts:
            if script.string:
                # 查找可能的视频URL模式
                video_urls = re.findall(r'["\']?(https?://[^"\']*\.(?:mp4|avi|mov|flv|wmv|m3u8))["\']?', script.string, re.IGNORECASE)
                video_elements.extend(video_urls)
                
                # 查找其他可能的视频URL模式
                video_urls2 = re.findall(r'video[Uu]rl["\']?\s*[:=]\s*["\']([^"\']+)["\']', script.string)
                video_elements.extend(video_urls2)
                
                # 查找播放器配置
                player_configs = re.findall(r'player\.config\s*=\s*({[^}]+})', script.string)
                for config in player_configs:
                    try:
                        config_data = json.loads(config)
                        if 'src' in config_data:
                            video_elements.append(config_data['src'])
                    except:
                        pass
        
        # 移除重复的URL
        video_elements = list(set(video_elements))
        
        print(f"找到 {len(video_elements)} 个可能的视频链接:")
        for i, element in enumerate(video_elements):
            print(f"{i+1}. {element}")
        
        if not video_elements:
            print("未找到视频链接，尝试查看页面源代码...")
            # 保存页面源代码供分析
            with open('page_source.html', 'w', encoding='utf-8') as f:
                f.write(response.text)
            print("页面源代码已保存为 page_source.html")
            
            # 尝试查找ajax请求或API调用
            print("\n查找可能的API调用...")
            api_patterns = [
                r'ajax["\']?\s*[:=]\s*["\']([^"\']+)["\']',
                r'api["\']?\s*[:=]\s*["\']([^"\']+)["\']',
                r'["\'](/api/[^"\']+)["\']',
                r'["\'](https?://[^"\']*api[^"\']*)["\']'
            ]
            
            for script in scripts:
                if script.string:
                    for pattern in api_patterns:
                        matches = re.findall(pattern, script.string, re.IGNORECASE)
                        for match in matches:
                            print(f"发现可能的API端点: {match}")
            
            return False
        
        # 下载找到的视频
        for i, video_url in enumerate(video_elements):
            try:
                # 处理相对URL
                if video_url.startswith('/'):
                    video_url = urljoin(url, video_url)
                elif not video_url.startswith('http'):
                    video_url = urljoin(url, video_url)
                
                print(f"\n正在下载视频 {i+1}: {video_url}")
                
                # 获取视频文件
                video_response = session.get(video_url, stream=True)
                video_response.raise_for_status()
                
                # 生成文件名
                parsed_url = urlparse(video_url)
                filename = os.path.basename(parsed_url.path) or f"video_{i+1}.mp4"
                
                # 确保文件名有扩展名
                if not os.path.splitext(filename)[1]:
                    filename += ".mp4"
                
                filepath = os.path.join(output_dir, filename)
                
                # 下载文件
                total_size = int(video_response.headers.get('content-length', 0))
                downloaded = 0
                
                with open(filepath, 'wb') as f:
                    for chunk in video_response.iter_content(chunk_size=8192):
                        if chunk:
                            f.write(chunk)
                            downloaded += len(chunk)
                            if total_size > 0:
                                progress = (downloaded / total_size) * 100
                                print(f"\r下载进度: {progress:.1f%}", end='', flush=True)
                
                print(f"\n视频已保存: {filepath}")
                
            except Exception as e:
                print(f"下载视频 {i+1} 时出错: {str(e)}")
                continue
        
        return True
        
    except Exception as e:
        print(f"获取页面时出错: {str(e)}")
        return False

def main():
    url = "https://www.itbaizhan.com/course/id/44700.html"
    
    print("百战程序员视频下载器")
    print("=" * 50)
    
    success = download_video(url)
    
    if success:
        print("\n下载完成!")
    else:
        print("\n下载失败，请检查网络连接和权限。")

if __name__ == "__main__":
    main()
