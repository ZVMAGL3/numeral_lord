<template>
    <div 
        class="outermost_layer" 
        @mousedown="mousedown" 
        @mousemove="mousemove" 
        @mouseup="mouseup"
    >
        <div class="checkerboard" :style="style">
            <battlefield/>
        </div>
    </div>
    <div class="top">
        <round_points/>
    </div>
    <div class="middle">
        <roleData/>
    </div>
    <div class="buttom">
        789
    </div>
</template>

<script setup>
    import { computed } from 'vue'
    import battlefield from '/src/components/map/battlefield.vue'
    import roleData from '/src/components/map/roleData.vue'
    import round_points from '/src/components/map/round_points.vue'
    import map from '/src/hooks/map.js'
    import positioning from '/src/hooks/positioning.js'
    const {checkerboardSize} = map()
    const {coordinate,mousedown,mousemove,mouseup} = positioning()

    let style = computed(()=>{
        return `${checkerboardSize.value}${coordinate.value}`
    })
</script>

<style scoped>

    .outermost_layer{
        height: 100vh;
        width:100vw;
        background-color: #161c28;
    }

    .checkerboard{
        position: absolute;
        top: 50%;
        left: 50%;
    }

    .top{
        position: absolute;
        left: 50%;
        top: 0;
        transform: translate(-50%, 0%);
    }

    .middle{
        position: absolute;
        left: 0;
        top: 50%;
        transform: translate(0%,-50%);
    }

    .buttom{
        background-color: red;
        position: absolute;
        left: 50%;
        top: 100%;
        transform: translate(-50%,-100%); 
    }

</style>