# Random Matrix Generator

I'm using rand()¹ to create random matrices. 

The size of matrices is defined in the main function ([COLUMN][ROW]).

Also the subset of random numbers that will fill the matrix ([SUBSET]).

E.g.:

```c
const size_t SUBSET = 1000; 
const size_t COLUMN = 10; 
const size_t ROW = 10;
```

[10x10, random numbers between [0-1000]];

```shell
$ ./a.out
[233, 544, 119, 415, 328, 953, 451, 945, 428, 405, ]
[621, 166, 597, 265, 974, 121, 594, 959, 755, 21, ]
[587, 898, 540, 159, 105, 292, 844, 306, 312, 252, ]
[136, 898, 797, 607, 313, 125, 912, 116, 422, 340, ]
[873, 43, 858, 470, 660, 833, 591, 255, 792, 699, ]
[628, 731, 597, 520, 242, 54, 812, 86, 712, 476, ]
[339, 200, 374, 488, 159, 39, 965, 71, 155, 387, ]
[411, 381, 783, 622, 851, 443, 455, 443, 50, 599, ]
[494, 678, 682, 443, 198, 924, 850, 362, 362, 914, ]
[191, 53, 115, 917, 541, 274, 957, 858, 346, 464, ]
```

