


import Proving.USC.T18.Ch73.Reslice.Structure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Structure

open Proving.USC.Common


theorem coherent1512_intro {c : ComplaintText}
    (hOfficialProceeding :
      TermDefinitionSupplied DefinedTerm.officialProceeding edge_1512_incorporates_1515a c)
    (hPhysicalForce :
      TermDefinitionSupplied DefinedTerm.physicalForce edge_1512_incorporates_1515a c)
    (hMisleadingConduct :
      TermDefinitionSupplied DefinedTerm.misleadingConduct edge_1512_incorporates_1515a c)
    (hLawEnforcementOfficer :
      TermDefinitionSupplied DefinedTerm.lawEnforcementOfficer edge_1512_incorporates_1515a c)
    (hCorruptlyPersuades :
      TermDefinitionSupplied DefinedTerm.corruptlyPersuades edge_1512_incorporates_1515a c)
    (hHonored : IncorporationHonored edge_1512_incorporates_1515a c)
    (hScope :
      DefinitionScopeRespected DefinedTerm.corruptlyFor1505 edge_1512c_lexSpecialis_1515b c)
    (hPenalty : PenaltySourceResolves1512 c)
    (hDeeming : IncorporationHonored edge_1512_incorporates_1512f c)
    (hScienterCircumstance : IncorporationHonored edge_1512_incorporates_1512g c)
    (hDefense : ExceptionHonored edge_1512_exceptAsProvided_1512e c)
    (hBonaFide : ExceptionHonored edge_1512_exceptAsProvided_1515c c)
    (hB3 : ParallelClauseReadsConsistently edge_1512b3_incorporates_1512a2C c)
    (hD2 : ParallelClauseReadsConsistently edge_1512d2_incorporates_1512a2C c)
    : Coherent1512 c :=
  { officialProceedingDefined := hOfficialProceeding
    physicalForceDefined := hPhysicalForce
    misleadingConductDefined := hMisleadingConduct
    lawEnforcementOfficerDefined := hLawEnforcementOfficer
    corruptlyPersuadesDefined := hCorruptlyPersuades
    definitionsHonored := hHonored
    corruptlyScopeRespected := hScope
    penaltyResolves := hPenalty
    deemingRuleHonored := hDeeming
    scienterCircumstanceRuleHonored := hScienterCircumstance
    affirmativeDefenseHonored := hDefense
    bonaFideCarveHonored := hBonaFide
    defectiveListB3ReadsAsParallel := hB3
    defectiveListD2ReadsAsParallel := hD2 }


theorem section1515IncorporationsResolve_intro {c : ComplaintText}
    (h1512 : ReferencedSectionExists edge_1512_incorporates_1515a c)
    (h1513 : ReferencedSectionExists edge_1513_incorporates_1515a c)
    (hSelf : ReferencedSectionExists edge_1515_incorporates_1515a c)
    (h1505 : ReferencedSectionExists edge_1505_incorporates_1515b c)
    (hHonored : IncorporationHonored edge_1512_incorporates_1515a c)
    (hScope :
      DefinitionScopeRespected DefinedTerm.corruptlyFor1505 edge_1512c_lexSpecialis_1515b c)
    (hCarve : ExceptionHonored edge_ch73_exceptAsProvided_1515c c)
    : Section1515IncorporationsResolve c :=
  { s1512Addressee := h1512
    s1513Addressee := h1513
    selfAddressee := hSelf
    s1505Addressee := h1505
    definitionsHonoredIn1512 := hHonored
    corruptlyScopeConfined := hScope
    chapterCarveHonored := hCarve }




theorem penaltySourceResolves1512_killing_intro {c : ComplaintText}
    (h1111 : ReferencedSectionExists edge_1512a3A_incorporates_1111 c)
    (h1112 : ReferencedSectionExists edge_1512a3A_incorporates_1112 c)
    (hRoute : IncorporationHonored edge_1512a1_incorporates_1512a3 c)
    : PenaltySourceResolves1512 c :=
  .killing h1111 h1112 hRoute


theorem penaltySourceResolves1512_attemptOrForce_intro {c : ComplaintText}
    (hRoute : IncorporationHonored edge_1512a2_incorporates_1512a3 c)
    : PenaltySourceResolves1512 c :=
  .attemptOrForce hRoute


theorem penaltySourceResolves1512_threatOfForce_intro {c : ComplaintText}
    (hRoute : IncorporationHonored edge_1512a2_incorporates_1512a3 c)
    : PenaltySourceResolves1512 c :=
  .threatOfForce hRoute


theorem penaltySourceResolves1512_fineUnderThisTitle_intro {c : ComplaintText}
    (hTitle : ReferencedSectionExists edge_1512b_incorporates_title18Fine c)
    : PenaltySourceResolves1512 c :=
  .fineUnderThisTitle hTitle


theorem penaltySourceResolves1512_trialEnhancement_intro {c : ComplaintText}
    (hFired : OverrideTriggered edge_1512j_notwithstanding_1512 c)
    : PenaltySourceResolves1512 c :=
  .trialEnhancement hFired


theorem penaltySourceResolves1512_conspiracyMirror_intro {c : ComplaintText}
    (hMirror : IncorporationHonored edge_1512k_incorporates_1512 c)
    : PenaltySourceResolves1512 c :=
  .conspiracyMirror hMirror




theorem carveOutPathway1512_affirmativeDefense_intro {c : ComplaintText}
    (h : ExceptionApplies edge_1512_exceptAsProvided_1512e c)
    : CarveOutPathway1512 c :=
  .affirmativeDefense h


theorem carveOutPathway1512_bonaFideRepresentation_intro {c : ComplaintText}
    (h : ExceptionApplies edge_1512_exceptAsProvided_1515c c)
    : CarveOutPathway1512 c :=
  .bonaFideRepresentation h

end Proving.USC.T18.Ch73.Reslice.Structure
