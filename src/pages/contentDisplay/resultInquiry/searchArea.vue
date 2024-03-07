<template>
    <div>
        <button @click="modifyStatus(false)">修改</button>
        <button @click="reviseResult">保存</button>
        <button @click="cancelModification">取消</button><br/>
        <input type="search" v-model="searchInput" placeholder="请输入学生姓名或者学生号">
        <button @click="resultInquiry">查找</button>
    </div>
</template>

<script>
    export default {
        name:'searchArea',
        props:['modifyStatus'],
        data(){
            return{
                searchInput:''
            }
        },
        methods:{
            //保存数据
            reviseResult(){
                this.$store.dispatch('resultsProcessing/reviseResult').then(() => {
                    this.modifyStatus(true)
                })
            },
            //取消操作
            cancelModification(){
                this.$store.commit('resultsProcessing/cancelModification').then(() => {
                    this.modifyStatus(true)
                })
            },
            //查找,重新加载表格
            resultInquiry(){
                this.$store.dispatch('resultsProcessing/resultInquiry',this.searchInput)
            }
        }
    }
</script>

<style>

</style>