<template>
  <div class="container dashboard">
    <div class="sidebar">
      <div class="s-logo">
        <div class="s-l-img"></div>
        <div class="s-l-name">Công việc</div>
      </div>
      <div class="s-menu">
        <div class="s-m-item">
          <div class="i__icon home"></div>
          <div class="i__content-menu">Tổng quan</div>
        </div>
        <router-link to="/mytask" class="s-m-item">
          <div class="i__icon my-job"></div>
          <div class="i__content-menu">Việc của tôi</div>
        </router-link>
        <div class="s-m-item">
          <div class="i__icon report"></div>
          <div class="i__content-menu">Báo cáo</div>
        </div>
      </div>
      <div class="s-option">
        <input placeholder="Tìm kiếm" class="s-o__filter" type="text" />
        <div class="s-o__setting"></div>
      </div>
      <div class="s-list scrollbar">
        <div class="s-l-item">
          <div class="s-l-i-left">
            <div class="l-i__icon icon-extend"></div>
            <div class="l-i__content-list list-content">Cá nhân</div>
          </div>
          <div class="s-l-i-right">
            <div class="l-i__icon add-project"></div>
            <div class="l-i__icon view-project"></div>
          </div>
        </div>
        <div class="s-list-item__project">
          <div class="s-l__p-icon">
            <div class="icon-project icon_my-job"></div>
          </div>
          <div class="s-l__p-text">
            <span class="list-content">Công việc cá nhân</span>
          </div>
        </div>
        <div class="s-l-item">
          <div class="s-l-i-left">
            <div class="l-i__icon icon-collapse"></div>
            <div class="l-i__content-list list-content">
              Phòng tài chính kế toán
            </div>
          </div>
          <div class="s-l-i-right">
            <div class="l-i__icon add-project"></div>
            <div class="l-i__icon view-project"></div>
          </div>
        </div>
      </div>
    </div>
    <div class="main">
      <div class="m-header">
        <div class="m-h-left">
          <div class="btn-header btn-custom">
            <div class="icon__btn-header icon-custom"></div>
            <span class="btn-h-text">Tuỳ chỉnh</span>
          </div>
        </div>
        <div class="m-h-right">
          <div class="btn-header" style="margin-right: 10px">
            <div class="icon__btn-header icon-add"></div>
            <span class="btn-h-text">Thêm công việc</span>
            <div class="btn-h-layout"></div>
            <div class="btn-add-plus">
              <div class="icon-h-drop"></div>
            </div>
            <div class="popup-add-job" style="display: none">
              <div class="arror arrow-top"></div>
              <div class="p-a-item">
                <div class="item-icon icon icon-24 add-job"></div>
                <div class="item-text">Thêm công việc từ mẫu</div>
              </div>
              <div class="p-a-item">
                <div class="item-icon icon icon-24 job-column"></div>
                <div class="item-text">Thêm cột mốc công việc</div>
              </div>
              <div class="p-a-item">
                <div class="item-icon icon icon-24 add-project-group"></div>
                <div class="item-text">Thêm dự án/nhóm</div>
              </div>
              <div class="p-a-item">
                <div class="item-icon icon icon-24 add-deprt"></div>
                <div class="item-text">Thêm phòng ban</div>
              </div>
              <div class="p-a-item">
                <div class="item-icon icon icon-24 add-uo"></div>
                <div class="item-text">Thêm phòng ban theo cơ cấu tổ chức</div>
              </div>
              <div class="p-a-item">
                <div class="item-icon icon icon-24 add-user"></div>
                <div class="item-text">
                  Thêm nhanh nhân viên vào phòng ban/dự án
                </div>
              </div>
            </div>
          </div>
          <div class="btn-icon-header">
            <div class="icon-header icon-search"></div>
            <div class="popup-search" style="display: none">
              <div class="arror arrow-top search-arrow"></div>
              <div class="p-n-input">
                <input
                  placeholder="Tìm theo tên công việc, mô tả công việc, thành viên, thẻ..."
                  class="input input-icon-left i-search-all"
                  type="text"
                />
                <div class="icon icon-16 search-all"></div>
              </div>
              <div class="p-n-content">
                <div class="p-n-c-background"></div>
                <div class="p-n-c-text">
                  Tìm kiếm công việc, thành viên, thẻ...
                </div>
              </div>
              <div class="p-n-footer">
                <div class="p-n-f-icon icon icon-16 icon-advanced"></div>
                <div class="p-n-f-text">Tìm kiếm công việc nâng cao</div>
              </div>
            </div>
          </div>
          <div class="btn-icon-header">
            <div class="icon-header icon-notification"></div>
            <div class="popup-notification" style="display: none">
              <div class="arror arrow-top notification-arrow"></div>
              <div class="p-n-header">
                <div class="p-n-h-title">Thông báo</div>
                <div class="p-n-h-func">
                  <div class="btn-nofiti">
                    <span>Tất cả</span>
                    <div class="icon-nofiti"></div>
                  </div>
                  <div class="popup-notification-view-menu">
                    <div class="p-a-item">
                      <div class="item-text">Tất cả</div>
                    </div>
                    <div class="p-a-item">
                      <div class="item-text">Chưa đọc</div>
                    </div>
                  </div>
                  <div class="btn-menu">
                    <div class="icon-menu"></div>
                  </div>
                  <div class="popup-notification-view-setup">
                    <div class="p-a-item">
                      <div class="item-icon icon icon-16 icon-checkall"></div>
                      <div class="item-text">Đánh dấu đã đọc tất cả</div>
                    </div>
                    <div class="p-a-item">
                      <div
                        class="item-icon icon icon-16 icon-setting-nofiti"
                      ></div>
                      <div class="item-text">Thiết lập thông báo</div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="p-n-notification">
                <div class="p-n-n-icon"></div>
              </div>
            </div>
          </div>
          <div class="btn-icon-header">
            <div class="icon-header icon-message"></div>
          </div>
          <div class="btn-icon-header">
            <div class="icon-header icon-setting"></div>
            <div class="popup-settings" style="display: none;">
              <div class="arror arrow-top settings-arrow"></div>
              <div class="p-s-header">Thiết lập chung</div>
              <div class="p-s-content">
                <div class="p-s-c-item"><span>Mẫu công việc</span></div>
                <div class="p-s-c-item"><span>Mẫu dự án</span></div>
                <div class="p-s-c-item"><span>Thông báo</span></div>
                <div class="p-s-c-item"><span>Tự động gửi báo cáo</span></div>
                <div class="p-s-c-item"><span>Bàn giao công việc</span></div>
                <div class="p-s-c-item"><span>Uỷ quyền</span></div>
                <div class="p-s-c-item"><span>Góp ý sản phẩm</span></div>
              </div>
            </div>
          </div>
          <div class="btn-icon-header btn-avatar"></div>
        </div>
      </div>
      <div class="m-content">
        <div class="m-c-info">
          <div class="m-c-hello">
            <span class="hello-text">Xin chào Quách Văn Cảnh</span>
          </div>
          <div class="m-c-datetime">
            <span class="datetime-text">{{ time }}</span>
          </div>
          <div class="m-c-saying">
            <span class="saying-text">{{ saying }}</span>
            <br />
            <br />
            <span class="saying-author">{{ author }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "HomeTask",
  components: {},
  created() {
    this.showTime();
    this.getSaying();
  },
  methods: {
    /**
     * Lấy thời gian hiện tại
     * Author: QVCANH (28/12/2022)
     */
    showTime() {
      var date = new Date();
      var h = date.getHours(); // 0 - 23
      var m = date.getMinutes(); // 0 - 59
      var s = date.getSeconds(); // 0 - 59
      var session = "AM";

      if (h == 0) {
        h = 12;
      }

      if (h > 12) {
        h = h - 12;
        session = "PM";
      }

      h = h < 10 ? "0" + h : h;
      m = m < 10 ? "0" + m : m;
      s = s < 10 ? "0" + s : s;

      this.time = h + ":" + m + ":" + s + " " + session;

      // Sau 1 giây sẽ chạy lại hàm showTime
      setTimeout(this.showTime, 1000);
    },

    /**
     * API lấy câu nói hay
     * Author: QVCANH (28/12/2022)
     */
    getSaying() {
      try {
        this.axios
          .get("https://type.fit/api/quotes")
          .then((res) => {
            var data = res.data[Math.floor(Math.random() * res.data.length)];
            this.saying = data.text;
            this.author = data.author;
          })
          .catch((res) => {
            console.log(res);
          });

        // Sau 1 phút sẽ chạy lại hàm getSaying
        setTimeout(this.getSaying, 60000);
      } catch (error) {
        console.log(error);
      }
    },
  },
  data() {
    return {
      // Thời gian hiện tại
      time: "",

      // Câu nói hay
      saying: "",

      // Tác giả câu nói
      author: "",
    };
  },
};
</script>

<style></style>
