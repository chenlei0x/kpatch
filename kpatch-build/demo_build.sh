GIT_PATH=/data/hotpatch/tkernel4
CACHEDIR="/data/hotpatch-result"
KERN_TAG=5.4.32-1-tlinux4_hotpatch_v6
KERN_DEBUGINFO=/data/rpmbuild/RPMS/aarch64/kernel-debuginfo-5.4.32-1.tlinux4_hotpatch_v6.tl2.aarch64.rpm
YOUR_PATCH_LIST=/data/hotpatch/tkernel4/0001-xfs-hotpatch-test.patch

CACHEDIR=$CACHEDIR ./kpatch-build-tlinux -g  "$GIT_PATH" -t "$KERN_TAG"  \
	--skip-gcc-check --skip-cleanup --debuginfo $KERN_DEBUGINFO \
	 $YOUR_PATCH_LIST \

