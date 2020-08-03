#!/usr/bin/env bash


# Create a PATCH via SVN
svn diff filename.php > filename.diff
svn diff > big_patch.diff
patch -p0 < patch.diff

# Create a PATCH via GIT
git diff --no-prefix > ~/some-feature.diff
git config --global diff.noprefix true
patch -p0 < ~/some-feature.diff

# wp patches
https://make.wordpress.org/core/handbook/tutorials/working-with-patches/
https://make.wordpress.org/core/handbook/tutorials/trac/submitting-a-patch/
https://docs.google.com/document/d/16Hzc0_Z1c8VSMJplAk4dcBter3ntlfVeyyCO56VANA4/edit
"some-feature" should be replaced with the name you wish to give to the patch. You could give it the name of ticket you've been working on. For example;
git diff --no-prefix > ~/#20425_updated_docblocks.diff
