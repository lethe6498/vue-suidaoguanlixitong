<template>
  <div class="login-container">
    <el-form class="user" size="large" :model="user">
      <div class="title-container">
        <h3 class="title">隧道后台管理系统登陆</h3>
      </div>
      <el-form-item prop="username">
        <el-input
          :prefix-icon="User"
          v-model="user.username"
          type="text"
          placeholder="请输入用户名"
          name="username"
        ></el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input
          :prefix-icon="Lock"
          v-model="user.password"
          type="text"
          placeholder="请输入密码"
          name="password"
        ></el-input>
      </el-form-item>
      <!--      .native.prevent阻止表单事件 -->
      <el-button
        style="width: 100%; margin-bottom: 30px"
        type="primary"
        @click.native.prevent="handleLogin"
        >登陆</el-button
      >
    </el-form>
  </div>
</template>
<script setup>
import { User, Lock } from '@element-plus/icons-vue'
import { reactive } from 'vue'
import api from '@/api/index.js'
import { useLoginStore } from '@/stores/loginStore.js'
import { useRouter } from 'vue-router'

//登陆仓库对象
const localStore = useLoginStore()
//获取路由对象
const router = useRouter()
//声明用户信息
const user = reactive({
  username: '',
  password: '',
})

// 处理登录逻辑
const handleLogin = () => {
  console.log(user)
  api
    .getLogin({
      username: user.username,
      password: user.password,
    })
    .then((res) => {
      console.log(res)
      if (res.data.status === 200) {
        console.log('登录成功', res.data)
        // 可以在这里保存 token 和用户信息
        localStore.token = res.data.token
        localStore.username = res.data.username
        localStore.permission = res.data.permission
        // 跳转到主页等操作
        router.push('/')
      } else {
        ElMessage.error(res.data.msg)
      }
    })
    .catch((error) => {
      console.error('请求失败:', error)
    })
}
</script>
<style scoped>
.login-container {
  width: 100vw;
  height: 100vh;
  background-color: #2d3a4b;
  position: fixed;
  top: 0;
  left: 0;
  margin: 0;
  padding: 0;
}
.user {
  position: relative;
  width: 400px;
  padding: 160px 35px 0;
  margin: 0 auto;
}
/* 修改输入框前缀图标大小 */
.user :deep(.el-input__prefix) {
  font-size: 18px; /* 调整图标大小，默认是 14px */
}
.title {
  font-size: 26px;
  text-align: center;
  color: #eee;
  /* Element Plus large 尺寸默认是 22px */
  margin-bottom: 22px;
}
</style>
