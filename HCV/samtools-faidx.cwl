class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: samtools_faidx
baseCommand:
  - samtools
  - faidx
inputs:
  - id: reference
    type: File
    inputBinding:
      position: 0
outputs:
  - id: output
    type: File
    outputBinding:
      glob: $(inputs.reference.basename)
    secondaryFiles:
        - .fai
label: samtools_faidx.cwl
requirements:
  - class: DockerRequirement
    dockerPull: 'wgspipeline/samtools:v0.0.2'
  - class: InitialWorkDirRequirement
    listing:
      - entry: $(inputs.reference)
        writable: false
  - class: InlineJavascriptRequirement
