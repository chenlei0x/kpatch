1. make sure the **t**kernel version against which your patch is applied.

2. install your kernel version's corresponding kernel-devel, debuginfo, and kernel-source rpms.

3. prepare your patch

4. cd `kpatch-public` project dir

5. cd kpatch-build

6. edit `demo_build.sh` as needed

   ```bash
   # your tkernel git dir
   GIT_PATH=/data/hotpatch/tkernel4
   
   # your temp dir, final patch.ko lies here
   CACHEDIR="/data/hotpatch-result"
   
   # your tkernel version against which your patch is applied.
   KERN_TAG=5.4.32-1-tlinux4_hotpatch_v6
   
   # your patch file
   YOUR_PATCH_LIST=/data/hotpatch/tkernel4/0001-xfs-hotpatch-test.patch
   
   CACHEDIR=$CACHEDIR ./kpatch-build-tlinux -g  "$GIT_PATH" -t "$KERN_TAG"  \
           $YOUR_PATCH_LIST \
           --skip-gcc-check --skip-cleanup
   ```

7. run demo_build.sh
8. demo_build.sh will tell you the  path of hotpatch (as a kernel module) 