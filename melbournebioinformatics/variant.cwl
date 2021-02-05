class: Workflow
cwlVersion: v1.0
id: variant
label: variant
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reference
    type: File
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
      - .fai
    'sbg:x': -348.12060546875
    'sbg:y': -199
  - id: reads
    type: 'File[]'
    'sbg:x': -346.3894958496094
    'sbg:y': -7.5
outputs:
  - id: variants
    outputSource:
      - freebayes/variants
    type: File
    outputBinding:
      glob: variants.vcf
    'sbg:x': 138.5
    'sbg:y': -224
steps:
  - id: bwa_mem
    in:
      - id: reads
        source:
          - reads
      - id: reference
        source: reference
    out:
      - id: alignment
    run: ./bwa-mem.cwl
    'sbg:x': -232
    'sbg:y': -101
  - id: samtools_sort
    in:
      - id: alignment
        source: bwa_mem/alignment
    out:
      - id: sorted_alignment
    run: ./samtools-sort.cwl
    label: samtools-sort
    'sbg:x': -117
    'sbg:y': -4
  - id: freebayes
    in:
      - id: alignment
        source: samtools_sort/sorted_alignment
      - id: reference
        source: reference
    out:
      - id: variants
    run: ./freebayes.cwl
    label: freebayes
    'sbg:x': 23.5
    'sbg:y': -129
requirements: []
