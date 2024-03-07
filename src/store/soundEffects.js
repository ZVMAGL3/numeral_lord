export default {
    namespaced: true,
    //数据存储
    state: () => ({
        trigger:0,
        pictureIndex:0,
    }),
    mutations: {
        countTrigger(state){
            state.trigger = (state.trigger + 1) % 2
        },
        //指定替换
        replaceAll(state,array){
            state[array[0]] = array[1]
        },
    },
    actions:{
        //播放音效
        playSound(context,index){
            context.commit('countTrigger')
            context.commit('replaceAll',['pictureIndex',index])
        },
	},
}
