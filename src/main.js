import { createApp } from "vue";
import App from "./App.vue";
import axios from "axios";
import VueAxios from "vue-axios";

import HomeTask from "./views/Home.vue";
import LoginAccount from "./views/Login.vue";
import RegisterAccount from "./views/Register.vue";
import MyTask from "./views/tasks/MyTask.vue";
import { createRouter, createWebHistory } from "vue-router";

const routers = [
  {
    path: "/",
    name: "HomeTask",
    component: HomeTask,
  },
  {
    path: "/login",
    name: "LoginAccount",
    component: LoginAccount,
  },
  {
    path: "/register",
    name: "RegisterAccount",
    component: RegisterAccount,
  },
  {
    path: "/mytask",
    name: "MyTask",
    component: MyTask,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes: routers,
});
createApp(App).use(VueAxios, axios).use(router).mount("#app");
