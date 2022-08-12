# SmartServiceCloud

### 前言

hello 这是我写的一个组件化架构，里面包含了主题化，react-navite组件等。我将讲解下我的构造思想，欢迎交流和点评。


### 效果图
<img src="/modularization.gif" width="375px" >

### 组件化构造

![modularization_flow_chart.jpg](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/7e5229e4eec7429a988f4418c62c0fae~tplv-k3u1fbpfcp-watermark.image?)

如图：我们的宿主App只和Main入口组件打交道，和中间件签订协议（其目的是帮助业务组件去执行任务，例如切换跟视图、推送业务等）。

```

 主题组件中写好了主题相关的方法颜色值等配置，和baseVC也放在主题里面，业务组件需要继承和使用主题组件开发。

 通用组件的定义是基础服务，里面包含了工具箱、户口本、本地化等一系列操作，供大家使用。

 中间件协调宿主和业务组件的任务，也协调业务组件之间的工作

 业务组件（主页组件、个人中心组件、人脸识别组件、购物车组件等等）

 第三方组件那个组件需要用就来拿（SDWebImage之类的）

 react navite组件，一些活动页，经常要改动的页面，适合用rn来写的，就用rn开发。

```


### 实现

使用pod本地库的方式来管理组件

![podfile.jpeg](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/79be8d85309e45218114461606735df8~tplv-k3u1fbpfcp-watermark.image?)

如图：主工程实际像是一个壳子，只负责运行，我们的本地组件都放到了Development Pods中，第三方组件和react navite组件则在Pods中。每一个组件安装依赖后都能可以单独运行编译，很大的方便了团队开发。

### 业务组件的实现规范
业务组件我比较习惯用MVVM的方式来实现，让VM管家去协调工作，VM拿到model，请求到数据后，将数据存起来。控制器注册管家的事件回调，来监听管家处理的任务执行情况，为此做出相应的处理。View和model都不会和控制器到交道，控制器只负责调用事件，处理事件。

示例：我的架构demo里面的home组件


![homevm.jpeg](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/4b37882513924066acd94e6df6425b48~tplv-k3u1fbpfcp-watermark.image?)


![homevc.jpeg](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/8cf1024c01c146299f4037e27c887ce5~tplv-k3u1fbpfcp-watermark.image?)
