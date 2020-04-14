https://www.youtube.com/watch?v=w8EKH_fjmXA&t=18s

applications:
* groff - to compile to needed format
* zathura, zathura-pdf-poppler (or a different pdf)

Usage:
1) compile the file (.mf extension) to pdf
> groff -ms filename.mf -T pdf > filename.pdf

2) Open with a pdf reader
> zathura filename.pdf

Merging PDF files
(required package: poppler-utils)
> $ pdfunite source1.pdf source2.pdf merged_output.pdf
