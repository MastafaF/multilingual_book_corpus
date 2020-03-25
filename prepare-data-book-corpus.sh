# Maintainer Mastafa Foufa <mastafa.foufa@hotmail.com>
#
# Usage: ./prepare-data-book-corpus.sh
#

set -e

# data paths
MAIN_PATH=$PWD
OUTPATH=$PWD/data/processed
DATA_PATH=$PWD/data

# tools paths
TOOLS_PATH=$PWD/tools
UTILS_PATH=$PWD/utils
#TOKENIZER=$TOOLS_PATH/tokenize.sh
LOWER_REMOVE_ACCENT=$TOOLS_PATH/lowercase_and_remove_accent.py
PREPROCESS_SENTENCE=$UTILS_PATH/preprocess-data.py

PROCESSED_PATH=$PWD/data/processed

# Parameters for utils/preprocess-data.py
MIN_LENGTH=$1


# install tools:
sh ./install-tools.sh

# create directories
mkdir -p $OUTPATH
mkdir -p $PROCESSED_PATH

# download data: in the future, we can add data on remote server


# Lower casing each line
echo "*** Preparing Corpus data ***"
for lg in en ; do
    awk -F '\n' '{ print $1}' $DATA_PATH/goblet_book.txt \
    | awk '{gsub(/\"/,"")};1' \
    | python $LOWER_REMOVE_ACCENT \
    > $PROCESSED_PATH/harry_potter.tok.$lg
done

for lg in en ; do
    awk -F '\n' '{ print $1}' $DATA_PATH/the_republic.txt \
    | awk '{gsub(/\"/,"")};1' \
    | python $LOWER_REMOVE_ACCENT \
    > $PROCESSED_PATH/the_republic.tok.$lg
done

for lg in ru ; do
    awk -F '\n' '{ print $1}' $DATA_PATH/harry_potter_ru.txt \
    | awk '{gsub(/\"/,"")};1' \
    | python $LOWER_REMOVE_ACCENT \
    > $PROCESSED_PATH/harry_potter.tok.$lg
done

if [ ${1} -gt 0 ] ; then
    printf "*** Sentences with a number of tokens inferior to %s are filtered out *** \n" "$1"
    python $PREPROCESS_SENTENCE --filename_in $PROCESSED_PATH/harry_potter.tok.en --filename_out $PROCESSED_PATH/harry_potter_proc.tok.en --min_length ${1}
    python $PREPROCESS_SENTENCE  --filename_in $PROCESSED_PATH/the_republic.tok.en --filename_out $PROCESSED_PATH/the_republic_proc.tok.en --min_length ${1}
    python $PREPROCESS_SENTENCE  --filename_in $PROCESSED_PATH/harry_potter.tok.ru --filename_out $PROCESSED_PATH/harry_potter_proc.tok.ru --min_length ${1}
fi

echo 'Finished preparing data.'