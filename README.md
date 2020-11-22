# CWL-workflows
Workflows written in common workflow language (CWL)

NOTE: this branch of the repository contains the workflow as described
in the reproducible
[WORKFLOW](https://gitlab.com/pjotrp/guix-notes/blob/master/WORKFLOW.org)
example (using GNU Guix, IPFS and CWL).

See https://view.commonwl.org/workflows/github.com/pjotrp/CWL-workflows/blob/guix-cwl/Workflows/test-workflow.cwl

(CWL Viewer https://view.commonwl.org)![test-workflow.cwl](./graph.png "test-workflow.cwl")

## Quick instructions using GNU Guix:

First install GNU Guix and clone
http://git.genenetwork.org/guix-bioinformatics/guix-bioinformatics

Next

```sh
guix pull --commit=3d7917f04229fe533ee7dadfd64257b474dead86
env GUIX_PACKAGE_PATH=.:~/guix-bioinformatics \
  ~/.config/guix/current/bin/guix environment -C guix --ad-hoc cwltool \
  trimmomatic-jar bwa fastqc  

cwltool --no-container Workflows/test-workflow.cwl Jobs/local-small.ERR034597.test-workflow.yml
  <lots of output>
  INFO Final process status is success
```

Note that `guix pull' has an option --commit=COMMIT for fixating the
package tree.  That is makes this workflow truely reproducible. The
commit can be retrieved with

```sh
~/.config/guix/current/bin/guix describe
    Generation 7    Nov 20 2020 01:59:00    (current)
      repository URL: https://git.savannah.gnu.org/git/guix.git
      branch: master
      commit: 3d7917f04229fe533ee7dadfd64257b474dead86
```

For now the GUIX_PACKAGE_PATH is pointing guix-bioinformatics until
CWL goes into Guix trunk (coming soon!).
