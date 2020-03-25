"""
Maintainer: Mastafa Foufa <mastafa.foufa@hotmail.com>


Here you can add additional preprocessing which depends on the task needed.

We simply want to filter out lines that are shorter than an estimated length of 5 tokens.

"""
import argparse

parser = argparse.ArgumentParser(description='Tune level of preprocessing')

parser.add_argument('--min_length', type=int, default=5,
    help='Minimum length a sentence in the corpus should have ')

parser.add_argument('--filename_in', type=str, default=None,
    help='Name of input file to be preprocessed')

parser.add_argument('--filename_out', type=str, default=None,
    help='Name of output file after preprocessing')

args = parser.parse_args()
MIN_LENGTH = args.min_length
FILENAME_IN = args.filename_in
FILENAME_OUT = args.filename_out



def filter_short_sentences(filename_in, filename_out, length_min = 5):
    arr_lines_long = [] # all lines that are long enough to be considered and kept
    with open(filename_in, 'r') as f:
        for line in f:
            if len(line.rstrip("\n").split()) > length_min:
                arr_lines_long.append(line)

    with open(filename_out, 'w') as f:
        for line in arr_lines_long:
            f.write(line)
    return


filter_short_sentences(filename_in=FILENAME_IN, filename_out=FILENAME_OUT, length_min=MIN_LENGTH)