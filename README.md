# AOS to SOA

This project facilitates the transformation of Array-of-Structures (AOS) to Struct-of-Arrays (SOA). It is based on [pbrt-v4](https://github.com/mmp/pbrt-v4).

## Files

- `soac.cpp`: This file is compiled to create the soac executable that is used to construct Struct-of-Arrays (SOA).
- `test.h`: Contains the definition of the predefined struct.
- `test.soa`:  A counterpart to test.h, this file is transformed into the SOA format.
- `CMakeLists.txt`: Includes the build command to generate SOA files.
- `test.cu`: Demonstrates how to utilize the transformed data structure in a main function.
