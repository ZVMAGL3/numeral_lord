<template>
    <div class="messageReleaseArea">
        <div class="userImage">
            <div class="avatarContainer">
                <avatarContainer
                    :imagePath="imagePath"
                />
            </div>
            <div style="flex:1;"></div>
        </div>
        <div class="operatingArea" :style="`height:${editingAreaHeight}%`">
            <div class="spacer"></div>
            <div class="editingArea">
                <el-input
                    type="textarea"
                    resize="none"
                    class="customTextarea"
                    :style="{ '--line-height': style.lineHeight, '--font-size': style.fontSize}"
                    :placeholder="placeholder"
                    maxlength="521"
                    v-model="messageText"
                    :show-word-limit="showWordLimit"
                    @focus="handleFocus"
                    @blur="handleblur"
                ></el-input>
            </div>
            <div class="spacer"></div>
            <button
                class="publishButton"
                :style="{'--button-bacc':style.buttonBacc}"
                @click="saveMessage"
            >发布</button>
        </div>
    </div>
</template>

<script>
    import avatarContainer from '/src/components/avatarContainer'
    export default {
        name:'userInput',
        props:{
            imagePath:{
                type:String,
            },
            placeholder:{
                type:String,
				default:'想与大家一起分享今天遇到的趣事吗',
            },
            replyType:{
                type:String,
            },
            id:{
                type:Number,
            },
            packagingMethod:{
                type:Function,
            },
            replyTo:{
                type:String,
                dafault:''
            }
        },
        components:{avatarContainer},
        data(){
            return{
                //编辑留言板的内容
                showWordLimit:false,
                Text:'',
                editingAreaHeight:'75',
                style:{
                    lineHeight:2.5,
                    fontSize:'14px',
                    buttonBacc:'#7fd6f5',
                },
            }
        },
        computed:{
            messageText:{
                get(){
                    return this.Text
                },
                set(newValue){
                    this.Text = newValue
                    if(newValue === ''){
                        this.style = {lineHeight:2.5,fontSize:'14px',buttonBacc:'#7fd6f5'}
                        this.showWordLimit=false
                    }else{
                        this.style = {lineHeight:'normal',fontSize:'12px',buttonBacc:'#00aeec'}
                        this.showWordLimit=true
                    }
                }
            }
        },
        methods:{
            saveMessage(){
                if(this.messageText === ''){
                    this.$message({
                        message: '您还没有输入内容',
                        center: true
                    });
                }else if(this.replyType === 'message'){
                    this.$store.dispatch('messageBoard/saveMessage',this.messageText)
                }else{
                    // this.$store.dispatch('messageBoard/saveComment',{userComment:(this.prefix + this.messageText),id:this.id})
                    this.$store.dispatch('messageBoard/saveComment',{userComment:this.messageText,id:this.id,replyTo:this.replyTo})
                    //执行打开全部评论区,并跳转到最后一页
                    this.packagingMethod(true)
                }
                this.messageText = ''
                this.editingAreaHeight = '75'
            },
            handleFocus(){
                this.editingAreaHeight = '100'
            },
            handleblur(){
                if(this.messageText === ''){
                    this.editingAreaHeight = '75'
                }
            },
        }
    }
</script>

<style scoped>

    .messageReleaseArea{
        display: flex;
        width:100%;
        height:100%;
    }

    .userImage{
        min-width: 55px;
        height: 100%;
    }

    .avatarContainer{
        width: 55px;
        height: 55px;
    }

    .operatingArea{
        flex:1;
        display: flex;
    }

    .operatingArea,.operatingArea > * {
        transition: height 0.3s ease;
    }

    .editingArea{
        height: 100%;
        flex-grow: 0.96;
    }

    ::v-deep .customTextarea{
        height: 100%;
    }

    ::v-deep .customTextarea>.el-textarea__inner{
        height: 100%; 
        line-height: var(--line-height);
        font-size: var(--font-size);
        font-family:font-microsoft-yahei; 
        background-color:rgb(241,242,243,255);
    }

    ::v-deep .customTextarea>.el-textarea__inner:hover{
        background-color:#ffffff ;
    }

    ::v-deep .customTextarea>.el-textarea__inner:focus{
        background-color:#ffffff ;
    }
    
    ::v-deep .customTextarea>textarea::placeholder {
        color:rgb(148,153,160,255);
        font-family:font-microsoft-yahei; 
    }

    ::v-deep .customTextarea>span{
        background-color:rgb(0,0,0,0) ;
    }

    .spacer{
        flex-grow: 0.02;
    }

    .publishButton{
        border:none;
        cursor: pointer;
        height: 100%;
        width: 80px;
        border-radius: 4px;
        font-size:16px;
        font-family: Arial;
        color:#ffffff;
        background-color: var(--button-bacc);
    }

</style>