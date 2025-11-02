const express = require('express')
const app = express()

// 添加 CORS 支持，解决跨域问题
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*')
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
  res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization')
  if (req.method === 'OPTIONS') {
    return res.sendStatus(200)
  }
  next()
})

// 解析 application/json
app.use(express.json())
// 解析 application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }))

const router = require('./router')
app.use('/api', router)
//监听一个叫3000的端口
app.listen(3000, () => {
  console.log('服务器运行在3000端口上')
})
