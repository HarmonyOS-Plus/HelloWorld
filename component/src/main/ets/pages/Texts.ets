@Entry
@Component
struct Texts {
  build() {
    Row() {
      Column() {
        /*
         * 文本元素的组件，例如Text、Span、Button、TextInput等，
         * 可使用
         * fontColor颜色：'red'，Color.xxx，1535
         * fontSize大小：
         * fontStyle样式：FontStyle.xxx
         * fontWeight粗细：number类型取值[100, 900]，取值间隔为100，默认为400，取值越大，字体越粗。string类型仅支持number类型取值的字符串形式，例如“400”，以及“bold”、“bolder”、“lighter”、“regular”、“medium”，分别对应FontWeight中相应的枚举值。默认值：FontWeight.Normal。
         * fontFamily字体：设置文本的字体列表。使用多个字体，使用“，”进行分割，优先级按顺序生效。例如：“Arial，sans-serif”。
         *
         * 文本装饰线
         * decoration：设置文本装饰线样式及其颜色
         * TextDecorationType：None：不使用文本装饰线。Overline：文字上划线修饰。LineThrough：穿过文本的修饰线。Underline：文字下划线修饰。
         *
         * */
        Text('HarmonyOS').fontSize(40)
        Text('HarmonyOS')
          .fontColor(Color.Blue)
          .fontSize(35)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .decoration({ type: TextDecorationType.Underline, color: Color.Red })
          .fontFamily('Arial')
        /*
         * textAlign 文本对齐方式：Start（默认值）水平对齐首部。Center：水平居中对齐。End：水平对齐尾部。
         * backgroundColor 背景
         * */
        Text('HarmonyOS')
          .height(50)
          .width(400)
          .fontSize(30)
          .textAlign(TextAlign.Start)
          .backgroundColor(0xE6F2FD)
        /*
         * 文本超长显示
         * maxLines用于设置文本显示最大行数
         * textOverflow设置为Ellipsis ，它将显示不下的文本用 “...”
         *
                  * */
        Text('This is the text content of Text This is the text content of Text Component')
          .fontSize(25)
          .width(400)
          .height(50)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ top: 10 })
          .backgroundColor(0xE6F2FD)
      }
      .width('100%')
    }
    .height('100%')
  }
}