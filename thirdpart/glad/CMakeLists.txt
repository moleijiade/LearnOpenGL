# glad —— OpenGL 函数加载器（项目内手写精简版 loader）
# 只编译一个 glad.c，并把头目录暴露给链接方
add_library(glad STATIC src/glad.c)
target_include_directories(glad PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
