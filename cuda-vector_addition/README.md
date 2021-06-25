# Cuda: Vector Addition

Ref: https://cuda-tutorial.readthedocs.io/en/latest/

Using Cuda and GPU parallelization for Vector Addition.

E.g.:

```c
vector_add<<Thread Block, Parallel Threads>>
```

[1] 1 thread block x 256 parallel threads:

```shell
==202299== NVPROF is profiling process 202299, command: ./vector_add
==202299== Profiling application: ./vector_add
==202299== Profiling result:
            Type  Time(%)      Time     Calls       Avg       Min       Max  Name
 GPU activities:   53.23%  1.68500s         1  1.68500s  1.68500s  1.68500s  vector_add(float*, float*, float*, int)
                   46.77%  1.48034s         2  740.17ms  739.29ms  741.05ms  [CUDA memcpy HtoD]
      API calls:   49.75%  1.69580s         3  565.27ms  3.4667ms  1.68880s  cudaFree
                   43.45%  1.48101s         3  493.67ms  19.128us  741.34ms  cudaMemcpy
                    6.68%  227.80ms         3  75.933ms  3.7808ms  220.07ms  cudaMalloc
                    0.08%  2.5723ms         4  643.07us  614.33us  654.37us  cuDeviceTotalMem
                    0.04%  1.3187ms       404  3.2640us     118ns  150.43us  cuDeviceGetAttribute
                    0.00%  135.48us         4  33.869us  29.867us  45.258us  cuDeviceGetName
                    0.00%  80.442us         1  80.442us  80.442us  80.442us  cudaLaunchKernel
                    0.00%  12.667us         4  3.1660us     863ns  6.0440us  cuDeviceGetPCIBusId
                    0.00%  3.1130us         8     389ns     117ns  2.1450us  cuDeviceGet
                    0.00%     793ns         4     198ns     153ns     249ns  cuDeviceGetUuid
                    0.00%     776ns         3     258ns     141ns     485ns  cuDeviceGetCount
```

[2] 128 Threads block x 256 parallel threads:

```shell
==203151== NVPROF is profiling process 203151, command: ./vector_add
==203151== Profiling application: ./vector_add
==203151== Profiling result:
            Type  Time(%)      Time     Calls       Avg       Min       Max  Name
 GPU activities:   50.26%  1.47876s         2  739.38ms  738.89ms  739.87ms  [CUDA memcpy HtoD]
                   49.74%  1.46356s         1  1.46356s  1.46356s  1.46356s  vector_add(float*, float*, float*, int)
      API calls:   46.50%  1.47938s         3  493.13ms  19.001us  740.19ms  cudaMemcpy
                   46.34%  1.47444s         3  491.48ms  3.5561ms  1.46727s  cudaFree
                    7.03%  223.81ms         3  74.604ms  3.8435ms  215.94ms  cudaMalloc
                    0.08%  2.5057ms         4  626.44us  616.76us  647.65us  cuDeviceTotalMem
                    0.04%  1.3793ms       404  3.4140us     118ns  225.65us  cuDeviceGetAttribute
                    0.00%  118.37us         4  29.592us  27.589us  34.308us  cuDeviceGetName
                    0.00%  79.818us         1  79.818us  79.818us  79.818us  cudaLaunchKernel
                    0.00%  9.3350us         4  2.3330us     712ns  5.9890us  cuDeviceGetPCIBusId
                    0.00%  2.9270us         8     365ns     113ns  2.0370us  cuDeviceGet
                    0.00%  2.3990us         3     799ns     129ns  1.7380us  cuDeviceGetCount
                    0.00%     756ns         4     189ns     154ns     250ns  cuDeviceGetUuid

```

[3] 256 threads block x 256 parallel threads:

```shell
==203570== NVPROF is profiling process 203570, command: ./vector_add
==203570== Profiling application: ./vector_add
==203570== Profiling result:
            Type  Time(%)      Time     Calls       Avg       Min       Max  Name
 GPU activities:   52.02%  1.60524s         1  1.60524s  1.60524s  1.60524s  vector_add(float*, float*, float*, int)
                   47.98%  1.48069s         2  740.34ms  739.57ms  741.11ms  [CUDA memcpy HtoD]
      API calls:   48.59%  1.61610s         3  538.70ms  3.5394ms  1.60894s  cudaFree
                   44.54%  1.48129s         3  493.76ms  19.701us  741.43ms  cudaMemcpy
                    6.75%  224.58ms         3  74.859ms  3.8438ms  216.80ms  cudaMalloc
                    0.08%  2.5524ms         4  638.10us  622.90us  667.54us  cuDeviceTotalMem
                    0.04%  1.2747ms       404  3.1550us     118ns  148.83us  cuDeviceGetAttribute
                    0.00%  130.00us         4  32.499us  29.311us  40.362us  cuDeviceGetName
                    0.00%  87.056us         1  87.056us  87.056us  87.056us  cudaLaunchKernel
                    0.00%  12.258us         4  3.0640us     823ns  6.1700us  cuDeviceGetPCIBusId
                    0.00%  3.0520us         8     381ns     108ns  2.1640us  cuDeviceGet
                    0.00%     877ns         4     219ns     160ns     362ns  cuDeviceGetUuid
                    0.00%     732ns         3     244ns     127ns     448ns  cuDeviceGetCount
```
