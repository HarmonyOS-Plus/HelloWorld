@Entry
@Component
struct ListDemo {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State editFlag: boolean = false

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
          }.editable(true)
        }, item => item)
      }
      // 水平排列: Vertical 垂直，Horizontal 水平
      .listDirection(Axis.Vertical)
      .divider({ strokeWidth: '4', color: Color.Red, startMargin: '8', endMargin: '8' })
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

    }
    .padding(12)
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}