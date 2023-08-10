import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
/**
 * UIAbility 的生命周期
 * （UIAbility Start） -> Create -> WindowStageCreate -> Foreground
 *  -> Background -> WindowStageDestroy -> Destroy -> （UIAbility End）
 *
 * UIAbility的启动模式
 * 对于浏览器或者新闻等应用，用户在打开该应用，并浏览访问相关内容后，回到桌面，再次打开该应用，显示的仍然是用户当前访问的界面。
 * 对于应用的分屏操作，用户希望使用两个不同应用（例如备忘录应用和图库应用）之间进行分屏，也希望能使用同一个应用（例如备忘录应用自身）进行分屏。
 * 对于文档应用，用户从文档应用中打开一个文档内容，回到文档应用，继续打开同一个文档，希望打开的还是同一个文档内容。
 * 基于以上场景的考虑，UIAbility当前支持 singleton（单实例模式）、multiton（多实例模式）和specified（指定实例模式）3种启动模式。
 *
 * - singleton（单实例模式）
 当用户打开浏览器或者新闻等应用，并浏览访问相关内容后，回到桌面，再次打开该应用，显示的仍然是用户当前访问的界面。
 这种情况下可以将UIAbility配置为singleton（单实例模式）。每次调用startAbility()方法时，如果应用进程中该类型的UIAbility实例已经存在，则复用系统中的UIAbility实例，系统中只存在唯一一个该UIAbility实例。
 即在最近任务列表中只存在一个该类型的UIAbility实例。
 *
 * - multiton（多实例模式）
 用户在使用分屏功能时，希望使用两个不同应用（例如备忘录应用和图库应用）之间进行分屏，也希望能使用同一个应用（例如备忘录应用自身）进行分屏。
 这种情况下可以将UIAbility配置为multiton（多实例模式）。每次调用startAbility()方法时，都会在应用进程中创建一个该类型的UIAbility实例。
 即在最近任务列表中可以看到有多个该类型的UIAbility实例。
 *
 * - specified（指定实例模式）
 用户打开文档应用，从文档应用中打开一个文档内容，回到文档应用，继续打开同一个文档，希望打开的还是同一个文档内容；以及在文档应用中新建一个新的文档，每次新建文档，希望打开的都是一个新的空白文档内容。

 这种情况下可以将UIAbility配置为specified（指定实例模式）。在UIAbility实例新创建之前，允许开发者为该实例创建一个字符串Key，新创建的UIAbility实例绑定Key之后，后续每次调用startAbility方法时，
 都会询问应用使用哪个Key对应的UIAbility实例来响应startAbility请求。如果匹配有该UIAbility实例的Key，则直接拉起与之绑定的UIAbility实例，否则创建一个新的UIAbility实例。运行时由UIAbility内部业务决定是否创建多实例。
 *
 *
 *
 */
export default class EntryAbility extends UIAbility {
  /**
   * Create状态，在UIAbility实例创建时触发，系统会调用onCreate回调。可以在onCreate回调中进行相关初始化操作。
   *
   * @param want
   * @param launchParam
   */
  onCreate(want, launchParam) {
    // 应用初始化
    // 例如用户打开电池管理应用，在应用加载过程中，在UI页面可见之前，可以在onCreate回调中读取当前系统的电量情况，用于后续的UI页面展示。
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  /**
   * UIAbility实例创建完成之后，在进入Foreground之前，系统会创建一个WindowStage。每一个UIAbility实例都对应持有一个WindowStage实例。
   * WindowStage为本地窗口管理器，用于管理窗口相关的内容，例如与界面相关的获焦/失焦、可见/不可见。
   * 可以在onWindowStageCreate回调中，设置UI页面加载、设置WindowStage的事件订阅。
   * 在onWindowStageCreate(windowStage)中通过loadContent接口设置应用要加载的页面. Window接口的使用详见[窗口开发指导](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/application-window-stage-0000001427584712-V3?catalogVersion=V3)。
   *
   * @param windowStage
   */
  onWindowStageCreate(windowStage: window.WindowStage) {
    /*
     * 例如用户打开游戏应用，正在打游戏的时候，有一个消息通知，打开消息，消息会以弹窗的形式弹出在游戏应用的上方，
     * 此时，游戏应用就从获焦切换到了失焦状态，消息应用切换到了获焦状态。对于消息应用，在onWindowStageCreate回调中，
     * 会触发获焦的事件回调，可以进行设置消息应用的背景颜色、高亮等操作。
     *
     * */
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  /*
   * Foreground和Background状态，分别在UIAbility切换至前台或者切换至后台时触发。
   *
   * 例如用户打开地图应用查看当前地理位置的时候，假设地图应用已获得用户的定位权限授权。在UI页面显示之前，
   * 可以在onForeground回调中打开定位功能，从而获取到当前的位置信息。
   *
   * 当地图应用切换到后台状态，可以在onBackground回调中停止定位功能，以节省系统的资源消耗。
   *
   */

  /**
   * onForeground回调，在UIAbility的UI页面可见之前，即UIAbility切换至前台时触发。
   * 可以在onForeground回调中《《申请系统需要的资源》》，或者重新申请在onBackground中释放的资源。
   */
  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }
  /**
   * onBackground回调，在UIAbility的UI页面完全不可见之后，即UIAbility切换至后台时候触发。
   * 可以在onBackground回调中《《释放UI页面不可见时无用的资源》》，或者在此回调中执行较为耗时的操作，例如状态保存等。
   */
  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  /**
   * 在UIAbility实例销毁之前，则会先进入onWindowStageDestroy回调，我们可以在该回调中释放UI页面资源。
   *
   * 例如在onWindowStageCreate中设置的获焦/失焦等WindowStage订阅事件。
   */
  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  /**
   * 在UIAbility销毁时触发。可以在onDestroy回调中进行系统资源的释放、数据的保存等操作。
   */
  onDestroy() {
    /*
    例如用户使用应用的程序退出功能，会调用UIAbilityContext的terminalSelf()方法，
    * 从而完成UIAbility销毁。或者用户使用最近任务列表关闭该UIAbility实例时，也会完成UIAbility的销毁。
     */
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }
}
