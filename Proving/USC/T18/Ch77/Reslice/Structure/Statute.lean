import Proving.USC.T18.Ch77.Reslice.Structure.Types
import Proving.USC.T18.Ch77.Reslice.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false














namespace Proving.USC.T18.Ch77.Reslice.Structure

open Proving.USC.Common








structure Coherent1590 (c : ComplaintText) : Prop where

  chapterPredicate   : ChapterWideIncorporationHonored edge_1590a_incorporates_ch77 c

  chapterExists      : ReferencedSectionExists edge_1590a_incorporates_ch77 c

  fineRegime         : IncorporationHonored edge_1590a_incorporates_3571 c

  kidnapAggravator   : IncorporationHonored edge_1590a_incorporates_1201 c

  sexAbuseAggravator : IncorporationHonored edge_1590a_incorporates_2241 c

  obstructionPenalty : PenaltyIncorporationHonored edge_1590b_incorporates_1590a c










structure Coherent1591 (c : ComplaintText) : Prop where

  smtjResolves          : ReferencedSectionExists edge_1591a1_incorporates_t18s7 c

  coercionDefined       : DefinitionalTermResolves edge_1591a_incorporates_1591e2 c

  coercionDefinedGraded : DefinitionalTermResolves edge_1591b1_incorporates_1591e2 c

  abuseOfProcessDefined : DefinitionalTermResolves edge_1591e2C_incorporates_1591e1 c

  ventureDefined        : DefinitionalTermResolves edge_1591e4_incorporates_1591a1 c

  beneficiaryChain      : IncorporationHonored edge_1591a2_incorporates_1591a1 c

  punishmentChain       : IncorporationHonored edge_1591a_incorporates_1591b c

  fineRegime            : IncorporationHonored edge_1591b_incorporates_3571 c

  advertisingCarve      : QualifyingProvisionHonored edge_1591a_exceptAsProvided_1591a1 c

  observationQualifier  : QualifyingProvisionHonored edge_1591a1_subjectTo_1591c c

  obstructionScope      : ReferencedSectionExists edge_1591d_incorporates_1591 c









structure Coherent1592 (c : ComplaintText) : Prop where

  inCourseOffenses      : EnumeratedReferencesResolve edges_1592a1_predicateOffenses c

  intentOffenses        : EnumeratedReferencesResolve edges_1592a2_predicateOffenses c

  tvpaDefinition        : CrossActReferenceResolves edge_1592a3_incorporates_tvpa103 c

  victimCarveHonored    : QualifyingProvisionHonored edge_1592a_exceptAsProvided_1592b c

  victimCarveDefinition : CrossActReferenceResolves edge_1592b_incorporates_tvpa103 c

  fineRegime            : IncorporationHonored edge_1592a_incorporates_3571 c

  obstructionPenalty    : PenaltyIncorporationHonored edge_1592c_incorporates_1592a c







inductive Section1591AgeProofPath (c : ComplaintText) : Prop where


  | scienterPleaded
      (hCoercion : DefinitionalTermResolves edge_1591a_incorporates_1591e2 c)
      (hCarve    : QualifyingProvisionHonored edge_1591a_exceptAsProvided_1591a1 c)
      : Section1591AgeProofPath c



  | reasonableOpportunityToObserve
      (hTrigger : OverrideTriggered edge_1591a1_subjectTo_1591c c)
      (hHonored : QualifyingProvisionHonored edge_1591a1_subjectTo_1591c c)
      : Section1591AgeProofPath c





inductive Section1592Disposition (c : ComplaintText) : Prop where


  | victimConductCarve
      (hFires   : ExceptionApplies edge_1592a_exceptAsProvided_1592b c)
      (hTvpa    : CrossActReferenceResolves edge_1592b_incorporates_tvpa103 c)
      : Section1592Disposition c


  | predicateOffenceChain
      (hPred    : EnumeratedReferencesResolve edges_1592a1_predicateOffenses c)
      (hPenalty : IncorporationHonored edge_1592a_incorporates_3571 c)
      : Section1592Disposition c





structure Ch77SliceReferenceGraphCoherent (c : ComplaintText) : Prop where
  s1590 : Coherent1590 c
  s1591 : Coherent1591 c
  s1592 : Coherent1592 c

end Proving.USC.T18.Ch77.Reslice.Structure
