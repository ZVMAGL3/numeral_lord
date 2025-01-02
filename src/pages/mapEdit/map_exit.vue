<template>
    <div 
        class="outermost_layer" 
        @mousedown="mousedown" 
        @mousemove="mousemove" 
        @mouseup="mouseup"
    >
        <div class="checkerboard" :style="style">
            <battlefield/>
        </div>
    </div>
</template>

<script setup>
    import { computed,onMounted } from 'vue'
    import battlefield from '/src/components/map/battlefield.vue'
    import roleData from '/src/components/map/roleData.vue'
    import round_points from '/src/components/map/round_points.vue'
    import map from '/src/hooks/map.js'
    import around_fun from '/src/hooks/around.js'
    import positioning from '/src/hooks/positioning.js'
    import { useMapState } from '/src/hooks/useMapState.js'
    import { useStore } from 'vuex'
    const store = useStore()

    const { around2 } = around_fun()
    console.log(around2(1921,63))
    const {checkerboardSize} = map()
    const {coordinate,mousedown,mousemove,mouseup} = positioning()
    const { tileCodeString } = useMapState('map', ['tileCodeString']);
    let style = computed(()=>{
        return `${checkerboardSize.value}${coordinate.value}`
    })
        
    onMounted(()=>{
        //初始化
        // let list = Array(3969).fill('O')
        // store.commit('map/replaceAll',['tileCodeString',list])
        store.commit('map/replaceAll',['long',63])
        store.dispatch('map/edit_initialization')
        
        store.commit('map/reviseArray',['tileCodeString',1985,"M"])
        let old = [{new:1921,old:1985},{new:2047,old:1985},{new:1986,old:1985}]
        // let und_old = []
        let news = []
        // let i = 7
        // while(i > 0){
        //     i--
        // }
        setInterval(() => {
            
            // und_old.forEach(item => {
            //     store.commit('map/reviseArray',['tileCodeString',item,"O"])
            // })
            // und_old = []
            old.forEach(coordinate => {
                store.commit('map/reviseArray',['tileCodeString',coordinate.new,"M"])
                let son = around2(coordinate.new,63)
                let index = son.indexOf(coordinate.old)
                news.push({new:son[(index+2) % 6],old:coordinate.new})
                news.push({new:son[(index+4) % 6],old:coordinate.new})
            });
            news.sort((a,b) => a.new - b.new)
            for(let j = news.length - 1 ; j > 0 ; j--){
                if(news[j].new === news[j - 1].new){
                    news.splice(j,1)
                    news.splice(j - 1,1)
                    j--
                }else{
                    let erci = around2(news[j].new,63)
                    for(let z = 0 ; z < 6 ; z++ ){
                        if(news[j].old !== erci[z] && tileCodeString.value[erci[z]] === 'M'){
                            news.splice(j,1)
                            break
                        }
                    }
                }
            }
            old = [...news]
            news = []
        }, 1000);
    })
</script>

<style scoped>

    .outermost_layer{
        height: 100vh;
        width:100vw;
        background-color: #161c28;
    }

    .checkerboard{
        position: absolute;
        top: 50%;
        left: 50%;
    }

    .top{
        position: absolute;
        left: 50%;
        top: 0;
        transform: translate(-50%, 0%);
    }

    .middle{
        position: absolute;
        left: 0;
        top: 50%;
        transform: translate(0%,-50%);
    }

    .buttom{
        background-color: red;
        position: absolute;
        left: 50%;
        top: 100%;
        transform: translate(-50%,-100%); 
    }

</style>