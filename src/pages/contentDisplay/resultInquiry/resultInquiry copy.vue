<template>
    <div>
        <div class="searchArea" v-if="!(identity === 'student')">
            <searchArea :modifyStatus="modifyStatus"/>
        </div>
        <div>
            <table>
                <tr>
                    <th v-for="cell in result.th" :key="cell">
                        {{ cell }}
                    </th>
                </tr>
                <tr v-for="(row, rowIndex) in result.td" :key="row[1]">
                    <td v-for="(cell,cellIndex) in row" :key="result.th[cellIndex]">
                        <input 
                            class="interact"
                            :disabled="(cellIndex < 2) || modifiedStatus"
                            :value="cell" 
                            @change="updateTableData([rowIndex, cellIndex, $event.target.value])"
                        />
                    </td>
                </tr>
                <!-- <template v-if="identity === 'student'">
                    <tr>
                        <td v-for="(cell,index) in result.td[0]" :key="result.th[index]">
                            <input 
                                class="interact"
                                disabled
                                :value="cell" 
                            />
                        </td>
                    </tr>
                </template> -->
            </table>
        </div>
    </div>
</template>

<script>
    import searchArea from './searchArea'
    import { mapGetters,mapActions } from 'vuex'

    export default {
        name:'resultInquiry',
        components:{searchArea},
        data(){
            return{
                modifiedStatus:true, //保存修改状态
            }
        },
        computed:{
            ...mapGetters('resultsProcessing',['result']),
            identity(){
                return this.$store.state.processUserInfo.userInfo.identity
            }
        },
        methods:{
            ...mapActions('resultsProcessing',['updateTableData']),
            modifyStatus(value){
                this.modifiedStatus = value
            }
        }
    }
</script>

<style scoped>
    table {
        border-collapse: collapse;
        font-family: Futura, Arial, sans-serif;
        table-layout: fixed;
        width: 100%;
        border: 0px solid ;
    }

    th {
        font-size: 17px;
    }

    th {
        width : 100px ;
        padding: 12px;
        background: #555 nonerepeat scroll 0 0;
        border: 1px solid #777;
        color: #fff;
    }

    td {
        border: 1px solid#777;
    }
    
    th {
        background: #696969;
        color:#FFFFFF;
    }

    tbody tr:nth-child(odd) {
        background: #ccc;
    }

    .interact{
        width: 100%;
        height: 100%;
        padding: 12px;
        border:0px;
        box-sizing: border-box;
        text-align: center;
        font-size:15px
    }

</style>