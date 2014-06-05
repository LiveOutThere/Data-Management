Data-Management
===============
This repository is used to track Product Data Management`s seasonal data load scripts, as well as any useful SQL Tools we happen to write with regard to PO building and Data Load procedures.
-Tyler Gillson 2014-06-05

GIT PowerShell Commands

Notes:

The Data-Management repository only contains one working branch at all times. Therefore the complexity of it's GIT maintenance is rather simple. Whereas the LiveOutThere GIT repository typically has at least 5 working branches that all have to be merged, pruned, tracked, maintained etc.

All remote branches exist remotely, and can be cloned down to your local working environment at any time. The concept of a "working HEAD" simply indicates which local branch GIT is looking at.


git status -- tells you the status of your local working environment, relative to the remote origin

git pull [...] -- pulls down all of the files from the remote origin in their most up-to-date state. Cannot be performed if your local working environment has untracked changes

git add [-a|local-directory/<filename>|...] -- adds certain change(ed) file(s) to a commit

git commit [-f|-u|...] EXAMPLE: "git commit -u origin master", commits current commit to the origin master branch 

git checkout [<insert name of local branch>] EXAMPLE: "git checkout master" -- allows you to switch your working HEAD from local working branch to local working branch at will. This is useful if you want to commit certain changes in one branch or another... instead of committing everything in one place.

git push [...] -- pushes all of the change(es) that you have bundled into a "commit" up to the remote branch that you have told GIT to look at by "checking out" it's local equivalent.