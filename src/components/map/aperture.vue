<template>
    <img 
        class="aperture" 
        v-if="chessman && combatUnit.has(index) && !process" 
        :src="'numberGame/Sprite/Ripple.png'"
        :style="style"
    />
</template>
<script setup>

    import { useMapState } from '/src/hooks/useMapState.js'
    import { ref,onMounted,computed } from "vue";

    const { combatUnit,specialForces,process } = useMapState('map', ['combatUnit','specialForces','process']);

    const props = defineProps({
        chessman:{
            type:[Object, Boolean, String, Number, Array],
        },
        index:{
            type:Number,
        }
    });

    let battleApertureIndex = ref(0) //战斗光圈下标
    let battleApertureOpacity = computed(()=>{
        let number = (battleApertureIndex.value-10)/10
        return 0.7-(number>0?number:0)
    })

    let timer = null;

    let style = computed(()=>{
        return `opacity:${battleApertureOpacity.value};width:${(battleApertureIndex.value*6+10)*(specialForces.value.has(props.index)?0.75:1)}%`
    })

    onMounted(()=>{
        timer = setInterval(() => {
            battleApertureIndex.value = (battleApertureIndex.value+1) % 20
        }, 50);
    })

</script>

<style scoped>

    .aperture{
        width:70px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

</style>