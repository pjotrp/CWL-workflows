#!/usr/bin/env cwl-runner

class: CommandLineTool
id: bwa-mem-PE-0.7.4--ha92aebf_0
label: bwa-mem-PE-0.7.4--ha92aebf_0
cwlVersion: v1.0

$namespaces:
  edam: 'http://edamontology.org/'

hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/bwa:0.7.4--ha92aebf_0'

requirements:
  - class: InlineJavascriptRequirement
  - class: ShellCommandRequirement

baseCommand: [ bwa, mem ]

inputs:
  - id: ref
    type: File
    inputBinding:
      position: 2
    doc: Fasta reference (e.g., hs37d5)
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
  - id: fq1
    type: File
    format: edam:format_1930
    inputBinding:
      position: 3
    doc: FastQ file from next-generation sequencers
  - id: fq2
    type: File
    format: edam:format_1930
    inputBinding:
      position: 4
    doc: FastQ file from next-generation sequencers

outputs:
  - id: sam
    type: stdout
    format: edam:format_2573

stdout: output.sam

arguments:
  - position: 1
    prefix: -t
    valueFrom: "4"
