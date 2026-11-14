```
<div align="center">
# LearnOpenGL 学习笔记 · Learning Notes
**用 C++ 与现代 OpenGL（3.3 Core Profile）从零开始学习计算机图形学**
**Learning modern computer graphics from scratch, with C++ and OpenGL 3.3 (Core Profile)**

[![C++](https://img.shields.io/badge/C%2B%2B-17-00599C?logo=cplusplus&logoColor=white)](https://isocpp.org/)
[![OpenGL](https://img.shields.io/badge/OpenGL-3.3%20Core-5586A4?logo=opengl&logoColor=white)](https://www.opengl.org/)
[![GLFW](https://img.shields.io/badge/GLFW-3.3-6C8EBF)](https://www.glfw.org/)
[![CMake](https://img.shields.io/badge/CMake-3.10%2B-064F8C?logo=cmake&logoColor=white)](https://cmake.org/)
[![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?logo=windows11&logoColor=white)](https://learnopengl.com/)
[![License](https://img.shields.io/badge/License-MIT-F9C600)](#-许可证--license)

[简体中文](#-简体中文) · [English](#-english)
</div>

---

## 🇨🇳 简体中文

### 📖 关于本仓库
这是我跟随 [LearnOpenGL 中文教程](https://learnopengl-cn.github.io/) 学习现代 OpenGL 的完整记录。
每一课都是 `lessons/` 目录下一个独立的小工程：既能用命令行一键构建，也能直接在 Visual Studio 里按 F5 运行。

与大多数只放代码的练习仓库不同，这里**每节课都附有实现思路、踩坑记录和关键代码讲解**——
既是我自己的复习笔记，也希望给同样在学 OpenGL 的朋友一点参考。

### 📚 课程进度

| # | 课程 | 核心内容 | 状态 |
|:--:|------|----------|:----:|
| 01 | [你好，窗口](lessons/01_hello_window/) | GLFW 窗口创建、GLAD 初始化、渲染循环、回调机制 | ✅ 已完成 |
| 02 | [你好，三角形](lessons/02_hello_triangle/) | 着色器编写/编译/链接、VAO · VBO · EBO、`glDrawElements` 索引绘制 | ✅ 已完成 |
| 03 | 着色器进阶 | Uniform 传值、更多顶点属性、着色器类封装 | 🔜 计划中 |
| 04 | 纹理 | 纹理加载与贴图、纹理单元、混合模式 | 🔜 计划中 |
| 05 | 变换 | GLM 矩阵、位移/旋转/缩放 | 🔜 计划中 |
| 06 | 坐标系统 | 模型/观察/投影变换、深度测试 | 🔜 计划中 |

> 状态图例：✅ 已完成 · 🚧 进行中 · 🔜 计划中

<details>
<summary><b>01 · 你好，窗口 —— 笔记摘要</b></summary>

- GLFW 负责创建窗口和 OpenGL 上下文，GLAD 负责在运行时加载 OpenGL 函数指针——**GLAD 必须在所有 `gl*` 调用之前初始化成功**，失败要立即退出。
- 窗口尺寸改变不会自动更新视口，必须通过 `framebuffer_size_callback` 回调重新调用 `glViewport`。
- 渲染循环的标准节奏：处理输入 → 清屏 → 绘制 → 交换缓冲 → 轮询事件。

</details>

<details>
<summary><b>02 · 你好，三角形 —— 笔记摘要</b></summary>

- 渲染一个图形的最小闭环：**着色器编译 → 程序链接 → VAO 绑定顶点属性 → 绘制调用**。
- 用 EBO 索引绘制矩形：4 个顶点 + 6 个索引，两个三角形必须共享一条**对角线**（如 `{0,1,3, 1,2,3}`），否则会出现缺口。
- 最终效果：白色背景下绘制一枚橙色实心矩形，按 `ESC` 退出。

</details>

### 🎬 运行效果

| 01 · 你好，窗口 | 02 · 你好，三角形 |
|:---:|:---:|
| *待补充截图* | *待补充截图* |

### 🔨 构建与运行

**环境要求**

| 依赖 | 版本 | 备注 |
|------|------|------|
| Visual Studio 2022 | 17.x | 需安装「使用 C++ 的桌面开发」工作负载 |
| CMake | ≥ 3.10 | VS 自带，无需单独安装 |
| GLFW / GLAD | 3.3+ / 3.3 Core | 已包含在第三方依赖中 |

**方式一：Visual Studio（推荐日常学习）**
1. 用 VS 2022 打开仓库根目录（CMake 工程）或生成的解决方案；
2. 选择 `x64 Debug` 配置；
3. 选中某一课设为启动项，按 **F5** 编译运行。

**方式二：命令行（CMake）**
```bash
# 克隆本仓库
git clone [https://github.com/](https://github.com/)<你的用户名>/LearnOpenGL.git
cd LearnOpenGL

# 配置 + 构建全部课程
cmake -B build -S .
cmake --build build

# 运行某一课（以第 02 课为例）
./build/bin/Debug/02_hello_triangle.exe
```

**⌨️ 操作说明**：按 `ESC` 关闭窗口；拖拽调整窗口大小，视口会自适应。

### 📂 目录结构

```
LearnOpenGL/
├── lessons/                     # 每课一个独立子项目
│   ├── 01_hello_window/
│   │   ├── CMakeLists.txt
│   │   └── main.cpp
│   └── 02_hello_triangle/
│       ├── CMakeLists.txt
│       └── main.cpp
├── bin/                         # 编译输出（已加入 .gitignore）
├── screenshots/                 # 运行截图
├── CMakeLists.txt               # 根构建脚本
└── README.md
```

### 🧠 踩坑记录

初学时真实踩过的坑，记录在此避免重蹈覆辙：

1. **`glDrawElements` 第二个参数是「索引个数」，不是顶点数也不是三角形数**——写 `2` 导致画面空白/残缺，应该是 `6`。
2. **矩形必须沿对角线拆成两个三角形**。共享一条边（如 `{0,1,2, 3,2,1}`）会让两个三角形区域重叠，矩形顶角出现 V 形缺口。
3. **颜色分量范围是 `[0.0, 1.0]`**。片段着色器里把 alpha 写成 `10.0` 虽不会报错，但语义错误，规范应为 `1.0`。
4. **GLAD 初始化失败必须立即退出**，否则后续所有 `gl*` 调用都是未定义行为。
5. **着色器链接也要检查状态**：`glGetProgramiv(program, GL_LINK_STATUS, ...)`，编译成功不代表链接成功。
6. **着色器对象链接进 program 后即可删除**（`glDeleteShader`），不删只是资源泄漏，不影响运行结果。

### 🗺️ 路线图

- 第一课：创建窗口与渲染循环
- 第二课：着色器与索引绘制
- 第三课：Uniform 与着色器类封装
- 第四课：纹理贴图
- 第五~六课：变换与坐标系统
- 光照入门（颜色基础 → 材质 → 冯氏光照）

### 🙏 致谢

- [LearnOpenGL](https://learnopengl.com/)（[中文版](https://learnopengl-cn.github.io/)）—— Joey de Vries 写的极优秀的 OpenGL 教程，本仓库所有练习基于它
- [GLFW](https://www.glfw.org/) —— 轻量跨平台的窗口与输入库
- [GLAD](https://glad.dav1d.de/) —— OpenGL 函数加载器生成服务

---

## 🇬🇧 English

### 📖 About

This repository is a complete record of my journey learning modern OpenGL with the
[LearnOpenGL tutorial](https://learnopengl.com/). Every lesson is a small, self-contained
CMake project under `lessons/` — buildable from the command line in one shot, or runnable
directly in Visual Studio with a single F5.

Unlike most exercise repos that ship code only, each lesson here comes with
**implementation notes, pitfalls I actually hit, and key code walkthroughs** —
serving both as my own review notes and, hopefully, as a useful reference for
anyone else learning OpenGL.

### 📚 Progress

| # | Lesson | Key Topics | Status |
| --- | --- | --- | --- |
| 01 | [Hello Window](lessons/01_hello_window/) | GLFW window creation, GLAD initialization, render loop, callbacks | ✅ Done |
| 02 | [Hello Triangle](lessons/02_hello_triangle/) | Shader authoring/compilation/linking, VAO · VBO · EBO, indexed drawing with `glDrawElements` | ✅ Done |
| 03 | Shaders In Depth | Uniforms, more vertex attributes, shader class | 🔜 Planned |
| 04 | Textures | Loading, mapping, texture units, blending | 🔜 Planned |
| 05 | Transformations | GLM matrices, translate / rotate / scale | 🔜 Planned |
| 06 | Coordinate Systems | Model / view / projection, depth testing | 🔜 Planned |

> 
> Legend: ✅ Done · 🚧 In Progress · 🔜 Planned

01 · Hello Window — notes

- GLFW creates the window and OpenGL context; GLAD loads the function pointers at runtime. **GLAD must be initialized successfully before any `gl*` call** — otherwise exit immediately.
- Resizing the window does not update the viewport by itself; `framebuffer_size_callback` must re-issue `glViewport`.
- The canonical render loop rhythm: input → clear → draw → swap buffers → poll events.

02 · Hello Triangle — notes

- The minimal loop to render anything: **compile shaders → link program → set up VAO/VBO/EBO → draw call**.
- Drawing a quad with an EBO takes 4 vertices + 6 indices; the two triangles must share a **diagonal** (e.g. `{0,1,3, 1,2,3}`), otherwise you get a gap.
- Result: a solid orange quad on a white background; press `ESC` to exit.

### 🎬 Screenshots

| 01 · Hello Window | 02 · Hello Triangle |
| --- | --- |
| *screenshot to be added* | *screenshot to be added* |

### 🔨 Build & Run

**Requirements**

| Dependency | Version | Notes |
| --- | --- | --- |
| Visual Studio 2022 | 17.x | "Desktop development with C++" workload |
| CMake | ≥ 3.10 | Bundled with VS |
| GLFW / GLAD | 3.3+ / 3.3 Core | Included as third-party deps |

**Option 1 — Visual Studio (recommended for daily study)**

1. Open the repository root (CMake project or generated solution) in VS 2022;
2. Pick the `x64 Debug` configuration;
3. Set a lesson as the startup project and press **F5**.

**Option 2 — Command line (CMake)**

```
# Clone the repository
git clone [https://github.com/<your-username>/LearnOpenGL.git](https://github.com/<your-username>/LearnOpenGL.git)
cd LearnOpenGL

# Configure and build all lessons
cmake -B build -S .
cmake --build build

# Run one lesson (e.g. lesson 02)
./build/bin/Debug/02_hello_triangle.exe
```

**⌨️ Controls**: press `ESC` to close the window; resizing is handled by the framebuffer callback.

### 📂 Project Layout

```
LearnOpenGL/
├── lessons/                     # one self-contained project per lesson
│   ├── 01_hello_window/
│   │   ├── CMakeLists.txt
│   │   └── main.cpp
│   └── 02_hello_triangle/
│       ├── CMakeLists.txt
│       └── main.cpp
├── bin/                         # build output (gitignored)
├── screenshots/                 # screenshots
├── CMakeLists.txt               # root build script
└── README.md
```

### 🧠 Pitfalls I Hit

Real mistakes from a beginner's perspective, written down so they never happen twice:

1. **The second argument of `glDrawElements` is the number of *indices*** — not vertices, not triangles. I passed `2` and got a blank screen; it should have been `6`.
2. **A quad must be split along a diagonal.** Two triangles sharing an edge (`{0,1,2, 3,2,1}`) overlap and leave a V-shaped notch at the top.
3. **Color components live in `[0.0, 1.0]`.** Writing `10.0` for alpha compiles fine but is semantically wrong — keep it `1.0`.
4. **If GLAD fails to load, exit immediately.** Every subsequent `gl*` call would otherwise be undefined behavior.
5. **Check the link status too**: `glGetProgramiv(program, GL_LINK_STATUS, ...)` — a successful compile does not guarantee a successful link.
6. **Shader objects can be deleted right after linking** (`glDeleteShader`); keeping them only leaks handles.

### 🗺️ Roadmap

- Lesson 01: window + render loop
- Lesson 02: shaders + indexed drawing
- Lesson 03: uniforms & a shader class
- Lesson 04: textures
- Lessons 05–06: transformations & coordinate systems
- Basic lighting (colors → materials → Phong)

### 🙏 Acknowledgements

- [LearnOpenGL](https://learnopengl.com/) — Joey de Vries' brilliant tutorial; every exercise here follows it
- [GLFW](https://www.glfw.org/) — lightweight, cross-platform windowing and input
- [GLAD](https://glad.dav1d.de/) — OpenGL loader generator

---

## 📄 许可证 · License

MIT — 见 LICENSE 文件 · See the LICENSE file for details.

如果这个仓库对你有帮助，欢迎点一个 Star ⭐
If this repository helps you, a star is much appreciated ⭐

```