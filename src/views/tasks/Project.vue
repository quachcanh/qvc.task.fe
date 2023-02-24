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
          <div class="btn-name-department">
            <span class="btn-h-text" style="color: #000; font-size: 15px"
              >Cá nhân</span
            >
            <div class="btn-add-plus">
              <div class="icon-h-drop drop-black"></div>
            </div>
          </div>
          <SelectDepartment
            v-if="false"
            @onSelectData="onSelectDataDeprt"
          ></SelectDepartment>
          <div class="icon icon-24 icon-setting-deprt"></div>
          <div ref="tabtable" class="tab-item tab-active" style="margin-left: 24px" @click="toggleTab(0)">
            <div class="tab-item-text">Bảng</div>
          </div>
          <div ref="tablist" class="tab-item" style="margin-left: 24px" @click="toggleTab(1)">
            <div class="tab-item-text">Danh sách</div>
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
    <ProjectTable v-if="isShowTable"></ProjectTable>
    <ProjectList v-if="isShowList"></ProjectList>
  </div>
</template>
<script>
import SelectDepartment from "./../../components/popup/select-department.vue";
import ProjectTable from "./../../components/project/project-table.vue";
import ProjectList from "./../../components/project/project-list.vue";
export default {
  name: "ProjectTask",
  components: { SelectDepartment, ProjectTable, ProjectList },
  emits: [],
  props: [],
  watch: {},
  created() {},
  methods: {
    toggleTab(index){
      if(index==0){
        this.isShowTable = true;
        this.isShowList=false;
        this.$refs.tabtable.classList.add("tab-active");
        this.$refs.tablist.classList.remove("tab-active");
      }else{
        this.isShowTable = false;
        this.isShowList=true;
        this.$refs.tabtable.classList.remove("tab-active");
        this.$refs.tablist.classList.add("tab-active");
      }
    }
  },
  data() {
    return {
      isShowTable: true,
      isShowList: false
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
  margin-left: 12px;
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
