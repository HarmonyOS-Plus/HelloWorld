import router from '@ohos.router'

@Extend(Button) function buttonStyle() {
  .margin({
    top: 5
  })
  .type(ButtonType.Capsule)
  .backgroundColor('#ff39ec11')
  .width('40%')
  .height('5%')
}

@Entry
@Component
struct Index {
  build() {
    // Row 行，表示沿水平方向布局的容器。
    Row() {
      // Column 列，表示沿垂直方向布局的容器。
      Column() {
        Text('使用基础组件与Column、Row容器组件，页面布局').fontSize(26).fontWeight(FontWeight.Bold)
        Button() {
          Text('Text 组件').fontSize(22)
            .onClick(() => {
              router.pushUrl({ url: 'pages/Texts' })
            })
        }
        .buttonStyle()

        Button() {
          Text('Image 组件').fontSize(22)
            .onClick(() => {
              router.pushUrl({ url: 'pages/Images' })
            })
        }
        .buttonStyle()

        Button() {
          Text('TextInput 组件').fontSize(22)
            .onClick(() => {
              router.pushUrl({ url: 'pages/TextInputs' })
            })
        }
        .buttonStyle()

        Button() {
          Text('Button 组件').fontSize(22)
            .onClick(() => {
              router.pushUrl({ url: 'pages/Buttons' })
            })
        }
        .buttonStyle()

        Button() {
          Text('LoadingProgres 组件').fontSize(18)
            .onClick(() => {
              router.pushUrl({ url: 'pages/MyLoadingProgres' })
            })
        }
        .buttonStyle()

        Button() {
          Text('登录示例').fontSize(22)
            .onClick(() => {
              router.pushUrl({ url: 'pages/assemblyandlayout/LoginPage' })
            })
        }
        .buttonStyle()

        Button() {
          Text('List 组件').fontSize(22)
            .onClick(() => {
              router.pushUrl({ url: 'pages/assemblyandlayout/ListDemo' })
            })
        }
        .buttonStyle()

        Button() {
          Text('Grid 组件').fontSize(22)
            .onClick(() => {
              router.pushUrl({ url: 'pages/assemblyandlayout/GridDemo' })
            })
        }
        .buttonStyle()

        Button() {
          Text('Tabs 组件').fontSize(22)
            .onClick(() => {
              router.pushUrl({ url: 'pages/assemblyandlayout/TabsExample' })
            })
        }
        .buttonStyle()

      }
      .width('100%')
    }
    .height('100%')
  }
}