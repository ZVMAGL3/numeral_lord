import { ref,computed,onMounted } from 'vue'
import useRandomUsername from './useRandomUsername'

export default ()=>{

    let userName = ref('')
    let originalUsername = ''
    
    onMounted(() => {
        //检查本地是否有用户名,没有就生成一个随机的用户名
        if(localStorage.getItem('userName')){
            userName.value = localStorage.getItem('userName')
        }else{
            userName.value = useRandomUsername().value
            localStorage.setItem('userName', userName.value)
        }
        originalUsername  = userName.value
    })
    
    //控制重置按钮显示
    let userName_inputFocus = ref(false)
    function userName_input_blur(){
        userName_inputFocus.value = false
    
        //检查退出时名字是否为空,为空重置,否则保存
        if(userName.value){
            originalUsername = userName.value
            localStorage.setItem('userName', userName.value)
        }else{
            userName.value = originalUsername
        }
    }
    
    
    let rotateStyle = ref(0)
    
    let rotateClass = computed(()=>{
        return {
            transform: `rotate(${rotateStyle.value * 180}deg)`
        }
    })
    
    function rotateButton(){
        userName.value = originalUsername
        rotateStyle.value++ //控制旋转动画
    }

    return  {userName,rotateButton,rotateClass,userName_inputFocus,userName_input_blur} 
}