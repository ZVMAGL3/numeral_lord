<template>
    <useBackground/>
    <div class="userMain">
        <userLogin/>
        <div class="gameLogo">
            <img src="http://localhost:5173/numberGame/Sprite/logo.png">
        </div>
        <userName/>
        
        <div class="gameEntry">
            <div class="entrance" @click="mapEdit">
                <img src="http://localhost:5173/numberGame/Sprite/Main4.png">
                <span>编辑</span>
            </div>
        </div>
    </div>
</template>

<script setup>

    import useBackground from '/src/components/userMain/useBackground.vue'
    import userName from '/src/components/userMain/userName.vue'
    import userLogin from '/src/components/userMain/userLogin.vue'
    import router from '/src/router/index'
    
    function mapEdit(){
        router.push('/mapEdit')
    }

</script>

<style scoped>

    .entrance{
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;

        font-size:25px;
        color:aliceblue;
        font-family: 'KaiTi', serif;
        font-weight:bold;
    }

    .entrance>img{
        max-width: 120px;
        max-height: 120px;
    }

</style>