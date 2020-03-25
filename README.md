# Introduction

This corpus is useful for testing multilingual architectures. One can use a zero-shot setting and test one's architecture on such corpus. 

Indeed, one can do the following: 
1. Train a model on English-only data using Harry Potter and The Republic books in English.
2. Test a model on non-English data using Harry Potter's book translated to Russian.

# Details on the corpus 

1. Harry Potter and the Goblet of Fire, J.K. Rowling - English version (full: 6,192 lines)
2. The Republic, Plato - English version (full: 19,846 lines)
3. Harry Potter and the Cursed Child, J.K. Rowling - Russian version  (sample of 435 lines)

# Preprocessing 

One can remove manually the first introduction lines from The Republic, Plato. 

We provide a bash file preprocessing data by lowercasing, removing accents and filtering short sentences.
One can additionally preprocess data according to their needs.

## Installing tools 

Install Moses tools for preprocessing. We only used lowercasing and remove accent in practice but one can
also tokenize with Moses tools using tokenize.sh in utils folder.

```bash
sh intall-tools.sh
```
## Adapt  preprocessing
We expect one parameter which is the minimum length MIN_LEGNTH.
All sentences with a shorter estimated number of tokens than MIN_LENGTH
are filtered out. By setting MIN_LENGTH to 0, one can keep the corpus without 
filtering short sentences. 

```bash
sh prepare-data-book-corpus.sh MIN_LENGTH

```
The above will preprocess the corpus by:
1. Lowercasing and removing accents and store that in data/processed e.g. harry-potter.tok.en 
2. Filtering out short sentences and store that in data/processed e.g. harry-potter_proc.tok.en 

One can add additional steps as desired by modifying prepare-data-book-corpus.sh. 