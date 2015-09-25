# pdfbooklet
A simple shell script to rearrange a PDF into booklet format.

Usage: `./pdfbooklet.sh input.pdf output.pdf`

## Example

A PDF with 10 pages:

    +-----+ +-----+     +-----+ +-----+
    |     | |     |     |     | |     |
    |  1  | |  2  | ... |  9  | |  10 |
    |     | |     |     |     | |     |
    +-----+ +-----+     +-----+ +-----+

Becomes a booklet with 10 pages that can be stapled and folded.  The input pages are rearranged, rotated and placed two per page.

    +-----+ +-----+     +-----+ +-----+
    |  10 | |  9  |     |  7  | |  6  |
    +-----+ +-----+ ... +-----+ +-----+
    |  1  | |  2  |     |  4  | |  5  |
    +-----+ +-----+     +-----+ +-----+

## Prerequisites

1. Input must have an even number of pages.
2. Requires [`cpdf`](http://community.coherentpdf.com/)
3. Requires `pdfinfo` (part of a standard Linux distro)
