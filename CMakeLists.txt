cmake_minimum_required(VERSION 3.10)

project(test LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CUDA_ARCHITECTURES 86)
set(CMAKE_BUILD_TYPE Debug)


add_executable(soac soac.cpp)
# target_compile_definitions(soac PRIVATE CPU_FORMAT)
set(SOA_OUTPUT_DIR ${CMAKE_BINARY_DIR})
add_custom_command(OUTPUT ${SOA_OUTPUT_DIR}/test_soa.h
    COMMAND soac ${CMAKE_SOURCE_DIR}/test.soa > ${SOA_OUTPUT_DIR}/test_soa.h
    DEPENDS soac ${CMAKE_SOURCE_DIR}/test.soa)
set(SOA_GENERATED ${SOA_OUTPUT_DIR}/test_soa.h)
add_custom_target(soa_generate DEPENDS ${SOA_GENERATED})


add_executable(test test.cu)
target_include_directories(test PRIVATE ${SOA_OUTPUT_DIR})
add_dependencies(test soa_generate)