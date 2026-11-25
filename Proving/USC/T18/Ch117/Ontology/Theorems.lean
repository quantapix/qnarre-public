import Proving.USC.Common.Types
import Proving.USC.T18.Ch117.Ontology.Types
import Proving.USC.T18.Ch117.Ontology.Predicates
import Proving.USC.T18.Ch117.Ontology.Statute










namespace Proving.USC.T18.Ch117.Ontology

open Proving.USC.Common




theorem illicitSexualConductDef_introSexualAct {x p c}
    (hAct : IsSexualActCh109A x c) (hAge : IsUnderAge18 p c) :
    IllicitSexualConductDef x p c :=
  .sexualActUnder18 hAct hAge


theorem illicitSexualConductDef_introCommercialSex {x p c}
    (hAct : IsCommercialSexAct x c) (hAge : IsUnderAge18 p c) :
    IllicitSexualConductDef x p c :=
  .commercialSexActUnder18 hAct hAge


theorem illicitSexualConductDef_introChildPorn {x p c}
    (hCp : IsChildPornographyProduction x c) :
    IllicitSexualConductDef x p c :=
  .childPornProduction hCp




theorem priorSexOffenseConvictionDef_introFederal {v c}
    (h : IsConvictionUnderCoveredFederalOffense v c) :
    PriorSexOffenseConvictionDef v c :=
  .federalCovered h


theorem priorSexOffenseConvictionDef_introState {v c}
    (h : IsConvictionUnderStateOrMilitaryEquivalent v c) :
    PriorSexOffenseConvictionDef v c :=
  .stateOrMilitary h




theorem stateDef_introUnitedStates {j c}
    (h : IsStateOfTheUnitedStates j c) : StateDef j c :=
  .ofTheUnitedStates h


theorem stateDef_introDistrictOfColumbia {j c}
    (h : IsDistrictOfColumbia j c) : StateDef j c :=
  .districtOfColumbia h


theorem stateDef_introTerritory {j c}
    (h : IsCommonwealthTerritoryOrPossession j c) : StateDef j c :=
  .commonwealthTerritoryOrPossession h




theorem victimDef_intro {p c}
    (h : IsHarmedByChapterOffense p c) : VictimDef p c :=
  ⟨h⟩

end Proving.USC.T18.Ch117.Ontology
