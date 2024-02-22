#include <iostream>
#include <vector>
#include <chrono>
#include <cuda_runtime.h>

#include "test.h"

using namespace std;

__global__ void kernel(SOA<Interval> soa, int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i >= N) return;
    // set all the values
    // soa[i] = { sqrtf(i + 1), sqrtf(i + 2) };
    // set only the low value
    soa.low[i] = sqrtf(i + 1);
}

__global__ void show(SOA<Interval> soa, int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i >= N) return;
    // get all the values
    // auto val = Interval(soa[i]);
    // printf("low: %f, high: %f\n", val.low, val.high);
    // get only the low value
    printf("low: %f\n", soa.low[i]);
}

int main()
{
    constexpr int N = 1 << 20;
    constexpr int block_size = 256;

    SOA<Interval> soa(N);
    kernel<<<(N + block_size - 1) / block_size, block_size>>>(soa, N);
    cudaDeviceSynchronize();

    show<<<10, 1>>>(soa, N);
    cudaDeviceSynchronize();

    return 0;
}