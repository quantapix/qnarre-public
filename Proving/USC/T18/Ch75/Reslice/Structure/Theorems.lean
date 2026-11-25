



import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Reslice.Structure.Types
import Proving.USC.T18.Ch75.Reslice.Structure.Predicates
import Proving.USC.T18.Ch75.Reslice.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Structure

open Proving.USC.Common




theorem ch75MaximumTermResolved_intro {r : Ref} {c : ComplaintText}
    (hTrigger : OverrideTriggered r c)
    (hTargetExists : ReferencedSectionExists r c)
    (hReconciled : ConflictingProvisionsReconciled r c) :
    Ch75MaximumTermResolved r c :=
  .sectionMaximumControls hTrigger hTargetExists hReconciled



theorem ch75MaximumTermResolved_alternative_intro {r : Ref} {c : ComplaintText}
    (hTrigger : OverrideTriggered r c)
    (hTargetExists : ReferencedSectionExists r c)
    (hReconciled : ConflictingProvisionsReconciled r c) :
    Ch75MaximumTermResolved r c :=
  .alternativeMaximumControls hTrigger hTargetExists hReconciled


theorem ch75MaximumTermResolved_noTrigger_intro {r : Ref} {c : ComplaintText}
    (hNoTrigger : ¬ OverrideTriggered r c) :
    Ch75MaximumTermResolved r c :=
  .noEnhancementTriggered hNoTrigger


theorem section1546CarveStatus_intro {c : ComplaintText}
    (hNoOfficerDirection :
      ¬ ExceptionApplies e1546a_exceptAsProvided_officerDirection c)
    (hNoAuthorizedActivity :
      ¬ ExceptionApplies e1546c_exceptAsProvided_lawEnforcementActivity c) :
    Section1546CarveStatus c :=
  .noCarve hNoOfficerDirection hNoAuthorizedActivity


theorem section1546CarveStatus_officerDirection_intro {c : ComplaintText}
    (hCarve : ExceptionApplies e1546a_exceptAsProvided_officerDirection c) :
    Section1546CarveStatus c :=
  .officerDirection hCarve


theorem section1546CarveStatus_authorizedActivity_intro {c : ComplaintText}
    (hCarve : ExceptionApplies e1546c_exceptAsProvided_lawEnforcementActivity c) :
    Section1546CarveStatus c :=
  .authorizedActivity hCarve


theorem section1546CarveStatus_savings_intro {c : ComplaintText}
    (hSavings : SavingsClausePreservesActivity e1546c_savings_occaTitleV c) :
    Section1546CarveStatus c :=
  .savingsPreserved hSavings


theorem coherent1542_intro {c : ComplaintText}
    (hPassportLaw : ExternalAuthorityIdentified e1542_incorporates_passportLaws c)
    (hTerrExists : ReferencedSectionExists e1542_incorporates_2331 c)
    (hTerrReaches : DefinitionScopeReachesReferrer e1542_incorporates_2331 c)
    (hTerrHonored : IncorporationHonored e1542_incorporates_2331 c)
    (hDtcExists : ReferencedSectionExists e1542_incorporates_929a c)
    (hDtcReaches : DefinitionScopeReachesReferrer e1542_incorporates_929a c)
    (hDtcHonored : IncorporationHonored e1542_incorporates_929a c)
    (hFine : IncorporationHonored e1542_incorporates_3571 c)
    (hMax : Ch75MaximumTermResolved e1542_subjectTo_1547 c) :
    Coherent1542 c :=
  ⟨hPassportLaw, hTerrExists, hTerrReaches, hTerrHonored,
   hDtcExists, hDtcReaches, hDtcHonored, hFine, hMax⟩


theorem coherent1543_intro {c : ComplaintText}
    (hTerrExists : ReferencedSectionExists e1543_incorporates_2331 c)
    (hTerrReaches : DefinitionScopeReachesReferrer e1543_incorporates_2331 c)
    (hTerrHonored : IncorporationHonored e1543_incorporates_2331 c)
    (hDtcExists : ReferencedSectionExists e1543_incorporates_929a c)
    (hDtcReaches : DefinitionScopeReachesReferrer e1543_incorporates_929a c)
    (hDtcHonored : IncorporationHonored e1543_incorporates_929a c)
    (hFine : IncorporationHonored e1543_incorporates_3571 c)
    (hMax : Ch75MaximumTermResolved e1543_subjectTo_1547 c) :
    Coherent1543 c :=
  ⟨hTerrExists, hTerrReaches, hTerrHonored,
   hDtcExists, hDtcReaches, hDtcHonored, hFine, hMax⟩


theorem coherent1544_intro {c : ComplaintText}
    (hPassportRules : ExternalAuthorityIdentified e1544_incorporates_passportRules c)
    (hPassportConditions :
      ExternalAuthorityIdentified e1544_incorporates_passportConditions c)
    (hTerrExists : ReferencedSectionExists e1544_incorporates_2331 c)
    (hTerrReaches : DefinitionScopeReachesReferrer e1544_incorporates_2331 c)
    (hTerrHonored : IncorporationHonored e1544_incorporates_2331 c)
    (hDtcExists : ReferencedSectionExists e1544_incorporates_929a c)
    (hDtcReaches : DefinitionScopeReachesReferrer e1544_incorporates_929a c)
    (hDtcHonored : IncorporationHonored e1544_incorporates_929a c)
    (hFine : IncorporationHonored e1544_incorporates_3571 c)
    (hMax : Ch75MaximumTermResolved e1544_subjectTo_1547 c) :
    Coherent1544 c :=
  ⟨hPassportRules, hPassportConditions, hTerrExists, hTerrReaches, hTerrHonored,
   hDtcExists, hDtcReaches, hDtcHonored, hFine, hMax⟩


theorem coherent1546_intro {c : ComplaintText}
    (hImmigrationLaw :
      ExternalAuthorityIdentified e1546a_incorporates_immigrationLaws c)
    (hPerjuryResolves : CrossTitleReferenceResolves e1546a_incorporates_28usc1746 c)
    (hPerjuryHonored : IncorporationHonored e1546a_incorporates_28usc1746 c)
    (hTerrExists : ReferencedSectionExists e1546a_incorporates_2331 c)
    (hTerrReaches : DefinitionScopeReachesReferrer e1546a_incorporates_2331 c)
    (hTerrHonored : IncorporationHonored e1546a_incorporates_2331 c)
    (hDtcExists : ReferencedSectionExists e1546a_incorporates_929a c)
    (hDtcReaches : DefinitionScopeReachesReferrer e1546a_incorporates_929a c)
    (hDtcHonored : IncorporationHonored e1546a_incorporates_929a c)
    (hFine : IncorporationHonored e1546a_incorporates_3571 c)
    (hEmployment : CrossTitleReferenceResolves e1546b_incorporates_ina274Ab c)
    (hStateDef : IncorporationHonored e1546_incorporates_1546c_stateDefinition c)
    (hSavingsExists : ReferencedSectionExists e1546c_savings_occaTitleV c)
    (hCarve : Section1546CarveStatus c)
    (hMax : Ch75MaximumTermResolved e1546_subjectTo_1547 c) :
    Coherent1546 c :=
  ⟨hImmigrationLaw, hPerjuryResolves, hPerjuryHonored,
   hTerrExists, hTerrReaches, hTerrHonored,
   hDtcExists, hDtcReaches, hDtcHonored, hFine,
   hEmployment, hStateDef, hSavingsExists, hCarve, hMax⟩


theorem ch75PenaltyConflictCoherent_intro {c : ComplaintText}
    (hOverrideExists : ReferencedSectionExists e1547_notwithstanding_ch75 c)
    (hReconciled :
      ConflictingProvisionsReconciled e_ch75_lexSpecialis_penaltyConflict c) :
    Ch75PenaltyConflictCoherent c :=
  ⟨hOverrideExists, hReconciled⟩

end Proving.USC.T18.Ch75.Reslice.Structure
