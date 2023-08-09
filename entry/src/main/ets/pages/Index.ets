import router from '@ohos.router'

let msg: string = 'Index传递过来的数据'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World66'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          // 添加按钮，以响应用户点击
          Button() {
            Text('下一页')
              .fontSize(30)
              .fontWeight(FontWeight.Bold)
                // 跳转按钮绑定onClick事件，点击时跳转到第二页
              .onClick(() => {
                router.pushUrl({ url: 'pages/Second', params: { src: msg } })
              })
          }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#ff39ec11')
        .width('30%')
        .height('5%')
        Blank()
      }
      .width('100%')
    }
    .height('100%')
  }
}