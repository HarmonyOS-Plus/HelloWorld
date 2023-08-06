@Entry
@Component
struct Index {
  @State message: string = 'Hello World66'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(60)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}