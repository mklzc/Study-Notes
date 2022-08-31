for ((i = 1; i <= 100; i++))
do
    ./makedata > data.in
    ./std < std.in > std.out
    ./my < my.in > my.out
    if diff -Bbqs std.out my.out;
    then :
    else exit 0;
    fi
done