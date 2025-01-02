export default ()=>{
    function around(index,long,len,filter=true){
        let rows = (index - (index % long))/long //行数
        let Parity = rows % 2 //奇偶行
        let fix = Parity*2-1 //偏差修正
        let list = [index-long,index+fix,index+long,index+long-fix,index-fix,index-long-fix]
        if(!filter) return list
        if((Parity === 1 && (index === rows * long)) || (Parity === 0 && (index === (rows + 1) * long - 1))){
            list = list.slice(0,3)
        }else if((Parity === 1 && (index === (rows + 1) * long - 1)) || (Parity === 0 && (index === rows * long))){
            list = [list[0],...list.slice(2)]
        }
        return list.filter((element) => {
            return element >= 0 && element < len;
        });
    }
    function around2(index,long){
        let rows = (index - (index % long))/long //行数
        let Parity = rows % 2 //奇偶行
        return [index-long-Parity,index-1,index+long-Parity,index+long-Parity+1,index+1,index-long-Parity+1]
    }
    return { around,around2 };
}