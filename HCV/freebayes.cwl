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
      position: 1
    secondaryFiles:
      - .bai
  - id: reference
    type: File
    inputBinding:
      position: 0
      prefix: '-f'
    # secondaryFiles:
    #   - .fai
outputs:
  - id: variants
    type: File
label: freebayes
requirements:
  - class: DockerRequirement
    dockerPull: 'ctomlins/freebayes_polish:latest'
stdout: varients.vcf
