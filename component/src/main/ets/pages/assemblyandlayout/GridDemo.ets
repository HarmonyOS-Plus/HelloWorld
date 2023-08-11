@Entry
@Component
struct GridDemo {
  private arr: String[] = ['0', '1', '2', '3']

  build() {
    Column() {
      Grid() {
        ForEach(this.arr, (day: string) => {
          ForEach(this.arr, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(168)
                .fontColor(Color.White)
                .backgroundColor(0x007DFF)
                .width('100%')
                .height('150')
                .textAlign(TextAlign.Center)
            }
          }, day => day)
        }, day => day)
      }
      // // 列数
      .columnsTemplate('1fr 1fr 1fr 1fr')
      // // 行数
      // .rowsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .height(300)
    }
    .width('100%')
    .padding(12)
    .backgroundColor(0xF1F3F5)
  }
}