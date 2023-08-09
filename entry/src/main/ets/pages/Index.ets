import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State myMessage: string = 'Hello World66'

  build() {
    Row() {
      Column() {
        Text(this.myMessage)
          .fontSize(60)
          .fontWeight(FontWeight.Bold)
          // 添加按钮，以响应用户点击
          Button() {
            Text('下一页')
              .fontSize(30)
              .fontWeight(FontWeight.Bold)
          }
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          })
          .backgroundColor('#ff39ec11')
          .width('30%')
          .height('5%')
          // 跳转按钮绑定onClick事件，点击时跳转到第二页
          .onClick(() => {
            router.pushUrl({ url: 'pages/Second' })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}