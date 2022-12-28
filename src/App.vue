<template>
  <div class="container task">
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
        <div class="s-m-item">
          <div class="i__icon my-job"></div>
          <div class="i__content-menu">Việc của tôi</div>
        </div>
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
          <div class="btn-header">
            <div class="icon__btn-header icon-custom"></div>
            <span class="btn-h-text">Tuỳ chỉnh</span>
          </div>
        </div>
        <div class="m-h-right">
          <div class="btn-header" style="margin-right: 10px">
            <div class="icon__btn-header icon-add"></div>
            <span class="btn-h-text">Thêm công việc</span>
            <div class="btn-h-layout"></div>
            <div class="icon-h-drop"></div>
          </div>
          <div class="btn-icon-header">
            <div class="icon-header icon-search"></div>
          </div>
          <div class="btn-icon-header">
            <div class="icon-header icon-notification"></div>
          </div>
          <div class="btn-icon-header">
            <div class="icon-header icon-message"></div>
          </div>
          <div class="btn-icon-header">
            <div class="icon-header icon-setting"></div>
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
  name: "App",
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

<style>
@import url(./css/main.css);
</style>
