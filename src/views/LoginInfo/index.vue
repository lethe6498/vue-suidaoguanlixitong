<template>
  <div class="login-container">
    <el-form class="user" size="large" :model="user">
      <div class="title-container">
        <h3 class="title">隧道后台管理系统登陆</h3>
      </div>
      <el-form-item prop="username">
        <el-input
          v-model="user.username"
          type="text"
          placeholder="请输入用户名"
          name="username"
        ></el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input
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
import { reactive } from 'vue'
const user = reactive({
  username: '',
  password: '',
})
</script>
