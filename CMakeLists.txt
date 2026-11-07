cmake_minimum_required(VERSION 3.20 FATAL_ERROR)
project(LearnOpenGL VERSION 0.1.0 LANGUAGES C CXX)

# ============================================================================
# 学习项目：跟着 LearnOpenGL (https://learnopengl.com) 逐章练习
# 每一章一个 lessons/ 子目录，一个可执行目标，互不干扰。
# ============================================================================

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(MSVC)
    set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>DLL")
    add_compile_options(/utf-8 /W4)
endif()

# 统一输出：exe/dll 进 bin/<Config>，库进 lib/<Config>
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin/$<CONFIG>")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY  "${CMAKE_CURRENT_SOURCE_DIR}/lib/$<CONFIG>")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY  "${CMAKE_CURRENT_SOURCE_DIR}/lib/$<CONFIG>")

# ============================================================================
# 第三方依赖（只在这里接入，不修改 thirdpart/ 源码）
# ============================================================================
find_package(OpenGL REQUIRED)                     # 系统 OpenGL（target: OpenGL::GL）

set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS    OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_DOCS     OFF CACHE BOOL "" FORCE)
set(GLFW_INSTALL        OFF CACHE BOOL "" FORCE)
set(GLM_BUILD_LIBRARY   OFF CACHE BOOL "" FORCE)
set(GLM_BUILD_TESTS     OFF CACHE BOOL "" FORCE)
set(GLM_BUILD_INSTALL   OFF CACHE BOOL "" FORCE)

add_subdirectory(thirdpart/glfw)   # 窗口与输入   -> target: glfw
add_subdirectory(thirdpart/glm)    # 数学库(header-only) -> target: glm::glm
add_subdirectory(thirdpart/glad)   # OpenGL 加载器 -> target: glad

# ============================================================================
# 课程（每章一个子目录，在 lessons/CMakeLists.txt 里登记）
# ============================================================================
add_subdirectory(lessons)
