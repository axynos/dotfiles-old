# Silver's Dotfiles
Dotfiles for the programs I use most frequently for development.




## How do I get these for myself?

Option 1:
Clone the repo and get the file you want manually.

```bash
git clone git@github.com:axynos/dotfiles.git ./dotfiles
```

Option 2:
If you want to download a specific file, you can use curl or wget.

```
curl  -O -J dot.axynos.ee/path-in-repo

wget dot.axynos.ee/path-in-repo
```

The code that rewrites the request is available in [dotfiles-rewrite](https://github.com/axynos/dotfiles-rewrite/blob/main/next.config.js)

In case you don't trust a random domain, you can also use the following curl and wget commands to achieve the same effect.

```
curl  -O -J https://raw.githubusercontent.com/axynos/dotfiles/main/path-in-repo

wget https://raw.githubusercontent.com/axynos/dotfiles/main//path-in-repo
```
