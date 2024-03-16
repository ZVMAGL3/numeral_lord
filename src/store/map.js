export default {
    namespaced: true,
    //数据存储
    state: () => ({
        tileCodeString: "",
        long: 0,
        soldiers:[], //战棋分布,index(下标)--坐标,contingent--玩家编号,dots--点数
        abbreviatedChessboard: new Set([]), //只有存在棋子格子的下标
        specialForces: new Set([]), //存储所有断电兵的下标

        combatUnit: new Set([]), //当前可移动战斗单位下标
        combatUnitAll:new Set([]), //所有的战斗单位
        inactivate: new Set([]), //本回合失去行动力
        player_name:['玩家一','玩家二'], //玩家昵称，开始游戏时传递过来，下标对应行动编号
        player_num:2, //玩家数量
        player_ico:['TS1001.png','TS1002.png'], //玩家图标 (后续要后端控制玩家编号)
        actioning: 0, //当前行动的玩家编号
        team:[], //玩家所属队伍 下标对应队伍
        troop: [new Set([0]),new Set([1])], //下标为队伍,内部为队伍对应的玩家编号
        // survive: new Set([]), //记录存活的队伍编号
        operable:new Set([0,1]), //当前客户端可以操作的对象 (后续要后端控制玩家编号)
        fraction:[], //玩家点数，下标对应玩家编号
        process:0, //流程 0--行动回合,1--加点回合
        selected:[],//记录选定的点
        score:[], //可用积分
        roundScore:[], //下回合的积分

        json:{
            id:1001, //地图编号
            author:"maker", //地图作者
        
            player_num:2, //玩家数量
            team:[0,1], //玩家所属队伍
            width:9,  //地图宽度
            terrain:"MMMMMMMPVPSMOOMOMPMOOMMOMMVPMOSMPOMPPMMPPMMPVPMOPMSOMPMMOMMOOMVPMOMOOMSPPMMMMMMMV", //地形编号
            soldiers:[ //战棋分布下标分别为0--坐标,1--玩家编号,2--点数
                [10,0,2],
                [11,0,1],
                [30,1,1],
                [50,0,1],
                [69,1,1],
                [70,1,2],
                [79,1,1],
            ]
        }
    }),
    mutations: {
        //指定替换
        replaceAll(state,array){
            state[array[0]] = array[1]
        },
        //修改回合加分
        reviseRoundScore(state,array){
            state.roundScore[array[0]] = array[1]
        },
        //修改积分
        reviseFraction(state,array){
            state.fraction[array[0]] += array[1]
        },
        //修改士兵
        reviseSoldiers(state,chessman){
            const oldContingent = state.soldiers[chessman[0]].contingent
            const oldDots = state.soldiers[chessman[0]].dots
            if(chessman[1].contingent >= 0){
                state.fraction[chessman[1].contingent] += chessman[1].dots
            }
            if(oldContingent >= 0){
                state.fraction[oldContingent] -= oldDots
            }
            console.log(state.fraction,chessman[1].dots,oldContingent)

            state.soldiers[chessman[0]] = chessman[1]
        },
        reviseSoldiersDots(state,chessman){
            state.soldiers[chessman[0]].dots = chessman[1]
        },
        //Set类型的属性,添加元素
        addSet(state,array){
            state[array[0]].add(array[1])
        },
        //Set类型的属性,删除元素
        unSet(state,array){
            state[array[0]].delete(array[1])
        },
        //Set类型的属性,清空元素
        clearSet(state,name){
            state[name].clear()
        },
        addArray(state,array){
            state[array[0]].push(array[1])
        },
        reviseArray(state,chessman){
            state[chessman[0]][chessman[1]] = chessman[2]
        },
        clearArray(state,name){
            state[name] = []
        },
    },
    actions: {

        //初始化
        initialization(context){
            const json = context.state.json
            context.commit('replaceAll',["tileCodeString",json.terrain])
            context.commit('replaceAll',["long",json.width])
            context.commit('replaceAll',["team",json.team])
            context.commit('replaceAll',["fraction",new Array(json.player_num).fill(0)])
            
            const defaultValue = {'contingent':-1, 'dots': 0}; //初始化地块
            const myArray = new Array(json.terrain.length).fill(defaultValue);
            context.commit('replaceAll',['soldiers',myArray]) 

            context.commit('replaceAll',['score',new Array(json.team.length).fill(0)])
            context.commit('replaceAll',['roundScore',new Array(json.team.length).fill(0)])

            json.soldiers.forEach(item => {
                context.commit('reviseSoldiers',[item[0],{'contingent':item[1],'dots':item[2]}])
                context.commit('addSet',['abbreviatedChessboard',item[0]])
                context.commit('addSet',['specialForces',item[0]]) //将目标地添加到断电兵中
                // context.commit('reviseFraction',[item[1],item[2]]) //初始化积分
            });

            for (let index = 0; index < json.terrain.length; index++) {
                const item = json.terrain[index];
                if(item === "S" && context.state.specialForces.has(index)){
                    let contingent = context.state.soldiers[index].contingent
                    context.commit('unSet',['specialForces',index]) //删除断电兵中的自己
                    context.commit('reviseRoundScore',[contingent,context.state.roundScore[contingent]+1]) //开始计算下回合的加点
                    // context.commit('addSet',['survive',context.state.soldiers[index].contingent]) //删除断电兵中的自己
                    context.dispatch('powerUps',index)
                }
            }

            context.commit('replaceAll',['actioning',0])
            context.commit('replaceAll',['process',0])
            context.dispatch('startRound',0)
        },

        //开始回合
        startRound(context,actioning){
            console.log(actioning)
            const player_num = context.state.player_num //玩家数量
            const score = context.state.score //存储的点数
            const roundScore = context.state.roundScore //回合点数
            
            while(roundScore[actioning % player_num]  === 0){
                actioning = (actioning + 1) % player_num
            }

            context.commit('replaceAll',['actioning',actioning])

            //计算可以加点的数量
            context.commit('reviseArray',['score',actioning,score[actioning]+roundScore[actioning]]) //开始计算下回合的加点
            context.commit('replaceAll',['process',0])
            
            context.dispatch('reviseCombatUnit',actioning)
        },

        //战斗单位
        reviseCombatUnit(context,team){
            const soldiers = context.state.soldiers
            const abbreviatedChessboard = context.state.abbreviatedChessboard;
            const tileCodeString = context.state.tileCodeString;
            const long = context.state.long;
            const inactivate = context.state.inactivate
            const specialForces = context.state.specialForces
            const process = context.state.process

            context.commit('clearSet','combatUnit')
            context.commit('clearSet','combatUnitAll')

            abbreviatedChessboard.forEach(item => {
                
                if(( soldiers[item].dots > 1 || specialForces.has(item) ) && !inactivate.has(item)){
                    let aroundIndex = around(item,long,tileCodeString.length) //返回附近格子的下标
                    for (let i = 0 , len = aroundIndex.length; i < len; i++) {
                        
                        const tileCode = tileCodeString[aroundIndex[i]];
                        //检查附近地块可否通行
                        if(isPassableTile(tileCode)){
                            let contingents=[soldiers[aroundIndex[i]].contingent,soldiers[item].contingent]
                            //检查附近地块是否可以前进
                            if(!abbreviatedChessboard.has(aroundIndex[i]) || (context.state.team[contingents[0]] !== context.state.team[contingents[1]])){
                                if(contingents[1] === team){
                                    context.commit('addSet',['combatUnit',item])
                                }
                                context.commit('addSet',['combatUnitAll',item])
                                break
                            }
                        }
                    }
                }
            })
            
            const combatUnit = context.state.combatUnit
            if(!combatUnit.size && !process){
                console.log('结束回合')
                context.commit('replaceAll',['process',1])
                context.commit('clearSet','inactivate')
            }
        },
        
        //处理点击事件(战斗回合)
        selectedEvent(context,index){
            const soldiers = context.state.soldiers //战棋分布,index(下标)--坐标,contingent--玩家编号,dots--点数
            const long = context.state.long
            const tileCodeString = context.state.tileCodeString
            const selected = context.state.selected //记录选定的点
            const combatUnit = context.state.combatUnit //当前可移动战斗单位下标
            const operable = context.state.operable //当前客户端可以操作的对象
            const player_num = context.state.player_num //玩家数量
            const actioning = context.state.actioning % player_num //当前行动的队伍编号
            const team = context.state.team //玩家所属队伍 下标对应队伍
            const troop = context.state.troop //下标为队伍,内部为队伍对应的玩家编号
            const specialForces = context.state.specialForces //断电部队
            const inactivate = context.state.inactivate //失活
            const roundScore = context.state.roundScore //回合点数


            const tileCode1 = tileCodeString[selected[0]]
            const tileCode2 = tileCodeString[index]
            let soldier1 = {}
            const soldier2 = soldiers[index]

            //判断是否是可操作的部队
            function addSelected(click=true){
                if(operable.has(actioning) && combatUnit.has(index)){ //判断是否有权操作,判断是否可以行动
                    context.commit('addArray',['selected',index])
                    
                    if(click){
                        //音效
                        playSound(1)
                    }
                }
            }

            //播放音效
            function playSound(index){
                context.dispatch('soundEffects/playSound',index,{root:true})
            }

            //查询周围是否有同队的通电兵
            function judgeLink(subscript){
                let aroundSelected = around(subscript,long,tileCodeString.length) //返回附近格子的下标
                for(let i = 0;i < aroundSelected.length;i++){
                    if(soldiers[aroundSelected[i]].contingent === actioning && !specialForces.has(aroundSelected[i])){ //判断是不是自己的部队&&判断这个兵有没有通电
                        return true
                    }
                }
                return false
            }

            //判定目标地是否失活
            function judgeInactivate(myTroop,eating,powerOutage){
                console.log(soldier1.dots)
                if((tileCode1 === 'O' && (tileCode2 === 'M' || tileCode2 === 'S')) || (soldier1.dots === 1) || (eating && powerOutage)){
                    console.log(123)
                    context.commit('addSet',['inactivate',index])
                }else{
                    //判断周围是否有据点,是否失活
                    let aroundIndex = around(index,long,tileCodeString.length)
                    for(let i = 0 ; i < aroundIndex.length;i++){
                        //这里的逻辑是遍历目标地周围的地块,如果是空地不考虑,如果有据点并且是敌军的据点,则失去行动力
                        if(soldiers[aroundIndex[i]].dots && (tileCodeString[aroundIndex[i]] === 'S' && !myTroop.has(soldiers[aroundIndex[i]].contingent))){
                            context.commit('addSet',['inactivate',index])
                        }
                    }
                }
            }

            //更新出发地的状态
            function renewDeparture(confrontation){
                if(specialForces.has(selected[0]) || !confrontation){ //判断出发地是不是断电兵
                    context.commit('reviseSoldiers',[selected[0],{'contingent':-1,'dots':0}]) //更新路径地块
                    context.commit('unSet',['abbreviatedChessboard',selected[0]]) //删除临时棋盘中的出发地下标
                    context.commit('unSet',['specialForces',selected[0]]) //删除断电兵中的自己
                }else{
                    context.commit('reviseSoldiers',[selected[0],{'contingent':actioning,'dots':1}]) //更新路径地块
                }
            }

            //更新到达目标地状态
            function updateArrives(myTroop,eating){
                context.commit('addSet',['abbreviatedChessboard',index]) //将目标地下标加入迷你棋盘
                let powerOutage = false
                if(tileCode2 === 'O' || (!judgeLink(index) && tileCode2 !== 'S')){ //判断目标地是不是海洋&&判断有没有和部队链接
                    context.commit('addSet',['specialForces',index]) //将目标地添加到断电兵中
                    powerOutage = true
                }else{
                    //链接周围能连接的断电兵
                    context.dispatch('powerUps',index)
                    context.commit('reviseRoundScore',[actioning,roundScore[actioning]+1]) //开始计算下回合的加点
                }
                if(tileCode2 === 'O'){
                    //音效
                    playSound(4)
                }else{
                    //音效
                    playSound(2)
                }
                judgeInactivate(myTroop,eating,powerOutage) //判定目标地是否失活
            }

            //士兵死亡事件
            function soldiersDie(subscript,contingent){
                context.commit('unSet',['inactivate',subscript]) //删除目标地的失活状态
                context.commit('unSet',['abbreviatedChessboard',subscript]) //删除临时棋盘中的出发地下标
                context.commit('reviseSoldiers',[subscript,{'contingent':-1,'dots':0}]) //更新死亡地
                
                //判断是不是断电兵
                if(specialForces.has(subscript)){
                    context.commit('unSet',['specialForces',subscript]) //删除目标地的断电兵状态
                }else{
                    //下回合加点-1
                    context.dispatch('reviseRoundScore',[contingent,context.state.roundScore[contingent]-1]) //开始计算下回合的加点

                    //断电逻辑
                    let unfiltered = around(subscript,long,tileCodeString.length,false) //返回附近格子的下标(未筛选)
                    let aroundSelected = around(subscript,long,tileCodeString.length) //返回附近格子的下标
                    let electrifiedAround = aroundSelected.filter(idx => soldiers[idx].contingent === contingent && !specialForces.has(idx));
                    let electrifiedAround_filtered = []
                    for(let i=0 ,j=5;i<6;i++){
                        if(electrifiedAround.includes(unfiltered[i]) && !electrifiedAround.includes(unfiltered[j])){
                            electrifiedAround_filtered.push(unfiltered[i])
                        }
                        j=i
                    }
                    let len = electrifiedAround_filtered.length - (tileCodeString[subscript] === 'S'?0:1)
                    let list1 = [] //[new Set([])]
                    let list2 = [] //[true,false]
                    
                    function breadthFirst(idx,serial){                     
                        list1[serial].add(idx) //向自己列表添加自己
                        let Selected = around(idx,long,tileCodeString.length) //返回附近格子的下标
                        for(let i = 0;i < Selected.length;i++){ //遍历周边的格子

                                
                            if(soldiers[Selected[i]].contingent === contingent && !list1[serial].has(Selected[i])){ //判断当前格子和自己是否是一个队伍
                                if(electrifiedAround_filtered.slice(serial+1).includes(Selected[i])){ 
                                    list1[serial].add(Selected[i]) //减组后添加到前辈里面
                                    electrifiedAround_filtered = electrifiedAround_filtered.filter(item => item !== Selected[i])
                                    len -= 1
                                    if(!len) return true //列对数归零说明死亡点周围的点是相连的,
                                }
                                let tileCode =tileCodeString[Selected[i]] //记录当前格子的地形
                                if(tileCode === 'S'){ //如果是据点,完成目标
                                    list1[serial].add(Selected[i]) //向自己列表添加自己
                                    return true
                                }else if(tileCode === 'M'){ //如果是陆地则说明相连,查它
                                    for(let j = 0 ; j < serial ; j++){ //查询前辈的状态,是不是找到了据点,是否有链接
                                        if(list2[j] && list1[j].has(Selected[i])){
                                            return true
                                        }
                                    }
                                    if(breadthFirst(Selected[i],serial)){
                                        return true
                                    }
                                }
                            }
                        }
                        return false
                    }
                    
                    for(let i = 0 ; i < electrifiedAround_filtered.length ; i++){
                        list1[i] = new Set([])
                        let tileCode =tileCodeString[electrifiedAround_filtered[i]] //记录当前格子的地形
                        let Power = false
                        if(tileCode === "S"){
                            Power = true
                            list1[i].add(electrifiedAround_filtered[i])
                        }else{
                            Power = breadthFirst(electrifiedAround_filtered[i],i)
                        }
                        list2[i] = Power
                    }
                    list2.forEach((item,index) => {
                        if(!item){
                            list1[index].forEach(idx => {
                                if(soldiers[idx].dots > 1){
                                    context.commit('reviseSoldiers',[idx,{'contingent':soldiers[idx].contingent,'dots':soldiers[idx].dots - 1}]) //点数减一
                                    context.commit('addSet',['specialForces',idx]) //将目标地添加到断电兵中
                                }else{
                                    context.commit('reviseSoldiers',[idx,{'contingent':-1,'dots':0}]) //删除点数等于一
                                    context.commit('unSet',['inactivate',idx]) //删除目标地的失活状态
                                    context.commit('unSet',['abbreviatedChessboard',idx]) //删除临时棋盘中的出发地下标
                                }
                            })
                            //加点数需要减去list1[index].length
                            context.dispatch('reviseRoundScore',[contingent,roundScore[contingent]-list1[index].size]) //开始计算下回合的加点
                        }
                    })

                }
            }
            
            //主程序
            if(isPassableTile(tileCode2)){ //判断点击的方块是否为可操作的地块
                if(selected.length){ //判断是否有选中的棋子
                    soldier1 = soldiers[selected[0]] //获取选中的棋子对象
                    let dost1 = soldier1.dots //获取选中棋子的大小
                    let aroundSelected = around(selected[0],long,tileCodeString.length) //返回附近格子的下标v
                    context.commit('clearArray','selected') //不管什么情况,都去掉选中状态

                    //!!!删除附近格子的选中状态??

                    //情况一,点击的是空地,情况二,点击的是敌军,情况三,点击的是友军非战斗单位,情况四,点击的是友军的战斗单位,情况五,点击的是自己√,情况六,是否为阻挡
                    if(aroundSelected.includes(index)){ //是否点击的是附近的格子
                        const myTroop = troop[team[soldier1.contingent]] //行动者的队伍
                        if(myTroop.has(soldiers[index].contingent)){ //是否为友军
                            addSelected()
                        }else{
                            if(soldier2.dots){ //敌军
                                //如果是断电兵,攻击力等于自身,因为攻击的时候默认减一,所以在这里抵消
                                if(specialForces.has(selected[0])){
                                    dost1+=1
                                }
                                const dost2 = soldier2.dots
                                const defense = !inactivate.has(index)
                                if(defense){//有无防御
                                    if(dost1 > dost2){ //消灭
                                        
                                        //棋子死亡事件
                                        soldiersDie(index,soldier2.contingent)
                                        //更新出发地
                                        renewDeparture(true)
                                        if(dost1 - dost2 > 1){ //前进
                                            context.commit('reviseSoldiers',[index,{'contingent':actioning,'dots':(dost1 - dost2 - 1)}]) //更新目标地
                                            //更新到达后的状态
                                            updateArrives(myTroop,true)
                                        }else{ //不前进
                                            context.commit('reviseSoldiers',[index,{'contingent':-1,'dots':0}]) //更新目标地
                                            //音效
                                            playSound(3)
                                        }

                                    }else{ //未消灭,破防
                                        //棋子死亡事件
                                        soldiersDie(selected[0],soldier1.contingent)
                                        if(tileCode2 !== 'S'){
                                            context.commit('addSet',['inactivate',index]) //目标地失活/破防
                                        }
                                        context.commit('reviseSoldiers',[index,{'contingent':soldier2.contingent,'dots':dost2 - dost1 + 1}]) //更新目标地块
                                        //音效
                                        playSound(3)                                        
                                    }
                                }else{
                                    if(dost1 > dost2){ //消灭
                                        //更新出发地
                                        renewDeparture(true)
                                        //棋子死亡事件
                                        soldiersDie(index,soldier2.contingent)
                                        //更新目标地
                                        context.commit('reviseSoldiers',[index,{'contingent':actioning,'dots':(dost1 - 1)}]) 
                                        //更新到达后的状态
                                        updateArrives(myTroop,true)
                                    }else{ //未消灭
                                        context.commit('addSet',['inactivate',selected[0]]) //出发地失活
                                        context.commit('reviseSoldiers',[index,{'contingent':soldier2.contingent,'dots':dost2 - dost1 + 1}]) //更新目标地块
                                        //音效
                                        playSound(3)
                                    }
                                }
                            }else{ //空地
                                //更新目标地
                                context.commit('reviseSoldiers',[index,{'contingent':actioning,'dots':(dost1-1?dost1-1:1)}])
                                //更新出发地
                                renewDeparture(true)
                                //更新到达后的状态
                                updateArrives(myTroop,false)
                            }

                            //重新渲染战斗单位
                            context.dispatch('reviseCombatUnit',actioning).then(()=>{  
                                // context.dispatch('selectedEvent',index) //将移动后的地块设置为选中的
                                addSelected(false)
                            })
                        }
                    }else if(!(selected[0] === index)){
                        addSelected()
                    }
                }else{
                    addSelected()

                    //给附近格子加上样式

                }
            }else{
                context.commit('clearArray','selected')
            }
        },

        //处理点击事件(加点回合)
        bonusEvent(context,index){
            const tileCodeString = context.state.tileCodeString
            const soldiers = context.state.soldiers //战棋分布,index(下标)--坐标,contingent--玩家编号,dots--点数
            const specialForces = context.state.specialForces //断电部队
            const player_num = context.state.player_num
            const actioning = context.state.actioning % player_num//当前行动的队伍编号
            const score = context.state.score //可用积分

            const tileCode = tileCodeString[index]

            //播放音效
            function playSound(index){
                context.dispatch('soundEffects/playSound',index,{root:true})
            }

            if(isPassableTile(tileCode)){
                if(soldiers[index].contingent === actioning){
                    if(!specialForces.has(index)){
                        context.commit('reviseSoldiers',[index,{'contingent':actioning,'dots':soldiers[index].dots + 1}])
                        context.commit('reviseArray',['score',actioning,score[actioning]-1])
                        context.dispatch('reviseCombatUnit',actioning)
                        playSound(0)
                        if(!score[actioning]){
                            console.log('加点回合结束')
                            context.dispatch('startRound',(actioning+1)%player_num)
                        }
                    }else{
                        console.log('断电兵不能加点')
                    }
                }else{
                    console.log('这不是你能加点的部队')
                }
            }else{
                console.log('当前地块不可操作')
            }

        },

        //连通事件
        powerUps(context,index){
            const soldiers = context.state.soldiers //战棋分布,index(下标)--坐标,contingent--玩家编号,dots--点数
            const long = context.state.long
            const tileCodeString = context.state.tileCodeString
            const specialForces = context.state.specialForces //断电部队
            const contingent = soldiers[index].contingent
            const aroundSelected = around(index,long,tileCodeString.length) //返回附近格子的下标
            const roundScore = context.state.roundScore
            aroundSelected.forEach(idx => {
                if(specialForces.has(idx) && soldiers[idx].contingent === contingent && !(tileCodeString[idx] === "O")){
                    context.commit('reviseRoundScore',[contingent,roundScore[contingent]+1]) //增加下回合的加点
                    context.commit('unSet',['specialForces',idx]) //删除断电兵中的自己
                    context.dispatch('powerUps',idx)
                }
            })
        },

        reviseRoundScore(context,array){
            context.commit('reviseRoundScore',array)
            if(array[1] === 0){
                const player_num = context.state.player_num
                const actioning = context.state.actioning % player_num //当前行动的队伍编号
                const soldiers = context.state.soldiers //战棋分布,index(下标)--坐标,contingent--玩家编号,dots--点数
                const roundScore = context.state.roundScore
                const team = context.state.team //编号对应的队伍
                soldiers.forEach((item,index) => {
                    if(item.contingent === array[0]){
                        context.commit('unSet',['inactivate',index]) //删除目标地的失活状态
                        context.commit('unSet',['abbreviatedChessboard',index]) //删除临时棋盘中的出发地下标
                        context.commit('reviseSoldiers',[index,{'contingent':-1,'dots':0}]) //更新死亡地
                        context.commit('unSet',['specialForces',index]) //删除目标地的断电兵状态
                    }
                })
                if(array[0] === actioning){ //如果是行动者死亡则直接结束回合
                    context.dispatch('startRound',context.state.actioning+1)
                }

                //如果死亡判断是不是只有一个队伍
                let troop = new Set([])
                roundScore.forEach((score,index) => {
                    if(score > 0){
                        troop.add(team[index])
                    }
                })
                if(troop.size === 1){
                    console.log('游戏结束')
                }
            }
        }
        
	},
}

function around(index,long,len,filter=true){
    let rows = (index - (index % long))/long
    let Parity = rows % 2
    let fix = Parity*2-1
    let list = [index-9,index+fix,index+9,index+9-fix,index-fix,index-9-fix]
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

function isPassableTile(tileCode) {
    return ['M', 'S', 'O'].includes(tileCode);
}
