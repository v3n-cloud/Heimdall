project(libpit LANGUAGES CXX)

add_library(pit STATIC
    source/libpit.cpp)

 target_compile_features(pit PUBLIC cxx_std_11)
target_include_directories(pit PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/source")
