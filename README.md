# copy_files
Copy files maintaining sub-directory structure

## Description
Copies file from one location to another while maintaining sub-directory structure. The root directory is taken to be the lowest level directory common to all files. The subdirectory structure below this level is copied. 
 - If any destination directories already exist they are created.
 - If any destination directories or files already exist they are ignored with a warning.
 - If any source files do not exist they are ignored with a warning.
Requires packages dplyr and tidyr (or tidyverse, covering both).

## Usage
copy_files(from, to)

## Arguments
from  a vector of character file names to copy, including full path 
to  a single character vector giving full path of the root directory into which to copy

## Example
    devtools::source_url("https://raw.githubusercontent.com/MarcusRowcliffe/copy_files/main/copy_files.R")
    from <- c("C:/Users/bloggs.j/data/dir1/file1.jpg",
          "C:/Users/bloggs.j/data/dir2/subdir1/file1.jpg",
          "C:/Users/bloggs.j/data/dir2/subdir2/file1.jpg")
    to <- "C:/Users/bloggs.j/data_copy"
    copy_files(from, to)


