class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: samtools_sort
baseCommand:
  - samtools
  - sort
inputs:
  - id: alignment
    type: File
    inputBinding:
      position: 0
outputs:
  sorted_alignment:
    type: stdout
label: samtools-sort
requirements:
  - class: DockerRequirement
    dockerPull: 'biocontainers/samtools:v1.9-4-deb_cv1'
stdout: sorted_alignment.bam
