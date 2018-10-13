
search_dir=$1


for entry in `ls -R $search_dir`; do
    echo $entry
done
