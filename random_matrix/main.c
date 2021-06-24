#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int generateMatrix(const size_t COLUMN, const size_t ROW, const size_t SUBSET)
{

	int matrix[COLUMN][ROW];
	srand(time(NULL));

	for (int l = 0; l < (sizeof(matrix)/sizeof(matrix[0])); l++) {
 		for (int m = 0; m < (sizeof(matrix)/sizeof(matrix[0])); m++){ 
			matrix[l][m] = rand() % SUBSET;
		}
	}

	// Matrix Style
	
	for (int i = 0; i < (sizeof(matrix)/sizeof(matrix[0])); i++){
		printf("["); 
		for (int j = 0; j < (sizeof(matrix)/sizeof(matrix[0])); j++){
			printf("%d", matrix[i][j]);
			if (j < sizeof(matrix)) {
				printf(", ");
			}
		} printf("]");
		if (i == sizeof(matrix)) {
			printf("]");
		}
		if (i < sizeof(matrix)) {
			printf("\n");
		}
	} printf("\n");

}

int main() 
{
	const size_t SUBSET = 1000; // Generates a random number (0-SUBSET);
	const size_t COLUMN = 10; 
	const size_t ROW = 10;

	generateMatrix(COLUMN, ROW, SUBSET);
	return (0);

}

