class: Workflow
cwlVersion: v1.0
id: hcv_variant
label: HCV_variant
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reference
    type: File
    'sbg:x': -1207.160888671875
    'sbg:y': -466.4270324707031
  - id: reads
    type: 'File[]'
    'sbg:x': -1089.658203125
    'sbg:y': -156.1692657470703
outputs:
  - id: variants
    outputSource:
      - freebayes/variants
    type: File
    'sbg:x': -175.2062530517578
    'sbg:y': -377.2226257324219
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
    'sbg:x': -503.6619567871094
    'sbg:y': -373.05120849609375
  - id: samtools_index
    in:
      - id: alignment
        source: samtools_sort/sorted_alignment
    out:
      - id: output
    run: ./samtools-index.cwl
    label: samtools-index
    'sbg:x': -688.2169189453125
    'sbg:y': -264.6105041503906
  - id: samtools_sort
    in:
      - id: alignment
        source: bwa_mem/alignment
    out:
      - id: sorted_alignment
    run: ./samtools-sort.cwl
    label: samtools-sort
    'sbg:x': -798.1316528320312
    'sbg:y': -222.3167266845703
  - id: bwa_mem
    in:
      - id: reads
        source:
          - reads
      - id: reference
        source: bwa_index/out
    out:
      - id: alignment
    run: ./bwa-mem.cwl
    'sbg:x': -940.9181518554688
    'sbg:y': -202.87188720703125
  - id: bwa_index
    in:
      - id: reference
        source: reference
    out:
      - id: out
    run: ./bwa-index.cwl
    label: BWA-Index
    'sbg:x': -1110.5123291015625
    'sbg:y': -341.77069091796875
requirements: []
'sbg:categories':
  - Alignment
'sbg:license': 'https://creativecommons.org/licenses/by/4.0/'
'sbg:links':
  - id: 'https://www.ncbi.nlm.nih.gov/nuccore/NC_004102'
    label: HCV1a
'sbg:toolAuthor': Charles Hadley King
'sbg:wrapperAuthor': Charles hadley King
'sbg:wrapperLicense': 'https://creativecommons.org/licenses/by/4.0/'
