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
        <ListDepartment
          v-for="(item, index) in departments"
          :key="index"
          :name="item.DepartmentName"
          :id="item.DepartmentID"
          :isloadproject="isLoadProject"
          @onShowProject="onShowProject(item.DepartmentID, item.DepartmentName)"
        ></ListDepartment>
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
            <div
              style="display: flex; align-items: center"
              @click="isShowJobDetail = !isShowJobDetail"
            >
              <div class="icon__btn-header icon-add"></div>
              <span class="btn-h-text">Thêm công việc</span>
            </div>
            <div class="btn-h-layout"></div>
            <div class="btn-add-plus" @click="isShowAddJob = !isShowAddJob">
              <div class="icon-h-drop"></div>
            </div>
            <div class="popup-add-job" v-if="isShowAddJob">
              <div class="arror arrow-top"></div>
              <div class="p-a-item">
                <div class="item-icon icon icon-24 add-job"></div>
                <div class="item-text">Thêm công việc từ mẫu</div>
              </div>
              <div class="p-a-item">
                <div class="item-icon icon icon-24 job-column"></div>
                <div class="item-text">Thêm cột mốc công việc</div>
              </div>
              <div
                class="p-a-item"
                @click="onShowProject(undefined, undefined)"
              >
                <div class="item-icon icon icon-24 add-project-group"></div>
                <div class="item-text">Thêm dự án/nhóm</div>
              </div>
              <div class="p-a-item" @click="onShowFormDeprt">
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
          <div
            class="btn-icon-header"
            @click.stop="isShowFilter = !isShowFilter"
          >
            <div class="icon-header icon-search"></div>
            <div class="popup-search" v-if="isShowFilter">
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
          <div
            class="btn-icon-header"
            @click.stop="this.isShowNotification = !this.isShowNotification"
          >
            <div class="icon-header icon-notification"></div>
            <div class="popup-notification" v-if="isShowNotification">
              <div class="arror arrow-top notification-arrow"></div>
              <div class="p-n-header">
                <div class="p-n-h-title">Thông báo</div>
                <div class="p-n-h-func">
                  <div
                    class="btn-nofiti"
                    @click.stop="isShowNotifiFilter = !isShowNotifiFilter"
                  >
                    <span>Tất cả</span>
                    <div class="icon-nofiti"></div>
                  </div>
                  <div
                    class="popup-notification-view-menu"
                    v-if="isShowNotifiFilter"
                  >
                    <div class="p-a-item">
                      <div class="item-text">Tất cả</div>
                    </div>
                    <div class="p-a-item">
                      <div class="item-text">Chưa đọc</div>
                    </div>
                  </div>
                  <div
                    class="btn-menu"
                    @click.stop="isShowNotifiSetting = !isShowNotifiSetting"
                  >
                    <div class="icon-menu"></div>
                  </div>
                  <div
                    class="popup-notification-view-setup"
                    v-if="isShowNotifiSetting"
                  >
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
          <div
            class="btn-icon-header"
            @click="this.isShowSetting = !this.isShowSetting"
          >
            <div class="icon-header icon-setting"></div>
            <div class="popup-settings" v-if="isShowSetting">
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
          <div class="text-logout" @click="onLogout">Đăng xuất</div>
        </div>
      </div>
      <div class="m-content">
        <div class="m-c-info">
          <div class="m-c-hello">
            <span class="hello-text">{{ hello }}</span>
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
  <PopupNotification
    v-if="isShowWaring"
    :title="titleWaring"
    :content="contentWaring"
    :typeicon="typeIcon"
    :showbtncancel="false"
    @onClose="isShowWaring = false"
    @onConfirm="onConfirm"
  ></PopupNotification>
  <DepartmentDetail
    v-if="isShowDepartment"
    @onClose="isShowDepartment = !isShowDepartment"
    @onCancel="isShowDepartment = !isShowDepartment"
    @onConfirm="insertDepartment"
  ></DepartmentDetail>
  <QvcLoading v-if="isShowLoading"></QvcLoading>
  <ToastMessage ref="toast"></ToastMessage>
  <ProjectDetail
    v-if="isShowProjectDetail"
    @onClose="isShowProjectDetail = !isShowProjectDetail"
    @onCancel="isShowProjectDetail = !isShowProjectDetail"
    @onConfirm="insertProject"
    :iddeprt="idDeprt"
    :namedeprt="nameDeprt"
  ></ProjectDetail>
  <JobDetail
    @onClose="isShowJobDetail = !isShowJobDetail"
    @onCancel="isShowJobDetail = !isShowJobDetail"
    @onConfirm="insertJob"
    :idproject="idProjectSelected"
    :nameproject="nameProjectSelected"
    v-if="isShowJobDetail"
  ></JobDetail>
</template>

<script>
import PopupNotification from "./../components/popup/popup-notification.vue";
import ListDepartment from "./../components/menu/list-department.vue";
import DepartmentDetail from "./../components/form/department-detail.vue";
import QvcLoading from "./../components/dialog/qvc-loading.vue";
import ToastMessage from "./../components/toast/toast-message.vue";
import ProjectDetail from "./../components/form/project-detail.vue";
import JobDetail from "./../components/form/job-detail.vue";
import { ENUMICON } from "@/enum.js";
import { ENUMPOPUP } from "@/enum.js";
import { ENUMTOAST } from "@/enum.js";
import { RESAPI } from "@/res.js";
export default {
  name: "HomeTask",
  components: {
    PopupNotification,
    ListDepartment,
    DepartmentDetail,
    QvcLoading,
    ToastMessage,
    ProjectDetail,
    JobDetail,
  },
  created() {
    // Kiểm tra xem đã login hay chưa?
    if (!localStorage.getItem("access-token")) {
      // Hiển thị thông báo đăng nhập
      this.contentWaring = [];
      this.contentWaring.push(
        "Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại để tiếp tục."
      );
      this.typeIcon = ENUMICON.Waring;
      this.typePopup = ENUMPOPUP.Login;
      this.isShowWaring = true;
    } else {
      // Hiển thị thông tin người dùng
      this.setInfoSession();

      // Hiển thị danh sách phòng ban
      this.getDepartment();
      this.showTime();
      this.getSaying();
    }
  },
  methods: {
    onLogout(){
      localStorage.clear();
      this.$router.push("/login");
    },
    insertJob(job, jobchild) {
      // Bulid dữ liệu
      var data = {
        DataInsert: {
          Data: job,
          DBDomain: localStorage.getItem("domain-db"),
        },
        DataList: jobchild,
      };
      this.isShowLoading = true;
      //Gọi API
      this.axios
        .post(RESAPI.InsertJob, data)
        .then(() => {
          setTimeout(() => {
            this.isShowLoading = false;
            this.isShowJobDetail = false;
            // Hiển thị toast
            this.$refs.toast.show(
              "Thành công!",
              "Dữ liệu công việc đã được cập nhật.",
              ENUMTOAST.Success
            );
          }, 500);
        })
        .catch((res) => {
          setTimeout(() => {
            this.isShowLoading = false;
            // Hiển thị toast
            this.$refs.toast.show(
              "Lỗi!",
              "Không thể thêm mới công. Vui lòng kiểm tra lại.",
              ENUMTOAST.Waring
            );
            console.log(res);
          }, 500);
        });
    },

    /**Sự kiện khi ấn đồng ý */
    onConfirm() {
      switch (this.typePopup) {
        case ENUMPOPUP.Login:
          this.goToLogin();
          break;
        default:
          break;
      }
    },

    /**
     * Lấy danh sách phòng ban
     */
    getDepartment() {
      var domain = localStorage.getItem("domain-db");
      this.axios
        .get(`http://localhost:56428/api/v2/Department/${domain}`)
        .then((res) => {
          if (res) {
            this.departments = res.data;
          }
        })
        .catch((res) => {
          console.log(res);
        });
    },

    /**
     * Thực hiện hiển thị thông tin cá nhân khi vào trang home
     */
    setInfoSession() {
      // Hiển thị lời chào
      this.hello = "Xin chào " + localStorage.getItem("full-name");
    },

    /**
     * Đi tới trang login
     */
    goToLogin() {
      this.isShowWaring = false;
      this.$router.push("/login");
    },

    /**
     * Tạo mã bản ghi random
     */
    generateCodeDeprt(key) {
      // Generate a random integer between 0 and 99999
      const randomNumber = Math.floor(Math.random() * 100000);

      // Pad the number with leading zeros to ensure it has 5 digits
      const randomCode = randomNumber.toString().padStart(5, "0");

      // Concatenate the code with the prefix 'DP'
      const finalCode = key + randomCode;

      return finalCode;
    },

    /**
     * Hiển thị form thêm phòng ban
     */
    onShowFormDeprt() {
      this.isShowAddJob = false;
      this.isShowDepartment = true;
    },

    /**
     * Thực hiên thêm mới phòng ban
     * @param {*} deprt thông tin phòng ban
     * @param {*} listid danh sách id nhân viên
     */
    insertDepartment(deprt, listid) {
      // Bulid dữ liệu
      var data = {
        Data: {
          DepartmentName: deprt.DepartmentName,
          DepartmentCode: this.generateCodeDeprt("DP"),
        },
        DBDomain: localStorage.getItem("domain-db"),
      };
      this.isShowLoading = true;
      //Gọi API
      this.axios
        .post("http://localhost:56428/api/v2/Department/insert", data)
        .then(() => {
          setTimeout(() => {
            this.isShowLoading = false;
            this.isShowDepartment = false;
            // Hiển thị toast
            this.$refs.toast.show(
              "Thành công!",
              "Dữ liệu phòng ban đã được cập nhật.",
              ENUMTOAST.Success
            );
            //Lấy lại danh sách phòng ban
            this.getDepartment();
          }, 500);
        })
        .catch((res) => {
          setTimeout(() => {
            this.isShowLoading = false;
            // Hiển thị toast
            this.$refs.toast.show(
              "Lỗi!",
              "Không thể thêm mới phòng ban. Vui lòng kiểm tra lại.",
              ENUMTOAST.Waring
            );
            console.log(res);
          }, 500);
        });
      console.log(listid);
    },

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
     * Hiển thị form thêm dự án
     * @param {*} iddeprt id phòng ban
     */
    onShowProject(iddeprt, namedeprt) {
      if (!iddeprt) {
        this.isShowAddJob = false;
        this.isShowProjectDetail = true;
      } else {
        this.isShowProjectDetail = true;
        this.idDeprt = iddeprt;
        this.nameDeprt = namedeprt;
      }
    },

    insertProject(project, listid) {
      // Bulid dữ liệu
      project.ProjectCode = this.generateCodeDeprt("PR");
      var data = {
        Data: project,
        DBDomain: localStorage.getItem("domain-db"),
      };
      this.isShowLoading = true;
      //Gọi API
      this.axios
        .post("http://localhost:56428/api/v2/Project/insert", data)
        .then(() => {
          setTimeout(() => {
            this.isShowLoading = false;
            this.isShowProjectDetail = false;
            // Hiển thị toast
            this.$refs.toast.show(
              "Thành công!",
              "Dữ liệu dự án đã được cập nhật.",
              ENUMTOAST.Success
            );
            //Lấy lại danh sách dự án
            this.isLoadProject = !this.isLoadProject;
          }, 500);
        })
        .catch((res) => {
          setTimeout(() => {
            this.isShowLoading = false;
            // Hiển thị toast
            this.$refs.toast.show(
              "Lỗi!",
              "Không thể thêm mới dự án. Vui lòng kiểm tra lại.",
              ENUMTOAST.Waring
            );
            console.log(res);
          }, 500);
        });
      console.log(data, listid);
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
      /**Id dự án đang chọn */
      idProjectSelected: "",

      /**Tên dự án đang chọn */
      nameProjectSelected: "",

      // Thời gian hiện tại
      time: "",

      // Câu nói hay
      saying: "",

      // Tác giả câu nói
      author: "",

      /**Hiển thị thông báo */
      isShowWaring: false,

      /**Tiêu đề thông báo */
      titleWaring: "Thông báo",

      /**Nội dung thông báo */
      contentWaring: [],

      /**Loại icon thông báo */
      typeIcon: ENUMICON.Info,

      /**Loại thông báo */
      typePopup: ENUMPOPUP.Waring,

      /**Lời chào */
      hello: "",

      /**Hiển thị popup thiết lập chung */
      isShowSetting: false,

      /**Hiển thị popup thông báo */
      isShowNotification: false,

      /**Hiển thị menu lọc thông báo */
      isShowNotifiFilter: false,

      /**Hiển thị menu thiết lập thông báo */
      isShowNotifiSetting: false,

      /**Hiển thị popup tìm kiếm */
      isShowFilter: false,

      /**Hiển thị popup thêm công việc */
      isShowAddJob: false,

      /**Danh sách phòn ban */
      departments: [],

      /**Hiển thị dialog thêm phòng ban */
      isShowDepartment: false,

      /**Hiển thị loading */
      isShowLoading: false,

      /**Hiển thị form thêm dự án*/
      isShowProjectDetail: false,

      /**State lấy lại danh sách dự án */
      isLoadProject: false,

      /**ID phòng ban đang thao tác */
      idDeprt: "",

      /**Tên phòng ban đang tương tác */
      nameDeprt: "",

      /** Hiển thị form thêm công việc*/
      isShowJobDetail: false,

      /**Dữ liệu enum */
      ENUMICON,
      ENUMPOPUP,
      ENUMTOAST,
      RESAPI,
    };
  },
};
</script>

<style scoped>
.text-logout{
  color: #fff;
  font-size: 15px;
  font-weight: 600;
  margin-top: 8px;
  padding-left: 18px;
  cursor: pointer;
  user-select: none;
}
.text-logout:hover{
  color: lightgreen;
}
</style>
