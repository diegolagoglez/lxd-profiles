#!/bin/bash

if ! type lxc >/dev/null; then
	echo "ERROR: 'lxc' command not found." >&2
	exit 1
fi

echo "NOTICE: This script DOES NOT install any profile; it only generates commands to manually install them." >&2

for profile in $(find . -maxdepth 1 -name '*.yaml' -type f -printf '%f\n'); do
	profile_name=$(sed 's/\.yaml//g' <<< $profile)
	if ! lxc profile show "$profile_name" >/dev/null 2>&1; then
		echo "  lxc profile create $profile_name"
		echo "  lxc profile edit $profile_name < $profile"
	else
		echo "WARNING: Duplicated profile: $profile_name (it won't be installed)" >&2
	fi
done

