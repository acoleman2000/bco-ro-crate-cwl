class: Workflow
cwlVersion: v1.0
id: index_mem
label: index-mem
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: InputFile
    type: File
    'sbg:x': -316.3905944824219
    'sbg:y': -148.5
  - id: reads
    type: 'File[]'
    'sbg:x': -217.3905792236328
    'sbg:y': -15.5
outputs:
  - id: alignment
    outputSource:
      - bwa_mem/alignment
    type: File
    'sbg:x': 5.609415054321289
    'sbg:y': -145.5
steps:
  - id: bwa_index
    in:
      - id: IndexName
        default: NC_004102.1
      - id: InputFile
        source: InputFile
    out:
      - id: index
    run: ./bwa-index.cwl
    'sbg:x': -180
    'sbg:y': -150
  - id: bwa_mem
    in:
      - id: reads
        source:
          - reads
      - id: reference
        source:
          - bwa_index/indexed_reference
          - bwa_index/index
    out:
      - id: alignment
    run: ./bwa-mem.cwl
    'sbg:x': -49
    'sbg:y': -37
requirements:
  - class: MultipleInputFeatureRequirement
