<template>
  <div class="container my-task">
    <div class="my-task-header">
      <div class="mt-header-left">
        <div class="h-left-icon">
          <div class="icon icon-24 icon-toggle"></div>
          <router-link to="/" class="icon icon-24 icon-home"></router-link>
        </div>
        <div class="mt-layout"></div>
        <div class="h-left-tab">
          <div class="tab-item tab-active">
            <div class="tab-item-text">Việc cần làm</div>
            <div class="tab-item-quantity icon icon-25"><span>12</span></div>
          </div>
          <div class="tab-item">
            <div class="tab-item-text">Việc giao cho tôi</div>
            <div class="tab-item-quantity icon icon-25"><span>12</span></div>
          </div>
          <div class="tab-item">
            <div class="tab-item-text">Việc tôi giao</div>
            <div class="tab-item-quantity icon icon-25"><span>12</span></div>
          </div>
          <div class="tab-item">
            <div class="tab-item-text">Liên quan đến tôi</div>
            <div class="tab-item-quantity icon icon-25"><span>12</span></div>
          </div>
          <div class="btn-header btn-other">
            <span class="btn-h-text" style="color: #000">Khác</span>
            <div class="btn-add-plus">
              <div class="icon-h-drop drop-black"></div>
            </div>
          </div>
          <div class="popup-combobox cbb-other" v-if="false">
            <div class="arror arrow-top"></div>
            <div class="p-s-content">
              <div class="item-ccb">
                <span>Việc chờ duyệt</span>
                <div class="icon icon-cbb"></div>
              </div>
              <div class="item-ccb"><span>Việc tôi quản lý</span></div>
            </div>
          </div>
        </div>
      </div>
      <div class="mt-header-right">
        <div class="btn-header btn-layout">
          <div class="icon__btn-header icon-add"></div>
          <span class="btn-h-text">Thêm công việc</span>
          <div class="btn-h-layout"></div>
          <div class="btn-add-plus">
            <div class="icon-h-drop"></div>
          </div>
        </div>
      </div>
    </div>
    <div class="my-task-content">
      <div class="mt-content-body">
        <div class="c-body-header">
          <div class="b-header-left">
            <div class="bh-left-job-soon">
              <div class="job-soon job-text">Công việc sắp đến hạn</div>
              <div
                class="job-soon job-state"
                @click="isShowSortByDate = !isShowSortByDate"
              >
                7 ngày gần nhất
              </div>
              <div
                class="job-soon job-icon"
                @click="isShowSortByDate = !isShowSortByDate"
              >
                <div class="icon-h-drop drop-gray"></div>
              </div>
              <div class="popup-combobox popup-sort" v-if="false">
                <div class="arror arrow-top"></div>
                <div class="p-s-content">
                  <div class="item-ccb">
                    <span>Hạn hoàn thành</span>
                    <div class="icon icon-cbb"></div>
                  </div>
                  <div class="item-ccb"><span>Ngày bắt đầu</span></div>
                  <div class="item-ccb"><span>Ngày tạo</span></div>
                  <div class="item-ccb"><span>Phòng ban/Dự án</span></div>
                </div>
              </div>
            </div>
            <div class="bh-left-sort">
              <div class="job-sort sort-icon">
                <div class="icon-sort"></div>
              </div>
              <div class="job-sort sort-text">Sắp xếp</div>
              <div class="job-sort sort-state">Phòng ban/Dự án</div>
              <div class="job-sort sort-icon">
                <div class="icon-h-drop drop-gray"></div>
              </div>
              <SortByDate v-if="isShowSortByDate"></SortByDate>
            </div>
          </div>
          <div class="b-header-right">
            <button class="btn btn-with-icon btn-light btn-setup">
              <div class="icon__button icon-setup"></div>
              <span>Thiết lập</span>
            </button>
            <div class="popup popup-setup" v-if="false">
              <div class="arror arrow-top arrow-setup"></div>
              <div class="popup-header">
                <div class="p-header-title">Tuỳ chọn dữ liệu</div>
                <div class="icon icon-pos-16 icon-close"></div>
              </div>
              <div class="popup-body body-setup">
                <div class="from-item item-pos">
                  <input
                    placeholder="Tìm kiếm"
                    class="input i-search-left"
                    type="text"
                    name=""
                    id=""
                  />
                  <div class="icon icon-pos-16 i-search-input"></div>
                </div>
                <div class="item-ccb item-checkbox">
                  <div class="icon icon-20 icon-checked"></div>
                  <div class="icon icon-18 icon-hidelist"></div>
                  <span>Chọn tất cả</span>
                </div>
                <div class="item-ccb item-checkbox">
                  <div class="icon icon-20 icon-check item-cbb-depart"></div>
                  <div class="icon icon-18 icon-hidelist"></div>
                  <span>Cá nhân</span>
                </div>
                <div class="item-ccb item-checkbox">
                  <div class="icon icon-20 icon-check item-cbb-project"></div>
                  <div class="i-group gr-user">
                    <div class="icon icon-16 icon-member"></div>
                  </div>
                  <span>Công việc cá nhân</span>
                </div>
                <div class="item-ccb item-checkbox">
                  <div class="icon icon-20 icon-checked item-cbb-depart"></div>
                  <div class="icon icon-18 icon-hidelist"></div>
                  <span>Phòng ban 1</span>
                </div>
                <div class="item-ccb item-checkbox">
                  <div class="icon icon-20 icon-check item-cbb-project"></div>
                  <div class="i-group gr-leaf">
                    <div class="icon icon-16 icon-leaf"></div>
                  </div>
                  <span>Dự án 1</span>
                </div>
                <div class="item-ccb item-checkbox">
                  <div class="icon icon-20 icon-check item-cbb-project"></div>
                  <div class="i-group gr-star">
                    <div class="icon icon-16 icon-star"></div>
                  </div>
                  <span>Dự án 2</span>
                </div>
                <div class="item-ccb item-checkbox">
                  <div class="icon icon-20 icon-check item-cbb-project"></div>
                  <div class="i-group gr-page">
                    <div class="icon icon-16 icon-page"></div>
                  </div>
                  <span>Dự án 3</span>
                </div>
                <div class="item-ccb item-checkbox">
                  <div class="icon icon-20 icon-check item-cbb-depart"></div>
                  <div class="icon icon-18 icon-showlist"></div>
                  <span>Phòng ban 2</span>
                </div>
                <div class="item-ccb item-checkbox">
                  <div class="icon icon-20 icon-checked item-cbb-depart"></div>
                  <div class="icon icon-18 icon-showlist"></div>
                  <span>Phòng ban 3</span>
                </div>
              </div>
            </div>
            <button class="btn btn-with-icon btn-light">
              <div class="icon__button icon-export"></div>
              <span>Xuất khẩu</span>
            </button>
            <div class="bh-layout"></div>
            <div class="icon icon-24 icon-filter"></div>
            <div class="popup popup-filter" style="display: none">
              <div class="arror arrow-top arrow-filter"></div>
              <div class="popup-header">
                <div class="p-header-title">Lọc công việc</div>
                <div class="icon icon-pos-16 icon-close"></div>
              </div>
              <div class="popup-body">
                <div class="from-item item-pos">
                  <input
                    placeholder="Tìm kiếm công việc"
                    class="input i-search-left"
                    type="text"
                    name=""
                    id=""
                  />
                  <div class="icon icon-pos-16 i-search-input"></div>
                </div>
                <div class="from-item item-pos">
                  <div class="f-i-title">Hạn hoàn thành</div>
                  <input class="input i-cbb-right" type="text" name="" id="" />
                  <div class="icon icon-pos-16 icon-dropdown"></div>
                  <div class="popup-combobox">
                    <div class="p-s-content">
                      <div class="item-ccb">
                        <span>Không chọn</span>
                        <div class="icon icon-cbb"></div>
                      </div>
                      <div class="item-ccb"><span>Hôm nay</span></div>
                      <div class="item-ccb"><span>Tuần này</span></div>
                      <div class="item-ccb"><span>Tuần trước</span></div>
                      <div class="item-ccb"><span>Tháng này</span></div>
                      <div class="item-ccb"><span>Tháng trước</span></div>
                      <div class="item-ccb"><span>Tuỳ chọn</span></div>
                    </div>
                  </div>
                </div>
                <div class="from-item item-group">
                  <div
                    class="from-item"
                    style="margin-right: 12px; width: 100%"
                  >
                    <input
                      placeholder="Từ ngày"
                      class="input"
                      type="date"
                      name=""
                      id=""
                    />
                  </div>
                  <div class="from-item" style="width: 100%">
                    <input
                      placeholder="Đến ngày"
                      class="input"
                      type="date"
                      name=""
                      id=""
                    />
                  </div>
                </div>
                <div class="from-item item-pos">
                  <div class="f-i-title">Trạng thái hoàn thành</div>
                  <input class="input i-cbb-right" type="text" name="" id="" />
                  <div class="icon icon-pos-16 icon-dropdown"></div>
                  <div class="popup-combobox">
                    <div class="p-s-content">
                      <div class="item-ccb">
                        <span>Tất cả</span>
                        <div class="icon icon-cbb"></div>
                      </div>
                      <div class="item-ccb"><span>Chưa hoàn thành</span></div>
                      <div class="item-ccb"><span>Đã hoàn thành</span></div>
                    </div>
                  </div>
                </div>
                <div class="from-item item-pos">
                  <div class="f-i-title">Trạng thái hoạt động</div>
                  <input class="input i-cbb-right" type="text" name="" id="" />
                  <div class="icon icon-pos-16 icon-dropdown"></div>
                  <div class="popup-combobox">
                    <div class="p-s-content">
                      <div class="item-ccb">
                        <span>Tất cả</span>
                        <div class="icon icon-cbb"></div>
                      </div>
                      <div class="item-ccb"><span>Đang hoạt động</span></div>
                      <div class="item-ccb"><span>Đã lưu trữ</span></div>
                    </div>
                  </div>
                </div>
                <div class="from-item">
                  <div class="f-i-title">Người thực hiện</div>
                  <div class="icon icon-pos-32 icon-plus-circle"></div>
                </div>
              </div>
              <div class="popup-footer">
                <button class="btn btn-light">Bỏ lọc</button>
                <button class="btn btn-success">Áp dụng</button>
              </div>
            </div>
          </div>
        </div>
        <div class="c-body-content scrollbar">
          <table class="tbl">
            <thead>
              <tr>
                <th>Tên công việc</th>
                <th v-if="false">Phòng ban</th>
                <th v-if="false">Dự án/Nhóm</th>
                <th>Thời điểm bắt đầu</th>
                <th>Hạn hoàn thành</th>
                <th>Tình trạng</th>
                <th v-if="false">Trạng thái hoạt động</th>
                <th v-if="false">Tiến độ</th>
                <th>Thẻ</th>
                <th>Người thực hiện</th>
                <th v-if="false">Người liên quan</th>
                <th>Ngày tạo</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(mytask, index) in mytask" :key="index">
                <td>
                  <div class="td-multiple">
                    <div class="td-m-icon icon icon-24 icon-complete"></div>
                    <div class="td-m-text">{{ mytask.JobName }}</div>
                  </div>
                </td>
                <td v-if="false">Cá nhân</td>
                <td v-if="false">
                  <div class="td-multiple">
                    <div class="td-m-icon icon icon-24 icon-group">
                      <div class="icon icon-16 icon-user"></div>
                    </div>
                    <div class="td-m-text">Công việc cá nhân</div>
                  </div>
                </td>
                <td>
                  <div class="td-multiple">
                    <div class="td-m-icon icon icon-datepicker"></div>
                    <div class="td-m-text">
                      {{ formatDateTime(mytask.StartTime) }}
                    </div>
                  </div>
                </td>
                <td>
                  <div class="td-multiple">
                    <div
                      class="td-m-icon icon icon-24 icon-datepicker-yes"
                    ></div>
                    <div class="td-m-text">
                      {{ formatDateTime(mytask.EndTime) }}
                    </div>
                  </div>
                </td>
                <td>
                  <div class="td-multiple">
                    <div
                      class="td-m-icon icon icon-10 icon-status"
                      :class="
                        onBindingJobStatus(mytask.EndTime, mytask.JobStatus)
                      "
                    ></div>
                    <div class="td-m-text">
                      {{
                        isDateGreaterThanToday(mytask.EndTime)
                          ? "Quá hạn"
                          : mytask.JobStatus == ENUMJOBSTATUS.Complete
                          ? "Đã hoàn thành"
                          : mytask.JobStatus == ENUMJOBSTATUS.Processing
                          ? "Đang thực hiện"
                          : mytask.JobStatus == ENUMJOBSTATUS.Todo
                          ? "Cần thực hiện"
                          : ""
                      }}
                    </div>
                  </div>
                </td>
                <td v-if="false">Đang hoạt động</td>
                <td v-if="false">Gần xong</td>
                <td>
                  <div class="td-multiple">
                    <div
                      class="td-m-icon icon icon-16"
                      :class="{
                        important: mytask.JobTag == ENUMJOBTAG.Important,
                        instant: mytask.JobTag == ENUMJOBTAG.Urgent,
                      }"
                    ></div>
                    <div class="td-m-text">
                      {{
                        mytask.JobTag == ENUMJOBTAG.Important
                          ? "Quan trọng"
                          : mytask.JobTag == ENUMJOBTAG.Urgent
                          ? "Khẩn cấp"
                          : ""
                      }}
                    </div>
                  </div>
                </td>
                <td>
                  <div class="td-multiple">
                    <div class="td-m-icon icon icon-performer"></div>
                    <div class="td-m-text">{{ mytask.EmployeeName }}</div>
                  </div>
                </td>
                <td v-if="false">
                  <div class="td-multiple">
                    <div class="td-m-icon icon icon-jobadd"></div>
                    <div class="td-m-text">Quách Văn Cảnh</div>
                  </div>
                </td>
                <td>{{ formatDateTime(mytask.CreatedDate) }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import SortByDate from "./../../components/popup/sort-by-date.vue";
import { ENUMJOBSTATUS } from "@/enum.js";
import { ENUMJOBTAG } from "@/enum.js";
export default {
  name: "MyTask",
  components: { SortByDate },
  watch: {
    // Thay đổi title
    $route: {
      immediate: true,
      handler(to) {
        document.title = to.meta.title || "QVC | Việc của tôi";
      },
    },
  },
  created() {
    this.onGetAllTask();
  },
  methods: {
    onBindingJobStatus(time, status) {
      var clas = "";
      if (this.isDateGreaterThanToday(time)) {
        clas = "outofdate";
      } else {
        if (status == ENUMJOBSTATUS.Processing) {
          clas = "progess";
        }
        if (status == ENUMJOBSTATUS.Todo) {
          clas = "todo";
        }
        if (status == ENUMJOBSTATUS.Complete) {
          clas = "complete";
        }
      }
      return clas;
    },
    isDateGreaterThanToday(dateString) {
      const date = new Date(dateString);
      const today = new Date();
      if (!dateString) {
        return false;
      } else {
        return date < today;
      }
    },
    onGetAllTask() {
      this.axios
        .get(
          `http://localhost:56428/api/v2/Assign/GetAllMyTask?id=${localStorage.getItem(
            "userid"
          )}&dbdomain=${localStorage.getItem(
            "domain-db"
          )}&dbcompany=${localStorage.getItem("domain-company")}`
        )
        .then((res) => {
          if (res.data) {
            this.mytask = res.data;
            console.log(this.mytask);
          }
        })
        .catch((res) => {
          console.log(res);
        });
    },
    formatDateTime(dateString) {
      const date = new Date(dateString);
      const day = date.getDate().toString().padStart(2, "0");
      const month = (date.getMonth() + 1).toString().padStart(2, "0");
      const year = date.getFullYear().toString();
      const hours = date.getHours().toString().padStart(2, "0");
      const minutes = date.getMinutes().toString().padStart(2, "0");
      if (
        `${day}/${month}/${year}` == "01/01/1970" ||
        `${day}/${month}/${year}` == "01/01/1"
      ) {
        return ``;
      } else {
        return `${day}/${month}/${year} - ${hours}:${minutes}`;
      }
    },
  },
  data() {
    return {
      isShowSortByDate: false,
      mytask: [],
      ENUMJOBSTATUS,
      ENUMJOBTAG,
    };
  },
};
</script>

<style scoped>
.outofdate {
  background-color: red !important;
  border-color: red;
}
.complete {
  background-color: #50b83c !important;
  border-color: #50b83c !important;
}
.todo {
  /* background-color: rgb(141, 163, 166) !important;
  border-color: rgb(141, 163, 166) !important; */
}
.progess {
  background-color: coral !important;
  border-color: coral !important;
}
.important {
  background-image: url(./../../assets/img/information-circle-orange.svg);
}
.instant {
  background-image: url(./../../assets/img/lightning-circle-red.svg);
}
</style>
