const { pipeiStates } = require('../utils');
const addStates = (userId) => {
    let date = Date();
    pipei.set(userId,{date});
}
const pipei = (userId,data) => {
    let {} = data
    if(pipeiStates.has(userId)){
        return ;
    }else{
        if(pipeiStates.size){ //可以成功匹配的条件，暂定有人就开
            
        }else{
            addStates(userId)
        }
    }
}

module.exports = { pipei};