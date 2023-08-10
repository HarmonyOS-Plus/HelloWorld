/**
 * LoadingProgress组件用于显示加载进展，比如应用的登录界面，当我们点击登录的时候，
 * 显示的“正在登录”的进度条状态。LoadingProgress的使用非常简单，只需要设置颜色和宽高就可以了。
 */

@Entry
@Component
struct MyLoadingProgress {
  build() {
    Row() {
      Column() {

        LoadingProgress()
          .color(Color.Blue)
          .height(100)
          .width(100)


      }
      .width('100%')
    }
    .height('100%')
  }
}