<template>
  <div class="project-task-content">
    <div class="group-job">
      <div class="gr-header" style="background-color: rgb(33, 229, 243)">
        <div class="gr-hd-text">Cần thực hiện</div>
        <div class="gr-hd-count">
          <span>{{ jobTodos.length }}</span>
        </div>
      </div>
      <div class="gr-content">
        <div class="item-job" v-for="(item, index) in jobTodos" :key="index">
          <div class="job-name">{{ item.JobName }}</div>
          <div class="job-icon">
            <div class="icon icon-24 icon-relevant-circle-dash-v2"></div>
            <div class="icon icon-24 icon-no-date"></div>
          </div>
        </div>
      </div>
    </div>
    <div class="group-job">
      <div class="gr-header" style="background-color: rgb(33, 150, 243)">
        <div class="gr-hd-text">Đang thực hiện</div>
        <div class="gr-hd-count"><span>5</span></div>
      </div>
      <div class="gr-content">
        <div
          class="item-job"
          v-for="(item, index) in jobProcessings"
          :key="index"
        >
          <div class="job-name">{{ item.JobName }}</div>
          <div class="job-icon">
            <div class="icon icon-24 icon-relevant-circle-dash-v2"></div>
            <div class="icon icon-24 icon-no-date"></div>
          </div>
        </div>
      </div>
    </div>
    <div class="group-job">
      <div class="gr-header" style="background-color: rgb(76, 217, 100)">
        <div class="gr-hd-text">Đã hoàn thành</div>
        <div class="gr-hd-count"><span>5</span></div>
      </div>
      <div class="gr-content">
        <div
          class="item-job"
          v-for="(item, index) in jobCompletes"
          :key="index"
        >
          <div class="job-name">{{ item.JobName }}</div>
          <div class="job-icon">
            <div class="icon icon-24 icon-relevant-circle-dash-v2"></div>
            <div class="icon icon-24 icon-no-date"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "ProjectTable",
  components: {},
  emits: [],
  props: [],
  watch: {},
  mounted() {
    // Lấy danh sách dự án thep phòng ban
    this.getJobTodo(this.$route.params.id);
    this.getJobProcessing(this.$route.params.id);
    this.getJobComplete(this.$route.params.id);
  },
  created() {},
  methods: {
    getJobTodo(id) {
      this.axios
        .get(
          `http://localhost:56428/api/v2/Job/job-todo?id=${id}&dbDomain=${localStorage.getItem(
            "domain-db"
          )}`
        )
        .then((res) => {
          this.jobTodos = res.data;
        });
    },
    getJobProcessing(id) {
      this.axios
        .get(
          `http://localhost:56428/api/v2/Job/job-processing?id=${id}&dbDomain=${localStorage.getItem(
            "domain-db"
          )}`
        )
        .then((res) => {
          this.jobProcessings = res.data;
        });
    },
    getJobComplete(id) {
      this.axios
        .get(
          `http://localhost:56428/api/v2/Job/job-complete?id=${id}&dbDomain=${localStorage.getItem(
            "domain-db"
          )}`
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
    };
  },
};
</script>

<style scoped>
.job-name {
  font-size: 15px;
  color: rgba(0, 0, 0, 0.87);
  margin-bottom: 24px;
}
.job-icon {
  display: flex;
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
.icon-relevant-circle-dash-v2 {
  background-image: url(./../../assets/img/relevant-circle-dash-v2.svg);
  margin-right: 16px;
}
.icon-no-date {
  background-image: url(./../../assets/img/no-date.svg);
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
