class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: samtools_index
baseCommand:
  - index
inputs:
  - id: alignment
    type: File
    inputBinding:
      position: 0
    doc: Input bam file
outputs:
  - id: output
    doc: the index file
    type: File
    outputBinding:
      glob: $(inputs.alignment.basename)
    secondaryFiles:
      - .bai
label: samtools-index
requirements:
  - class: DockerRequirement
    dockerPull: 'stjudecloud/samtools:branch-validate-refactor-1.0.0'
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.alignment)
  - class: InlineJavascriptRequirement
