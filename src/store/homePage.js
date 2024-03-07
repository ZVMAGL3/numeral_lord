import axios from 'axios';
import useRandomUsername from '/src/hooks/useRandomUsername'

export default {
    namespaced: true,
    //数据存储
    state: () => ({
        userInfo:{
            userName:''
        },
        userLoginState : 'jumpOver', //登录状态
        showLoginModal : false,
        originalUsername : '' //用户名备份
    }),
    mutations: {
        saveInfo(state,value){
            state.userInfo = value
            state.userLoginState = 'login' //检测用户登录状态
        },

        unUserInfo(state){
            state.userInfo = {}
            state.loginState = 'jumpOver' //检测用户登录状态
        },
        eventShowLoginModal(state,value){
            state.showLoginModal = value
        },
        logout(state){
            state.userLoginState = 'jumpOver'
            state.userInfo = {}
            context.commit('saveUserName', useRandomUsername().value)
        },
        saveUserName(state,userName){
            state.userInfo.userName = userName
            state.originalUsername = userName
            localStorage.setItem('userName', userName)
        },
        saveOriginalUsername(state,value){
            state.originalUsername = value
        }
    },
    actions:{
        //初始化
        homePageInitialization(context){
            let account = localStorage.getItem('account')
            let userInfoHash =  localStorage.getItem('userInfoHash')
            //如果是游客
            if(localStorage.getItem('userName')){
                context.commit('saveUserName',localStorage.getItem('userName'))
            }else{
                context.commit('saveUserName', useRandomUsername().value)
            }
            if(account && userInfoHash){
                axios.post("http://localhost:1023/verify", {
                    data:{
                        value:{
                            account,
                            userInfoHash
                        }
                    }
                }).then(response => {
                    if(response.data){
                        console.log(response)
                        context.commit('saveInfo',response.data.userInfo)
                    }else{
                        //弹窗提示,身份验证失败,请重新登录
                    }
                }).catch(err => {
                    console.log(err)
                })
            }
        },
	},
}
