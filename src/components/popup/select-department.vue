<template>
  <div class="popup-combobox cbb-other">
    <div class="arror arrow-top"></div>
    <div class="p-s-content">
      <div
        class="item-ccb"
        v-for="(item, index) in departments"
        :key="index"
        @click="onSelect(item)"
      >
        <span>{{ item.DepartmentName }}</span>
        <div class="icon icon-cbb"></div>
      </div>
    </div>
  </div>
</template>

<script>
import { RESAPI } from "@/res.js";
export default {
  name: "SelectDepartment",
  components: {},
  emits: ["onSelectData"],
  created() {
    this.getDepartment();
  },
  methods: {
    /**
     * Xử lý khi chọn phòng ban
     * @param {*} data dữ liệu phòng ban
     */
    onSelect(data) {
      this.$emit("onSelectData", data);
    },

    /**
     * Lấy danh sách phòng ban
     */
    getDepartment() {
      var domain = localStorage.getItem("domain-db");
      this.axios
        .get(RESAPI.GetDepartment(domain))
        .then((res) => {
          if (res) {
            this.departments = res.data;
          }
        })
        .catch((res) => {
          console.log(res);
        });
    },
  },
  data() {
    return {
      /**Dữ liệu phòng ban */
      departments: [],

      /**Dữ liệu Res */
      RESAPI,
    };
  },
};
</script>

<style scoped>
.cbb-other {
  top: calc(100% + 5px);
  right: 90px;
  width: 200px !important;
}
</style>
