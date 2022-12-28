<template>
  <div class="container login">
    <div class="wrap-login">
      <div class="w-l-header">
        <div class="login-header-logo"></div>
        <div class="login-header-title">QVC TASK</div>
      </div>
      <div class="w-l-content">
        <div class="item-control c-username"></div>
        <div class="item-control c-password"></div>
        <div class="c-restore-pass"><span>Quên mật khẩu?</span></div>
        <div class="item-control c-btn-login">
          <span>Đăng nhập</span>
        </div>
      </div>
      <div class="w-l-footer">
        <span class="no-account">Chưa có tài khoản?</span>
        <span class="no-sigup"><b>Đăng ký</b></span>
      </div>
    </div>
    <div class="copy-right">Copyright © 2022 QVC TASK</div>
  </div>
</template>

<script>
export default {
  name: "LoginAccount",
  components: {},
  created() {},
  methods: {},
  data() {
    return {};
  },
};
</script>

<style>
@import url(./css/main.css);
</style>
