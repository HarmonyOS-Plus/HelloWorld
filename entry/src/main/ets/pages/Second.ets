// Second.ets
import router from '@ohos.router'

@Entry
@Component
struct Second {
  @State message: string = 'Hi there'
  @State src: string = router.getParams()?.['src']

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text(this.src)
        Button() {
          Text('返回')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#ff39ec11')
        .width('30%')
        .height('5%')
        // 返回按钮绑定onClick事件，点击按钮时返回到第一页
        .onClick(() => {
          router.back()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}