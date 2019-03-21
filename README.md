1. kpatch workdir: where kpatch tool chain lies, kpatch build dir: where kernel devel, debuginfo , kpatch temp files stored.
2. create kpatch build directory, e.g: mkdir /data/kpatch_root.
2. create cache, kernel dir, e.g: mkdir /data/kpatch_root/cache, mkdir /data/kpatch_root/kernel.
4. copy kernel debuginfo & devel package to /data/kpatch_root/kernel.
5. rpm2cpio xxx.rpm | cpio -div, to extract debuginfo & devel package.
6. copy kernel git repo to some location, e.g:  /data/projects/tkernel3-public
7. prepare your source code patch, el.g: 0001-fix-some-bug.patch
8. suppose the tag you want to patch is: 4.14.105-1-tlinux3-0002
9. cd to kpatch workdir/kpatch-build, run make command first if you have not did it.
10. ./kpatch-build -g /data/projects/tkernel3-public -t 4.14.105-1-tlinux3-0002 /data/projects/0001-fix-some-bug.patch
11. if kpatch report warnings about gcc version not match, make sure gcc's major version be the same as kernel. If only minor version is different, you may add --skip-gcc-check to ignore it.
12. when build succeed, the final ko will be in kpatch workdir/kpatch-build.
