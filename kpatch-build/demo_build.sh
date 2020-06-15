GIT_PATH=/data/hotpatch/tkernel4 # your tkernel git dir
CACHEDIR="/data/hotpatch-result" # your 
KERN_TAG=5.4.32-1-tlinux4_hotpatch_v6
YOUR_PATCH_LIST=/data/hotpatch/tkernel4/0001-xfs-hotpatch-test.patch

CACHEDIR=$CACHEDIR ./kpatch-build-tlinux -g  "$GIT_PATH" -t "$KERN_TAG"  \
		$YOUR_PATCH_LIST \
		--skip-gcc-check --skip-cleanup
