<template>
    <Skeleton
        :src="srcArray"
        :initial_slide="initial_slide"
    />
</template>

<script setup>
    import { ref,reactive,onBeforeUnmount } from 'vue';
    import Skeleton from './Skeleton.vue'

    const props = defineProps({
        src:Array,
    });

    //记录数组长度
    let len = props.src.length

    //记录页数
    let initial_slide = ref(0)

    //初始化(待完善)
    let array = props.src //拷贝一份
    let srcArray = reactive([[],array[0],array[1]])

    function nextIndex(){
        return (initial_slide.value+1)%len
    }
    
    //定时翻页
    let timer1 = setInterval(() => {
        initial_slide.value = nextIndex()
        srcArray.shift()
        setTimeout(() => {
            srcArray[0]=[]
        }, 1000);
        setTimeout(() => {
            srcArray.push(array[nextIndex()])
        }, 1500);
    }, 3000);


    //销毁定时器
    onBeforeUnmount(()=>{
        clearTimeout(timer1)
    })

</script>

<style scoped>
</style>
