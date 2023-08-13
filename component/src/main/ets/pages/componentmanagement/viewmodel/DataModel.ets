/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import CommonConstants from '../../../common/constants/CommonConstants';
import Logger from '../../../common/utils/Logger';
import TaskItemBean from '../../../common/bean/TaskItemBean';

const TAG = '[DataModel]';

/**
 * 保存和操作页面上显示的数据。
 */
export class DataModel {

  /**
   * 保存的数据。
   */
  private targetData: Array<TaskItemBean> = [];

  /**
   * 获取最新数据。
   */
  getData(): Array<TaskItemBean> {
    return this.targetData;
  }

  /**
   * 删除所选数据。
   *
   * @param selectArr: An array indicating whether historical data is selected.
   */
  deleteData(selectArr: Array<boolean>) {
    if (!selectArr) {
      Logger.error(TAG, 'Failed to delete data because selectArr is ' + selectArr);
    }
    let dataLen = this.targetData.length - CommonConstants.ONE_TASK;
    for (let i = dataLen; i >= 0; i--) {
      if (selectArr[i]) {
        this.targetData.splice(i, CommonConstants.ONE_TASK);
      }
    }
  }

  /**
   * 将数据添加到targetData。
   *
   * @param Data of the RecordItemBean type to be added.
   */
  addData(data: TaskItemBean) {
    if (!data) {
      Logger.error(TAG, 'addData error because data is: ' + data);
      return;
    }
    this.targetData.push(data);
  }

  /**
   * 获取最新进展。
   */
  getLatestProgressValue(): number {
    if (this.targetData.length === 0) {
      return 0;
    }
    return this.targetData[this.targetData.length - CommonConstants.ONE_TASK].progressValue;
  }

  /**
   * 根据索引和进度值以及更新日期更新数据。
   *
   * @param 更新项的索引。
   * @param 更新项的值.
   * @param 更新项目的日期.
   */
  updateProgress(index: number, updateValue: number, updateDate: string): boolean {
    if (!this.targetData[index]) {
      return false;
    }
    this.targetData[index].progressValue = updateValue;
    this.targetData[index].updateDate = updateDate;
    return true;
  }
}

export default new DataModel();