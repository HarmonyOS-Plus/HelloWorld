/**
 * TextInput组件用于输入单行文本，响应输入事件。TextInput的使用也非常广泛，例如应用登录账号密码、发送消息等。
 * 和Text组件一样，TextInput组件也支持文本样式设置.
 */

@Entry
@Component
struct TextInputs {
  controller: TextInputController = new TextInputController()
  @State text: string = ''

  build() {
    Row() {
      Column() {
        /**
         * 输入提示文本
         * 使用placeholder属性就可以轻松的实现，使用 placeholderColor 和 placeholderFont 分别设置提示文本的颜色和样式
         */
        TextInput({ placeholder: '请输入帐号' })
          .placeholderColor(0x999999)
          .placeholderFont({ size: 25, weight: FontWeight.Medium, family: 'cursive', style: FontStyle.Italic })
          .width(350)
          .height(60)
          .fontColor(Color.Blue)
          .fontSize(25)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .fontFamily('Arial')

        /**
         * 设置输入类型
         * InputType:
         * --Normal：基本输入模式。支持输入数字、字母、下划线、空格、特殊字符。
         * --Password：密码输入模式。
         * --Email：e-mail地址输入模式。
         * --Number：纯数字输入模式。
         */
        TextInput({ placeholder: '请输入密码' })
          .type(InputType.Password)
          .placeholderColor(0x999999)
          .placeholderFont({ size: 25, weight: FontWeight.Medium, family: 'cursive', style: FontStyle.Italic })
          .width(350)
          .height(60)
          .margin({ top: 25 })
          .fontColor(Color.Blue)
          .fontSize(25)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .fontFamily('Arial')

        /**
         * 设置光标位置
         */
        TextInput({ controller: this.controller })
          .type(InputType.Normal)
          .placeholderColor(0x999999)
          .placeholderFont({ size: 25, weight: FontWeight.Medium, family: 'cursive', style: FontStyle.Italic })
          .width(350)
          .height(60)
          .margin({ top: 15 })
          .fontColor(Color.Blue)
          .fontSize(25)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .fontFamily('Arial')
        Button('移动光标到第2位')
          .onClick(() => {
            this.controller.caretPosition(2)
          })

        /**
         * 获取输入文本
         *
         */
        TextInput({ placeholder: '请输入账号' })
          .type(InputType.Normal)
          .width(350)
          .height(60)
          .margin({ top: 15 })
          .fontColor(Color.Blue)
          .fontSize(25)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .fontFamily('Arial')
          .caretColor(Color.Blue)
          .onChange((value: string) => {
            this.text = value
          })
        Text(this.text)
      }
      .width('100%')
    }
    .height('100%')
  }
}