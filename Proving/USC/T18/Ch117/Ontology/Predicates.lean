import Proving.USC.Common.Types
import Proving.USC.T18.Ch117.Ontology.Types













namespace Proving.USC.T18.Ch117.Ontology

open Proving.USC.Common





axiom IsUnderAge18 (p : Person) (c : ComplaintText) : Prop



axiom IsUnderAge16 (p : Person) (c : ComplaintText) : Prop





axiom IsProstitution (x : Conduct) (c : ComplaintText) : Prop





axiom IsSexualActivityChargeable (x : Conduct) (c : ComplaintText) : Prop




axiom IsSexualActCh109A (x : Conduct) (c : ComplaintText) : Prop




axiom IsCommercialSexAct (x : Conduct) (c : ComplaintText) : Prop




axiom IsChildPornographyProduction (x : Conduct) (c : ComplaintText) : Prop



axiom IsIllicitSexualConduct (x : Conduct) (c : ComplaintText) : Prop






axiom IsAlien (p : Person) (c : ComplaintText) : Prop



axiom IsHarmedByChapterOffense (p : Person) (c : ComplaintText) : Prop





axiom IsVictim (p : Person) (c : ComplaintText) : Prop





axiom IsConvictionUnderCoveredFederalOffense (v : Conviction) (c : ComplaintText) : Prop





axiom IsConvictionUnderStateOrMilitaryEquivalent (v : Conviction) (c : ComplaintText) : Prop



axiom IsPriorSexOffenseConviction (v : Conviction) (c : ComplaintText) : Prop





axiom IsStateOfTheUnitedStates (j : Jurisdiction) (c : ComplaintText) : Prop



axiom IsDistrictOfColumbia (j : Jurisdiction) (c : ComplaintText) : Prop



axiom IsCommonwealthTerritoryOrPossession (j : Jurisdiction) (c : ComplaintText) : Prop



axiom IsState (j : Jurisdiction) (c : ComplaintText) : Prop






axiom IsProscribedIntent (m : MentalState) (c : ComplaintText) : Prop






axiom IsInteractiveComputerService (s : Service) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch117.Ontology
