








import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Reslice.Structure.Types
import Proving.USC.T18.Ch75.Reslice.Structure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Structure

open Proving.USC.Common










inductive Ch75MaximumTermResolved (r : Ref) (c : ComplaintText) : Prop



  | noEnhancementTriggered
      (hNoTrigger : ¬ OverrideTriggered r c) :
      Ch75MaximumTermResolved r c


  | sectionMaximumControls
      (hTrigger : OverrideTriggered r c)
      (hTargetExists : ReferencedSectionExists r c)
      (hReconciled : ConflictingProvisionsReconciled r c) :
      Ch75MaximumTermResolved r c


  | alternativeMaximumControls
      (hTrigger : OverrideTriggered r c)
      (hTargetExists : ReferencedSectionExists r c)
      (hReconciled : ConflictingProvisionsReconciled r c) :
      Ch75MaximumTermResolved r c


inductive Section1546CarveStatus (c : ComplaintText) : Prop


  | noCarve
      (hNoOfficerDirection :
        ¬ ExceptionApplies e1546a_exceptAsProvided_officerDirection c)
      (hNoAuthorizedActivity :
        ¬ ExceptionApplies e1546c_exceptAsProvided_lawEnforcementActivity c) :
      Section1546CarveStatus c



  | officerDirection
      (hCarve : ExceptionApplies e1546a_exceptAsProvided_officerDirection c) :
      Section1546CarveStatus c


  | authorizedActivity
      (hCarve : ExceptionApplies e1546c_exceptAsProvided_lawEnforcementActivity c) :
      Section1546CarveStatus c


  | savingsPreserved
      (hSavings : SavingsClausePreservesActivity e1546c_savings_occaTitleV c) :
      Section1546CarveStatus c


structure Coherent1542 (c : ComplaintText) : Prop where
  passportLawIdentified :
    ExternalAuthorityIdentified e1542_incorporates_passportLaws c
  terrorismDefExists : ReferencedSectionExists e1542_incorporates_2331 c
  terrorismDefReaches : DefinitionScopeReachesReferrer e1542_incorporates_2331 c
  terrorismDefHonored : IncorporationHonored e1542_incorporates_2331 c
  dtcDefExists : ReferencedSectionExists e1542_incorporates_929a c
  dtcDefReaches : DefinitionScopeReachesReferrer e1542_incorporates_929a c
  dtcDefHonored : IncorporationHonored e1542_incorporates_929a c
  fineIncorporated : IncorporationHonored e1542_incorporates_3571 c
  maximumTerm : Ch75MaximumTermResolved e1542_subjectTo_1547 c




structure Coherent1543 (c : ComplaintText) : Prop where
  terrorismDefExists : ReferencedSectionExists e1543_incorporates_2331 c
  terrorismDefReaches : DefinitionScopeReachesReferrer e1543_incorporates_2331 c
  terrorismDefHonored : IncorporationHonored e1543_incorporates_2331 c
  dtcDefExists : ReferencedSectionExists e1543_incorporates_929a c
  dtcDefReaches : DefinitionScopeReachesReferrer e1543_incorporates_929a c
  dtcDefHonored : IncorporationHonored e1543_incorporates_929a c
  fineIncorporated : IncorporationHonored e1543_incorporates_3571 c
  maximumTerm : Ch75MaximumTermResolved e1543_subjectTo_1547 c


structure Coherent1544 (c : ComplaintText) : Prop where
  passportRulesIdentified :
    ExternalAuthorityIdentified e1544_incorporates_passportRules c
  passportConditionsIdentified :
    ExternalAuthorityIdentified e1544_incorporates_passportConditions c
  terrorismDefExists : ReferencedSectionExists e1544_incorporates_2331 c
  terrorismDefReaches : DefinitionScopeReachesReferrer e1544_incorporates_2331 c
  terrorismDefHonored : IncorporationHonored e1544_incorporates_2331 c
  dtcDefExists : ReferencedSectionExists e1544_incorporates_929a c
  dtcDefReaches : DefinitionScopeReachesReferrer e1544_incorporates_929a c
  dtcDefHonored : IncorporationHonored e1544_incorporates_929a c
  fineIncorporated : IncorporationHonored e1544_incorporates_3571 c
  maximumTerm : Ch75MaximumTermResolved e1544_subjectTo_1547 c




structure Coherent1546 (c : ComplaintText) : Prop where
  immigrationLawIdentified :
    ExternalAuthorityIdentified e1546a_incorporates_immigrationLaws c
  perjuryFormResolves : CrossTitleReferenceResolves e1546a_incorporates_28usc1746 c
  perjuryFormHonored : IncorporationHonored e1546a_incorporates_28usc1746 c
  terrorismDefExists : ReferencedSectionExists e1546a_incorporates_2331 c
  terrorismDefReaches : DefinitionScopeReachesReferrer e1546a_incorporates_2331 c
  terrorismDefHonored : IncorporationHonored e1546a_incorporates_2331 c
  dtcDefExists : ReferencedSectionExists e1546a_incorporates_929a c
  dtcDefReaches : DefinitionScopeReachesReferrer e1546a_incorporates_929a c
  dtcDefHonored : IncorporationHonored e1546a_incorporates_929a c
  fineIncorporated : IncorporationHonored e1546a_incorporates_3571 c
  employmentVerificationResolves :
    CrossTitleReferenceResolves e1546b_incorporates_ina274Ab c
  stateDefinitionHonored :
    IncorporationHonored e1546_incorporates_1546c_stateDefinition c
  savingsTargetExists : ReferencedSectionExists e1546c_savings_occaTitleV c
  carveStatus : Section1546CarveStatus c
  maximumTerm : Ch75MaximumTermResolved e1546_subjectTo_1547 c




structure Ch75PenaltyConflictCoherent (c : ComplaintText) : Prop where
  overrideProvisionExists : ReferencedSectionExists e1547_notwithstanding_ch75 c
  conflictReconciled :
    ConflictingProvisionsReconciled e_ch75_lexSpecialis_penaltyConflict c

end Proving.USC.T18.Ch75.Reslice.Structure
