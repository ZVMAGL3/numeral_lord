<template>
    <div class="userLogin">
        <span class="span-prompt" v-if="userLoginState === 'jumpOver'">您好,请选择
            <span class="span-register" @click="showlogin(false)">登录</span>/
            <span class="span-register" @click="showlogin(true)">注册</span>
        </span>
        <span class="span-prompt" v-if="userLoginState === 'login'">您好{{ userInfo.userName }}
            <span class="span-register" @click="logout">退出登录</span>
        </span>
    </div>
    <login v-if="showLoginModal" :isLoggedin="isLoggedin"/>
</template>

<script setup>
    import { ref,computed } from 'vue';
    import { useMapState } from '/src/hooks/useMapState.js'
    import { useStore } from 'vuex'
    import login from '/src/components/userMain/login.vue'

    const store = useStore()

    const { userInfo,userLoginState } = useMapState('homePage', ['userInfo', 'userLoginState']);

    let showLoginModal = computed({
        get(){
            return store.state.homePage.showLoginModal
        },
        set(value){
            store.commit('homePage/eventShowLoginModal',value)
        }
    })

    let isLoggedin = ref(false)

    function showlogin(value){
        showLoginModal.value = true
        isLoggedin.value = value
    }

    function logout(){
        localStorage.removeItem('account')
        localStorage.removeItem('userInfoHash')
        localStorage.removeItem('userName')
        store.commit('homePage/logout')
    }

</script>

<style scoped>

    .span-prompt{
        color: deepskyblue;
    }

    .span-register{
        text-decoration: underline;
        background: none;
        border: none;
        padding: 0;
        font: inherit;  /* 继承父元素的字体样式 */
        color:dodgerblue;
        cursor: pointer; /* 鼠标指针形状为指针 */
    }

    .span-register:hover {
        color:deepskyblue;
    }

    .span-register:active {
        color: #06c;
    }
</style>