class: Workflow
cwlVersion: v1.0
id: hcv_variant
label: HCV_variant
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reads
    type: 'File[]'
    'sbg:x': -1124.1566162109375
    'sbg:y': -125.52313232421875
  - id: reference
    type: File
    'sbg:x': -1025.7716064453125
    'sbg:y': -288.1734313964844
outputs:
  - id: variants
    outputSource:
      - freebayes/variants
    type: File
    'sbg:x': -99.35231018066406
    'sbg:y': -419.6639404296875
steps:
  - id: samtools_sort
    in:
      - id: alignment
        source: bwa_mem/alignment
    out:
      - id: sorted_alignment
    run: ./samtools-sort.cwl
    label: samtools-sort
    'sbg:x': -601.5089111328125
    'sbg:y': -100.70106506347656
  - id: bwa_index
    in:
      - id: reference
        source: reference
    out:
      - id: out
    run: ./bwa-index.cwl
    label: BWA-Index
    'sbg:x': -931.1031494140625
    'sbg:y': -215.6334686279297
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
    'sbg:x': -841.5729370117188
    'sbg:y': -94.29181671142578
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
    'sbg:x': -292.2562255859375
    'sbg:y': -329.5551452636719
  - id: samtools_index
    in:
      - id: alignment
        source: samtools_sort/sorted_alignment
    out:
      - id: output
    run: ./samtools-index.cwl
    label: samtools-index
    'sbg:x': -487.63262939453125
    'sbg:y': -105.64871215820312
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
