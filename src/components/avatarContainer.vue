<template>
    <div id="avatarContainer" >
        <img class="roundIcon" :src="userimagePath">
        <div v-if="Change" id="overlay" @click="uploadImage">切换头像</div>
        <input type="file" ref="fileInput" accept="image/jpeg,image/png" @change="onFileChange" style="display: none" />
    </div>
</template>

<script>    
    export default {
        name:'avatarContainer',
        props:{
            //是否需要上传图片
			Change:{
				type:Boolean,
				default:false, //默认值
			},
            //必须传一个图片的地址
            imagePath:{
                type:String,
                required:true,
            },
            //默认头像
            defaultAvatar:{
                type:String,
				default:'http://localhost:1023/defaultAvatar.jpg',
            },
            //返回上传的图片Base64格式的
            saveAvatar:{
                type:Function,
            }
		},
        data(){
            return{
                userimagePath:'',
            }
        },
        mounted(){
            this.userimagePath = this.defaultAvatar
            this.isValidUrl(this.imagePath)
        },
        methods:{
            isValidUrl(url) {
                new Promise(resolve => {
                    const img = new Image()
                    img.src = url
                    img.onload = function() {
                        resolve(true)
                        img.onerror = null
                    }
                }).then(isValid => {
                    if (isValid) {
                        this.userimagePath = this.imagePath
                    }else{
                        this.userimagePath = this.defaultAvatar
                    }
                }) 
            },
            uploadImage() {
                this.$refs.fileInput.click();
            },
            onFileChange(e){
                const file = e.target.files[0]
                if (file) {
                    const reader = new FileReader()
                    reader.readAsDataURL(file)
                    reader.onload = e => {
                        // this.imagePath = e.target.result
                        const value = e.target.result
                        this.saveAvatar(value)
                    }
                }
            },
        },
        watch:{
            imagePath(newUrl){
                this.isValidUrl(newUrl)
            }
        }
    }
</script>

<style>

    #avatarContainer {
        position: relative;
        width:100%;
        height:100%;
    }

    #avatarContainer:hover #overlay {
        display: block;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .roundIcon{
        display: flex;
        width:100%;
        height:100%;
        border-radius: 50%;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        position: relative;
    }

    #overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        border-radius: 50%;
        background-color: rgba(0, 0, 0, 0.5);
        color: white;
        text-align: center;
        display: none;
    }

</style>