tmpdir=`mktemp -d`

scriptdir=$(cd $(dirname $0); pwd -P)
sourcedir=$(cd $scriptdir/..; pwd -P)
. $scriptdir/shlibs/os.sh

# TODO: This should be OS specific
if [ ! -d /usr/local/include/mcl ]; then
(
    cd $tmpdir
    git clone https://github.com/alinush/mcl
    cd mcl/
    make
    sudo make install
)
fi

(
    cd $sourcedir/
    GOPATH=$sourcedir go get github.com/stretchr/testify/assert
    GOPATH=$sourcedir go get github.com/Sirupsen/logrus
    GOPATH=$sourcedir go get github.com/dustin/go-humanize
    GOPATH=$sourcedir go get github.com/consensys/gurvy
)