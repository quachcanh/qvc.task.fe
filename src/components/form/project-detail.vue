<template>
  <!-- The Modal -->
  <div class="modal">
    <!-- Modal Content -->
    <div class="modal-content">
      <span class="icon icon-24 close" @click="onClose"></span>
      <!-- Modal header -->
      <div class="title">Thêm mới dự án</div>
      <div class="form-body">
        <div class="from-item">
          <div class="item-content">Tên dự án <b class="requied">&#42;</b></div>
          <input
            ref="nameproject"
            placeholder="Nhập tên dự án..."
            class="input"
            type="text"
            v-model="this.project.ProjectName"
          />
        </div>
        <div class="group-item">
          <div
            class="from-item-group"
            style="position: relative; margin-right: 12px"
          >
            <div class="item-content">Chọn phòng ban</div>
            <input
              placeholder="-- Chọn phòng ban --"
              class="input item-cbb"
              type="text"
              :objid="this.project.DepartmentID"
              v-model="this.project.DepartmentName"
            />
            <div class="container-cbb" @click="onShowDepartment">
              <div class="icon icon-16 cbb"></div>
            </div>
          </div>
          <div v-if="isShowDropDeprt" class="popup-combobox popup-deprt">
            <div class="p-s-content">
              <div
                class="item-ccb"
                v-for="(item, index) in departments"
                :key="index"
                :objid="item.DepartmentID"
                @click="onSelectDeprt(item)"
              >
                <span>{{ item.DepartmentName }}</span>
                <div class="icon icon-cbb"></div>
              </div>
            </div>
          </div>
          <div class="from-item-group" style="margin-right: 12px">
            <div class="item-content">Từ ngày</div>
            <input class="input" type="date" v-model="this.project.StartDay" />
          </div>
          <div class="from-item-group">
            <div class="item-content">Đến ngày</div>
            <input class="input" type="date" v-model="this.project.EndDay" />
          </div>
        </div>
        <div class="from-item">
          <div class="item-content">Mô tả</div>
          <textarea
            placeholder="Mô tả..."
            class="input"
            v-model="this.project.Description"
            type="text"
          />
        </div>
        <div class="from-item form-select">
          <div class="item-content">Thành viên (1)</div>
          <input
            placeholder="Tìm theo tên hoặc email để thêm nhanh"
            class="input"
            type="text"
          />
          <div class="item-select">
            <div class="icon icon-16 icon-userblue"></div>
            <div class="content-select">Chọn</div>
          </div>
        </div>
      </div>
      <div class="modal-foodter">
        <button class="btn btn-light" @click="onCancel">Huỷ bỏ</button>
        <button class="btn btn-success" @click="onConfirm">Lưu</button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "ProjectDetail",
  props: ["iddeprt", "namedeprt"],
  emits: ["onClose", "onCancel", "onConfirm"],
  components: {},
  created() {
    this.$nextTick(() => this.$refs.nameproject.focus());
    // Hiển thị thông tin phòng ban đang chọn
    if (this.namedeprt && this.iddeprt) {
      this.project.DepartmentName = this.namedeprt;
      this.project.DepartmentID = this.iddeprt;
    }
  },
  methods: {
    /**
     * Sự kiện ẩn popup
     */
    onClose() {
      this.$emit("onClose");
    },

    /**
     * Sự kiện ẩn popup
     */
    onCancel() {
      this.$emit("onCancel");
    },

    /**
     * Sự kiện ấn đồng ý
     */
    onConfirm() {
      this.$emit("onConfirm", this.project, this.employeeId);
    },

    /**
     * Hiển thị popup phòng ban
     */
    onShowDepartment() {
      if (this.isShowDropDeprt) {
        this.isShowDropDeprt = false;
      } else {
        // Hiển thị popup
        this.isShowDropDeprt = true;
        //Gọi API lấy danh sách phòng ban
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
      }
    },

    onSelectDeprt(item) {
      // Đóng popup
      this.isShowDropDeprt = false;

      // Gán dữ liệu
      this.project.DepartmentID = item.DepartmentID;
      this.project.DepartmentName = item.DepartmentName;
    },
  },
  data() {
    return {
      /**Đối tượng thông tin dự án */
      project: {},

      /**Danh sách thành viên được chọn */
      employeeId: [],

      /**Hiển thị drop phòng ban */
      isShowDropDeprt: false,

      /**Danh sách phòng ban */
      departments: [],
    };
  },
};
</script>

<style scoped>
/* The Modal (background) */
.modal {
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0, 0, 0); /* Fallback color */
  background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  position: absolute;
  left: 50%; /* Change from left: 0; */
  top: 50%; /* Change from top: 0; */
  transform: translate(
    -50%,
    -50%
  ); /* Center the popup vertically and horizontally */
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  min-width: 500px;
  width: auto;
  border-radius: 8px;
}

.title {
  font-size: 24px;
  font-weight: 600;
}

.form-body {
  padding-top: 20px;
  padding-bottom: 20px;
}

.modal-foodter {
  display: flex;
  justify-content: flex-end;
}

/* The Close Button */
.close {
  float: right;
  background-image: url(./../../assets/img/Close.svg);
}

.close:hover,
.close:focus {
  filter: invert(57%) sepia(50%) saturate(596%) hue-rotate(64deg)
    brightness(97%) contrast(91%);
  text-decoration: none;
  cursor: pointer;
}

.requied {
  color: red;
  font-size: 18px;
}

.item-content {
  font-size: 13.5px;
  font-weight: 600;
  color: #4e4e4e;
  margin-bottom: 8px;
}

.item-select {
  position: absolute;
  width: auto;
  height: 36px;
  bottom: 0px;
  right: 0px;
  display: flex;
  align-items: center;
  cursor: pointer;
}

.form-select {
  position: relative;
  user-select: none;
}

.icon-userblue {
  background-image: url(./../../assets/img/user-blue.svg);
  margin-right: 4px;
}

.content-select {
  color: #2196f3;
  font-size: 15px;
  padding-right: 8px;
}

textarea {
  height: 78px;
}

.group-item {
  display: flex;
  margin-top: 12px;
  margin-bottom: 12px;
}

.item-cbb {
  width: 255px;
  padding-right: 30px;
}

.container-cbb {
  width: 30px;
  height: 30px;
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
  bottom: 3px;
  right: 3px;
  cursor: pointer;
}

.cbb {
  background-image: url(./../../assets/img/cbb.svg);
}

.group-item {
  position: relative;
}

.popup-deprt {
  width: 278px;
  position: absolute;
  top: 60px;
}
</style>
