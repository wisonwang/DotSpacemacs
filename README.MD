# 我的spacemacs配置 #


参考：
[zilongshangren的spacemacs配置](https://github.com/zilongshanren/spacemacs-private "子龙山人的spacemacs配置")

## 使用 ##

1. [安装spacemacs](https://github.com/syl20bnr/spacemacs "安装spacemacs")

2. 下载本项目，执行

```bash
ln -s /project/path/.spacemacs /user/home/path/.spacemacs
ln -s /project/path/private /user/home/path/.emacs.d/private

ln -s /project/path/.custom.el /user/home/path/.custom.el

emacs

```

.custom.el 包含和用户本地环境有关的配置所以要看情况添加修改

# 支持语言 #
## scala ##

[[https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Blang/scala][spacemacs安装scala环境]]
## golang ##

## python ##

### python 懒加载包不能补全问题（tensorflow.keras）

   jedi settings: auto import modules ， 可以直接修改jedi包中的settings.py 中的auto_import_modules属性
   https://github.com/davidhalter/jedi/issues/1391
   https://jedi.readthedocs.io/en/latest/docs/settings.html
