cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  ccu002_01-covid19-infection-reference---primary:
    run: ccu002_01-covid19-infection-reference---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  ccu002_01-covid19-infection-severity---primary:
    run: ccu002_01-covid19-infection-severity---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: ccu002_01-covid19-infection-reference---primary/output
  ccu002_01-covid19-infection-serum---primary:
    run: ccu002_01-covid19-infection-serum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: ccu002_01-covid19-infection-severity---primary/output
  ccu002_01-covid19-infection-antigen---primary:
    run: ccu002_01-covid19-infection-antigen---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: ccu002_01-covid19-infection-serum---primary/output
  ccu002_01-covid19-infection-assay---primary:
    run: ccu002_01-covid19-infection-assay---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu002_01-covid19-infection-antigen---primary/output
  acute-ccu002_01-covid19-infection---primary:
    run: acute-ccu002_01-covid19-infection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: ccu002_01-covid19-infection-assay---primary/output
  ccu002_01-covid19-infection-coronavirus---primary:
    run: ccu002_01-covid19-infection-coronavirus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: acute-ccu002_01-covid19-infection---primary/output
  ccu002_01-covid19-infection-speciman---primary:
    run: ccu002_01-covid19-infection-speciman---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: ccu002_01-covid19-infection-coronavirus---primary/output
  ccu002_01-covid19-infection-confirmed---primary:
    run: ccu002_01-covid19-infection-confirmed---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: ccu002_01-covid19-infection-speciman---primary/output
  ccu002_01-covid19-infection-scale---primary:
    run: ccu002_01-covid19-infection-scale---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: ccu002_01-covid19-infection-confirmed---primary/output
  ccu002_01-covid19-infection-detection---primary:
    run: ccu002_01-covid19-infection-detection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: ccu002_01-covid19-infection-scale---primary/output
  ccu002_01-covid19-infection-detected---primary:
    run: ccu002_01-covid19-infection-detected---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: ccu002_01-covid19-infection-detection---primary/output
  ccu002_01-covid19-infection-result---primary:
    run: ccu002_01-covid19-infection-result---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: ccu002_01-covid19-infection-detected---primary/output
  ribonucleic-ccu002_01-covid19-infection---primary:
    run: ribonucleic-ccu002_01-covid19-infection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: ccu002_01-covid19-infection-result---primary/output
  ccu002_01-covid19-infection-antibody---primary:
    run: ccu002_01-covid19-infection-antibody---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: ribonucleic-ccu002_01-covid19-infection---primary/output
  ccu002---primary:
    run: ccu002---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: ccu002_01-covid19-infection-antibody---primary/output
  ccu002_01-covid19-infection---primary:
    run: ccu002_01-covid19-infection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: ccu002---primary/output
  positive-ccu002_01-covid19-infection---primary:
    run: positive-ccu002_01-covid19-infection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: ccu002_01-covid19-infection---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: positive-ccu002_01-covid19-infection---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
