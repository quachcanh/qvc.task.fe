<template>
  <div class="container login">
    <div class="wrap-login">
      <div class="w-l-header">
        <div class="login-header-logo"></div>
        <div class="login-header-title">QVC TASK</div>
      </div>
      <div class="w-l-content">
        <div class="item-control">
          <input
            ref="username"
            placeholder="Tên đăng nhập/email"
            class="input c-username"
            type="text"
          />
        </div>
        <div class="item-control">
          <input
            placeholder="Mật khẩu"
            class="input c-password"
            type="password"
          />
          <div class="icon icon-16 showpass"></div>
        </div>
        <div class="c-restore-pass"><span>Quên mật khẩu?</span></div>
        <router-link to="/" class="item-control c-btn-login">
          <span>Đăng nhập</span>
        </router-link>
      </div>
      <div class="w-l-footer">
        <span class="no-account">Chưa có tài khoản?</span>
        <router-link to="/register" class="no-sigup"
          ><b>Đăng ký</b></router-link
        >
      </div>
    </div>
    <div class="copy-right">Copyright © 2022 QVC TASK</div>
  </div>
</template>

<script>
export default {
  name: "LoginAccount",
  components: {},
  created() {
    this.autoFocus();
  },
  methods: {
    /**
     * Thực hiện focus vào ô nhập liệu đầu tiên khi form được mở lên
     * Author: QVCANH (01/12/2022)
     */
    autoFocus() {
      try {
        this.$nextTick(() => this.$refs.username.focus());
      } catch (error) {
        console.log(error);
      }
    },
  },
  data() {
    return {};
  },
};
</script>

<style></style>
