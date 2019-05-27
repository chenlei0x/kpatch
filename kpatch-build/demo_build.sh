GIT_PATH=/data/tkernel3-public-dev_tlinux3_longterm
OUTPUT="/tmp/"
KERN_TAG=4.14.105-19-0002_arm_support
YOUR_PATCH_LIST=/data/test-kpatch/rename-ext4.diff

./kpatch-build-tlinux -o "$OUTPUT" -g  "$GIT_PATH" -t "$KERN_TAG"  \
	$YOUR_PATCH_LIST \
	--skip-gcc-check --skip-cleanup
