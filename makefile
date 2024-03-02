all:
	QUARTO_DENO_EXTRA_OPTIONS=--v8-flags=--max-old-space-size=8192 quarto render --to html
	cp -r _book docs/_book

