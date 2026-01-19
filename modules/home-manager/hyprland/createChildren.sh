
parent=
parentId=

while  getopts "p:c:d:e:f:" opt; do
case ${opt} in
    p) parent=${OPTARG}
       parentId=$! ;;
    c) ${OPTARG} & ;;
    d) ${OPTARG} & ;;
    e) ${OPTARG} & ;;
    f) ${OPTARG} & ;;
    t) sleep ${OPTARG};;
esac
done

$parent

pkill -P $$
exit 1
