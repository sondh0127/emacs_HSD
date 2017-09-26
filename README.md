# new automatic install
## 1. run:
./setup_HSD
- type password for sudo

## 2. emacs activating
-open emacs then:
M-x irony-install-server

# manual instruction (just some hotkey)
- (not for default emacs user)
- Copy, paste, cut, undo redo, C-c, C-v, C-x, C-z, C-y
- sr-speed bar (side bar-tree - cột thư mục): f9 for toggle
- toggle comment: C-M-/ (can use for Multi-Line or Single_line)
- useful snippet: just google or youtube Yasnippet emacs manual (io, std, main, for, while, switch, once)
- multi file tabbar switching: left click ???
- expand-region: C-=
- searching(swipper/ivy/ counsel): C-s => type key => up down = > enter
- replace or something: (multiple-cursor): try this sh*t 
- //(replace cần gõ chuẩn từ chữ, gõ sai cái éo undo xóa được cái word vừa sửa đâu)
- (global-set-key (kbd "C-+") 'mc/edit-lines) // cái này vô dụng
- (global-set-key (kbd "C->")  'mc/mark-next-like-this) //next
- (global-set-key (kbd "C-<")  'mc/mark-previous-like-this) // previous
- (global-set-key (kbd "C-|")  'mc/mark-all-like-this) // all 
- (global-set-key (kbd "C-S-<down-mouse-1>")  'mc/add-cursor-on-click) // no comment
- có cái Smartparens nhiều hotkey lắm nhưng ko hữu dụng mấy(just for me)
...



# (old) emacs_HSD manual install
## download and install cMake
https://cmake.org/download/

extract and open cmake folder

./bootstrap

make

sudo make install
## config for irony/company - UBUNTU 
sudo apt-get install libclang-3.5-dev 

sudo apt-get install global
## emacs activating
M-x irony-install-server
