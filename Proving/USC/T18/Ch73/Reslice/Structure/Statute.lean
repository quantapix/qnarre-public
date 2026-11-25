









import Proving.USC.T18.Ch73.Reslice.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Structure

open Proving.USC.Common




inductive PenaltySourceResolves1512 (c : ComplaintText) : Prop where

  | killing
      (h1111 : ReferencedSectionExists edge_1512a3A_incorporates_1111 c)
      (h1112 : ReferencedSectionExists edge_1512a3A_incorporates_1112 c)
      (hRoute : IncorporationHonored edge_1512a1_incorporates_1512a3 c)

  | attemptOrForce
      (hRoute : IncorporationHonored edge_1512a2_incorporates_1512a3 c)

  | threatOfForce
      (hRoute : IncorporationHonored edge_1512a2_incorporates_1512a3 c)

  | fineUnderThisTitle
      (hTitle : ReferencedSectionExists edge_1512b_incorporates_title18Fine c)


  | trialEnhancement
      (hFired : OverrideTriggered edge_1512j_notwithstanding_1512 c)

  | conspiracyMirror
      (hMirror : IncorporationHonored edge_1512k_incorporates_1512 c)


inductive CarveOutPathway1512 (c : ComplaintText) : Prop where


  | affirmativeDefense
      (h : ExceptionApplies edge_1512_exceptAsProvided_1512e c)

  | bonaFideRepresentation
      (h : ExceptionApplies edge_1512_exceptAsProvided_1515c c)







structure Coherent1512 (c : ComplaintText) : Prop where

  officialProceedingDefined :
    TermDefinitionSupplied DefinedTerm.officialProceeding edge_1512_incorporates_1515a c

  physicalForceDefined :
    TermDefinitionSupplied DefinedTerm.physicalForce edge_1512_incorporates_1515a c

  misleadingConductDefined :
    TermDefinitionSupplied DefinedTerm.misleadingConduct edge_1512_incorporates_1515a c

  lawEnforcementOfficerDefined :
    TermDefinitionSupplied DefinedTerm.lawEnforcementOfficer edge_1512_incorporates_1515a c

  corruptlyPersuadesDefined :
    TermDefinitionSupplied DefinedTerm.corruptlyPersuades edge_1512_incorporates_1515a c

  definitionsHonored : IncorporationHonored edge_1512_incorporates_1515a c


  corruptlyScopeRespected :
    DefinitionScopeRespected DefinedTerm.corruptlyFor1505 edge_1512c_lexSpecialis_1515b c

  penaltyResolves : PenaltySourceResolves1512 c

  deemingRuleHonored : IncorporationHonored edge_1512_incorporates_1512f c


  scienterCircumstanceRuleHonored : IncorporationHonored edge_1512_incorporates_1512g c

  affirmativeDefenseHonored : ExceptionHonored edge_1512_exceptAsProvided_1512e c

  bonaFideCarveHonored : ExceptionHonored edge_1512_exceptAsProvided_1515c c

  defectiveListB3ReadsAsParallel :
    ParallelClauseReadsConsistently edge_1512b3_incorporates_1512a2C c

  defectiveListD2ReadsAsParallel :
    ParallelClauseReadsConsistently edge_1512d2_incorporates_1512a2C c




structure Section1515IncorporationsResolve (c : ComplaintText) : Prop where

  s1512Addressee : ReferencedSectionExists edge_1512_incorporates_1515a c


  s1513Addressee : ReferencedSectionExists edge_1513_incorporates_1515a c

  selfAddressee : ReferencedSectionExists edge_1515_incorporates_1515a c


  s1505Addressee : ReferencedSectionExists edge_1505_incorporates_1515b c

  definitionsHonoredIn1512 : IncorporationHonored edge_1512_incorporates_1515a c

  corruptlyScopeConfined :
    DefinitionScopeRespected DefinedTerm.corruptlyFor1505 edge_1512c_lexSpecialis_1515b c

  chapterCarveHonored : ExceptionHonored edge_ch73_exceptAsProvided_1515c c

end Proving.USC.T18.Ch73.Reslice.Structure
