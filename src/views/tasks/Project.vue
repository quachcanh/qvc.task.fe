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
          <div class="btn-name-department" @click="onShowPopListProject">
            <span class="btn-h-text" style="color: #000; font-size: 15px">{{
              project.ProjectName
            }}</span>
            <div class="btn-add-plus">
              <div class="icon-h-drop drop-black"></div>
            </div>
          </div>
          <SelectDepartment
            v-if="false"
            @onSelectData="onSelectDataDeprt"
          ></SelectDepartment>
          <div
            class="icon icon-24 icon-setting-deprt"
            @click="isShowSetting = !isShowSetting"
          ></div>
          <!-- Popup hiển thị thiết lập dự án -->
          <div
            class="popup-combobox cbb-setting"
            v-if="isShowSetting"
            style="right: 158px"
          >
            <div class="p-s-content">
              <div class="item-ccb" @click="onShowEditProject">
                <span>Thông tin dự án/nhóm</span>
              </div>
              <div class="item-ccb" @click="onShowDialogDeleteProject">
                <span>Xoá dự án/nhóm</span>
              </div>
            </div>
          </div>
          <!-- Popup hiển thị thiết lập dự án -->
          <div
            ref="tabtable"
            class="tab-item tab-active"
            style="margin-left: 24px"
            @click="toggleTab(0)"
          >
            <div class="tab-item-text">Bảng</div>
          </div>
          <div
            ref="tablist"
            class="tab-item"
            style="margin-left: 24px"
            @click="toggleTab(1)"
          >
            <div class="tab-item-text">Danh sách</div>
          </div>
          <!-- Popup hiển thị chọn dự án -->
          <div class="popup-combobox cbb-project" v-if="isShowPopListProject">
            <div class="arror arrow-top" style="right: 185px"></div>
            <div class="p-s-content">
              <div
                class="item-ccb"
                @click="onSelecteProject(item.ProjectID, item.DepartmentID)"
                :objid="item.ProjectID"
                v-for="(item, index) in listProject"
                :key="index"
              >
                <span>{{ item.ProjectName }}</span>
              </div>
            </div>
          </div>
          <!-- Popup hiển thị chọn dự án -->
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
    <ProjectTable
      :id="this.$route.query.projectid"
      :state="this.$route.query.state"
      v-if="isShowTable"
      :isload="isLoadDataJob"
    ></ProjectTable>
    <ProjectList
      :id="this.$route.query.projectid"
      :state="this.$route.query.state"
      :nameproject="project.ProjectName"
      :isload="isLoadDataJob"
      v-if="isShowList"
    ></ProjectList>
  </div>
  <ProjectDetail
    :mode="ENUMMODE.Edit"
    :data="project"
    :stateedit="this.$route.query.state"
    v-if="isShowProjectDetail"
    @onClose="isShowProjectDetail = false"
    @onCancel="isShowProjectDetail = false"
    @onConfirm="insertProject"
  ></ProjectDetail>
  <ToastMessage ref="toast"></ToastMessage>
  <QvcLoading v-if="isShowLoading"></QvcLoading>
  <PopupNotification
    :title="titleWarning"
    :content="contentWaring"
    :typeicon="typeIcon"
    :showbtncancel="true"
    @onClose="isShowWarning = false"
    @onConfirm="onDeleteProject"
    @onCancel="isShowWarning = false"
    v-if="isShowWarning"
  ></PopupNotification>
</template>
<script>
import SelectDepartment from "./../../components/popup/select-department.vue";
import ProjectTable from "./../../components/project/project-table.vue";
import ProjectList from "./../../components/project/project-list.vue";
import { ENUMSTATE } from "@/enum";
import { ENUMMODE } from "@/enum.js";
import { ENUMTOAST } from "@/enum.js";
import { ENUMICON } from "@/enum.js";
import ProjectDetail from "./../../components/form/project-detail.vue";
import ToastMessage from "./../../components/toast/toast-message.vue";
import QvcLoading from "./../../components/dialog/qvc-loading.vue";
import PopupNotification from "./../../components/popup/popup-notification.vue";
export default {
  name: "ProjectTask",
  components: {
    SelectDepartment,
    ProjectTable,
    ProjectList,
    ProjectDetail,
    ToastMessage,
    QvcLoading,
    PopupNotification,
  },
  emits: [],
  props: [],
  watch: {},
  mounted() {
    this.getProjectById();
  },
  created() {
    this.getProjectById();
    this.checkState();
  },
  methods: {
    insertProject(project, listid) {
      // Bulid dữ liệu
      var data = {
        Data: project,
        DBDomain:
          this.state == ENUMSTATE.CaNhan
            ? localStorage.getItem("domain-db")
            : localStorage.getItem("domain-company"),
      };
      data.Data.ModifiedBy = localStorage.getItem("full-name");
      this.isShowLoading = true;
      //Gọi API
      this.axios
        .post("http://localhost:56428/api/v2/Project/updateby-id", data)
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
      console.log(project, listid);
    },
    onShowEditProject() {
      this.isShowSetting = false;
      this.isShowProjectDetail = true;
    },

    checkState() {
      if (
        !localStorage.getItem("domain-company") ||
        localStorage.getItem("domain-company") == "null"
      ) {
        this.state = ENUMSTATE.CaNhan;
        // Dạng cá nhân
      } else {
        //Dạng công ty
        this.state = ENUMSTATE.CongTy;
      }
    },
    getDataUrl() {
      var data = {
        Projectid: this.$route.query.projectid,
        Departid: this.$route.query.departid,
        State: this.$route.query.state,
      };
      return data;
    },
    getDataLocal() {
      var data = {
        Dbdomain: localStorage.getItem("domain-db"),
        Dbcompany: localStorage.getItem("domain-company"),
        Role: parseInt(localStorage.getItem("role")),
        Fullname: localStorage.getItem("full-name"),
      };
      return data;
    },
    onShowPopListProject() {
      if (this.isShowPopListProject) {
        // Đóng
        this.isShowPopListProject = false;
      } else {
        this.isShowPopListProject = true;
        this.getAllProjectByIdDepart();
      }
    },
    getAllProjectByIdDepart() {
      var dataUrl = this.getDataUrl();
      var dataLocal = this.getDataLocal();
      this.axios
        .get(
          `http://localhost:56428/api/v2/Project/getall-byid?id=${
            dataUrl.Departid
          }&domain=${
            dataUrl.State == ENUMSTATE.CaNhan
              ? dataLocal.Dbdomain
              : dataLocal.Dbcompany
          }`
        )
        .then((res) => {
          if (res.data) {
            this.listProject = res.data;
          }
        })
        .catch((res) => {
          console.log(res);
        });
    },
    onSelecteProject(id, iddepart) {
      // Đóng
      this.isShowPopListProject = false;
      var dataUrl = this.getDataUrl();
      var dataLocal = this.getDataLocal();
      this.$router.push({
        path: "/project",
        query: {
          projectid: id,
          departid: iddepart,
          state: dataUrl.State,
        },
      });
      this.axios
        .get(
          `http://localhost:56428/api/v2/Project/getby-id?id=${id}&domaindb=${
            dataUrl.State == ENUMSTATE.CaNhan
              ? dataLocal.Dbdomain
              : dataLocal.Dbcompany
          }`
        )
        .then((res) => {
          if (res.data) {
            this.project = res.data;
            this.isLoadDataJob = !this.isLoadDataJob;
          }
        })
        .catch((res) => {
          console.log(res);
        });
    },

    onShowDialogDeleteProject() {
      // Hiển thị thông báo đăng nhập
      this.contentWaring = [];
      this.contentWaring.push(
        `Bạn có muốn xoá dự án ${this.project.ProjectName} không?`
      );
      this.titleWarning = "Thông báo";
      this.typeIcon = ENUMICON.Waring;
      this.isShowWarning = true;
      this.isShowSetting = false;
    },
    onDeleteProject() {
      var db =
        this.state == ENUMSTATE.CaNhan
          ? localStorage.getItem("domain-db")
          : localStorage.getItem("domain-company");

      this.isShowLoading = true;
      this.axios
        .delete(
          `http://localhost:56428/api/v2/Project/deleteby-id?id=${this.project.ProjectID}&db=${db}`
        )
        .then(() => {
          setTimeout(() => {
            this.isShowLoading = false;
            this.isShowWarning = false;
            // Hiển thị toast
            this.$refs.toast.show(
              "Thành công!",
              "Dữ liệu đã được cập nhật.",
              ENUMTOAST.Success
            );
            this.$router.push("/");
          }, 500);
        })
        .catch((res) => {
          setTimeout(() => {
            this.isShowLoading = false;
            // Hiển thị toast
            this.$refs.toast.show(
              "Lỗi!",
              "Không thể cập nhật dữ liệu.",
              ENUMTOAST.Waring
            );
            console.log(res);
          }, 500);
        });
    },

    getProjectById() {
      var dataUrl = this.getDataUrl();
      var dataLocal = this.getDataLocal();
      this.axios
        .get(
          `http://localhost:56428/api/v2/Project/getby-id?id=${
            dataUrl.Projectid
          }&domaindb=${
            dataUrl.State == ENUMSTATE.CaNhan
              ? dataLocal.Dbdomain
              : dataLocal.Dbcompany
          }`
        )
        .then((res) => {
          if (res.data) {
            this.project = res.data;
          }
        })
        .catch((res) => {
          console.log(res);
        });
    },
    toggleTab(index) {
      if (index == 0) {
        this.isShowTable = true;
        this.isShowList = false;
        this.$refs.tabtable.classList.add("tab-active");
        this.$refs.tablist.classList.remove("tab-active");
      } else {
        this.isShowTable = false;
        this.isShowList = true;
        this.$refs.tabtable.classList.remove("tab-active");
        this.$refs.tablist.classList.add("tab-active");
      }
    },
  },
  data() {
    return {
      contentWaring: [],
      isShowProjectDetail: false,
      isShowSetting: false,
      isShowTable: true,
      isShowList: false,
      project: {},
      listProject: [],
      isShowPopListProject: false,
      textRole: {},
      keyRole: {},
      isShowLoading: false,
      state: ENUMSTATE.CaNhan,
      ENUMMODE,
      ENUMSTATE,
      ENUMTOAST,
      isShowWarning: false,
      titleWarning: "Thông báo",
      typeIcon: ENUMICON.Waring,
      isLoadDataJob: false,
    };
  },
};
</script>

<style scoped>
.cbb-setting {
  position: absolute;
  top: 48px;
  left: 0px;
}
.cbb-project {
  top: 48px;
  left: -70px;
  z-index: 20;
}
.my-task-content {
  width: calc(100% - 36px);
  height: auto !important;
  padding: 0px 16px 12px 16px;
}
.my-task-content {
  width: calc(100% - 36px);
  height: calc(100vh - 69px);
  padding: 0px 16px 12px 16px;
}
.char-pro + .char-pro {
  margin-top: 4px;
}
.i-description {
  margin-top: 6px;
  padding-left: 30px;
}
.text-name {
  font-size: 17px;
  font-weight: 700;
  margin-bottom: 6px;
}
.text-date {
  font-size: 13px;
  color: #666;
}
.info-avt {
  width: 30px;
  height: 30px;
  background-color: greenyellow;
  border-radius: 50px;
  margin-right: 8px;
}
.i-info {
  display: flex;
  align-items: center;
  justify-content: center;
}
.c-project {
  padding: 20px 0px 20px 0px;
  display: flex;
}
.item-projecr {
  width: 200px;
  height: 300px;
  background-color: #fff;
  border-radius: 8px;
  padding: 10px;
}
.item-projecr + .item-projecr {
  margin-left: 20px;
}
.chart-content {
  padding: 20px;
}
.i-text {
  font-size: 13px;
  color: #767676;
}
.item-chart {
  display: flex;
  align-items: center;
}

.i-color {
  width: 12px;
  height: 12px;
  border-radius: 2px;
  margin-right: 8px;
}
.chart-footer {
  display: flex;
  justify-content: space-around;
  padding: 20px;
}
.i-cbb {
  width: 250px;
  position: relative;
}
.chart-header {
  display: flex;
  justify-content: space-between;
}
.c-chart {
  background-color: #fff;
  border-radius: 8px;
  padding: 20px;
}
.point {
  left: 10px !important;
}
.i-filter {
  width: 250px;
}
.c-header {
  display: flex;
  padding: 20px 0px 20px 0px;
  justify-content: space-between;
}
.flex-con {
  display: flex;
  align-items: center;
  position: relative;
}
.my-task-content {
  background-color: #f1f1f1 !important;
}
.h-left-tab {
  align-items: center;
  position: relative;
}

.popup-deprt {
  top: 37px;
}

.cbb {
  background-image: url(./../../assets/img/cbb.svg);
  position: absolute;
  right: 10px;
}
.icon-setting-deprt {
  background-image: url(./../../assets/img/setting-deprt.svg);
  margin-left: 12px;
  cursor: pointer;
  user-select: none;
}
.icon-white {
  background-image: url(./../../assets/img/white.svg);
  width: 30px;
  height: 24px;
  background-size: 24px 24px;
  margin-left: 12px;
}
.btn-name-department {
  min-width: 10px !important;
  margin-top: 4px;
  width: auto;
  min-width: 78px;
  height: 32px;
  padding: 0px 16px 0px 16px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  position: relative;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
}
</style>
