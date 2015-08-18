Malcolm Lidierth's [Project Waterloo File and Matrix Utilities](http://www.mathworks.com/matlabcentral/fileexchange/12250-project-waterloo-file-and-matrix-utilities)
(snapshot at commit [6cd02f](http://sourceforge.net/p/waterloo/beta/ci/6cd02fffef7ad5114284fd9b4d60d1e537be9af6/))

Utilities for partial input/output from MATLAB MAT-files, HDF5-files and custom binary files.

Appropriate use of the custom classes provided here can speed MATLAB code execution typically by 2- to 20-fold.

I/O is supported using 
[1] virtual memory mapping of files (recommended: Version 6 MAT, HDF5 and binary files). 
[2] low-level i/o using fread (Version 6 MAT- files /HDF5/binary). 
[3] via the matlab.io.MatFile class for Version 7.3 MAT-files with R2011b+.

The previous MAT-file utilities for writing Version 6 MAT-files are included in the library. 
Various functions for converting between file types are also included.

