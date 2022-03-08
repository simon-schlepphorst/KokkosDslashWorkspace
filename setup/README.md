Setup
=====

Usefull for machines which allow only incoming connections.

`init.sh GIT_Remote SSH_Alias` will create bare repos including all submodules
in `~/git-repos/` on the remote machine. Provided a working `ssh` connection.

Now you can locally clone the repo with:
`git clone --recurse-submodules ~/git-repos/KokkosDslashWorkspace.git`
