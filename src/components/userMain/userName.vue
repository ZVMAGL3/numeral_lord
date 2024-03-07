<template>
    <div class="userName">
        <input 
            class="userName_input" 
            type="text" 
            v-model="showOriginalUsername"
            :disabled="userLoginState === 'jumpOver'"
            @focus="userName_inputFocus = true"
            @blur="userName_input_blur"
        />
        <button v-if="userName_inputFocus" class="icon_button" @mousedown.prevent @click.self="rotateButton" :style="rotateClass"></button>
    </div>
</template>

<script setup>
    import { ref,computed,onMounted } from 'vue'
    import store from '/src/store/index'
    import { useMapState } from '/src/hooks/useMapState.js'

    let userName_inputFocus = ref(false)
    const { userInfo,userLoginState } = useMapState('homePage', ['userInfo','userLoginState'])

    let showOriginalUsername = computed({
        get(){
            return store.state.homePage.originalUsername
        },
        set(value){
            store.commit('homePage/saveOriginalUsername',value)
        }
    })

    function userName_input_blur(){
        userName_inputFocus.value = false
    
        //检查退出时名字是否为空,为空重置,否则保存
        if(showOriginalUsername){
            store.commit('homePage/saveUserName',showOriginalUsername.value)
        }else{
            store.commit('homePage/saveOriginalUsername',userInfo.userName)
        }
    }

    let rotateStyle = ref(0)
    
    let rotateClass = computed(()=>{
        return {
            transform: `rotate(${rotateStyle.value * 180}deg)`
        }
    })
    
    function rotateButton(){
        showOriginalUsername = userInfo.value.userName
        rotateStyle.value++ //控制旋转动画
    }

</script>

<style scoped>

    .userName{  
        display: flex;
        justify-content: center; /* 横向居中对齐 */
        align-items: center; /* 纵向居中对齐 */
    }

    .userName_input{
        text-align: center;
        border: none;
        background: none;
        padding: 0;
        margin: 0;
        font-size: 30px;
        width:20vw;
        min-width: 250px;
        font-family: 'CustomFont3', serif;
        color:aqua;
        background-color: rgb(0, 0, 0, 0);    
    }
    
    .userName_input:focus{
        outline: none;
    }

    .icon_button{
        border: none;
        margin-left: 5px;
        width: 30px;
        height: 30px;
        background-color: rgb(0, 0, 0, 0);
        background-image: url('http://localhost:5173/numberGame/Sprite/IconReload.png');
        background-size: cover;  /* 调整图标填充方式 */
        /* 添加其他样式属性 */

        transition: transform 0.5s ease;
    }

</style>