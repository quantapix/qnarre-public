









import Proving.USC.T18.Ch42Ch95.Structure.Types
import Proving.USC.T18.Ch42Ch95.Structure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Structure

open Proving.USC.Common





structure Coherent892 (c : ComplaintText) : Prop where

  definitionsExist : ReferencedSectionExists edge_892a_incorporates_891 c

  definitionsHonored : IncorporationHonored edge_892a_incorporates_891 c

  fineRegimeExists : ReferencedSectionExists edge_892a_incorporates_fineRegime c

  primaFacieNonexclusive : SavingsClausePreserves edge_892b_savings_892a c

  reputationRuleHonored : IncorporationHonored edge_892c_incorporates_892b c





structure Coherent894 (c : ComplaintText) : Prop where


  definitionsExist : ReferencedSectionExists edge_894a_incorporates_891 c

  definitionsHonored : IncorporationHonored edge_894a_incorporates_891 c

  fineRegimeExists : ReferencedSectionExists edge_894a_incorporates_fineRegime c

  s892b1Exists : ReferencedSectionExists edge_894c_incorporates_892b1 c

  s892b1Honored : IncorporationHonored edge_894c_incorporates_892b1 c

  s892b2Honored : IncorporationHonored edge_894c_incorporates_892b2 c





structure Coherent1952 (c : ComplaintText) : Prop where

  fineRegimeExists : ReferencedSectionExists edge_1952a_incorporates_fineRegime c


  csaDefinitionHonored : IncorporationHonored edge_1952b_incorporates_csa102_6 c


  bsaIncorporationHonored : IncorporationHonored edge_1952b_incorporates_t31ch53subchII c

  s1956Exists : ReferencedSectionExists edge_1952b_incorporates_1956 c

  s1956Honored : IncorporationHonored edge_1952b_incorporates_1956 c

  s1957Exists : ReferencedSectionExists edge_1952b_incorporates_1957 c

  preRetailDefinitionHonored : IncorporationHonored edge_1952d_incorporates_670 c





inductive Displacement1952 (c : ComplaintText) : Prop where


  | preRetailMedicalProduct :
      OverrideTriggered edge_1952d_lexSpecialis_670 c →
      SpecificProvisionControls edge_1952d_lexSpecialis_670 c →
      Displacement1952 c



  | savingsPromotionRaffle :
      ExceptionApplies edge_1952a_exceptAsProvided_1952e c →
      IncorporationHonored edge_1952e_incorporates_fcua101 c →
      IncorporationHonored edge_1952e_incorporates_fdia3 c →
      Displacement1952 c







structure Coherent1956 (c : ComplaintText) : Prop where

  s1961RosterExists : ReferencedSectionExists edge_1956c7A_incorporates_1961_1 c

  s1961RosterHonored : IncorporationHonored edge_1956c7A_incorporates_1961_1 c


  bsaCarveOutHonored : ExceptionApplies edge_1956c7A_exceptAsProvided_t31ch53subchII c

  enumeratedOffensesHonored : IncorporationHonored edge_1956c7D_incorporates_enumerated c


  financialInstitutionDefHonored : IncorporationHonored edge_1956c6_incorporates_t31s5312 c


  civilPenaltyBaseHonored : IncorporationHonored edge_1956b1_incorporates_1956a c

  s1957Exists : ReferencedSectionExists edge_1956b1_incorporates_1957 c

  receiverPowersExist : ReferencedSectionExists edge_1956b4_incorporates_t28s754 c

  nonSupersessionPreserved : SavingsClausePreserves edge_1956d_savings_otherLaw c


  venueExceptionHonored : ExceptionApplies edge_1956i1_exceptAsProvided_1956i2 c

  conductsDefinitionHonored : IncorporationHonored edge_1956i3_incorporates_1956c2 c






inductive LimitationsRegime1956 (c : ComplaintText) : Prop where

  | generalPeriodGoverns :
      ReferencedSectionExists edge_1956j_notwithstanding_3282 c →
      ¬ OverrideTriggered edge_1956j_notwithstanding_3282 c →
      LimitationsRegime1956 c

  | sevenYearPeriodGoverns :
      ReferencedSectionExists edge_1956j_notwithstanding_3282 c →
      OverrideTriggered edge_1956j_notwithstanding_3282 c →
      LimitationsRegime1956 c




structure SliceCrossReferencesResolve (c : ComplaintText) : Prop where

  s894c_to_892b1 : IncorporationHonored edge_894c_incorporates_892b1 c

  s894c_to_892b2 : IncorporationHonored edge_894c_incorporates_892b2 c

  s1952b_to_1956 : IncorporationHonored edge_1952b_incorporates_1956 c

  s892b_saves_892a : SavingsClausePreserves edge_892b_savings_892a c

  s892c_to_892b : IncorporationHonored edge_892c_incorporates_892b c

  s1956b1_to_1956a : IncorporationHonored edge_1956b1_incorporates_1956a c

  s1956e_to_1956c7E : IncorporationHonored edge_1956e_incorporates_1956c7E c

  s1956i3_to_1956c2 : IncorporationHonored edge_1956i3_incorporates_1956c2 c

  s892b1Exists : ReferencedSectionExists edge_894c_incorporates_892b1 c

  s1956Exists : ReferencedSectionExists edge_1952b_incorporates_1956 c

end Proving.USC.T18.Ch42Ch95.Structure
