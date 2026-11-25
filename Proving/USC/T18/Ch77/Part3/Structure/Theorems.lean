import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part3.Structure.Types
import Proving.USC.T18.Ch77.Part3.Structure.Predicates
import Proving.USC.T18.Ch77.Part3.Structure.Statute

set_option autoImplicit false







namespace Proving.USC.T18.Ch77.Part3.Structure

open Proving.USC.Common


theorem section1593bIncorporationsResolve_intro {c : ComplaintText}
    (hPara3 : InternalAntecedentResolves edge_1593b1_incorporates_1593b3 c)
    (hAmountSrc : ReferencedSectionExists edge_1593b3_incorporates_2259c2 c)
    (hAmountDef : TermMeaningImported term_fullAmountOfVictimsLosses c)
    (hFlsa : CrossTitleReferenceResolves edge_1593b3_incorporates_flsa c)
    (hProc : ReferencedSectionExists edge_1593b2_incorporates_3664 c)
    (hManner : IncorporationHonored edge_1593b2_incorporates_3663A c)
    (hForfeiture : CrossTitleReferenceResolves edge_1593b4_incorporates_853 c)
    (hCarveOut : ExceptionApplies edge_1593b4_except_853d c)
    : Section1593bIncorporationsResolve c :=
  { paragraph3Resolves := hPara3
  , amountSourceExists := hAmountSrc
  , amountDefinitionImported := hAmountDef
  , flsaFloorResolves := hFlsa
  , enforcementProcedureExists := hProc
  , enforcementMannerHonored := hManner
  , forfeitureRegimeResolves := hForfeiture
  , forfeitureCarveOut := hCarveOut }


theorem coherent1593_intro {c : ComplaintText}
    (h3663 : OverrideTriggered edge_1593a_notwithstanding_3663 c)
    (h3663A : OverrideTriggered edge_1593a_notwithstanding_3663A c)
    (hSavings : SavingsClauseHonored edge_1593a_savings_otherPenalties c)
    (hScope : IncorporationHonored edge_1593a_incorporates_ch77 c)
    (hAmount : Section1593bIncorporationsResolve c)
    (hVictimScope : IncorporationHonored edge_1593c_incorporates_ch77 c)
    (hVictimTerm : TermMeaningImported term_victim c)
    (hVictimDef : LexSpecialisControls edge_1593c_lexSpecialis_3663A c)
    : Coherent1593 c :=
  { displaces3663 := h3663
  , displaces3663A := h3663A
  , cumulativeRemediesPreserved := hSavings
  , predicateOffenseScopeResolves := hScope
  , amountRegime := hAmount
  , victimScopeResolves := hVictimScope
  , victimTermImported := hVictimTerm
  , victimDefinitionControls := hVictimDef }


theorem restitutionOverridePath_displacingDiscretionary_intro {c : ComplaintText}
    (h : OverrideTriggered edge_1593a_notwithstanding_3663 c)
    : RestitutionOverridePath c :=
  .displacingDiscretionary h


theorem restitutionOverridePath_displacingMandatory_intro {c : ComplaintText}
    (h : OverrideTriggered edge_1593a_notwithstanding_3663A c)
    : RestitutionOverridePath c :=
  .displacingMandatory h


theorem section1593b4AntecedentDefect_intro {c : ComplaintText}
    (hMissing : ¬ InternalAntecedentResolves edge_1593b4_internal_forfeitureAntecedent c)
    (hNamed : ReferencedSectionExists edge_1593b4_incorporates_853 c)
    : Section1593b4AntecedentDefect c :=
  { antecedentMissing := hMissing
  , incorporationStillNamed := hNamed }


theorem coherent1593_amountRegime {c : ComplaintText}
    (h : Coherent1593 c) : Section1593bIncorporationsResolve c :=
  h.amountRegime

end Proving.USC.T18.Ch77.Part3.Structure
