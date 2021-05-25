# Hesychius For GoldenDict

## DESCRIPTION

The [Hesychius Lexicon](https://en.wikipedia.org/wiki/Hesychius_of_Alexandria) is a dictionary of Greek words
compiled by the grammarian Hesychius of Alexandria during the 5th century A.D. It contains more
than 51000 lemmas. The [printed dictionary](https://bmcr.brynmawr.edu/2018/2018.06.02) is rather expensive but the
text can be found in [pdf format](https://archive.org/details/hesychiialexand00schmgoog/page/n15/mode/2up)
and in the  [TLG CDROM](http://stephanus.tlg.uci.edu/tlgauthors/cd.authors.php) (Beta Code format).


**Hesychius For GoldenDict** is a utility to decode the text of Hesychius, taken from the TLG CDROM,
into utf-8 text, and then compile the data into a ABBYY Lingvo .dsl dictionary file that can be used with
the digital dictionary lookup program [GoldenDict]( http://goldendict.org/), so that the Hesychius lexicon can be searched like any other modern dictionary.

## DEPENDENCIES
The **Hesychius For GoldenDict** script is meant to be run within a Linux environment.
It requires the following:

* [tlg2u](https://github.com/proteusx/tlg2u), this is the beta-code to utf-8 text conversion
    utility.
* Bash
* Perl
* Patch
* Sed
* TLG CDROM. This is no longer sold but it can be found via bit torrents.


## USAGE

Clone the Github repository: `git clone https://github.com/proteusx/Hesychius-For-GoldenDict.git`

Edit the first line of the file `build-hesychius.sh`. The variable `TLG_CDROM` must
contain the path to the TLG CDROM files.

Run the script: `build-hesychius.sh`

If everything is in order the file **`dictionary/hesychius.dsl`** should be produced.  Point
GoldenDict to this folder and the Hesychius Lexicon is ready to search.  Alternatively you may
copy the folder **`dictionary`** to some other location.

There is also a release with `hesychius.dsl` compiled and ready to use.

## NOTES
Hesychius Lexicon as encoded in the TLG CDROM is sourced from this hard copy edition:
*Hesychii Alexandrini lexicon,  Latte, K. (Ed), Copenhagen: Munksgaard, 1953*.

The original proem of the lexicon (also taken from the TLG) is included in the dictionary annotations file
`dictionary/hesychius.ann`.  There, Hesychius gives an account of his sources and gives instructions for the use of the lexicon. It is very interesting reading and you can either read it with a text editor, or read
it after installation from the **Dictionary information** of GoldenDict.

The source text of the lexicon is an old 15th century manuscript which has a few defects. This means that there are some lemmata with missing headwords and other corruptions.  These are not of any use in a searchable digital dictionary and have been deleted.  The few deletions and amendments are shown in the file `h.patch`.

## SEE ALSO
Another Ancient Greek Dictionary:
<https://github.com/proteusx/Suda-For-GoldenDict>



<!-- vim: set tw=80 spell fo=tq: -->
