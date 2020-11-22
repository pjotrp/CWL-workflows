# CWL-workflows
Workflows written in common workflow language (CWL)

NOTE: this branch of the repository contains the workflow as described
in the reproducible
[WORKFLOW](https://gitlab.com/pjotrp/guix-notes/blob/master/WORKFLOW.org)
example (using GNU Guix, IPFS and CWL).

See https://view.commonwl.org/workflows/github.com/pjotrp/CWL-workflows/blob/guix-cwl/Workflows/test-workflow.cwl

(CWL Viewer https://view.commonwl.org)![test-workflow.cwl](./graph.png "test-workflow.cwl")

Quick instructions using GNU Guix:

```sh
guix pull
env GUIX_PACKAGE_PATH=.:~/iwrk/opensource/guix/guix-bioinformatics/ \
  ~/.config/guix/current/bin/guix environment -C guix --ad-hoc cwltool \
  trimmomatic-jar bwa fastqc go-ipfs 

cwltool --no-container Workflows/test-workflow.cwl Jobs/local-small.ERR034597.test-workflow.yml
  <lots of output>
  INFO Final process status is success
```


