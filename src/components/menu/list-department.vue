<template>
  <div class="s-l-item" @click="onClickDepartment(id)" :objid="id">
    <div class="s-l-i-left">
      <div ref="icon" class="l-i__icon icon-collapse" type="false"></div>
      <div class="l-i__content-list list-content">{{ name }}</div>
    </div>
    <div class="s-l-i-right">
      <div class="l-i__icon add-project" @click="onClickAdd"></div>
      <div class="l-i__icon view-project" @click="onClickView"></div>
    </div>
  </div>
  <div v-if="isShowProject">
    <div
      class="s-list-item__project"
      v-for="(item, index) in projects"
      :key="index"
      :objid="item.ProjectID"
    >
      <div class="s-l__p-icon">
        <div class="icon-project icon_my-job"></div>
      </div>
      <div class="s-l__p-text">
        <span class="list-content">{{ item.ProjectName }}</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ListDepartment",
  props: ["name", "id"],
  components: {},
  created() {},
  methods: {
    /**
     * Sự kiện click vào phòng ban để xem danh sách dự án
     * @param {*} id id của phòng ban
     */
    onClickDepartment(id) {
      var status = this.$refs.icon.getAttribute("type");
      if (status == "true") {
        //Đóng lại
        this.$refs.icon.setAttribute("type", "false");
        this.$refs.icon.classList.remove("icon-extend");
        this.$refs.icon.classList.add("icon-collapse");
        this.isShowProject = false;
      } else {
        // Mở ra
        this.$refs.icon.setAttribute("type", "true");
        this.$refs.icon.classList.remove("icon-collapse");
        this.$refs.icon.classList.add("icon-extend");
        // Gọi hàm lấy danh sách dự án theo phòng ban
        this.getProjectById(id);
        this.isShowProject = true;
      }
    },

    /**
     * Thực hiện lấy danh sách dự án theo phòng ban
     * @param {*} id id của phòng ban
     */
    getProjectById(id) {
      this.axios
        .get(
          `http://localhost:56428/api/v2/Project/project?id=${id}&domain=${localStorage.getItem(
            "domain-db"
          )}`
        )
        .then((res) => {
          if (res.data) {
            this.projects = res.data;
          }
        })
        .catch((res) => {
          console.log(res);
        });
    },
  },
  data() {
    return {
      /**Hiển thị list project */
      isShowProject: false,

      /**Danh sách dự án */
      projects: [],
    };
  },
};
</script>

<style scoped>
.s-l-item,
.s-list-item__project {
  user-select: none;
}
</style>
