# Book "Fingrom Help Manual: Financial Accounting Application"

[![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/) <a href="https://www.buymeacoffee.com/lyskouski"><img height="20" src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=lyskouski&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff" /></a>

## Availability


- **Amazon Books**:
  - Kindle eBook ___
  - Hardcover ___
- **Google Books**
  - __
- **Apple Books**
  - https://books.apple.com/us/book/id6824298183


## About

This book is diving deep into capabilities of [Fingrom](https://github.com/lyskouski/app-finance) application.

**NOTE:** To compile the project
1. Install [LaTeX](https://miktex.org/download)
2. Run command (from current directory):
  - PDF (MiKTeX): `pdflatex -halt-on-error -aux-directory=build -output-directory=build index.tex`
  - PDF (TeX Live): `mkdir -p build && pdflatex -halt-on-error -output-directory=build index.tex`
  - EPUB: `pandoc --from=latex index.tex --to=epub3 --mathml --lua-filter=_lib/epub.lua -M lang=en-US -o build/index.epub`
    - Validate before uploading to stores: `java -jar epubcheck.jar build/index.epub` ([EPUBCheck](https://github.com/w3c/epubcheck/releases))
    - https://gist.github.com/lyskouski/9cc9abbc2dbf1589af4f26133a517d4c
  - MOBI: `tex4ebook -f mobi -l -r 640 index.tex`
  - TXT: `pdftotext -enc ASCII7 -nopgbrk -layout index.pdf`
  - HTML: `mk4ht htlatex index.tex "html,mathplayer,info"`

## Contributions

Please feel free to contribute to the quality of this content by submitting PRs.

Any contributions you make to this effort **are of course greatly appreciated**.

However, if you choose to contribute content (not just typo corrections) to this repo, you agree that you're giving
me a non-exclusive license to use that content for the book, as I (and my possible publisher) deem appropriate.
You probably guessed that already, but I just wanted to be extra clear on that.

## Support (Sponsorship)

If you'd like to contribute financially towards the efforts, please consider these options:

* [Github Sponsorship](https://github.com/users/lyskouski/sponsorship)
* [Paypal](https://www.paypal.me/terCAD)
* [Patreon](https://www.patreon.com/terCAD)
* [Donorbox](https://donorbox.org/tercad)

Or, [buy a :coffee:](https://www.buymeacoffee.com/lyskouski).

## License & Copyright

The materials herein are all &copy; 2026 Viachaslau Lyskouski.

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivs 4.0 Unported License</a>.
