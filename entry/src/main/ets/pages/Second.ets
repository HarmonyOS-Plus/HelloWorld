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
        Text(this.message).fontSize(50).fontWeight(FontWeight.Bold)
        Text(this.src).fontSize(25)
        Button() {
          Text('关闭').fontSize(25).fontWeight(FontWeight.Bold)
            .onClick(() => {
              router.disableAlertBeforeBackPage()
              router.back({
                url: 'pages/Index',
                params: {
                  resrc: 'Second页面《关闭》传来的数据',
                }
              })
            })
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#ff39ec11')
        .width('30%')
        .height('5%');

        Button() {
          Text('返回').fontSize(25).fontWeight(FontWeight.Bold)
            // 返回按钮绑定onClick事件，点击按钮时返回到第一页
            .onClick(() => {
              // 即在调用router.back()方法之前，可以先调用 router.enableBackPageAlert() 方法开启页面返回询问对话框功能。
              // 在Index页面通过调用router.getParams()方法，获取Second页面传递过来的自定义参数
              /*router.enableAlertBeforeBackPage({
                message: '确认返回吗？'
              });*/
              router.back({
                url: 'pages/Index',
                params: {
                  resrc: 'Second页面《返回》传来的数据',
                }
              })
              // 如需关闭页面返回询问对话框功能，可以通过调用 router.disableAlertBeforeBackPage() 方法关闭该功能即可。

              // router.back()
              // router.back({ url: 'pages/Index' });

            })
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#ff39ec11')
        .width('30%')
        .height('5%');
      }
      .width('100%')
    }
    .height('100%')
  }
}

