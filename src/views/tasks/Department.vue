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
          <div
            class="btn-name-department"
            @click="isShowPopupDeprt = !isShowPopupDeprt"
          >
            <span class="btn-h-text" style="color: #000; font-size: 15px">{{
              department.DepartmentName
            }}</span>
            <div class="btn-add-plus">
              <div class="icon-h-drop drop-black"></div>
            </div>
          </div>
          <SelectDepartment
            v-if="isShowPopupDeprt"
            @onSelectData="onSelectDataDeprt"
          ></SelectDepartment>
          <div
            class="icon icon-24 icon-setting-deprt"
            v-if="isShowSettingBtn"
            @click="isShowSetting = !isShowSetting"
          ></div>
          <div class="tab-item tab-active" style="margin-left: 12px">
            <div class="tab-item-text">Dự án trực thuộc</div>
          </div>
          <!-- Popup hiển thị thiết lập phòng ban -->
          <div class="popup-combobox cbb-setting" v-if="isShowSetting">
            <div class="arror arrow-top"></div>
            <div class="p-s-content">
              <div class="item-ccb" @click="onShowDeprtDetail">
                <span>{{ textRole.editDepart }}</span>
              </div>
              <div class="item-ccb" @click="onShowDeprtDelete">
                <span>{{ textRole.delDepart }}</span>
              </div>
            </div>
          </div>
          <!-- Popup hiển thị thiết lập phòng ban -->
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
    <div class="my-department-content">
      <div class="c-header">
        <div class="flex-con">
          <div style="font-size: 24px; font-weight: 600">Dự án trực thuộc</div>
        </div>
        <div class="flex-con">
          <div class="icon icon-16 search-all point"></div>
          <input
            class="input i-filter input-icon-left i-search-all"
            type="text"
            placeholder="Tìm kiếm"
          />
          <div class="icon icon-white"></div>
        </div>
      </div>
      <div class="c-chart">
        <div class="chart-header">
          <div class="flex-con">
            <div style="font-size: 17px; font-weight: 700">
              Tình hình thực hiện công việc
            </div>
          </div>
          <div class="flex-con">
            <input
              class="input i-cbb"
              type="text"
              readonly
              v-model="filterDate.filterText"
              @click="isShowPopupFilter = !isShowPopupFilter"
            />
            <div class="icon icon-16 cbb"></div>
            <div class="popup-combobox popup-deprt" v-if="isShowPopupFilter">
              <div class="p-s-content">
                <div
                  class="item-ccb"
                  @click="onSelectFilterDate(ENUMFILTER.Day7, '7 ngày gần đây')"
                >
                  <span>7 ngày gần đây</span>
                  <div class="icon icon-cbb"></div>
                </div>
                <div
                  class="item-ccb"
                  @click="
                    onSelectFilterDate(ENUMFILTER.Day30, '30 ngày gần đây')
                  "
                >
                  <span>30 ngày gần đây</span>
                  <div class="icon icon-cbb"></div>
                </div>
                <div
                  class="item-ccb"
                  @click="onSelectFilterDate(ENUMFILTER.WeekNow, 'Tuần này')"
                >
                  <span>Tuần này</span>
                  <div class="icon icon-cbb"></div>
                </div>
                <div
                  class="item-ccb"
                  @click="onSelectFilterDate(ENUMFILTER.WeekLast, 'Tuần trước')"
                >
                  <span>Tuần trước</span>
                  <div class="icon icon-cbb"></div>
                </div>
                <div
                  class="item-ccb"
                  @click="onSelectFilterDate(ENUMFILTER.MonthNow, 'Tháng này')"
                >
                  <span>Tháng này</span>
                  <div class="icon icon-cbb"></div>
                </div>
                <div
                  class="item-ccb"
                  @click="
                    onSelectFilterDate(ENUMFILTER.MonthLast, 'Tháng trước')
                  "
                >
                  <span>Tháng trước</span>
                  <div class="icon icon-cbb"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="chart-content">
          <ChartColumn :values="dataSets"></ChartColumn>
        </div>
      </div>
      <div class="c-project">
        <div
          class="item-projecr"
          v-for="(item, index) in dataPies"
          :key="index"
          @click="onNavigaterProject(item.Id, item.DepartId)"
        >
          <div class="i-info">
            <div class="info-avt"></div>
            <div class="info-text">
              <div class="text-name">{{ item.Name }}</div>
              <div class="text-date">
                {{ `Ngày bắt đầu: ${formatDate(item.Time)}` }}
              </div>
            </div>
          </div>
          <div class="i-chart">
            <ChartPie
              :completed="item.Complete"
              :inProgress="item.Processing"
              :toDo="item.Todo"
              :overdue="item.OutOfDate"
            ></ChartPie>
          </div>
          <div class="i-description">
            <div class="item-chart char-pro">
              <div class="i-text" style="color: rgb(53, 190, 69)">
                {{ `${item.Complete} Đã hoàn thành` }}
              </div>
            </div>
            <div class="item-chart char-pro">
              <div class="i-text" style="color: rgb(164, 207, 48)">
                {{ `${item.Processing} Đang thực hiện` }}
              </div>
            </div>
            <div class="item-chart char-pro">
              <div class="i-text" style="color: rgb(141, 163, 166)">
                {{ `${item.Todo} Cần thực hiện` }}
              </div>
            </div>
            <div class="item-chart char-pro">
              <div class="i-text" style="color: rgb(255, 101, 102)">
                {{ `${item.OutOfDate} Quá hạn` }}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <DepartmentDetail
    :mode="ENUMMODE.Edit"
    v-if="isShowDeparDetail"
    :data="department"
    @onConfirm="onUpdateDepart"
    @onClose="isShowDeparDetail = false"
    @onCancel="isShowDeparDetail = false"
  ></DepartmentDetail>
  <ToastMessage ref="toast"></ToastMessage>
  <QvcLoading v-if="isShowLoading"></QvcLoading>
  <PopupNotification
    :title="titleWarning"
    :content="contentWaring"
    :typeicon="typeIcon"
    :showbtncancel="true"
    @onClose="isShowWarning = false"
    @onConfirm="onDeleteDepart"
    @onCancel="isShowWarning = false"
    v-if="isShowWarning"
  ></PopupNotification>
</template>

<script>
import SelectDepartment from "./../../components/popup/select-department.vue";
import ToastMessage from "./../../components/toast/toast-message.vue";
import ChartColumn from "./../../components/chart/chart-column.vue";
import DepartmentDetail from "./../../components/form/department-detail.vue";
import ChartPie from "./../../components/chart/chart-pie.vue";
import QvcLoading from "./../../components/dialog/qvc-loading.vue";
import PopupNotification from "./../../components/popup/popup-notification.vue";
import Chart from "chart.js/auto";
import { ENUMFILTER } from "@/enum.js";
import { ENUMSTATE } from "@/enum.js";
import { ENUMMODE } from "@/enum.js";
import { ENUMTOAST } from "@/enum.js";
import { ENUMICON } from "@/enum.js";
import { RESAPI } from "@/res.js";
export default {
  name: "DepartmentTask",
  components: {
    SelectDepartment,
    ChartColumn,
    ChartPie,
    DepartmentDetail,
    ToastMessage,
    QvcLoading,
    PopupNotification,
  },
  watch: {
    // Thay đổi title
    $route: {
      immediate: true,
      handler(to) {
        document.title = to.meta.title || "Phòng ban | QVC | Task";
      },
    },
  },
  mounted() {
    // Lấy giá trị id từ query parameters
    this.iddepart = this.$route.query.id;
    // Lấy giá trị companyid từ query parameters
    this.companyid = this.$route.query.companyid;
    this.getProjectById(this.iddepart);
    this.getDepartmentById();
  },
  created() {
    // Lấy giá trị id từ query parameters
    this.iddepart = this.$route.query.id;
    // Lấy giá trị companyid từ query parameters
    this.companyid = this.$route.query.companyid;
    this.checkState();
    this.getDepartmentById();
  },
  methods: {
    onDeleteDepart() {
      var db = "";
      if (!this.department.CompanyID) {
        db = localStorage.getItem("domain-db");
      } else {
        db = localStorage.getItem("domain-company");
      }
      this.isShowLoading = true;
      this.axios
        .delete(
          `http://localhost:56428/api/v2/Department/deleteby-id?id=${this.department.DepartmentID}&db=${db}`
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
    onShowDeprtDelete() {
      this.onCheckState();
      // Hiển thị thông báo đăng nhập
      this.contentWaring = [];
      var content =
        this.state == ENUMSTATE.CaNhan
          ? `Bạn có muốn xoá danh mục ${this.department.DepartmentName} không?`
          : `Bạn có muốn xoá phòng ban ${this.department.DepartmentName} không?`;
      this.contentWaring.push(content);
      this.titleWarning = "Thông báo";
      this.typeIcon = ENUMICON.Waring;
      this.isShowWarning = true;
      this.isShowSetting = false;
    },
    onUpdateDepart(datadepart, listemp) {
      //Dữ liệu
      var data = {
        Data: datadepart,
        DBDomain: !this.companyid
          ? localStorage.getItem("domain-db")
          : localStorage.getItem("domain-company"),
      };
      this.isShowLoading = true;
      this.axios
        .post("http://localhost:56428/api/v2/Department/updateby-id", data)
        .then(() => {
          setTimeout(() => {
            this.isShowLoading = false;
            this.isShowDeparDetail = false;
            // Hiển thị toast
            this.$refs.toast.show(
              "Thành công!",
              "Dữ liệu đã được cập nhật.",
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
              "Không thể cập nhật dữ liệu.",
              ENUMTOAST.Waring
            );
            console.log(res);
          }, 500);
        });
      console.log(listemp);
    },
    getDepartmentById() {
      var db = !this.companyid
        ? localStorage.getItem("domain-db")
        : localStorage.getItem("domain-company");
      this.axios
        .get(
          `http://localhost:56428/api/v2/Department/getby-id?id=${this.iddepart}&domaindb=${db}`
        )
        .then((res) => {
          this.department = res.data;
          if (this.department.DepartmentCode == "CANHAN") {
            this.isShowSettingBtn = false;
          } else {
            this.isShowSettingBtn = true;
          }
        })
        .catch((res) => {
          console.log(res);
        });
    },

    onShowDeprtDetail() {
      this.isShowSetting = false;
      this.isShowDeparDetail = true;
    },
    onCheckState() {
      if (
        !localStorage.getItem("domain-company") ||
        localStorage.getItem("domain-company") == "null"
      ) {
        this.state = ENUMSTATE.CaNhan;
      } else {
        //Dạng công ty
        this.state = ENUMSTATE.CongTy;
      }
    },
    checkState() {
      if (
        !localStorage.getItem("domain-company") ||
        localStorage.getItem("domain-company") == "null"
      ) {
        this.state = ENUMSTATE.CaNhan;
        // Dạng cá nhân
        this.textRole.editDepart = "Chỉnh sửa danh mục công việc";
        this.textRole.delDepart = "Xoá danh mục";
      } else {
        //Dạng công ty
        this.state = ENUMSTATE.CongTy;
        // Dạng cá nhân
        this.textRole.editDepart = "Chỉnh sửa phòng ban";
        this.textRole.delDepart = "Xoá phòng ban";
      }
    },
    onNavigaterProject(id, iddepart) {
      this.$router.push({
        path: "/project",
        query: {
          projectid: id,
          departid: iddepart,
          state: !this.companyid ? ENUMSTATE.CaNhan : ENUMSTATE.CongTy,
        },
      });
    },
    getJobReports(data) {
      this.dataSets.Data = [];
      // Build dữ liệu đầu vào
      var db = !this.companyid
        ? localStorage.getItem("domain-db")
        : localStorage.getItem("domain-company");
      var datainput = {
        Id: [],
        DBDomain: db,
      };
      for (const item of data) {
        datainput.Id.push(item.ProjectID);
      }
      this.axios
        .post("http://localhost:56428/api/v2/Job/job-report", datainput)
        .then((res) => {
          this.dataSets.Data = [
            res.data.Complete,
            res.data.Processing,
            res.data.Todo,
            res.data.OutOfDate,
          ];
          this.renderChartColumn(res.data);
        })
        .catch((res) => {
          console.log(res);
        });
    },
    /**
     * THực hiện formatj ngày tháng
     * @param {*} data dữ liệu
     */
    formatDate(data) {
      // Tạo một đối tượng Date từ chuỗi "2023-02-22T00:00:00"
      const date = new Date(data);

      // Lấy các giá trị ngày, tháng, năm từ đối tượng Date
      const day = date.getDate();
      const month = date.getMonth() + 1;
      const year = date.getFullYear();

      // Tạo chuỗi định dạng "dd/mm/yyyy" từ các giá trị ngày, tháng, năm
      const formattedDate = `${day}/${month}/${year}`;
      if (formattedDate == "1/1/1") {
        return "";
      } else {
        return formattedDate;
      }
    },

    /**
     * Thực hiện tạo biểu đồ cột
     */
    renderChartColumn(datachart) {
      this.$nextTick(() => {
        /**Thông tin biểu đồ cột */
        const ctx = this.$refs.chartColumn;
        new Chart(ctx, {
          type: "bar",
          data: {
            labels: ["", "", "", ""],
            datasets: [
              {
                label: "",
                data: [
                  datachart.Complete,
                  datachart.Processing,
                  datachart.Todo,
                  datachart.OutOfDate,
                ],
                backgroundColor: [
                  "rgb(53, 190, 69)",
                  "rgb(164, 207, 48)",
                  "rgb(141, 163, 166)",
                  "rgb(255, 101, 102)",
                ],
              },
            ],
          },
          options: {
            scales: {
              y: {
                beginAtZero: true,
              },
            },
          },
        });
      });
    },

    /**
     * Thực hiện lấy danh sách dự án theo phòng ban
     * @param {*} id id của phòng ban
     */
    getProjectById(id) {
      var db = !this.companyid
        ? localStorage.getItem("domain-db")
        : localStorage.getItem("domain-company");
      this.axios
        .get(RESAPI.GetProjectById(id, db))
        .then((res) => {
          if (res.data) {
            this.projects = res.data;
            this.getJobReports(this.projects);
            // Lấy biểu đồ theo dự ấn
            for (let i = 0; i < this.projects.length; i++) {
              this.getJobReportsInProject(this.projects[i]);
            }
          }
        })
        .catch((res) => {
          console.log(res);
        });
    },

    async getJobReportsInProject(project) {
      this.dataPies = [];
      var db = !this.companyid
        ? localStorage.getItem("domain-db")
        : localStorage.getItem("domain-company");
      await this.axios
        .get(
          `http://localhost:56428/api/v2/Job/job-report?id=${project.ProjectID}&dbDomain=${db}`
        )
        .then((res) => {
          var objPie = {
            Complete: res.data.Complete,
            OutOfDate: res.data.OutOfDate,
            Processing: res.data.Processing,
            Todo: res.data.Todo,
            Name: project.ProjectName,
            Time: project.StartDay,
            Id: project.ProjectID,
            DepartId: project.DepartmentID,
          };
          this.dataPies.push(objPie);
        })
        .catch((res) => {
          console.log(res);
        });
    },

    // getJobForProject(id) {},
    /**
     * Thực hiện chọn thời gian tìm kiếm
     * @param {*} type kiểu
     * @param {*} text chuỗi heiern thị
     */
    onSelectFilterDate(type, text) {
      this.filterDate.filterType = type;
      this.filterDate.filterText = text;
      this.isShowPopupFilter = false;
    },

    /**
     * Thực hiện gán lại dữ liệu khi chọn phòng ban
     * @param {*} data dũ liệu phòng ban
     */
    onSelectDataDeprt(id, companyid) {
      // Lấy giá trị id từ query parameters
      this.iddepart = id;
      // Lấy giá trị companyid từ query parameters
      this.companyid = companyid;
      this.getDepartmentById();
      this.getProjectById(id);
      // Đóng popup
      this.isShowPopupDeprt = false;
    },
  },
  data() {
    return {
      state: ENUMSTATE.CaNhan,
      isShowWarning: false,
      isShowSettingBtn: true,
      keyRole: {},
      textRole: {},
      /**Danh sách dự án */
      projects: [],

      /**Hiển thị popup chọn phòng ban */
      isShowPopupDeprt: false,

      /**Đối tượng phòng ba */
      department: {
        DepartmentName: "Cá nhân",
      },

      /**Kiểu lọc theo ngày */
      filterDate: {
        filterType: ENUMFILTER.Day7,
        filterText: "7 ngày gần đây",
      },

      /**Dữ liệu biểu đồ tổng */
      chartTotal: {},
      companyid: "",

      /**Hiển thị popup chọn thời gian */
      isShowPopupFilter: false,

      /**ID phòng bạn đang chọn */
      iddepart: "",
      isShowSetting: false,

      /**Dữ liệu biểu đồ tròn */
      dataPies: [],

      /**Dữ liệu biểu đồ cột */
      dataSets: {
        /**Tiêu đề */
        Title: {
          X: "Số lượng công việc12",
          Y: "Dự án",
        },
        /**Các loại item hiển thị dữ liệu */
        Labels: [
          {
            Text: "Đã hoàn thành",
            Color: "rgb(53, 190, 69)",
          },
          {
            Text: "Đang thực hiện",
            Color: "rgb(164, 207, 48)",
          },
          {
            Text: "Cần thực hiện",
            Color: "rgb(141, 163, 166)",
          },
          {
            Text: "Quá hạn",
            Color: "rgb(255, 101, 102)",
          },
        ],
        /**Thông số dữ liệu */
        Data: [0, 0, 0, 0],
        /**Độ rộng cột */
        ColumnSize: 28,
        /**Tuỳ chọn hiển thị biểu đồ */
        Options: {
          ScalesX: true,
          ScalesY: true,
          TitleX: true,
          TitleY: true,
        },
      },
      titleWarning: "",
      contentWaring: [],
      isShowDeparDetail: false,
      isShowLoading: false,
      typeIcon: ENUMICON.Waring,

      ENUMFILTER,
      RESAPI,
      ENUMSTATE,
      ENUMMODE,
      ENUMTOAST,
      ENUMICON,
    };
  },
};
</script>

<style scoped>
.arror {
  position: absolute;
  top: -10px;
  right: 125px;
}
.cbb-setting {
  position: absolute;
  top: 48px;
  left: -12px;
  user-select: none;
}
.i-chart {
  width: 100%;
  height: calc(80% - 120px);
  display: flex;
  justify-content: center;
}
.my-department-content {
  width: calc(100% - 36px);
  /* height: calc(100% - 68px); */
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
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.item-projecr + .item-projecr {
  margin-left: 20px;
}
.chart-content {
  height: calc(100% - 16px);
}
.c-chart {
  background-color: #fff;
  border-radius: 8px;
  padding: 20px;
  height: 320px;
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
.my-department-content {
  background-color: #f1f1f1 !important;
}
.h-left-tab {
  align-items: center;
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
  cursor: pointer;
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
