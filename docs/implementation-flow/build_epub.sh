# Convert into HTML
mk4ht htlatex index.tex "html,mathplayer,info"

## Note, for some reasons it's generated not all of the images that are mentioned in HTML-file

# Take all images
grep -o 'src="[^"]*"' index.html | cut -d'"' -f2 > image_paths.txt

# Drop 'img'-tag
sed -i "/<img /g" index.html

# Remove all missings
while IFS= read -r image_path; do
    if [[ -e "$image_path" ]]; then
        echo "Image exists: $image_path"
    else
        echo "Image missing: $image_path"
        sed -i "/src=\"$image_path\"[^>]*>/d" index.html
    fi
done < image_paths.txt

# Restore 'img'-tag
sed -i 's/src="/<img src="/g' index.html
sed -i 's/\_img="/><img src="/g' index.html

## Convert HTML to ePUB via `pandoc`
# pandoc --from=html index.html --to=epub3 -o index.epub
## ... or, by using calibre (better outcome)
ebook-convert index.html index.epub --language en --no-default-epub-cover
