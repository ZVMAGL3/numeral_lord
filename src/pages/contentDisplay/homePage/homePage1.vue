<template>
    <div class="mainBody">
        <div class="item ">

            <!-- 用户头像 -->
            <div id="avatar-container" >
                <img class="roundIcon" :src="userImagePath" />
                <div id="overlay" @click="uploadImage">切换头像</div>
                <input type="file" ref="fileInput" accept="image/jpeg,image/png" @change="onFileChange" style="display: none" />
            </div>

            <!-- 用户姓名 -->
            <p class="userName">{{ userInfo.userName }}</p>

            <!-- 个性签名 -->
            <input 
                type="text"
                class="Signature"
                v-if="!modifiedStatus"
                :disabled="true"
                :value="homePageInfoEdit.signature" 
                placeholder="还没有个性签名哦~"
            />
            <input 
                type="text"
                class="Signature"
                v-if="modifiedStatus"
                :disabled="false"
                :value="homePageInfoEdit.signature" 
                placeholder="点击设置个性签名"
                @change="signatureAlter($event.target.value)"
            />

            <!-- 用户邮箱 -->
            <a :href="`mailto:${homePageInfoEdit.emaliAddress}`" v-if="homePageInfoEdit.emaliAddress && !modifiedStatus">{{ homePageInfoEdit.emaliAddress }}</a>
            <!-- <input
                v-if="modifiedStatus"
                placeholder="点击设置邮箱地址"
                :value="homePageInfo.emaliAddress"
                @change="emaliAddressAlter($event.target.value)"
            /> -->

            <el-input
                v-if="modifiedStatus"
                class="Signature"
                placeholder="点击设置邮箱地址"
                v-model="emaliAddress"
            ></el-input>

            <!-- 修改栏 -->
            <div id="divPugeBut">
                <el-button round class="pugeBut" @click="modifiedStatus=true" v-if="!modifiedStatus">修改主页内容</el-button>
                <el-button round class="pugeBut" @click="save" v-if="modifiedStatus">保存</el-button>
                <el-button round class="pugeBut" @click="cancel" v-if="modifiedStatus" style="margin:5px 0;">取消</el-button>
            </div>
            
            <!-- <button class="pugeBut" @click="modifiedStatus=true" v-if="!modifiedStatus">修改主页内容</button> -->
            <!-- <button class="pugeBut" @click="save" v-if="modifiedStatus">保存</button> -->
            <!-- <button class="pugeBut" @click="cancel" v-if="modifiedStatus">取消</button> -->
        </div>

        <div class="item" v-if="homePageInfoEdit.selfIntroduction||homePageInfoEdit.campusExperience||modifiedStatus">

            <!-- 自我介绍 -->
            <div class="selfIntroduction" v-if="homePageInfoEdit.selfIntroduction || modifiedStatus">
                <p class="subtitle">自我介绍:</p><hr/>
                <span   
                    v-if="!modifiedStatus"
                    v-text="homePageInfoEdit.selfIntroduction"
                ></span>
                <div   
                    class="dzmInput"
                    v-if="modifiedStatus"
                    contenteditable
                    v-text="homePageInfo.selfIntroduction"
                    placeholder="请输入内容"
                    @blur="selfIntroductionAlter($event.target.textContent)"
                ></div>
            </div>

            <!-- 校园经历 -->
            <div class="selfIntroduction" v-if="homePageInfoEdit.campusExperience || modifiedStatus">
                <p class="subtitle">校园经历:</p><hr/>
                <div   
                    v-if="!modifiedStatus"
                >{{homePageInfoEdit.campusExperience}}</div>
                <div   
                    class="dzmInput"
                    v-if="modifiedStatus"
                    contenteditable
                    v-text="homePageInfoEdit.campusExperience"
                    placeholder="请输入内容"
                    @blur="asd"
                ></div>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapState,mapMutations,mapActions } from 'vuex'
    export default {
        name:'homePage',
        data() {
            return {
                /* //头像
                imagePath:'', */
                //保存修改状态
                modifiedStatus:false,
            }
        },
        computed:{
            // ...mapGetters('homePage',['homePageInfoEdit']),
            ...mapState('homePage',['homePageInfo','userImagePath','homePageInfoEdit']),
            ...mapState('processUserInfo',['userInfo']),
            emaliAddress:{
                get(){
                    return  this.homePageInfoEdit.emaliAddress
                },
                set(value){
                    this.emaliAddressAlter(value)
                }
            }
        },
        methods:{
            ...mapMutations('homePage',['signatureAlter','emaliAddressAlter','selfIntroductionAlter','campusExperienceAlter','cancelHomePageInfo']),
            ...mapActions('homePage',['saveHomePageInfo','saveAvatar']),
            asd($event){
                console.log($event.target.textContent)
                this.campusExperienceAlter($event.target.textContent)
            },
            save(){
                this.modifiedStatus=false
                this.saveHomePageInfo()
            },
            cancel(){
                this.modifiedStatus=false
                this.cancelHomePageInfo()
            },
            //通过input上传图片
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
                        const value = {userAvatar:e.target.result,account:this.userInfo.account}
                        this.saveAvatar(value)
                    }
                }
            }
        },
        mounted(){
            //如果不存在头像则显示默认头像
            /* fetch(`/img/avatar/${this.userInfo.account}.jpg`)
            .then(
                response => {
                    if (response.ok) {
                        this.imagePath = `/img/avatar/${this.userInfo.account}.jpg`
                    }
                }
            ) */
        }
    }
</script>

<style scoped>

    .mainBody{
        display: flex;
        align-items: center;
        height: 72vh;
        justify-content:space-between;
    }

    .item {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        flex-grow: 1;
        margin: 5px;
    }

    #avatar-container {
        position: relative;
        width:20vh;
        height:20vh;
        min-width: 100px;
        min-height: 100px;
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

    #avatar-container:hover #overlay {
        display: block;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .userName{
        font-size:30px;
        margin-top:12px
    }

    .Signature{
        width: 200px;
        font-size:15px;
        margin:10px;
        color:gray;
        background-color: white;
        border: none;
        text-align:center;
    }

    .selfIntroduction{
        margin-top:20px;
        width:80%;
        min-width: 30vh;
        max-width: 50vh;
    }
    .subtitle{
        width:100%; 
        text-align: left;
    }

    .dzmInput{
        cursor: text;
    }

    .dzmInput:empty:before{
        content: attr(placeholder);
        color:rgba(0, 0, 0, 0.5);
    }

    textarea{
        border: none;
        resize: none;
        font-family: Arial, sans-serif;
        background-color: white;
        width: 100%;
        height: auto;
        font-size:15px;
    }

    hr{
        margin-bottom:20px ;
    }

    #divPugeBut{
        display: flex;
        flex-direction: column;
    }

    .pugeBut{
        margin-top:5px;
    }

</style> 