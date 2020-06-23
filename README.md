## How to generate

1. prepare `tkernel4` project and determine the kernel tag against which your patch is applied.

2. prepare target kernel's corresponding **debuginfo** and **devel** rpms, and extract them to a particular directory

   ```shell
   cd /data
   mkdir kernel-debuginfo-devel-root
   cd kernel-debuginfo-devel-root
   rpm2cpio kernel-debuginfo-5.4.32-1.tlinux4.tl2.aarch64.rpm | cpio -idmv
   rpm2cpio kernel-devel-5.4.32-1.tlinux4.tl2.aarch64.rpm | cpio -idmv
   ```

3. prepare your patch

4. prepare gcc for arm64 version **8.3.1**

   ```shell
   # install gcc 8.3.1
   yum install tlinux-release-sclo
   # switch to gcc 8.3.1
   scl enable devtoolset-8 bash
   # confirm gcc version
   gcc -v
   ```

5. clone `kpatch-public` project

   ```shell
   cd kpatch-public
   git checkout -b tkernel4_arm origin/tkernel4_arm
   make
   ```

6. `cd kpatch-public/kpatch-build`

7. edit `demo_build.sh` as needed

   ```bash
   # your tkernel git dir
   GIT_PATH=/data/tkernel4
   
   # everything including log, extracted debuginfo rpm and
   # final patch.ko lies here
   CACHEDIR="/data/hotpatch-result"
   
   # your tkernel version against which your patch is applied.
   KERN_TAG=5.4.32-1-tlinux4_hotpatch_v6
   
   # where your kernel debuginfo and devel rpm are extracted, refer to step 2
   KERN_DEBUGINFO_DEVEL_ROOT=/data/kernel-debuginfo-devel-root
   
   # your patch file
   PATCH_LIST=/data/tkernel4/0001-xfs-hotpatch-test.patch
   
   CACHEDIR=$CACHEDIR ./kpatch-build-tlinux -g  "$GIT_PATH" -t "$KERN_TAG"  \
   	--skip-gcc-check --skip-cleanup --debuginfo-devel-root $KERN_DEBUGINFO_DEVEL_ROOT \
   	 $PATCH_LIST
   ```

8. run `demo_build.sh`

9. the output will show you the  path of the hot patch (as a kernel module) 

## How to use

If everything goes will, your hot patch kernel module now is available. 

### To enable  your hotpatch

```shell
# insert kpatch kernel module (run once)
modprobe kpatch
# insert your hotpatch
insmode your-patch.ko
```

There exists **sysfs** entries for your hotpatch. Such as:

```shell
/sys/kernel/kpatch/your-patch/
```

### To confirm hot patch status

```shell
cd /sys/kernel/kpatch/your-patch/
cat enabled
```

### To disable your hot patch

```shell
cd /sys/kernel/kpatch/your-patch/
echo 0 > enabled
```

### To remove your hot patch

```shell
# disable your hot patch before removing
rmmod your-patch
```



