<template>
    <div class="Skeleton">
        <div 
            class="image_container" 
            v-for="imageUrl,index in src"
            :key='imageUrl' 
            :style="dynamicStyles(index)"
        >
            <!-- <img :src="src[initial_slide]" class="responsive_image"> -->
            <img :src="imageUrl" class="responsive_image"/>
        </div>
    </div>
</template>

<script setup>

    const props = defineProps({
        src:Array,
        initial_slide:Number,
    });
    
    function dynamicStyles(index){
        // let leftPosition = 50 + (index-props.initial_slide)*100
        let leftPosition = 50 + (index-1)*100
        return `left:${leftPosition}%;`
    }
  
</script>

<style scoped>

    .Skeleton{
        height: 100%;
        width: 100%;
        position: relative;
    }

    .image_container {
        transition: all 0.5s ease; 

        height: 100%;
        width: 100%;

        position:absolute;
        top: 50%;

        transform: translate(-50%, -50%);

        display: flex; /* 使用 Flex 布局 */
        justify-content: center; /* 水平居中 */
        overflow: hidden; /* 设置不溢出 */
    }
</style>

