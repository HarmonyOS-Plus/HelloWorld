import TaskItemBean from '../../../common/bean/TaskItemBean';
import CommonConstants from '../../../common/constants/CommonConstants';
import { changeProgress } from '../viewmodel/TaskListItemModel';
import ProgressEditPanel from './ProgressEditPanel';

@Component
export default struct TargetListItem {
  private taskItem: TaskItemBean;
  @State latestProgress: number = 0;
  @State updateDate: string = '';
  @Link selectArr: Array<boolean>;
  @Prop isEditMode: boolean;
  @Link @Watch('onClickIndexChanged') clickIndex: number;
  @State isExpanded: boolean = false;
  @Consume overAllProgressChanged: boolean;
  @State sliderMode: number = CommonConstants.DEFAULT_SLIDER_MODE;
  private index: number;

  aboutToAppear() {
    this.latestProgress = this.taskItem.progressValue;
    this.updateDate = this.taskItem.updateDate;
  }

  /**
   * Listening click index.
   */
  onClickIndexChanged() {
    if (this.clickIndex !== this.index) {
      this.isExpanded = false;
    }
  }

  build() {
    Column() {
      if (this.isExpanded) {
        Blank()
        ProgressEditPanel({
          slidingProgress: this.latestProgress,
          onCancel: () => this.isExpanded = false,
          onClickOK: changeProgress.bind(this),
          sliderMode: $sliderMode
        })
          .transition({
            scale: {
              x: CommonConstants.TRANSITION_ANIMATION_X,
              y: CommonConstants.TRANSITION_ANIMATION_Y
            }
          })

      }
    }
    .height(this.isExpanded ? $r('app.float.expanded_item_height') : $r('app.float.list_item_height'))
    .onClick(() => {
      this.isExpanded = !this.isExpanded;
    })
  }
}