<template>
    <div class="background">
        <canvas ref="myCanvas"></canvas>
    </div>
</template>

<script setup>
    import useBackground from '/src/hooks/useBackground.js'
    const { myCanvas } = useBackground();
</script>

<style scoped>
    .background {
        position: fixed;
        top: 0;
        left: 0;
        z-index: -1;
        background-color: #28303c;
        height: 100vh;
        overflow: hidden;
    }
</style>
