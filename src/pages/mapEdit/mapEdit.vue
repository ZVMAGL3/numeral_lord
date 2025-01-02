<template>
    <div>
        <button @click="gameRoom">热坐</button>
        <button @click="map_exit">编辑</button>
    </div>
</template>

<script setup>
    import router from '/src/router/index'

    function gameRoom(){
        router.push('/gameRoom')
    }
    function map_exit(){
        router.push('/map_exit')
    }
</script>