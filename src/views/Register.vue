<template>
  <div class="container login">
    <div class="wrap-register">
      <div class="w-l-header">
        <div class="login-header-logo"></div>
        <div class="register-header-title">Đăng ký tài khoản QVC TASK</div>
      </div>
      <div class="w-l-content">
        <div class="reg-content">
          <div class="reg-content-info">
            <div class="reg-info-title">
              <span>Thông tin tài khoản</span>
            </div>
            <div class="layout-row"></div>
            <div class="reg-info-body">
              <div class="from-item">
                <div class="f-i-title f-title-reg">Họ và tên</div>
                <input
                  placeholder="Nhập họ và tên"
                  class="input place-reg"
                  type="text"
                  name=""
                  id=""
                />
              </div>
              <div class="from-item item-group">
                <div class="from-item" style="margin-right: 12px">
                  <div class="f-i-title f-title-reg">Số điện thoại</div>
                  <input
                    placeholder="Nhập số điện thoại"
                    class="input place-reg"
                    type="text"
                    name=""
                    id=""
                  />
                </div>
                <div class="from-item">
                  <div class="f-i-title f-title-reg">Email</div>
                  <input
                    placeholder="Nhập email"
                    class="input place-reg"
                    type="text"
                    name=""
                    id=""
                  />
                </div>
              </div>
              <div class="from-item">
                <div class="f-i-title f-title-reg">Địa chỉ</div>
                <input
                  placeholder="Nhập địa chỉ"
                  class="input place-reg"
                  type="text"
                  name=""
                  id=""
                />
              </div>
              <div class="from-item">
                <div class="f-i-title f-title-reg">Công ty/Doanh nghiệp</div>
                <input
                  placeholder="Nhập tên công ty/doanh nghiệp"
                  class="input place-reg"
                  type="text"
                  name=""
                  id=""
                />
              </div>
            </div>
          </div>
          <div class="reg-content-info-login">
            <div class="reg-info-title">
              <span>Thông tin đăng nhập</span>
            </div>
            <div class="layout-row"></div>
            <div class="reg-info-body">
              <div class="from-item">
                <div class="f-i-title f-title-reg">Tên đăng nhập/Email</div>
                <input
                  placeholder="Nhập tên đăng nhập (email)"
                  class="input place-reg"
                  type="text"
                  name=""
                  id=""
                />
              </div>
              <div class="from-item item-pos">
                <div class="f-i-title f-title-reg">Mật khẩu</div>
                <input
                  placeholder="Nhập mật khẩu"
                  class="input input-pass place-reg"
                  type="password"
                  name=""
                  id=""
                />
                <div class="icon icon-16 showpass sp-form-reg"></div>
              </div>
              <div class="from-item item-pos">
                <div class="f-i-title f-title-reg">Nhập lại mật khẩu</div>
                <input
                  placeholder="Nhập lại mật khẩu"
                  class="input input-pass place-reg"
                  type="password"
                  name=""
                  id=""
                />
                <div class="icon icon-16 showpass sp-form-reg"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="item-control c-btn-login">
          <span>Đăng ký</span>
        </div>
      </div>
      <div class="w-l-footer">
        <span class="no-account">Bạn đang sử dụng QVC TASK?</span>
        <router-link to="/login" class="no-sigup"
          ><b>Mời đăng nhập</b></router-link
        >
      </div>
    </div>
    <div class="copy-right">Copyright © 2022 QVC TASK</div>
  </div>
</template>

<script>
export default {
  name: "RegisterAccount",
  components: {},
  created() {},
  methods: {},
  data() {
    return {};
  },
};
</script>

<style></style>
