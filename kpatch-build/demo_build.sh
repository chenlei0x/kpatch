GIT_PATH=/data/tkernel4
CACHEDIR="/data/hotpatch-result"
KERN_TAG=5.4.32-1-tlinux4_hotpatch_v6
KERN_DEBUGINFO_DEVEL_ROOT=/data/rpm-test
PATCH_LIST=/data/tkernel4/0001-xfs-hotpatch-test.patch

CACHEDIR=$CACHEDIR ./kpatch-build-tlinux -g  "$GIT_PATH" -t "$KERN_TAG"  \
	--skip-gcc-check --skip-cleanup --debuginfo-devel-root $KERN_DEBUGINFO_DEVEL_ROOT \
	 $PATCH_LIST

