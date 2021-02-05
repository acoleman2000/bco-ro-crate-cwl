class: Workflow
cwlVersion: v1.0
id: hcv_variant
label: HCV_variant
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: InputFile
    type: File
    'sbg:x': -292
    'sbg:y': -109
outputs:
  - id: index
    outputSource:
      - bwa_index/index
    type: File
    'sbg:x': -47.33587646484375
    'sbg:y': -199.5
steps:
  - id: bwa_index
    in:
      - id: InputFile
        source: InputFile
    out:
      - id: index
    run: ./bwa-index.cwl
    'sbg:x': -162
    'sbg:y': -174
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
