<template>
  <div class="project-task-content">
    <div class="group-job">
      <div class="gr-header" style="background-color: rgb(33, 229, 243)">
        <div class="gr-hd-text">Cần thực hiện</div>
        <div class="gr-hd-count">
          <span>{{ jobTodos.length }}</span>
        </div>
      </div>
      <div class="gr-content scrollbar">
        <div class="item-job" v-for="(item, index) in jobTodos" :key="index">
          <div class="job-status">
            <div class="s-item icon icon-24 icon-todo"></div>
            <div class="s-text" style="color: rgb(141, 163, 166)">
              Cần thực hiện
            </div>
          </div>
          <div class="job-name">{{ item.JobName }}</div>
          <div class="job-icon">
            <div class="icon icon-24 icon-relevant-circle-dash-v2"></div>
            <div class="icon icon-24 icon-no-date"></div>
            <div class="date-end">{{ formatDate(item.EndTime) }}</div>
          </div>
        </div>
      </div>
    </div>
    <div class="group-job">
      <div class="gr-header" style="background-color: rgb(33, 150, 243)">
        <div class="gr-hd-text">Đang thực hiện</div>
        <div class="gr-hd-count">
          <span>{{ jobProcessings.length }}</span>
        </div>
      </div>
      <div class="gr-content scrollbar">
        <div
          class="item-job"
          v-for="(item, index) in jobProcessings"
          :key="index"
        >
          <div class="job-status">
            <div class="s-item icon icon-24 icon-Progress"></div>
            <div class="s-text" style="color: rgb(164, 207, 48)">
              Đang thực hiện
            </div>
          </div>
          <div class="job-name">{{ item.JobName }}</div>
          <div class="job-icon">
            <div class="icon icon-24 icon-relevant-circle-dash-v2"></div>
            <div class="icon icon-24 icon-no-date"></div>
            <div class="date-end">{{ formatDate(item.EndTime) }}</div>
          </div>
        </div>
      </div>
    </div>
    <div class="group-job">
      <div class="gr-header" style="background-color: rgb(76, 217, 100)">
        <div class="gr-hd-text">Đã hoàn thành</div>
        <div class="gr-hd-count">
          <span>{{ jobCompletes.length }}</span>
        </div>
      </div>
      <div class="gr-content scrollbar">
        <div
          class="item-job"
          v-for="(item, index) in jobCompletes"
          :key="index"
        >
          <div class="job-status">
            <div class="s-item icon icon-24 icon-done-green"></div>
            <div class="s-text" style="color: rgb(53, 190, 69)">
              Đã hoàn thành
            </div>
          </div>
          <div class="job-name" style="text-decoration: line-through">
            {{ item.JobName }}
          </div>
          <div class="job-icon">
            <div class="icon icon-24 icon-relevant-circle-dash-v2"></div>
            <div class="icon icon-24 icon-no-date"></div>
            <div class="date-end">{{ formatDate(item.EndTime) }}</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { ENUMSTATE } from "@/enum";
export default {
  name: "ProjectTable",
  components: {},
  emits: [],
  props: ["id", "state", "isload"],
  watch: {
    isload() {
      // Lấy danh sách dự án thep phòng ban
      this.getJobTodo(this.id, this.state);
      this.getJobProcessing(this.id, this.state);
      this.getJobComplete(this.id, this.state);
    },
  },
  mounted() {
    // Lấy danh sách dự án thep phòng ban
    this.getJobTodo(this.id, this.state);
    this.getJobProcessing(this.id, this.state);
    this.getJobComplete(this.id, this.state);
  },
  created() {},
  methods: {
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
    getJobTodo(id, state) {
      var db =
        state == ENUMSTATE.CaNhan
          ? localStorage.getItem("domain-db")
          : localStorage.getItem("domain-company");
      this.axios
        .get(
          `http://localhost:56428/api/v2/Job/job-todo?id=${id}&dbDomain=${db}`
        )
        .then((res) => {
          this.jobTodos = res.data;
        });
    },
    getJobProcessing(id, state) {
      var db =
        state == ENUMSTATE.CaNhan
          ? localStorage.getItem("domain-db")
          : localStorage.getItem("domain-company");
      this.axios
        .get(
          `http://localhost:56428/api/v2/Job/job-processing?id=${id}&dbDomain=${db}`
        )
        .then((res) => {
          this.jobProcessings = res.data;
        });
    },
    getJobComplete(id, state) {
      var db =
        state == ENUMSTATE.CaNhan
          ? localStorage.getItem("domain-db")
          : localStorage.getItem("domain-company");
      this.axios
        .get(
          `http://localhost:56428/api/v2/Job/job-complete?id=${id}&dbDomain=${db}`
        )
        .then((res) => {
          this.jobCompletes = res.data;
        });
    },
  },
  data() {
    return {
      /**Danh sách công việc cần thực hiện */
      jobTodos: [],

      /**Danh sách công việc đang thực hiện */
      jobProcessings: [],

      /**Danh sách công việc đã hoàn thành */
      jobCompletes: [],
      ENUMSTATE,
    };
  },
};
</script>

<style scoped>
.date-end {
  font-size: 12px;
  font-weight: 600;
  color: red;
}
.s-item {
  margin-right: 10px;
}
.s-text {
  font-weight: 600;
}
.job-status {
  display: flex;
  align-items: center;
  border-bottom: 1px solid #c2c2c2;
  margin-bottom: 12px;
  padding-bottom: 10px;
}
.job-name {
  font-size: 15px;
  color: rgba(0, 0, 0, 0.87);
  margin-bottom: 24px;
}
.job-icon {
  display: flex;
  align-items: center;
}
.item-job {
  width: calc(100% - 24px);
  height: auto;
  background-color: #fff;
  border-radius: 8px;
  padding: 12px;
}
.item-job + .item-job {
  margin-top: 12px;
}
.icon-todo {
  background-image: url(./../../assets/img/todo.svg);
}
.icon-Progress {
  background-image: url(./../../assets/img/Progress.svg);
}
.icon-done-green {
  background-image: url(./../../assets/img/done-green.svg);
}
.icon-relevant-circle-dash-v2 {
  background-image: url(./../../assets/img/relevant-circle-dash-v2.svg);
  margin-right: 16px;
}
.icon-no-date {
  background-image: url(./../../assets/img/no-date.svg);
  margin-right: 12px;
}
.gr-hd-count {
  display: flex;
  justify-content: center;
  align-items: center;
}
.gr-hd-count > span {
  font-weight: 600;
  color: #ffffff;
  font-size: 15px;
}
.gr-hd-count {
  width: 24px;
  height: 24px;
  border-radius: 50px;
  background-color: rgb(173, 173, 173);
}
.gr-hd-text {
  font-size: 20px;
  color: white;
  font-weight: 600;
}
.gr-content {
  padding: 12px;
  height: calc(100% - 88px);
}
.gr-header {
  height: 40px;
  padding: 12px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.group-job {
  width: 283px;
  height: calc(100vh - 56px);
}
.group-job:nth-child(even) {
  background-color: #c2c2c2;
}
.group-job:nth-child(odd) {
  background-color: #c5c5c5e3;
}
.project-task-content {
  width: 100%;
  height: calc(100vh - 56px);
  padding: 0px;
  display: flex;
}
</style>
