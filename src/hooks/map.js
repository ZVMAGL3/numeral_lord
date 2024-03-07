import { computed } from "vue";
import { useMapState } from '/src/hooks/useMapState.js'
export default function(){
    const { tileCodeString,long,specialForces,combatUnitAll } = useMapState('map', ['tileCodeString','long','specialForces','combatUnitAll']);
    const sideLength = 41.2;
    const sqrt_3 = Math.sqrt(3);

    const len = computed(() => {
        return tileCodeString.value.length
    })
    const high = computed(() => {
        return ((len.value - ((len.value - 1) % long.value) - 1)/long.value) + 1
    })

    const checkerboardSize = computed(() => {
        return `min-height:${sideLength/2 + sideLength * 1.5 * high.value}px;min-width:${(sideLength/2 * sqrt_3)*((long.value*2)+1)}px;`
    });

    const frameSize = computed(() => {
        return [(sideLength/2 + sideLength * 1.5 * high.value)*0.5,((sideLength/2 * sqrt_3)*((long.value*2)+1))*0.5]
    });

    const getTile = (index) => {
        let x = index % long.value
        let y = (index - x) / long.value
        return [2 + (sideLength * 1.5 * y),2 + (sideLength/2 * sqrt_3)*((x*2)+((y+1)%2)),40 * Math.sqrt(3),40 * 2]
    };

    const getTileStyle = (index) => {
        const list = getTile(index)
        return `top:${list[0]}px;left:${list[1]}px;width:${list[2]}px;height:${list[3]}px;`
    };

    // const getSelectedStyle = (index) => {
    //     if(specialForces.value.has(index)){
    //         return `top:${getTile(index)[0]+10}px;left:${getTile(index)[1]+5*sqrt_3}px;height:60px;}`
    //     }else{
    //         return `top:${getTile(index)[0]}px;left:${getTile(index)[1]}px;height:80px;}`
    //     }
    // }

    const spanStyle = computed(() => (index) => {
        return (specialForces.value.has(index)?'font-size: 20px;':'')+(combatUnitAll.value.has(index)?`color: aliceblue;`:'')
    })

    function getTileIndexFromWindowCoords(xCoord,yCoord) {
        // 其他计算逻辑保持不变
        const xUnit = sideLength / 2 * sqrt_3;
        const yUnit = sideLength * 1.5;
        // 计算 y 偏移量的整数部分
        const yIndex = Math.floor(yCoord / yUnit); //y 应该在yIndex到yIndex-1中
        
        // 计算 x 偏移量的整数部分
        let xIndex = Math.floor(xCoord / xUnit);

        if ((yCoord % yUnit) < (sideLength / 2)) {
            // 如果 y 偏移量小于边长的一半，即需要判断离哪边更近
            //记录两个方块的下标 0---下方方块的下标 1---上方方块的下标
            let indexs = [
                [Math.floor((xIndex - ((yIndex) % 2)) / 2), yIndex - 1],
                [Math.floor((xIndex - ((yIndex + 1) % 2)) / 2), yIndex]
            ];
            // //分别记录方块中心点坐标
            // const distances = indexs.map((index) => {
            //     return [((index[0] * 2 + 1) + (index[1] + 1) % 2) * xUnit,index[1] * yUnit + sideLength]
            // });
            // //分别记录方块中心点距离点击点距离(开方)
            // const number = distances.map((distance) => {
            //     return distance[0]**2+distance[1]**2
            // });
            // //判断,目标方块距离更近的
            // if (number[0]<number[1]) {
            //     console.log(indexs[0]);
            // } else {
            //     console.log(indexs[1]);
            // }
            //计算相交线的一元一次方程解析式
            let k = ((((xIndex + yIndex) % 2) * (-2) + 1) * sqrt_3)/3
            let b1 = (yIndex * yUnit + 1) - (xIndex + ((xIndex + yIndex) % 2)) * xUnit * k
            //计算点击点的一元一次方程解析式
            let b2 = yCoord -  xCoord * k
            //计算仿鲿与Y的交点,取小.
            return CheckValidity(indexs[b1<b2?1:0])
        } else {
        // 如果 y 偏移量大于等于边长的一半，即在下半部分
            let index = [Math.floor((xIndex - ((yIndex + 1) % 2)) / 2),yIndex];
            return CheckValidity(index);
        }
    }

    function CheckValidity(coordinate){
        let x = coordinate[0]
        let y = coordinate[1]
        let index = y*long.value+x
        if(x>=0 && y>=0 && x<long.value && index<len.value){
            return index
        }else{
            return false
        }
    }

    return{checkerboardSize,getTileStyle,frameSize,getTileIndexFromWindowCoords,spanStyle}
}