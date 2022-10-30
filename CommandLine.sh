#!/bin/sh
posts_id=$(cat instagram_posts.csv| cut --fields=2,8 -s | grep -oE ‘^[[:digit:]]+[[:blank:]]+.{100,}$’ | head -10 | cut -f1)
while ifs= read -r id; do
    if ['$id'=-1]; then
        echo User was not found!
    else
        cat instagram_profiles.csv | cut -f 1,3 | grep -w '$id'| cat
    fi
done < '$posts_id'