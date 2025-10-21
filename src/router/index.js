// 导入Vue Router的核心函数
import { createRouter, createWebHistory } from 'vue-router'
// 导入首页组件 - 直接导入以提高首页加载速度
import Home from '../views/Homeview/index.vue'
// 导入布局组件 - 作为主要的页面容器
import Layout from '../views/Layout.vue'

/**
 * 创建路由器实例
 * 使用HTML5 History模式，提供更好的SEO和用户体验
 */
const router = createRouter({
  // 使用HTML5 History API，URL不会带有#号
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      // 根路由配置
      path: '/',
      name: 'Layout',
      component: Layout, // 布局组件作为父级容器
      children: [
        // 嵌套路由配置 - 所有业务页面都在Layout组件内渲染
        {
          // 首页路由 - 默认显示页面
          path: '/',
          name: 'Home',
          component: Home, // 直接导入，提高首屏加载速度
        },
        {
          // 建设管理页面
          path: '/build-manage',
          name: 'buildManage',
          // 使用动态导入实现路由级代码分割，提高应用性能
          component: () => import('../views/BuildManage/index.vue'),
        },
        {
          // 地质信息页面
          path: '/geological-info',
          name: 'geologicalInfo',
          component: () => import('../views/GeologicalInfo/index.vue'),
        },
        {
          // 登录信息页面
          path: '/login-info',
          name: 'loginInfo',
          component: () => import('../views/LoginInfo/index.vue'),
        },
        {
          // 项目信息页面
          path: '/project-info',
          name: 'projectInfo',
          component: () => import('../views/ProjectInfo/index.vue'),
        },
        {
          // 系统管理页面
          path: '/system-manage',
          name: 'systemManage',
          component: () => import('../views/SystemManage/index.vue'),
        },
        {
          // 隧道信息页面
          path: '/tunnel-info',
          name: 'tunnelInfo',
          component: () => import('../views/TunnelInfo/index.vue'),
        },
        {
          // 工作管理页面
          path: '/work-manage',
          name: 'workManage',
          component: () => import('../views/WorkManage/index.vue'),
        },
      ],
    },
  ],
})

export default router
