const express = require('express')
const router = express.Router()
const url = require('url')
const SQLConnect = require('./SqlConnect.js')
//添加接口
/* router.get('/list', (req, res) => {
  res.send({
    status: 200,
    messages: '测试服务器',
  })
}) */
/* 登陆接口 */
router.post('/login', (req, res) => {
  //接受客户端的参数：usename，password
  const { username, password } = req.body
  const sql = 'select * from user where username=? and password=?'
  SQLConnect(sql, [username, password], (result) => {
    if (result.length > 0) {
      res.send({
        status: 200,
        result,
      })
    } else {
      //没有查询到数据
      res.send({
        status: 500,
        msg: '用户名密码错误',
      })
    }
  })
})
module.exports = router
