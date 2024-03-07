<template>
    <div class="mainBody">
        <div class="item ">

            <!-- 用户头像 -->
            <!-- <div id="avatarContainer" >
                <img class="roundIcon" :src="userImagePath" />
                <div id="overlay" @click="uploadImage">切换头像</div>
                <input type="file" ref="fileInput" accept="image/jpeg,image/png" @change="onFileChange" style="display: none" />
            </div> -->
            <div class="avatarContainer">
                <avatarContainer
                    :imagePath="userImagePath" 
                    :Change="identity === 'self'"
                    :saveAvatar="saveAvatar"
                />
            </div>

            <!-- 用户姓名 -->
            <p class="userName">{{ userName }}</p>

            <!-- 个性签名 -->
            <input 
                type="text"
                class="Signature"
                v-if="!modifiedStatus"
                disabled
                :value="homePageInfoEdit.signature" 
                placeholder="还没有个性签名哦~"
            />
            <el-input 
                type="text"
                class="Signature"
                v-if="modifiedStatus"
                :disabled="false"
                v-model="signature" 
                placeholder="点击设置个性签名"
            />

            <!-- 用户邮箱 -->
            <a 
                class="userEmali"
                :href="`mailto:${homePageInfoEdit.emaliAddress}`" 
                v-if="homePageInfoEdit.emaliAddress && !modifiedStatus"
            >
                {{ homePageInfoEdit.emaliAddress }}
            </a>
            <!-- <input
                v-if="modifiedStatus"
                placeholder="点击设置邮箱地址"
                :value="homePageInfo.emaliAddress"
                @change="emaliAddressAlter($event.target.value)"
            /> -->

            <el-input
                v-if="modifiedStatus"
                class="Signature"
                size="mini"
                placeholder="点击设置邮箱地址"
                v-model="emaliAddress"
            ></el-input>

            <!-- 修改栏 -->
            <div id="divPugeBut" v-if="identity === 'self'">
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
                <div   
                    v-if="!modifiedStatus"
                    v-text="homePageInfoEdit.selfIntroduction"
                ></div>
                <!-- <div
                    class="dzmInput"
                    ref="selfIntroductionDiv"
                    v-if="modifiedStatus"
                    contenteditable
                    v-text="homePageInfoEdit.selfIntroduction"
                    placeholder="请输入内容"
                    @input="selfIntroductionAlter($event)"
                ></div> -->
                <el-input
                    type="textarea"
                    class="dzmInput"
                    v-if="modifiedStatus"
                    :autosize="{ minRows: 2, maxRows: 6}"
                    maxlength="521"
                    placeholder="请输入内容"
                    v-model="selfIntroduction"
                    show-word-limit
                ></el-input>
                <!-- <div v-if="modifiedStatus" class="remainingCharacters">
                    {{ remaining }}/{{ limit }}
                </div> -->
            </div>

            <!-- 校园经历 -->
            <div class="selfIntroduction" v-if="homePageInfoEdit.campusExperience || modifiedStatus">
                <p class="subtitle">校园经历:</p><hr/>
                <div   
                    v-if="!modifiedStatus"
                    v-text="homePageInfoEdit.campusExperience"
                ></div>
                <!-- <div   
                    class="dzmInput"
                    v-if="modifiedStatus"
                    contenteditable
                    v-text="homePageInfoEdit.campusExperience"
                    placeholder="请输入内容"
                    @blur="asd"
                ></div> -->
                <el-input
                    type="textarea"
                    class="dzmInput"
                    v-if="modifiedStatus"
                    :autosize="{ minRows: 2, maxRows: 6}"
                    maxlength="521"
                    placeholder="请输入内容"
                    v-model="campusExperience"
                    show-word-limit
                ></el-input>
            </div>
        </div>
    </div>
</template>

<script>
    import avatarContainer from '/src/components/avatarContainer'
    import { mapState,mapMutations,mapActions } from 'vuex'
    export default {
        name:'homePage',
        components:{avatarContainer},
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
            ...mapState('homePage',['homePageInfo','userImagePath','homePageInfoEdit','identity','userName']),
            ...mapState('processUserInfo',['userInfo']),
            emaliAddress:{
                get(){
                    return  this.homePageInfoEdit.emaliAddress
                },
                set(value){
                    this.emaliAddressAlter(value)
                }
            },
            remaining(){
                return this.homePageInfoEdit.selfIntroduction.length
            },
            selfIntroduction:{
                get(){
                    return  this.homePageInfoEdit.selfIntroduction
                },
                set(value){
                    this.selfIntroductionAlter(value)
                }
            },
            campusExperience:{
                get(){
                    return  this.homePageInfoEdit.campusExperience
                },
                set(value){
                    this.campusExperienceAlter(value)
                }
            },
            signature:{
                get(){
                    return this.homePageInfoEdit.signature
                },
                set(value){
                    this.signatureAlter(value)
                }
            },
            route() {
                return this.$route
            }
        },
        methods:{
            ...mapMutations('homePage',['signatureAlter','emaliAddressAlter','campusExperienceAlter','selfIntroductionAlter','cancelHomePageInfo']),
            ...mapActions('homePage',['saveHomePageInfo','saveAvatar','homePageInitialization']),
            asd($event){
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
            },
            /* selfIntroductionAlter($event){
                this.$store.commit('homePage/selfIntroductionAlter',{text:$event.target.textContent,limit:this.limit})
                console.log($event.target.textContent)
            } */

        },
        watch:{
            '$route.params'(newParams,oldParams){
                if(newParams.account && oldParams.account){
                    console.log(newParams,oldParams,'watch')
                    this.homePageInitialization(newParams.account)
                }
            }
        }
    }
</script>

<style scoped>

    .mainBody{
        margin:auto;
        display: flex;
        align-items: center;
        height: 80vh;
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
 
    .avatarContainer {
        position: relative;
        width:20vh;
        height:20vh;
        min-width: 100px;
        min-height: 100px;
    }
/*
    #avatarContainer:hover #overlay {
        display: block;
        display: flex;
        align-items: center;
        justify-content: center;
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
 */
    .userEmali{
        margin:5px;
    }
/* 
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
 */
    .userName{
        font-size:30px;
        margin-top:12px
    }

    .Signature{
        width: 200px;
        font-size:15px;
        margin:5px;
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
        width: 100%;
    }

    .dzmInput:empty:before{
        content: attr(placeholder);
        color:rgba(0, 0, 0, 0.5);
    }
/* 
    .remainingCharacters {
        text-align: right;
        font-size: 12px;
        color: #666;
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
 */
    .pugeBut{
        margin-top:5px;
    }

</style> 