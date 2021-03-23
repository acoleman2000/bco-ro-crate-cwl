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
outputs:
  - id: index
    outputSource:
      - bwa_index/index
    type: File
    'sbg:x': 4.499988555908203
    'sbg:y': -140.60470581054688
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
requirements: []
