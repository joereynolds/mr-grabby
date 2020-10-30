# What is it?

Grabs only the content from a website and renders it to the terminal for you.

# Requirements

- curl
- [pup](https://github.com/ericchiang/pup)
- [pandoc](https://pandoc.org/)
- [glow](https://github.com/charmbracelet/glow)
- [GNU recutils](https://www.gnu.org/software/recutils/)

# How

There's a GNU recutils DB of all websites and the HTML selector of their main
content.

It `curl`s the website, uses `pup` to get the correct content, `pandoc` to convert
it to markdown and `glow` to render it out nicely.

# Why?

Because I don't like bloated websites :(

## Why not an RSS feed?

Sometimes I just want to read one article from a random website and this is
quicker than downloading an RSS client, configuring it and then reading the
article.

# Usage

Once the file is in your PATH (for me I place it in `/usr/local/bin`), you can
do `grab url`.

e.g.

```
grab https://joereynoldsaudio.com/2020/03/17/ctags-lsp.html
```

It will display only the main content and not the rest of the site.
Handy for reading!

# Troubleshooting

## I've grabbed a URL and it's more than just the content

Add it to the DB, they get added to as they are encountered.
It's kind of like a spontaneous RSS feed.

## How do I query the sites.rec file?

You need recutils installed, it comes with `recsel` which allows you to execute
SQL-like queries on the file.

```
recsel -e 'Selector = "main"' sites.rec
```

# Known bugs

You can't specify a `main` selector in `sites.rec`. 
This is a [known issue](https://github.com/ericchiang/pup/issues/93) with pup
