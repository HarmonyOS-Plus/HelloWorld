@Entry
@Component
struct TabsExample {
  @State currentIndex: number = 0;
  // private controller: TabsController = new TabsController()
  private tabsController: TabsController = new TabsController()

  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        Column().width('100%').height('100%').backgroundColor('#00CB87')
      }
      .tabBar(this.TabBuilder('首页', 0, $r('app.media.home_selected'), $r('app.media.home_normal')))

      TabContent() {
        Column().width('100%').height('100%').backgroundColor('#007DFF')
      }
      .tabBar(this.TabBuilder('我的', 1, $r('app.media.mine_selected'), $r('app.media.mine_normal')))
    }
    .barWidth('100%')
    .barHeight(50)
    .onChange((index: number) => {
      this.currentIndex = index;
    })
  }
}

/*
build() {
  Column() {
    Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.Green)
      }
      .tabBar('green')

      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.Blue)
      }
      .tabBar('blue')

      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.Yellow)
      }
      .tabBar('yellow')

      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.Pink)
      }
      .tabBar('pink1')

      TabContent() {
        Column().width('80%').height('80%').backgroundColor(Color.Pink)
      }
      .tabBar('pink2')

      TabContent() {
        Column().width('55%').height('55%').backgroundColor(Color.Pink)
      }
      .tabBar('pink3')

      TabContent() {
        Column().width('20%').height('20%').backgroundColor(Color.Pink)
      }
      .tabBar('pink4')

    }
    .vertical(false) //
    // 设置Tabs的布局模式，Fixed：所有TabBar平均分配barWidth宽度（纵向时平均分配barHeight高度）,页签不可滚动；
    // Scrollable：每一个TabBar均使用实际布局宽度，超过总长度（横向Tabs的barWidth，纵向Tabs的barHeight）后可滑动。
    .barMode(BarMode.Scrollable)
    .barWidth('65%') // 设置TabBar宽度
    .barHeight(60) // 设置TabBar高度
    .width('100%') // 设置Tabs组件宽度
    .height('100%') // 设置Tabs组件高度
    .backgroundColor(0xF5F5F5) // 设置Tabs组件背景颜色
  }
  .width('100%')
  .height('100%')
}
}*/