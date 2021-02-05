class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
  s: https://schema.org/
  edam: http://edamontology.org/
baseCommand:
  - bwa
  - mem
inputs:
  - id: reads
    type: 'File[]'
    format:
      - edam:format_1930 # FASTA
      - edam:format_1931 # FASTQ
    inputBinding:
      position: 1
  - id: reference
    type: File
    inputBinding:
      position: 0
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
outputs:
  - id: alignment
    type: File
    outputBinding:
      glob: output.bam
requirements:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/bwa:0.7.17--ha92aebf_3'
stdout: output.bam
