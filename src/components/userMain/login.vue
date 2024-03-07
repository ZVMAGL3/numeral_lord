<template>
    <teleport to="body">
        <div class="mask">
            <div class="div">
                <div class="sign-div">
                    <button class="end" @click="end">×</button>  
                    <span class="gameName">数字领主</span>
                    <input class="input-text" type="username" v-model="account" placeholder="帐号">
                    <input v-show="isLoggedin" class="input-text" type="password" v-model="userName" placeholder="用户名">

                    <input class="input-text" type="password" v-model="password" placeholder="密码">
                    <input v-show="!isLoggedin" class="input-btn" type="submit" value="登录" @click="">
                    <span v-show="!isLoggedin" class="span-prompt">还没有账号么?前往<span class="span-register" @click="isLoggedin=!isLoggedin">注册</span></span>

                    <input v-show="isLoggedin" class="input-text" type="password" v-model="confirmPassword" placeholder="确认密码">
                    <input v-show="isLoggedin" class="input-btn" type="submit" value="注册" @click="">
                    <span v-show="isLoggedin" class="span-prompt">已注册?前往<span class="span-register" @click="isLoggedin=!isLoggedin">登录</span></span>
                </div>
            </div>
        </div>
    </teleport>
</template>

<script setup>
    import { ref } from 'vue';
    import { useStore } from 'vuex'
    const store = useStore()

    const props = defineProps({
        isLoggedin:{
            type: Boolean,
            default: false // 设置默认值为 false
        }
    });

    let account = ref()
    let userName = ref()
    let password = ref()
    let confirmPassword = ref()
    // let isLoggedin = ref(false)

    function end(){
        store.commit('homePage/eventShowLoginModal',false)
    }
</script>

<style scoped>

    .mask{
		position: absolute;
		top: 0;bottom: 0;left: 0;right: 0;
		background-color: rgba(0, 0, 0, 0.5);
	}

    .div {
        width: 25vw;
        min-width: 300px;
        height: 40vh;
        min-height: 350px;
        /* 实现整个框居中效果 */
        position: absolute;
        top: 47%;
        left: 50%;
        transform: translate(-50%, -50%);
        overflow: hidden; /* 溢出 */
    }

    .sign-div {
        box-sizing: content-box;
        width: calc(100% - 20px); /* 减去两边的间隔 */
        height: calc(100% - 20px); /* 减去两边的间隔 */
        padding: 10px;
        /* border: 1px solid rgb(94, 92, 233); */
        border-radius: 8px;
        background-color: rgba(172, 235, 243, 0.2);

        display: flex;
        flex:1 0 33%;
        flex-direction: column;
        align-items:center;
        justify-content:  space-evenly;
    }

    .end{
        position: absolute;
        top: 0%;
        left: 100%;
        transform: translate(-100%, -0%);
    }

    .gameName {
        font-size: 30px;
        color:burlywood;
    }

    input {
        transition: all 0.5s ease; 
        width: 250px;
        height: 44px;
        border: none;
        /* 元素周围的轮廓无效 */
        outline: none;
        /* 为元素指定的任何内边距和边框都将在已设定的宽度和高度内进行绘制 */
        box-sizing: border-box;
        display: block;
        padding: 0 16px;
    }

    .input-text {
        margin: 5px auto;
        border-radius: 12px;
    }

    .input-text:hover {
        transition: 0.5s;
        border: 1px solid rgb(76, 76, 233);
    }

    .input-text:focus {
        
        transition: 0.5s;
        border-radius: 4px;
        width: 265px;
        border: 1px solid rgb(76, 76, 233);

    }

    .input-btn {
        border-radius: 8px;
        cursor: pointer;
        background-color: rgba(84, 175, 249, 0.8);
    }

    .input-btn:hover {
        color: #fff;
        font-size: 16;
        border-radius: 4px;
        transition: 0.5s;
        background-color: rgba(10, 138, 243, 0.8);
    }

    .sign-div a {
        text-decoration: none;
        color: rgb(92, 61, 112);
        font-size: 14px;
        padding: 10px;
        transition: 0.8s;
        display: block;
    }

    a:hover {
        color: #FFF;
        background: rgba(0, 0, 0, .3);
        border-radius: 8px;
    }

    .span-prompt{
        color: deepskyblue;
    }

    .span-register{
        text-decoration: underline;
        background: none;
        border: none;
        padding: 0;
        font: inherit;  /* 继承父元素的字体样式 */
        color: #06f;
        cursor: pointer; /* 鼠标指针形状为指针 */
    }

    .span-register:hover {
        color:deepskyblue;
    }

    .span-register:active {
        color: #06c;
    }
</style>