class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: freebayes
baseCommand:
  - freebayes
inputs:
  - id: alignment
    type: File
    inputBinding:
      position: 0
    secondaryFiles:
      - .bai  
  - id: reference
    type: File
    inputBinding:
      position: 0
      prefix: '--fasta-reference'
    secondaryFiles:
      - .fai
outputs:
  - id: variants
    type: stdout
label: freebayes
arguments:
  - position: 0
    prefix: ''
requirements:
  - class: DockerRequirement
    dockerPull: 'maxulysse/freebayes:2.0.0'
stdout: varients.vcf
