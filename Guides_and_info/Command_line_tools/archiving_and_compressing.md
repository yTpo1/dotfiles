An archive file is a collection of files and directories that are stored in one file. The archive file is not compressed — it uses the same amount of disk space as all the individual files and directories combined. A compressed file is a collection of files and directories that are stored in one file and stored in a way that uses less disk space than all the individual files and directories combined. If you do not have enough disk space on your computer, you can compress files that you do not use very often or files that you want to save but do not use anymore. You can even create an archive file and then compress it to save disk space. 

> No point in compressing most images, music, videos and PDF files, as they are already compressed


## Archiving and Compessing
tar
* -c : create new archive
* -x : extract files from an archive.
* -f : when used with the -c option, use the filename specified for the creation of the tar file. When used with the -x option, unarchive the specified file.
* -t : show the list of files in the tar file.
* -v : show the progress of the files being archived.
* -z — compress the tar file with gzip.
* -j — compress the tar file with bzip2. 

example: 

create a tar:
tar -cf filename.tar dir/file

create a compressed with gzip - tar:
tar -czf filename.tgz dir/file

unarchive and uncompress:
tar -xzf filename.tgz

---
tar -cf name.tar origin_dir/

gzip -9 name.tar


## Archiving
link - https://maker.pro/linux/projects/how-to-archive-files-and-directories-in-linux


## Compressing:
link - https://www-uxsup.csx.cam.ac.uk/pub/doc/redhat/redhat7.3/rhl-gsg-en-7.3/s1-managing-compressing-archiving.html
Compression tools: gzip, bzip2, or zip.
The bzip2 compression tool is recommended because it provides the most compression and is found on most UNIX-like operating systems. The gzip compression tool can also be found on most UNIX-like operating systems. If you need to transfer files between Linux and other operating system such as MS Windows, you should use zip because it is more commonly used on these other operating systems.

| Compression Tool | File extension | Uncompression Tool |
| --- | --- | --- |
| gzip | .gz | gunzip |
| bzip | .bz2 | bunzip2 |
| zip | .zip | unzip |

