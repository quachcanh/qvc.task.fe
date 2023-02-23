<template>
  <!-- The Modal -->
  <div class="modal">
    <!-- Modal Content -->
    <div class="modal-content">
      <span class="icon icon-24 close" @click="onClose"></span>
      <!-- Modal header -->
      <div class="title">Thêm phòng ban</div>
      <div class="form-body">
        <div class="from-item">
          <div class="item-content">
            Tên phòng ban <b class="requied">&#42;</b>
          </div>
          <input
            ref="namedeprt"
            placeholder="Nhập tên phòng ban..."
            class="input"
            type="text"
            v-model="this.department.DepartmentName"
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
  name: "DepartmentDetail",
  props: [],
  emits: ["onClose", "onCancel", "onConfirm"],
  components: {},
  created() {
    this.$nextTick(() => this.$refs.namedeprt.focus());
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
      this.$emit("onConfirm", this.department, this.employeeId);
    },
  },
  data() {
    return {
      /**Đối tượng thông tin phòng ban */
      department: {},

      /**Danh sách thành viên được chọn */
      employeeId: [],
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
</style>
