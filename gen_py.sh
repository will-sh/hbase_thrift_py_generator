echo -e "# Generate thrift python binding libraries"
FILE=$(pwd)/Hbase.thrift
HBASETHRIFTDIR=$(pwd)/HbaseThrift
COMPILER_DIR=$(pwd)/thrift_compiler_installation
echo -e $FILE
if [ ! -f "$FILE" ];then
    echo -e "$FILE doesn't exist, please copy it from hbase host to here"
    exit 1
fi
if [ -d "$HBASETHRIFTDIR" ];then
    rm -rf $HBASETHRIFTDIR
else
    mkdir HbaseThrift
    cd HbaseThrift
    thrift -gen py ../Hbase.thrift
    mv gen-py/* .
    rm -rf gen-py/
    mkdir thrift
    cp -rp $COMPILER_DIR/thrift/lib/py/src/* ./thrift/
    echo -e "HBase thrift py bindings are available at $(pwd)/thrift"
fi
