@Entry
@Component
struct Buttons {
  build() {
    Row() {
      Column() {
        /**
         * 设置按钮样式
         * ButtonType：Capsule胶囊形按钮，Circle：圆形按钮，Normal：普通按钮（默认不带圆角）。
         * stateEffect：用于设置按钮按下时是否开启切换效果
         *
         * 设置按钮点击事件
         * onClick(()=>{})
         **/
        Button('登录', { type: ButtonType.Capsule, stateEffect: true })
          .onClick(() => {
            console.log('登录成功')
          })
          .width('90%')
          .height(50)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .backgroundColor('#007DFF')

        /**
         * 包含子组件
         */
        Button({ type: ButtonType.Circle, stateEffect: true }) {
          Image($r('app.media.delete')).width(55).height(55)
        }
        .margin({ top: 15 })
        .width(55)
        .height(55)
        .backgroundColor(0x317aff)

        /**
         * 使用资源引用类型，优化一些硬编码
         */
        Button($r('app.string.login_text'), { type: ButtonType.Capsule })
          .width($r('app.float.button_width'))
          .height($r('app.float.button_height'))
          .fontSize($r('app.float.login_fontSize'))
          .backgroundColor($r('app.color.button_color'))

      }
      .width('100%')
    }
    .height('100%')
  }
}