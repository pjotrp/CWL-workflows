#!/usr/bin/env cwl-runner

class: CommandLineTool
id: trimmomatic-0.38
label: trimmomatic-0.38
cwlVersion: v1.0

$namespaces:
  edam: 'http://edamontology.org/'

hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/trimmomatic:0.38--1'

requirements:
  - class: InlineJavascriptRequirement

baseCommand: [ java, -jar ]

inputs:
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
  - id: trimFq1P
    type: File
    format: edam:format_1930
    outputBinding:
      glob: $(inputs.fq1.basename).trim.1P.fastq
  - id: trimFq1U
    type: File
    format: edam:format_1930
    outputBinding:
      glob: $(inputs.fq1.basename).trim.1U.fastq
  - id: trimFq2P
    type: File
    format: edam:format_1930
    outputBinding:
      glob: $(inputs.fq2.basename).trim.2P.fastq
  - id: trimFq2U
    type: File
    format: edam:format_1930
    outputBinding:
      glob: $(inputs.fq2.basename).trim.2U.fastq

arguments:
  - position: 1
    valueFrom: /gnu/store/j1ljhxzaxmcqy8v6d4v1y37p48c68f5q-profile/lib/share/jar/trimmomatic-0.38.jar
  - position: 2
    valueFrom: PE
  - position: 5
    valueFrom: $(inputs.fq1.basename).trim.1P.fastq
  - position: 6
    valueFrom: $(inputs.fq1.basename).trim.1U.fastq
  - position: 7
    valueFrom: $(inputs.fq2.basename).trim.2P.fastq
  - position: 8
    valueFrom: $(inputs.fq2.basename).trim.2U.fastq
  - position: 9
    valueFrom: 'ILLUMINACLIP:/gnu/store/j1ljhxzaxmcqy8v6d4v1y37p48c68f5q-profile/lib/share/jar/adapters/TruSeq2-PE.fa:2:40:15'
