my_list=("$@")

# Loop through the array and print each item
for item in "${my_list[@]}"
do
    echo "creating feature $item"
    Y | mason make feature_brick --feature_name $item --state_management cubit
done

