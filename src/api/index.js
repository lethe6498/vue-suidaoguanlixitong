import axios from '../utils/request.js'
import base from './base.js'
const api = {
  getLogin(params) {
    return axios.post(base.baseUrl + base.login, params)
  },
}
export default api
