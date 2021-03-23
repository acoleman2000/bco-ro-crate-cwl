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
    'sbg:x': -560.740234375
    'sbg:y': -59.540924072265625
outputs:
  - id: variants
    outputSource:
      - freebayes/variants
    type: File
    outputBinding:
      glob: variants.vcf
    'sbg:x': 523.5899047851562
    'sbg:y': -127.99642944335938
steps:
  - id: freebayes
    in:
      - id: alignment
        source: samtools_index/output
      - id: reference
        source: reference
    out:
      - id: variants
    run: ./freebayes.cwl
    label: freebayes
    'sbg:x': 330.295654296875
    'sbg:y': -238.29495239257812
  - id: samtools_sort
    in: []
    out:
      - id: sorted_alignment
    run: ./samtools-sort.cwl
    label: samtools-sort
    'sbg:x': -153.8345184326172
    'sbg:y': 96.71886444091797
  - id: samtools_index
    in:
      - id: sorted_alignment
        source: samtools_sort/sorted_alignment
    out:
      - id: output
    run: ./samtools-index.cwl
    label: samtools-index
    'sbg:x': 116.04166412353516
    'sbg:y': -60.236106872558594
requirements: []
