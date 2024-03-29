/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import promptAction from '@ohos.promptAction';
import DataModel from './DataModel';
import getCurrentTime from '../../../common/utils/DateUtil';
import TaskItemBean from '../../../common/bean/TaskItemBean';
import CommonConstants from '../../../common/constants/CommonConstants';

/**
 * 在对话框中单击“确定”后，保存进度值和更新时间。
 *
 * @param context context from view.
 * @param value Latest Progress Value.
 */
export function saveTask(taskName: string) {
  if (taskName === '') {
    promptAction.showToast({
      message: $r('app.string.cannot_input_empty'),
      duration: CommonConstants.TOAST_TIME,
      bottom: CommonConstants.TOAST_MARGIN_BOTTOM
    });
    return;
  }
  DataModel.addData(new TaskItemBean(taskName, 0, getCurrentTime()));
  this.targetData = DataModel.getData();
  this.overAllProgressChanged = !this.overAllProgressChanged;
  this.dialogController.close();
}