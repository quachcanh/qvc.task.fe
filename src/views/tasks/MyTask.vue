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
              <div class="job-soon job-state">7 ngày gần nhất</div>
              <div class="job-soon job-icon">
                <div class="icon-h-drop drop-gray"></div>
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
            </div>
          </div>
          <div class="b-header-right">
            <button class="btn btn-with-icon btn-light">
              <div class="icon__button icon-export"></div>
              <span>Xuất khẩu</span>
            </button>
            <div class="bh-layout"></div>
            <div class="icon icon-24 icon-filter"></div>
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
              <tr>
                <td>
                  <div class="td-multiple">
                    <div class="td-m-icon icon icon-24 icon-complete"></div>
                    <div class="td-m-text">Tạo công việc của cá nhân</div>
                  </div>
                </td>
                <td>Cá nhân</td>
                <td>
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
                    <div class="td-m-text">12/12/2022</div>
                  </div>
                </td>
                <td>
                  <div class="td-multiple">
                    <div
                      class="td-m-icon icon icon-24 icon-datepicker-yes"
                    ></div>
                    <div class="td-m-text">12/12/2022</div>
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
                <td>12/12/2022</td>
              </tr>
              <tr>
                <td>
                  <div class="td-multiple">
                    <div
                      class="td-m-icon icon icon-24 icon-complete completed"
                    ></div>
                    <div class="td-m-text">Tạo công việc của cá nhân</div>
                  </div>
                </td>
                <td>Cá nhân</td>
                <td>
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
                    <div class="td-m-text">12/12/2022</div>
                  </div>
                </td>
                <td>
                  <div class="td-multiple">
                    <div class="td-m-icon icon icon-datepicker"></div>
                    <div class="td-m-text"></div>
                  </div>
                </td>
                <td>
                  <div class="td-multiple">
                    <div
                      class="td-m-icon icon icon-10 icon-status jobdue"
                    ></div>
                    <div class="td-m-text">Đến hạn</div>
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
                    <div class="td-m-text">Hoàng Tú</div>
                  </div>
                </td>
                <td>12/12/2022</td>
              </tr>
              <tr>
                <td>
                  <div class="td-multiple">
                    <div class="td-m-icon icon icon-24 icon-complete"></div>
                    <div class="td-m-text">Tạo công việc của cá nhân</div>
                  </div>
                </td>
                <td>Cá nhân</td>
                <td>
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
                    <div class="td-m-text">12/12/2022</div>
                  </div>
                </td>
                <td>
                  <div class="td-multiple">
                    <div
                      class="td-m-icon icon icon-24 icon-datepicker-yes"
                    ></div>
                    <div class="td-m-text">12/12/2022</div>
                  </div>
                </td>
                <td>
                  <div class="td-multiple">
                    <div class="td-m-icon icon icon-10 icon-status"></div>
                    <div class="td-m-text">Cần giao</div>
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
                    <div class="td-m-text">Thuỳ Trang</div>
                  </div>
                </td>
                <td>12/12/2022</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "MyTask",
  components: {},
  watch: {
    // Thay đổi title
    $route: {
      immediate: true,
      handler(to) {
        document.title = to.meta.title || "QVC | Việc của tôi";
      },
    },
  },
  created() {},
  methods: {},
  data() {
    return {};
  },
};
</script>

<style></style>
