







import Proving.USC.T28.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T28.Ontology

open Proving.USC.Common (ComplaintText Person)






axiom IsStateForSection1343 (s : State) (c : ComplaintText) : Prop




axiom IsDistrictOfColumbia (s : State) (c : ComplaintText) : Prop




axiom IsActExclusiveToDC (a : ActOfCongress) (c : ComplaintText) : Prop




axiom IsStatuteOfDC (a : ActOfCongress) (c : ComplaintText) : Prop




axiom IsCivilActionAuthorizedByLaw (act : CivilAction) (c : ComplaintText) : Prop



axiom CommencedByPerson (act : CivilAction) (p : Person) (c : ComplaintText) : Prop




axiom IsConspiracyDamagesAction (act : CivilAction) (c : ComplaintText) : Prop





axiom IsNeglectToPreventAction (act : CivilAction) (c : ComplaintText) : Prop






axiom IsColorOfLawDeprivationAction (act : CivilAction) (c : ComplaintText) : Prop





axiom IsCivilRightsProtectionAction (act : CivilAction) (c : ComplaintText) : Prop







axiom IsUnswornDeclaration (d : Declaration) (c : ComplaintText) : Prop




axiom DeclaresUnderPenaltyOfPerjury (d : Declaration) (c : ComplaintText) : Prop




axiom RecitesLawsOfUnitedStates (d : Declaration) (c : ComplaintText) : Prop



axiom AssertsTrueAndCorrect (d : Declaration) (c : ComplaintText) : Prop




axiom StatesExecutionDate (d : Declaration) (c : ComplaintText) : Prop




axiom BearsSignature (d : Declaration) (c : ComplaintText) : Prop



axiom ExecutedWithoutUnitedStates (d : Declaration) (c : ComplaintText) : Prop




axiom ExecutedWithinUnitedStates (d : Declaration) (c : ComplaintText) : Prop

end Proving.USC.T28.Ontology
