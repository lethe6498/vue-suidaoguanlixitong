const mysql = require('mysql')
const { Connect } = require('vite')
const MySQLObj = {
  //主机地址
  host: 'localhost',
  user: 'root',
  password: '',
  //数据库库名
  database: 'vue3_suidaoguanli',
}
const pool = mysql.createPool(MySQLObj)
function SQLConnect(sql, arr, callback) {
  //链接数据库
  pool.getConnection((err, connection) => {
    if (err) {
      console.log(err)
      return
    }
    connection.query(sql, arr, (err, result) => {
      //每次用完释放链接
      connection.release()
      if (err) {
        console.log(err)
        return
      }
      callback(result)
    })
  })
}
//导出函数
module.exports = SQLConnect
