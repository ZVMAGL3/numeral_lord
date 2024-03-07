import { ref,computed,onMounted,onUnmounted  } from "vue";
import map from '/src/hooks/map.js'
export default () => {
    let press = false
    let mouseX = 0
    let mouseY = 0
    
    let currentX = window.innerWidth/2
    let currentY = window.innerHeight/2

    let X = ref(0) //与中心点的相对坐标
    let Y = ref(0) //与中心点的相对坐标

    let X_centePointX = 0
    let Y_centePointY = 0

    const {frameSize} = map() //边界值,不能将棋盘移动到边界外
    let oldInnerWidth = window.innerWidth //记录中心点的边界坐标
    let oldInnerHeight = window.innerHeight //记录中心点的边界坐标
    
    const coordinate = computed(()=>{
        //修正棋盘坐标
        reviseXY()
        return `transform: translate(-50%, -50%) translate(${X.value}px, ${Y.value}px);`
    })

    // const coordinate = computed(()=>{
    //     return `transform: translate(-50%, -50%) translate(${
    //         frameSizeX<Math.abs(X.value)?(frameSizeX*(X.value/Math.abs(X.value))):X.value
    //     }px, ${
    //         frameSizeY<Math.abs(Y.value)?(frameSizeY*(Y.value/Math.abs(Y.value))):Y.value
    //     }px);`
    // })


    function reviseXY(){
        X.value = frameSize.value[0]<Math.abs(X.value)?(frameSize.value[0]*(X.value/Math.abs(X.value))):X.value
        Y.value = frameSize.value[1]<Math.abs(Y.value)?(frameSize.value[1]*(Y.value/Math.abs(Y.value))):Y.value
    }

    //按下鼠标
    function mousedown(event){
        press = true
        currentX = event.clientX
        currentY = event.clientY
    }

    //移动鼠标
    function mousemove(event){
        if(press){
            X.value += event.clientX-currentX
            Y.value += event.clientY-currentY
            currentX = event.clientX
            currentY = event.clientY
        }
    }

    //松开鼠标
    function mouseup(){
        press = false
    }

    //系统的移动鼠标
    function handleMouseMove(event){
            //获取实时的鼠标坐标,这里有一个小bug,就是当页面放大缩小的时候,
            //鼠标坐标发生了改变,但是因为鼠标没有移动,所以不会更新,需要手动更新.
            mouseX = event.clientX;
            mouseY = event.clientY;
            X_centePointX = mouseX - X.value - window.innerWidth/2
            Y_centePointY = mouseY - Y.value - window.innerHeight/2

    }

    onMounted(()=>{
        window.addEventListener('mousemove', handleMouseMove)

        //监视窗口大小变化
        window.onresize = () => {
            //手动更新鼠标坐标,解决上方提到的bug
            mouseX =(window.innerWidth/oldInnerWidth)*mouseX
            mouseY =(window.innerHeight/oldInnerHeight)*mouseY
            //更新旧界面大小
            oldInnerWidth = window.innerWidth
            oldInnerHeight = window.innerHeight

            X.value = (mouseX - X_centePointX) - window.innerWidth/2
            Y.value = (mouseY - Y_centePointY) - window.innerHeight/2

            reviseXY()

            X_centePointX = mouseX - X.value - window.innerWidth/2
            Y_centePointY = mouseY - Y.value - window.innerHeight/2
        }
    })

    onUnmounted(()=>{
        window.removeEventListener('mousemove', handleMouseMove);
        window.onresize = null;
    })

    return {coordinate,mousedown,mousemove,mouseup}
}   