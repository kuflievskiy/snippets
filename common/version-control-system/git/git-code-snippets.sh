``````````
http://stackoverflow.com/questions/5741407/how-to-undo-a-git-merge-with-conflicts
git merge --abort
``````````````
http://stackoverflow.com/questions/4785107/resolve-conflicts-using-remote-changes-when-pulling-from-git-remote
# fetch from the default remote, origin
git fetch
# reset your current branch (master) to origin's master
git reset --hard origin/master
``````````

# Tell Git not to track a file any more (remove from repo)
# but don't delete files locally
git rm -r --cached target sites/default/files


git commit --amend --author='Aleksey Kuflievskiy <kuflievskiy@gmail.com>' -m 'wp code style fixes'

git reset --hard <commit_before_merge>
git reset --hard origin/master

git reset --hard 9710d031930cef045e6a6c02d5a58715cb0f9bc7

# fetch file revision from any other branch
git show $REVISION:$FILENAME
git checkout $REVISION -- $FILENAME

git branch -D bugfix_branch_name
# remote_name = origin
git push remote_name --delete bugfix_branch_name issue_xxx

# Удалить все ветки, которых нет во внешнем репозитории можно командой
git remote prune origin


# view last commit
git log -1 --stat
git log --pretty=oneline --abbrev-commit --graph
# https://git-scm.com/docs/pretty-formats
git log -10 --pretty="| %Cred %h %Creset | %Creset %cr %Creset | %Cgreen %ce %Creset | %Cblue %s |"

<<<<<<< Updated upstream - то что пришло
======= - то что делал я

<<<<<<<
Changes made on the branch that is being merged into. In most cases,
this is the branch that I have currently checked out (i.e. HEAD).
|||||||
The common ancestor version.
=======
Changes made on the branch that is being merged in. This is often a
feature/topic branch.
>>>>>>>



(Code not in Conflict)
>>>>>>>>>>>
(first alternative for conflict starts here)
Multiple code lines here
===========
(second alternative for conflict starts here)
Multiple code lines here too
<<<<<<<<<<<
(Code not in conflict here)







http://stackoverflow.com/questions/10697463/resolve-git-merge-conflict-accepting-their-changes
Resolve git merge conflict accepting their changes

You can use the recursive theirs strategy:
git merge --strategy-option theirs
From the man: http://jk.gs/git-merge.html

ours
    This option forces conflicting hunks to be auto-resolved cleanly by
    favoring our version. Changes from the other tree that do not
    conflict with our side are reflected to the merge result.

    This should not be confused with the ours merge strategy, which does
    not even look at what the other tree contains at all. It discards
    everything the other tree did, declaring our history contains all that
    happened in it.

theirs
    This is opposite of ours.






git merge -X theirs issue_253


CODE SNIPPETS:

git clone git@github.com:user/repo.git
git clone ssh://git@github.com:user/repo.git
view graph https://github.com/git-kuf/%REPO_NAME%/network


BEFORE START:

git config --list
git remote set-url origin git@github.com:git-kuf/cms.git
git remote set-url origin git@github.com:git-kuf/wp-js-detect.git

//  git config --global user.email "you@example.com"
//  git config --global user.name "Your Name"


1.)
____________________________________________
1 - open an issue on github!
https://github.com/git-kuf/%REPOSITORY_NAME%/issues

2.)
git checkout master
git checkout -b feature_branch
.. работаем

git diff %FILENAME%

git checkout master
git merge feature_branch
git commit -a -m "Fixes #1 - Done! bla-bla-bla. Because I'm a Batman!"


git push
	or
git push origin master


// EXAMPLE no-ff merging!
 git push --tags --force origin token_integration

3)
*make commit from github
git pull

4).
	git branch bugfix
	git branch -D bugfix
	git push origin master :bugfix

	Удалить все ветки, которых нет во внешнем репозитории можно командой
	git remote prune origin


    Удалить удаленные ветки
    $ git push origin --delete issue_114 issue_118 issue_120 issue_121 issue_124 users

5)
	git log
	git reflog
	git lg1
	git lg2

	git hist // from .gitconfig
	git config --list

	git show %comit xxxx%

	git revert %comit xxxx%
6)
*make some changes....
git add -A
git commit -m 'very stupid local commit'

git reset --soft HEAD^
or
git reset --soft HEAD~1
git reset HEAD path/to/unwanted_file

git status


7)
git checkout -b new_branch
*make some changes....

git checkout master
git stash
git pull
git stash apply

git stash drop

8)
git checkout new_branch
*make 2 different commits

*show DETACHED HEAD

git log   - get commit hash
git checkout master

git cherry-pick xxxxx
git cherry-pick 7f545188^..a7785c10


git push -u origin new_branch

9)
 http://io.git-init.ru/git-trainer/
 https://github.com/gurugray/git-trainer

git branch -a
git checkout master
*make 1 commit

git checkout new_branch
git rebase master

git lg2
view graph https://github.com/git-kuf/%REPO_NAME%/network

# GIT TAGS
# To push a single tag:
git push origin <tag_name>
# push all tags (not recommended):
git push --tags

# Delete tag locally
git tag -d tag_0.0.1
# Delete tag remotely
git push --delete origin tag_0.0.1

# How do I clone into a non-empty directory?
git init
git remote add origin PATH/TO/REPO
git fetch
git checkout -t origin/master

# deploy project files to non-empty directory
git clone git@bitbucket.org:<username>/<project_name>.git ./<project_name>
cp -fR /home/dev/www/<sitename>/<project_name>/. /home/dev/www/<sitename>
rm -rf ./<project_name>

# Recomendations from bitbucket.org :
# `I have an existing project`
cd /path/to/my/repo
git remote add origin https://kuflievskiy@bitbucket.org/%user-name%/%repository-name%.git
git push -u origin --all # pushes up the repo and its refs for the first time
git push origin --tags # pushes up any tags



# https://git-scm.com/docs/git-checkout#git-checkout---patch
git checkout --patch origin/development_feature123 sites/all/modules/events

y - stage this hunk
n - do not stage this hunk
q - quit; do not stage this hunk nor any of the remaining ones
a - stage this hunk and all later hunks in the file
d - do not stage this hunk nor any of the later hunks in the file
g - select a hunk to go to
/ - search for a hunk matching the given regex
j - leave this hunk undecided, see next undecided hunk
J - leave this hunk undecided, see next hunk
k - leave this hunk undecided, see previous undecided hunk
K - leave this hunk undecided, see previous hunk
s - split the current hunk into smaller hunks
e - manually edit the current hunk
? - print help
