1) Create an issue on bitbucket or github. 

2) Check if there are no changes in git index.
	# it means that if you have changed files and didn't commit those changes, 
	# you should revert the changes shomehow. For example, use `git checkout path/to/file/filename.php` command to get the file state from repository.

git status

3) Switch to the `development` branch
git checkout development

4) Update the current state for this branch from the remote repository.
git pull origin development

5) Create a new branch for your changes and switch to it.

# Of course you can use some name like `my-super-branch`, but it can cause a mess in branches in future.
# It's better to name the branches via some naming convension.
# I prefer to use this branch naming approach (123 is an issue ID in the examples below ): 

	For new feature : 
		feature/some-issue-name#123
		enhancement/some-issue-name#123
	For some fix : 
		fix/some-issue-name#123
	For some hotfix(asap issue) : 
		hotfix/some-issue-name#123
	
# We can create a branch and switch to it via these 2 commands below :
- git branch feature/some-issue-name#123
- git checkout feature/some-issue-name#123
# Or we could use `-b` parameter with `git checkout` command.
- git checkout -b feature/some-issue-name#123


# *Optional : If you would like to check the current branches list, you can use `git branch -a` command.

6) Apply changes in the code you want and commit them.

# It's possible to check the current changes

git status
git diff path/to/some/file.php

# Let's commit changes. There are several possible ways.

# If you would like to commit all changes you made, 
git add --all

# or add only several files : 
git add path/to/some/file.php
git add path/to/some/file2.php


git commit -m 'Issue #123, I have implemented super feature here'		# commit changes

7) Push chenges to the remote repository branch 
git push origin feature/some-issue-name#123

8) *Optional : Create pull request and wait for code review ( propose changes from `feature/some-issue-name#123` to the `development` branch, check the `diff` ). 
( It can be merged by reviewer person via pull-request merge button on bitbucket or manually from the command line )

9) "Merge changes"
# If you don't want to create pull-request and would like to merge changes into the development branch.


git status 								# check if index is clear, there are no changes in files.
git checkout development 						# switch to the `development` branch
git pull origin development 						# fetch and apply changes from the remote repository in case if someone pushed changes before you
git merge feature/some-issue-name#123 					# merge changes from the `feature/some-issue-name#123` branch into the `development` branch,
										# *Optional : on this step you can see the conflicts. 
										# In this case you should resolve them via text editor (vim,nano,text editor or IDE ) and commit fixes on `development` branch. ( git commit -am 'merge conflicts resolved' )
git push origin development						# push changes to the remote repository into the `development` branch


Note : If reviewer submitted pull request from the bitbucket, then your branch was merged into the `development` branch already and you don't need to execute commands from this step.

10) Demo										
# usually on this step we open the staging server and fetch changes on it in order to demonstrate.
# let's go to the project directory on the staging server

git status 						# check the branch and git index state, revert all changes if required, 
							# your active branch for this site should be `development`
git pull origin development 				# pull changes from the remote branch
							# check changes on the site

11 ) *Optional : Addiitional fixes
Iterate steps 5-10. 
* You don't need to create a new branch on the 5th step, just switch to it via 
	git checkout feature/some-issue-name#123

12) merge changes from the `development` into the `master` branch ( on your local dev site )

git chekout development 	# switch to the development` branch
git pull origin development	# pull changes from the remote branch, maybe someone pushed something

git checkout master		# switch to the `master` branch , master branch usually is used on a production
git pull origin master		# pull changes from the remote branch, maybe someone pushed something

git merge development		# fix conflicts on this step if required
git push origin master		# push changes ( move to the remote repository )


12) Deploy 
Simply login via SSH and pull the changes on the production.

git branch 			# check the current branch, prod should be se on `master` branch
git pull origin master 		# fetch and apply changes



FYI : We are currently use only 2 branches ( master and development ). 
But when we have more than 1-2 developmers on the project, it's better to create one more branch named `staging`. 
This is not actual for this project now, it can be useful for understanding the work with branches.
	- master (production branch)
	- staging (stable branch for the clien's review)
	- development ( 
		Person, who is on the dev-lead position in the team 
			- merges feaures from the `feature` branches, 
			- reviews pull-requests 
			- merges changes from the development to the staging 
			- deploy changes to the staging & production sites
			- etc  
		)
		- feature/some-issue-name#123  ( a lot of branches created from the `development` branch )
		- hotfix/some-issue-name#123
