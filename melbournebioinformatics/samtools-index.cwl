class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: samtools_index
baseCommand:
  - samtools
  - index
inputs:
  - id: sorted_alignment
    type: File
    inputBinding:
      position: 0
    doc: Input bam file
outputs:
  - id: output
    doc: the indexed file
    type: File
    outputBinding:
      glob: $(inputs.alignment.basename)
    secondaryFiles:
      - .bai
label: samtools-index
requirements:
  - class: DockerRequirement
    dockerPull: 'biocontainers/samtools:v1.9-4-deb_cv1'
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.alignment)
  - class: InlineJavascriptRequirement
