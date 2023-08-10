import router from '@ohos.router'

@Entry
@Component
struct Index {
  build() {
    Row() {
      Column() {
        Text('使用Text、Image、TextInput、Button、LoadingProgress 组件').fontSize(26).fontWeight(FontWeight.Bold)
        Button() {
          Text('Text 组件').fontSize(22)
            .onClick(() => {
              router.pushUrl({ url: 'pages/Texts' })
            })
        }
        .margin({
          top: 5
        })
        .type(ButtonType.Capsule)
        .backgroundColor('#ff39ec11')
        .width('40%')
        .height('5%');

        Button() {
          Text('Image 组件').fontSize(22)
            .onClick(() => {
              router.pushUrl({ url: 'pages/Images' })
            })
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 5
        })
        .backgroundColor('#ff39ec11')
        .width('40%')
        .height('5%');

        Button() {
          Text('TextInput 组件').fontSize(22)
            .onClick(() => {
              router.pushUrl({ url: 'pages/TextInputs' })
            })
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 5
        })
        .backgroundColor('#ff39ec11')
        .width('40%')
        .height('5%');

        Button() {
          Text('Button 组件').fontSize(22)
            .onClick(() => {
              router.pushUrl({ url: 'pages/Buttons' })
            })
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 5
        })
        .backgroundColor('#ff39ec11')
        .width('40%')
        .height('5%');

        Button() {
          Text('LoadingProgres 组件').fontSize(22)
            .onClick(() => {
              router.pushUrl({ url: 'pages/MyLoadingProgres' })
            })
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 5
        })
        .backgroundColor('#ff39ec11')
        .width('45%')
        .height('5%');

      }
      .width('100%')
    }
    .height('100%')
  }
}