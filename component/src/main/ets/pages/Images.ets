
/**
 * Image组件用来渲染展示图片，它可以让界面变得更加丰富多彩。只需要给Image组件设置图片地址、宽和高，图片就能加载出来，
 */

@Entry
@Component
struct Images {
  build() {
    Row() {
      Column() {
        /**
         * 设置缩放类型
         * objectFit(ImageFit.xxx)
         * ImageFit：
         * --> Contain：保持宽高比进行缩小或者放大，使得图片完全显示在显示边界内。
         * --> Cover（默认值）：保持宽高比进行缩小或者放大，使得图片两边都大于或等于显示边界。
         * --> Auto：自适应显示。
         * --> Fill：不保持宽高比进行放大缩小，使得图片充满显示边界。
         * --> ScaleDown：保持宽高比显示，图片缩小或者保持不变。
         * --> None：保持原有尺寸显示。
         */
        Image($r("app.media.imges"))
          .objectFit(ImageFit.Contain)
          .backgroundColor(0xCCCCCC)
          .width(400)
          .height(250)

        /**
         * 加载网络图片
         * （为了成功加载网络图片，您需要在module.json5文件中申明网络访问权限。）
         */
        Image('https://developer.harmonyos.com/resource/image/release2/documentation/teaching-video/img_DLP_wendang_kecheng_04.png')
          .margin({ top: 20 })
          .width(500)
          .height(250)


      }
      .width('100%')
    }
    .height('100%')
  }
}