class: CommandLineTool
cwlVersion: v1.2
label: BWA-Index
doc: |-
  bwa - Burrows-Wheeler Alignment Tool
  Index database sequences in the FASTA format.

  Warning: `-a bwtsw' does not work for short genomes, while `-a is' and
           `-a div' do not work not for long genomes.

requirements:
- class: ShellCommandRequirement
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(inputs.reference)
- class: DockerRequirement
  dockerPull: biocontainers/bwa:v0.7.15_cv3

inputs:
- id: reference
  label: reference
  type: File
  inputBinding:
    position: 1
- id: blockSize
  label: blockSize
  doc: block size for the bwtsw algorithm (effective with -a bwtsw) [10000000]
  type:
  - int
  - 'null'
  inputBinding:
    prefix: -b
- id: algorithm
  label: algorithm
  doc: |
    BWT construction algorithm: bwtsw, is or rb2 [auto]
        - is IS linear-time algorithm for constructing suffix array. It requires 5.37N memory where N is the size of the database. IS is moderately fast, but does not work with database larger than 2GB. IS is the default algorithm due to its simplicity. The current codes for IS algorithm are reimplemented by Yuta Mori.
        - bwtsw      Algorithm implemented in BWT-SW. This method works with the whole human genome.
  type:
  - string
  - 'null'
  inputBinding:
    prefix: -a

outputs:
- id: out
  label: out
  type: File
  secondaryFiles:
  - pattern: .amb
  - pattern: .ann
  - pattern: .bwt
  - pattern: .pac
  - pattern: .sa
  outputBinding:
    glob: $(inputs.reference.basename)
    loadContents: false

baseCommand:
- bwa
- index
arguments: []

hints:
- class: ToolTimeLimit
  timelimit: |-
    $([inputs.runtime_seconds, 86400].filter(function (inner) { return inner != null })[0])
id: bwaIndex