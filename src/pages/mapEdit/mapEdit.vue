<template>
    <div>
        <button @click="gameRoom">热坐</button>
    </div>
</template>

<script setup>
    import router from '/src/router/index'

    function gameRoom(){
        router.push('/gameRoom')
    }
</script>