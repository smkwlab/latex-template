#!/usr/bin/env perl

# LaTeX compilation settings for Japanese documents
# This file configures latexmk to use platex for Japanese LaTeX documents

$latex = 'platex %O -synctex=1 -interaction=nonstopmode -file-line-error %S';
$bibtex = 'pbibtex %O %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex %O -o %D %S';
$pdf_mode = 3; # use dvipdf

# Clean up auxiliary files
$clean_ext = 'synctex.gz';