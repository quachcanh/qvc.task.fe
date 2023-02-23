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
          <div class="icon icon-24 icon-setting-deprt"></div>
          <div class="tab-item tab-active" style="margin-left: 12px">
            <div class="tab-item-text">Dự án trực thuộc</div>
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
        <div class="chart-content" style="width: 100%; height: 260px">
          <canvas
            ref="chartColumn"
            id="chartColumn"
            width="1000"
            height="300"
            style="margin: 0 auto"
          ></canvas>
        </div>
        <div class="chart-footer">
          <div class="item-chart">
            <div
              class="i-color"
              style="background-color: rgb(53, 190, 69)"
            ></div>
            <div class="i-text">Đã hoàn thành</div>
          </div>
          <div class="item-chart">
            <div
              class="i-color"
              style="background-color: rgb(164, 207, 48)"
            ></div>
            <div class="i-text">Đang thực hiện</div>
          </div>
          <div class="item-chart">
            <div
              class="i-color"
              style="background-color: rgb(141, 163, 166)"
            ></div>
            <div class="i-text">Cần thực hiện</div>
          </div>
          <div class="item-chart">
            <div
              class="i-color"
              style="background-color: rgb(255, 101, 102)"
            ></div>
            <div class="i-text">Quá hạn</div>
          </div>
        </div>
      </div>
      <div class="c-project" style="overflow-x: scroll">
        <div
          class="item-projecr"
          v-for="(item, index) in projects"
          :key="index"
          @click="onNavigaterProject(item.ProjectID)"
        >
          <div class="i-info">
            <div class="info-avt"></div>
            <div class="info-text">
              <div class="text-name">{{ item.ProjectName }}</div>
              <div class="text-date">
                {{ `Ngày bắt đầu: ${formatDate(item.StartDay)}` }}
              </div>
            </div>
          </div>
          <div class="i-chart">
            <canvas ref="chartProject" width="400" height="90"></canvas>
          </div>
          <div class="i-description">
            <div class="item-chart char-pro">
              <div
                class="i-color"
                style="background-color: rgb(53, 190, 69)"
              ></div>
              <div class="i-text">Đã hoàn thành</div>
            </div>
            <div class="item-chart char-pro">
              <div
                class="i-color"
                style="background-color: rgb(141, 163, 166)"
              ></div>
              <div class="i-text">Chưa hoàn thành</div>
            </div>
            <div class="item-chart char-pro">
              <div
                class="i-color"
                style="background-color: rgb(255, 101, 102)"
              ></div>
              <div class="i-text">Quá hạn</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import SelectDepartment from "./../../components/popup/select-department.vue";
import Chart from "chart.js/auto";
import { ENUMFILTER } from "@/enum.js";
import { RESAPI } from "@/res.js";
export default {
  name: "DepartmentTask",
  components: { SelectDepartment },
  watch: {
    idDeprtNow() {},
    // Thay đổi title
    $route: {
      immediate: true,
      handler(to) {
        document.title = to.meta.title || "Phòng ban | QVC | Task";
      },
    },
  },
  mounted() {
    this.idDeprtNow = this.$route.params.id;
    // Lấy danh sách dự án thep phòng ban
    this.getProjectById(this.idDeprtNow);
  },
  created() {},
  methods: {
    onNavigaterProject(id) {
      this.$router.push(`/project/${id}`);
    },
    getJobReports(data) {
      // Build dữ liệu đầu vào
      var datainput = {
        Id: [],
        DBDomain: localStorage.getItem("domain-db"),
      };
      for (const item of data) {
        datainput.Id.push(item.ProjectID);
      }
      this.axios
        .post("http://localhost:56428/api/v2/Job/job-report", datainput)
        .then((res) => {
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
     * THực hiện tạo biển đồ phần dự án
     */
    renderChartPro(datachart, pro) {
      this.$nextTick(() => {
        /**Thông tin biểu đồ tròn */
        // const pro = this.$refs.chartProject;
        // const pro = this.document.getElementById(id);
        new Chart(pro, {
          type: "polarArea",
          data: {
            datasets: [
              {
                data: [datachart.Complete, datachart.Todo, datachart.OutOfDate],
                borderWidth: 1,
                backgroundColor: [
                  "rgb(53, 190, 69)",
                  "rgb(141, 163, 166)",
                  "rgb(255, 101, 102)",
                ],
              },
            ],
          },
          options: {
            circular: true,
          },
        });
        // for (const item of pro) {

        // }
      });
    },
    /**
     * Thực hiện lấy danh sách dự án theo phòng ban
     * @param {*} id id của phòng ban
     */
    getProjectById(id) {
      this.axios
        .get(RESAPI.GetProjectById(id, localStorage.getItem("domain-db")))
        .then((res) => {
          if (res.data) {
            this.projects = res.data;
            this.getJobReports(this.projects);
            // Lấy biểu đồ theo dự ấn
            for (let i = 0; i < this.projects.length; i++) {
              this.getJobReportsInProject(this.projects[i], i);
            }
          }
        })
        .catch((res) => {
          console.log(res);
        });
    },

    async getJobReportsInProject(project, index) {
      await this.axios
        .get(
          `http://localhost:56428/api/v2/Job/job-report?id=${
            project.ProjectID
          }&dbDomain=${localStorage.getItem("domain-db")}`
        )
        .then((res) => {
          console.log(res.data);
          const pro = this.$refs.chartProject;
          this.renderChartPro(res.data, pro[index]);
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
    onSelectDataDeprt(data) {
      // Đóng popup
      this.isShowPopupDeprt = false;
      this.department = data;
    },
  },
  data() {
    return {
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

      /**Hiển thị popup chọn thời gian */
      isShowPopupFilter: false,

      /**ID phòng bạn đang chọn */
      idDeprtNow: "",

      ENUMFILTER,
      RESAPI,
    };
  },
};
</script>

<style scoped>
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
