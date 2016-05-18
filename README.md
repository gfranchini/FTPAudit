# FTP Directory Audit
This script will FTP into a host server and look into a specified directory and check the differences between the host directory and specified local directory (on your computer).  

The purpose of this is to be able to see the differences between directories with a large number of files. This script will create 3 files.

1.  host.txt - This file will contain a list of files contained on the host computer directory.
2.  local.txt - This file will contain a list of files contained on the local computer directory
3.  audit.txt - This file will contain the **differences** between host.txt and local.txt, showing the missing files on the local directory.  

** This script by default has the windows directory structure. Modify for linux based directory file structure. 
