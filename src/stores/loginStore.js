import { defineStore } from 'pinia'
export const useLoginStore = defineStore('login', {
  //组合式api
  state: () => {
    return {
      token: '',
      permission: '',
      username: '',
    }
  },
})
