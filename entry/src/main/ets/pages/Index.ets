import router from '@ohos.router'

let msg: string = 'Index传递过来的数据'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World66';
  @State resrc: string = '';

  onPageShow() {
    this.resrc = router.getParams()?.['resrc']
  }

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(50).fontWeight(FontWeight.Bold)
        Text(this.resrc).fontSize(25)
        // 添加按钮，以响应用户点击
        Button() {
          Text('下一页').fontSize(30).fontWeight(FontWeight.Bold)
            // 跳转按钮绑定onClick事件，点击时跳转到第二页
            .onClick(() => {
              router.pushUrl({ url: 'pages/Second', params: { src: msg } })
              //////////////
              // 可以将mode参数配置为router.RouterMode.Single单实例模式和router.RouterMode.Standard多实例模式。
              //////////////
              /* pushUrl（）在单实例模式下：如果目标页面的url在页面栈中已经存在同url页面，离栈顶最近同url页面会被移动到栈顶，
               《《移动后的页面为新建页，原来的页面仍然存在栈中，页面栈的元素数量不变》》；如果目标页面的url
               在页面栈中不存在同url页面，按多实例模式跳转，页面栈的元素数量会加1。

               说明：当页面栈的元素数量较大或者超过32时，可以通过调用router.clear()方法清除页面栈中
               的所有历史页面，仅保留当前页面作为栈顶页面。*/
              // router.pushUrl({ url: 'pages/Second', params: { src: msg } }, router.RouterMode.Single)
              /* replaceUrl（）在单实例模式下：如果目标页面的url在页面栈中已经存在同url页面，离栈顶最近同url页面会被移动到栈顶，
               《《替换当前页面，并销毁被替换的当前页面》》，移动后的页面为新建页，《《页面栈的元素数量会减1》》；
               如果目标页面的url在页面栈中不存在同url页面，按多实例模式跳转，页面栈的元素数量不变。
                */
              // router.replaceUrl({ url: 'pages/Second', params: { src: msg } },router.RouterMode.Single)
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