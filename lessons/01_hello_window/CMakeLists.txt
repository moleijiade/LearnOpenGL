# 第 01 章：Hello Window —— 创建 GLFW 窗口、初始化 GLAD、设置清屏色、ESC 退出
add_executable(lesson01_hello_window main.cpp)
target_link_libraries(lesson01_hello_window PRIVATE glfw glad glm::glm OpenGL::GL)
