<template>
    <div class="resultInquiry">
        <div v-if="!(identity === 'student')">
            <div class="searchArea">
                <div class="queryInputBox">
                    <el-input
                        type="text"
                        placeholder="请输入学生姓名或者学生号"
                        v-model="searchInput"
                        maxlength="10"
                        show-word-limit
                        style="width:225px"
                    ></el-input>
                </div>
                <div class="queryButton">
                    <el-button type="primary" @click="resultInquiry">查询</el-button>
                </div>
            </div>
        </div>
        <div>
            <el-table
                class="resultTable"
                :data="resultEdit"
                stripe
                @sort-change="sortChange"
                style="width: 100%;"
            >
                <el-table-column
                    prop="account"
                    label="学号"
                    sortable
                ></el-table-column>
                <el-table-column
                    prop="userName"
                    label="姓名"
                ></el-table-column>
                <el-table-column
                    prop="chineseScore"
                    label="语文成绩"
                    sortable
                ></el-table-column>
                <el-table-column
                    prop="mathScore"
                    label="数学成绩"
                    sortable
                ></el-table-column>
                <el-table-column
                    prop="englishScore"
                    label="英语成绩"
                    sortable
                ></el-table-column>
            </el-table>
            <el-pagination
                v-if="!(identity === 'student')"
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                :current-page.sync="currentPage"
                :page-sizes="[10, 20, 30, 40]"
                :page-size="sizepage"
                layout="total, sizes, prev, pager, next, jumper"
                :total="total">
            </el-pagination>
        </div>
    </div>
</template>

<script>
    // import { mapState } from 'vuex';
    export default {
        name:'resultInquiry',
        data(){
            return{
                searchInput:'',
                currentPage:1,
                sizepage:10,
            }
        },
        computed:{
            // ...mapState('resultsProcessing',['result']),
            resultEdit(){
                console.log(this.$store.state.resultsProcessing.resultEdit)
                return this.$store.state.resultsProcessing.resultEdit.slice((this.currentPage-1)*this.sizepage,this.currentPage*this.sizepage)
            },
            total(){
                return this.$store.state.resultsProcessing.resultEdit.length
            },
            identity(){
                return this.$store.state.processUserInfo.userInfo.identity
            }
        },
        methods: {
            handleSizeChange(val) {
                this.sizepage = val
                this.currentPage = 1
            },
            handleCurrentChange(val) {
                this.currentPage = val
            },
            sortChange(column){
                this.$store.commit('resultsProcessing/sortChange',{prop:column.prop,order:column.order})
            },
            resultInquiry(){
                this.$store.dispatch('resultsProcessing/resultInquiry',this.searchInput)
            }
        },
    }
</script>

<style scoped>

    .resultInquiry{
        margin-top: 50px;
        margin-left: 100px;
        width: 50vw;
    }

    .searchArea{
        display: flex;
        align-items: center;
        width:100%;
        height: 50px;

        background-color:aquamarine;
    }

    .queryInputBox{
        margin-left: 5px;
    }

    .queryButton{
        margin-left: 10px;
    }
</style>