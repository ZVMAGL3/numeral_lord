import { computed } from "vue";
import { useMapState } from '/src/hooks/useMapState.js'
export default function(){
    // 使用对象解构赋值获取地图状态
    const { tileCodeString, long, specialForces, combatUnitAll } = useMapState('map', ['tileCodeString', 'long', 'specialForces', 'combatUnitAll']);
    
    // 定义边长和sqrt(3)常量
    const sideLength = 41.5;
    const sqrt_3 = 1.7320508075688772;

    // 计算棋盘长度和高度
    const len = computed(() => tileCodeString.value.length);
    const high = computed(() => Math.ceil(len.value / long.value));

    // 计算棋盘样式和边框大小
    const checkerboardSize = computed(() => `min-height:${sideLength/2 + sideLength * 1.5 * high.value}px;min-width:${(sideLength/2 * sqrt_3)*((long.value*2)+1)}px;`);
    const frameSize = computed(() => [(sideLength/2 + sideLength * 1.5 * high.value)*0.5,((sideLength/2 * sqrt_3)*((long.value*2)+1))*0.5]);

    // 计算方块位置和样式
    function getTile(index) {
        const x = index % long.value;
        const y = Math.floor(index / long.value);
        return [2 + (sideLength * 1.5 * y), 2 + (sideLength/2 * sqrt_3)*((x*2)+((y+1)%2)), 40 * Math.sqrt(3), 40 * 2];
    }

    function getTileStyle(index) {
        const [top, left, width, height] = getTile(index);
        return `top:${top}px;left:${left}px;width:${width}px;height:${height}px;`;
    }

    // 计算span样式
    const spanStyle = computed(() => index => `${specialForces.value.has(index) ? 'font-size: 20px;' : ''}${combatUnitAll.value.has(index) ? 'color: aliceblue;' : ''}`);

    function getTileIndexFromWindowCoords(xCoord,yCoord) {
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
            //计算相交线的一元一次方程解析式
            let k = ((((xIndex + yIndex) % 2) * (-2) + 1) * sqrt_3)/3
            let b1 = (yIndex * yUnit + 1) - (xIndex + ((xIndex + yIndex) % 2)) * xUnit * k
            //计算点击点的一元一次方程解析式
            let b2 = yCoord -  xCoord * k
            //计算仿鲿与Y的交点,取小.
            return checkValidity(indexs[b1<b2?1:0])
        } else {
            // 如果 y 偏移量大于等于边长的一半，即在下半部分
            let index = [Math.floor((xIndex - ((yIndex + 1) % 2)) / 2),yIndex];
            return checkValidity(index);
        }
    }

    // 检查索引是否有效
    function checkValidity(coordinate) {
        const [x, y] = coordinate;
        const index = y * long.value + x;
        return x >= 0 && y >= 0 && x < long.value && index < len.value ? index : false;
    }

    return{checkerboardSize,getTileStyle,frameSize,getTileIndexFromWindowCoords,spanStyle}
}