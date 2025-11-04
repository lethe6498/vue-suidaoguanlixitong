// 导入Vue Router的核心函数
import { createRouter, createWebHistory } from 'vue-router'
// 导入首页组件 - 直接导入以提高首页加载速度
import Home from '../views/Homeview/index.vue'
// 导入布局组件 - 作为主要的页面容器
import Layout from '../views/Layout.vue'
import LoginInfo from '../views/LoginInfo/index.vue'
import { useLoginStore } from '../stores/loginStore.js'

/**
 * 创建路由器实例
 * 使用HTML5 History模式，提供更好的SEO和用户体验
 */
const router = createRouter({
  // 使用HTML5 History API，URL不会带有#号
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      // 登录页面 - 独立路由，不使用Layout布局
      path: '/LoginInfo',
      name: 'LoginInfo',
      component: LoginInfo,
    },
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
          /*如果用户未登录，就跳转到登录页；
如果已登录，才允许访问这个页面  */
          meta: {
            requiresAuth: true,
          },
        },
        {
          // 建设管理页面
          path: '/build-manage',
          name: 'buildManage',
          // 使用动态导入实现路由级代码分割，提高应用性能
          component: () => import('../views/BuildManage/index.vue'),
          meta: {
            requiresAuth: true,
          },
        },
        {
          // 地质信息页面
          path: '/geological-info',
          name: 'geologicalInfo',
          component: () => import('../views/GeologicalInfo/index.vue'),
          meta: {
            requiresAuth: true,
          },
        },
        {
          // 项目信息页面
          path: '/project-info',
          name: 'projectInfo',
          component: () => import('../views/ProjectInfo/index.vue'),
          meta: {
            requiresAuth: true,
          },
        },
        {
          // 系统管理页面
          path: '/system-manage',
          name: 'systemManage',
          component: () => import('../views/SystemManage/index.vue'),
          meta: {
            requiresAuth: true,
          },
        },
        {
          // 隧道信息页面
          path: '/tunnel-info',
          name: 'tunnelInfo',
          component: () => import('../views/TunnelInfo/index.vue'),
          meta: {
            requiresAuth: true,
          },
        },
        {
          // 工作管理页面
          path: '/work-manage',
          name: 'workManage',
          component: () => import('../views/WorkManage/index.vue'),
          meta: {
            requiresAuth: true,
          },
        },
      ],
    },
  ],
})
/* 路由权限 */
//前置钩子函数
useLoginStore
router.beforeEach((to, from, next) => {
  if (to.meta.requiresAuth) {
    //验证是否登录
    const loginStore = useLoginStore()
    if (!loginStore.token) {
      //如果不存在用户信息则去到登录页面
      next({
        path: '/LoginInfo',
      })
    } else {
      next()
    }
  } else {
    next()
  }
})
export default router
