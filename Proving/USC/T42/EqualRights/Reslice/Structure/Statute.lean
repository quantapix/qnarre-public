


















import Proving.USC.T42.EqualRights.Reslice.Structure.Types
import Proving.USC.T42.EqualRights.Reslice.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Structure

open Proving.USC.Common









structure Coherent1981 (t : IncorporatedTerm) (c : ComplaintText) : Prop where

  contractTermBorrowed :
    DefinedTermCarriesBorrowedMeaning t edge_1981a_incorporates_1981b c

  contractTermHonored : IncorporationHonored edge_1981a_incorporates_1981b c


  coverageHonored : IncorporationHonored edge_1981a_incorporates_1981c c







inductive DamagesGateway1981a (c : ComplaintText) : Prop where


  | titleVII
      (procedureExists : ReferencedSectionExists edge_1981a_incorporates_2000e5 c)
      (prohibitionHonored : IncorporationHonored edge_1981a_incorporates_2000e2 c)
      (section1981Bar : SubordinationSatisfied edge_1981a_subjectTo_1981 c)
      : DamagesGateway1981a c



  | disabilityStatutes
      (procedureExists : ReferencedSectionExists edge_1981a_incorporates_12117a c)
      (rehabVehicleExists : ReferencedSectionExists edge_1981a_incorporates_29_794a c)
      (prohibitionHonored : IncorporationHonored edge_1981a_incorporates_12112 c)
      (goodFaithHonored : ExceptionHonored edge_1981a_a2_exceptAsProvided_a3 c)
      : DamagesGateway1981a c





structure Coherent1981a (t : IncorporatedTerm) (c : ComplaintText) : Prop where

  gateway : DamagesGateway1981a c

  rehabProhibitionExists : ReferencedSectionExists edge_1981a_incorporates_29_791 c

  additionalReliefHonored : IncorporationHonored edge_1981a_incorporates_2000e5g c

  goodFaithAnchorHonored : IncorporationHonored edge_1981a_a3_incorporates_12112b5 c


  capsIncorporated : IncorporationHonored edge_1981a_a_incorporates_b c

  backpayExclusionHonored : IncorporationHonored edge_1981a_b2_incorporates_2000e5g c

  section1981Saved : SavingsClauseRespected edge_1981a_b4_savings_1981 c

  juryLimitationHonored : IncorporationHonored edge_1981a_c2_incorporates_b3 c

  complainingPartyBorrowed :
    DefinedTermCarriesBorrowedMeaning t edge_1981a_a_incorporates_d1 c

  titleVIIClassResolves : CrossReferenceResolvable edge_1981a_d1_incorporates_2000e

  adaClassResolves : CrossReferenceResolvable edge_1981a_d1_incorporates_12111

  practiceDefinitionHonored : IncorporationHonored edge_1981a_d2_incorporates_a c



















structure Coherent1983 (c : ComplaintText) : Prop where


  securedRightIncorporated : IncorporationHonored edge_1983_incorporates_securedRights c


  judicialOfficerExceptionHonored :
    ExceptionHonored edge_1983_exceptAsProvided_judicialOfficer c


  dcDeemingHonored : IncorporationHonored edge_1983_incorporates_dcDeeming c








inductive RemedyPath1985 (c : ComplaintText) : Prop where

  | viaClause1 (h : IncorporationHonored edge_1985_1_incorporates_remedy c)
      : RemedyPath1985 c

  | viaClause2 (h : IncorporationHonored edge_1985_2_incorporates_remedy c)
      : RemedyPath1985 c

  | viaClause3 (h : IncorporationHonored edge_1985_3_incorporates_remedy c)
      : RemedyPath1985 c





structure Coherent1985 (c : ComplaintText) : Prop where

  remedyReached : RemedyPath1985 c

  remedyClauseExists : ReferencedSectionExists edge_1985_3_incorporates_remedy c








structure Coherent1986 (c : ComplaintText) : Prop where

  section1985Exists : ReferencedSectionExists edge_1986_incorporates_1985 c


  predicateWrongIncorporated : IncorporationHonored edge_1986_incorporates_1985 c

  oneYearBarSatisfied : SubordinationSatisfied edge_1986_subjectTo_oneYearBar c








inductive RuleOfDecision1988a (c : ComplaintText) : Prop where

  | federalSuffices
      (conformity : IncorporationHonored edge_1988a_incorporates_usLaws c)
      (noDeficiency : ¬ ExceptionApplies edge_1988a_exceptAsProvided_stateCommonLaw c)
      : RuleOfDecision1988a c


  | stateCommonLawFills
      (deficiency : ExceptionApplies edge_1988a_exceptAsProvided_stateCommonLaw c)
      (fallbackHonored : ExceptionHonored edge_1988a_exceptAsProvided_stateCommonLaw c)
      (consistency : SubordinationSatisfied edge_1988a_stateLaw_subjectTo_federal c)
      : RuleOfDecision1988a c












structure Section1988IncorporationsResolve
    (p : EnforcementProceeding) (c : ComplaintText) : Prop where


  revisedStatutesResolve : CrossReferenceResolvable edge_1988a_incorporates_revisedStatutes

  ruleOfDecision : RuleOfDecision1988a c


  proceedingEnforcesEnumerated :
    EnforcementProceedingUnder edge_1988b_enforcementGate p c

  fee1981 : ReferencedSectionExists edge_1988b_incorporates_1981 c

  fee1981a : ReferencedSectionExists edge_1988b_incorporates_1981a c


  fee1982 : ReferencedSectionExists edge_1988b_incorporates_1982 c

  fee1983 : ReferencedSectionExists edge_1988b_incorporates_1983 c

  fee1985 : ReferencedSectionExists edge_1988b_incorporates_1985 c

  fee1986 : ReferencedSectionExists edge_1988b_incorporates_1986 c

  feeTitleIX : CrossReferenceResolvable edge_1988b_incorporates_20_1681

  feeRfra : CrossReferenceResolvable edge_1988b_incorporates_2000bb


  feeRluipa : CrossReferenceResolvable edge_1988b_incorporates_2000cc

  feeTitleVI : CrossReferenceResolvable edge_1988b_incorporates_2000d

  feeSection12361 : CrossReferenceResolvable edge_1988b_incorporates_34_12361



  judicialOfficerCostExceptionHonored :
    ExceptionHonored edge_1988b_exceptAsProvided_judicialOfficer c


  expertFeeOverrideTriggered : OverrideTriggered edge_1988c_lexSpecialis_1988b c


  expertFeeScopeHonored : IncorporationHonored edge_1988c_incorporates_1981_1981a c

end Proving.USC.T42.EqualRights.Reslice.Structure
