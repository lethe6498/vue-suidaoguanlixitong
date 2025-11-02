import axios from 'axios'
import qs from 'querystring'
//错误状态码status，
//错误信息info
/* 错误处理：
根据 状态和具体的错误信息给出开发者更明确的
错误信息： 2x 3x 4x 5x

状态码：*/
const errorHandler = (status, info) => {
  switch (status) {
    case 400:
      console.log('语义错误')
      break
    case 401:
      console.log('服务器认证失败')
      break
    case 403:
      console.log('服务器请求拒绝执行')
      break
    case 404:
      console.log('请检查网路请求地址')
      break
    case 500:
      console.log('服务器发生意外')
      break
    case 502:
      console.log('服务器无响应')
      break
    default:
      console.log(info)
      break
  }
}
/* 
创建axios对象 */
const instance = axios.create({
  //公共配置
  /*   baseURL: 'http://iwenwiki.com', // 修改为正确的地址 */
  //超时，5s之后没有链接就中断
  timeout: 5000,
})
/* 
拦截器
发送请求和响应结果之前都可以拦截
*/

//请求拦截
instance.interceptors.request.use(
  //成功函数
  (config) => {
    //config:请求信息
    //所有的post请求都需要增加一个参数的格式化 querystring.stringify()
    if (config.method === 'post') {
      //将data格式化后赋值回去
      config.data = qs.stringify(config.data)
    }
    return config
  },
  //失败函数
  (error) => Promise.reject(error),
)

//响应拦截
instance.interceptors.response.use(
  //成功函数
  (response) => (response.status === 200 ? Promise.resolve(response) : Promise.reject(response)),
  //失败函数
  (error) => {
    /*  const response = error.response  */
    const { response } = error
    if (response) {
      errorHandler(response.status, response.info)
    } else {
      console.log('断网了')
    }
  },
)

// 导出配置好的 axios 实例
export default instance
