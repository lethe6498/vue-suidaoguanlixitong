const express = require('express')
const app = express()
const router = require('./router')
//解决跨域
const cors = require('cors')
app.use(cors())
//接受post参数
app.use(
  express.urlencoded({
    extended: true,
  }),
)
app.use('/api', router)
//监听一个叫3000的端口
app.listen(3000, () => {
  console.log('服务器运行在3000端口上')
})
