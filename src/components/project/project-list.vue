<template>
  <div class="project-task-content">
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
                <div class="from-item" style="margin-right: 12px; width: 100%">
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
              <th>Phòng ban</th>
              <th>Dự án/Nhóm</th>
              <th>Thời điểm bắt đầu</th>
              <th>Hạn hoàn thành</th>
              <th>Tình trạng</th>
              <th>Trạng thái hoạt động</th>
              <th>Tiến độ</th>
              <th>Thẻ</th>
              <th>Người thực hiện</th>
              <th>Người liên quan</th>
              <th>Ngày tạo</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(item, index) in jobs" :key="index">
              <td>
                <div class="td-multiple">
                  <div class="td-m-icon icon icon-24 icon-complete"></div>
                  <div class="td-m-text">{{ item.JobName }}</div>
                </div>
              </td>
              <td>Cá nhân</td>
              <td>
                <div class="td-multiple">
                  <div class="td-m-icon icon icon-24 icon-group">
                    <div class="icon icon-16 icon-user"></div>
                  </div>
                  <div class="td-m-text">{{ item.ProjectID }}</div>
                </div>
              </td>
              <td>
                <div class="td-multiple">
                  <div class="td-m-icon icon icon-datepicker"></div>
                  <div class="td-m-text">{{ item.StartTime }}</div>
                </div>
              </td>
              <td>
                <div class="td-multiple">
                  <div class="td-m-icon icon icon-24 icon-datepicker-yes"></div>
                  <div class="td-m-text">{{ item.EndTime }}</div>
                </div>
              </td>
              <td>
                <div class="td-multiple">
                  <div
                    class="td-m-icon icon icon-10 icon-status outofdate"
                  ></div>
                  <div class="td-m-text">Quá hạn</div>
                </div>
              </td>
              <td>Đang hoạt động</td>
              <td>Gần xong</td>
              <td>
                <div class="td-multiple">
                  <div class="td-m-icon icon icon-jobadd"></div>
                  <div class="td-m-text"></div>
                </div>
              </td>
              <td>
                <div class="td-multiple">
                  <div class="td-m-icon icon icon-performer"></div>
                  <div class="td-m-text">Quách Văn Cảnh</div>
                </div>
              </td>
              <td>
                <div class="td-multiple">
                  <div class="td-m-icon icon icon-jobadd"></div>
                  <div class="td-m-text">Quách Văn Cảnh</div>
                </div>
              </td>
              <td>{{ item.EndTime }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "ProjectList",
  components: {},
  emits: [],
  props: [],
  watch: {},
  mounted() {
    this.getAllJob(this.$route.params.id);
  },
  created() {},
  methods: {
    getAllJob(id) {
      this.axios
        .get(
          `http://localhost:56428/api/v2/Job/project?id=${id}&domain=${localStorage.getItem(
            "domain-db"
          )}`
        )
        .then((res) => {
          this.jobs = res.data;
        })
        .catch((res) => {
          console.log(res);
        });
    },
  },
  data() {
    return {
      /**Danh sách công việc*/
      jobs: [],
    };
  },
};
</script>

<style scoped>
.project-task-content {
  width: calc(100% - 40px);
  height: calc(100vh - 96px);
  padding: 20px;
  display: flex;
}
</style>
