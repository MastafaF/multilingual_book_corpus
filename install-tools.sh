# Maintainer Mastafa Foufa <mastafa.foufa@hotmail.com>
#
# Usage: ./install-tools.sh
#

set -e

lg=$1  # input language

# data path
MAIN_PATH=$PWD
TOOLS_PATH=$PWD/tools

# tools
MOSES_DIR=$TOOLS_PATH/mosesdecoder

# tools path
mkdir -p $TOOLS_PATH

#
# Download and install tools
#

cd $TOOLS_PATH

# Download Moses
if [ ! -d "$MOSES_DIR" ]; then
  echo "Cloning Moses from GitHub repository..."
  git clone https://github.com/moses-smt/mosesdecoder.git
fi


# # Chinese segmenter
# if ! ls $TOOLS_PATH/stanford-segmenter-* 1> /dev/null 2>&1; then
#   echo "Stanford segmenter not found at $TOOLS_PATH/stanford-segmenter-*"
#   echo "Please install Stanford segmenter in $TOOLS_PATH"
#   exit 1
# fi
#
# # Thai tokenizer
# if ! python -c 'import pkgutil; exit(not pkgutil.find_loader("pythainlp"))'; then
#   echo "pythainlp package not found in python"
#   echo "Please install pythainlp (pip install pythainlp)"
#   exit 1
# fi
#
