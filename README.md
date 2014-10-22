#padding

**padding** is a tiny node.js module for zero padding

- rename files with zero padding **automatically**
- **zero configuration**
- by zero padding, you get files whose name have **same length**
- you can use this as both **cli tool** and **in your code**
- dotfiles (like `.DS_Store`) are not supported currently


##Example

###files without any prefix

```bash
➜  example1 ✗ ls -1
1.jpg
10.jpg
101.jpg
2.jpg
209.jpg
77.jpg

➜  example1 ✗ padding
add padding

➜  example1 ✗ ls -1
001.jpg
002.jpg
010.jpg
077.jpg
101.jpg
209.jpg
```

- simple exmaple
- In this example, the longest file name is `101.jpg` or `209.jpg`.
- So **padding** changes all target files to have same length (**7characters**).


###files which have common prefix

```bash
➜  example2 ✗ ls -1
sample1.jpg
sample10.jpg
sample101.jpg
sample2.jpg
sample209.jpg
sample77.jpg
➜  example2 ✗ padding
add padding
➜  example2 ✗ ls -1
sample001.jpg
sample002.jpg
sample010.jpg
sample077.jpg
sample101.jpg
sample209.jpg
```

- `sample` is prefix in this example
- `padding` works well with prefix


##Installation

If you want to use command line tool, you should install globally.

```bash
npm install -g padding
```

Also you can use **padding** in your project.

```bash
npm install padding --save
```

##Public API



##License

MIT