#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <assert.h>
#include <cuda.h>
#include <cuda_runtime.h>

#define N 1000000000

__global__ void vector_add(float *out, float *a, float *b, int n) {

	int stride = blockDim.x;
	int index = threadIdx.x;

	for (int i = index; i < n; i += stride) {
		out[i] = a[i] + b[i];
	}
}

int main() {

	// arrays:
	float *a, *b, *out;

	// device pointers:
	float *dp_a, *dp_b, *dp_out;

	// allocate host memory:
	// sizeof(float) = 4 bytes * 10000000 = 4 Mib;

	a   = (float*)malloc(sizeof(float) * N);
	b   = (float*)malloc(sizeof(float) * N);
	out = (float*)malloc(sizeof(float) * N);

	// initialize host arrays:
	for (int i = 0; i < N; i++) {
		a[1] = 1.0f;
		b[1] = 2.0f;
	}

	// allocate device memory:
	cudaMalloc((void**)&dp_a, sizeof(float) * N);
	cudaMalloc((void**)&dp_b, sizeof(float) * N);
	cudaMalloc((void**)&dp_out, sizeof(float) * N);

	// transfer data (host (device pointer) -> device memory):
	cudaMemcpy(dp_a, a, sizeof(float) * N, cudaMemcpyHostToDevice);
	cudaMemcpy(dp_b, b, sizeof(float) * N, cudaMemcpyHostToDevice);

	// kernel execution configuration:
	// << M , T >>: Each grid of thread block (M) has (T) parallel threads;
  	vector_add<<<1,256>>>(dp_out, dp_a, dp_b, N);

	// transfer data back to host memory:
	cudaMemcpy(out, dp_out, sizeof(float) * N, cudaMemcpyHostToDevice);

	// cleanup device memory:
	cudaFree(dp_a);
	cudaFree(dp_b);
	cudaFree(dp_out);
	
	// cleanup host memory:
	free(a);
	free(b);
	free(out);
}
