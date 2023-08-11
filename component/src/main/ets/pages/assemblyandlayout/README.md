# 容器组件与布局

## 相关概念

基础组件：
- Text：显示一段文本的组件。
- Image：图片组件，支持本地图片和网络图片的渲染展示。
- TextInput：可以输入单行文本并支持响应输入事件的组件。
- Button：按钮组件，可快速创建不同样式的按钮。
- LoadingProgress：用于显示加载动效的组件。

容器组件：
- Flex：应用弹性方式布局子组件的容器组件。
- Column：沿垂直方向布局的容器。
- Row：沿水平方向布局容器。
- List：列表包含一系列相同宽度的列表项。适合连续、多行呈现同类数据，例如图片和文本。
- Swiper：滑动容器，提供切换子组件显示的能力。
- Grid：网格容器，由“行”和“列”分割的单元格所组成，通过指定“项目”所在的单元格做出各种各样的布局。

## Column和Row

- Column 列，沿垂直方向布局的容器。
- Row 行，沿水平方向布局的容器。

----------------------------------------------------

----------------------------------------------------

主轴和交叉轴概念：

> 一个垂直，一个水平；以一个为主轴时，另一个就是交叉轴。

属性介绍：

- justifyContent：设置子组件在主轴方向上的对齐格式。

子组件在主轴方向上的对齐使用justifyContent属性来设置，其参数类型是FlexAlign。`FlexAlign` 定义了以下几种类型：

- - **Start**：元素在主轴方向首端对齐，第一个元素与行首对齐，同时后续的元素与前一个对齐（简单理解：首部对齐）。
- - **Center**：元素在主轴方向中心对齐（简单理解：居中对齐）。
- - **End**：元素在主轴方向尾部对齐（简单理解：尾部对齐）。
- - **SpaceBetween**：元素在主轴方向均匀分配弹性元素，相邻元素之间距离相同。 第一个元素与行首对齐，最后一个元素与行尾对齐。
- - **SpaceAround**：元素在主轴方向均匀分配弹性元素，相邻元素之间距离相同。 第一个元素到行首的距离和最后一个元素到行尾的距离是相邻元素之间距离的一半。
- - **SpaceEvenly**：元素在主轴方向等间距布局，无论是相邻元素还是边界元素到容器的间距都一样。

----------------------------

- alignItems：设置子组件在交叉轴方向上的对齐格式。

-Column容器的主轴是垂直方向，交叉轴是水平方向，其参数类型为HorizontalAlign（水平对齐），`HorizontalAlign` 定义了以下几种类型：

- - **Start**：设置子组件在水平方向上按照起始端对齐。
- - **Center**（默认值）：设置子组件在水平方向上居中对齐。
- - **End**：设置子组件在水平方向上按照末端对齐。

----------------------------

-Row容器的主轴是水平方向，交叉轴是垂直方向，其参数类型为VerticalAlign（垂直对齐），`VerticalAlign` 定义了以下几种类型：

- - **Top**：设置子组件在垂直方向上居顶部对齐。
- - **Center**（默认值）：设置子组件在竖直方向上居中对齐。
- - **Bottom**：设置子组件在竖直方向上居底部对齐。

----------------------------------------------------

----------------------------------------------------

接口介绍：

- Column(value?:{space?: string | number})
- Row(value?:{space?: string | number})

Column和Row容器的接口都有一个可选参数space，表示子组件在主轴方向上的间距。


## 构建列表页面布局

常见的列表有线性列表（List列表）和网格布局（Grid列表）：

![](./README.assets/list-Grid.png)

### List组件的使用

#### List组件简介

List是很常用的滚动类容器组件，一般和子组件`ListItem`一起使用，`List`列表中的每一个列表项对应一个`ListItem`组件。

![](./README.assets/list.png)

#### 使用ForEach渲染列表

```tsx
@Entry
@Component
struct ListDemo {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  build() {
    Column() {
      List({ space: 10 }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text(`${item}`)
              .width('100%')
              .height(100)
              .fontSize(20)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0x007DFF)
          }
        }, item => item)
      }
    }
    .padding(12)
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}
```

![](./README.assets/list-listItem.png)

#### 设置列表项分割线

List组件子组件ListItem之间默认是没有分割线的，部分场景子组件ListItem间需要设置分割线，
这时候您可以使用List组件的`divider`属性。divider属性包含四个参数：

- **strokeWidth**: 分割线的线宽。
- **color**: 分割线的颜色。
- **startMargin**：分割线距离列表侧边起始端的距离。
- **endMargin**: 分割线距离列表侧边结束端的距离。

```tsx
List(){ ... }.divider({ strokeWidth: '4', color: Color.Red, startMargin: '8', endMargin: '8' })
```

![](./README.assets/list-divider.png)

#### List列表滚动事件监听

List组件提供了一系列事件方法用来监听列表的滚动，您可以根据需要，监听这些事件来做一些操作：

- onScroll：列表滑动时触发，返回值scrollOffset为滑动偏移量，scrollState为当前滑动状态。
- onScrollIndex：列表滑动时触发，返回值分别为滑动起始位置索引值与滑动结束位置索引值。
- onReachStart：列表到达起始位置时触发。
- onReachEnd：列表到底末尾位置时触发。
- onScrollStop：列表滑动停止时触发。

```tsx
List({ space: 10 }) {
  ForEach(this.arr, (item) => {
    ListItem() {
      Text(`${item}`)
        ...
    }.editable(true)
  }, item => item)
}
.editMode(this.editFlag)
// 列表滑动时触发，返回值分别为 滑动起始位置索引值 与 滑动结束位置索引值。
.onScrollIndex((firstIndex: number, lastIndex: number) => {
    console.info('first：' + firstIndex + '，last：' + lastIndex)
})
// 列表滑动时触发，返回值scrollOffset为滑动偏移量，scrollState为当前滑动状态。
.onScroll((scrollOffset: number, scrollState: ScrollState) => {
    console.info('scrollOffset：' + scrollOffset + '，scrollState：' + scrollState)
})
// 滑动到顶部时
.onReachStart(() => {
    console.info('onReachStart')
})
// 滑动到底部时
.onReachEnd(() => {
    console.info('onReachEnd')
})
// 停止滑动时
.onScrollStop(() => {
    console.info('onScrollStop')
})
```

#### 设置List排列方向listDirection

List组件里面的列表项默认是按垂直方向排列的.

`listDirection` 属性设置为`Axis.`。

```tsx
List(){ ... }.listDirection(Axis.Vertical)
```

![](./README.assets/list-listDirection-Vertical.png)

 `listDirection` 属性设置为`Axis.Horizontal`。

```tsx
List(){ ... }.listDirection(Axis.Horizontal)
```

![](./README.assets/list-listDirection-Horizontal.png)


#### 




#### 



























