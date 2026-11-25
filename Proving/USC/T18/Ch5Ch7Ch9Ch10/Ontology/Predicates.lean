import Proving.USC.T18.Ch5Ch7Ch9Ch10.Ontology.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false
open Proving.USC.Common










namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Ontology







axiom IsSubstantialBodilyInjury (i : BodilyInjury) (c : ComplaintText) : Prop




axiom IsStrangling (act : Conduct) (c : ComplaintText) : Prop




axiom IsSuffocating (act : Conduct) (c : ComplaintText) : Prop





axiom IsFederalLawEnforcementOfficer (p : Person) (c : ComplaintText) : Prop




axiom IsImmediateFamilyMember (p : Person) (c : ComplaintText) : Prop




axiom IsUnitedStatesJudge (p : Person) (c : ComplaintText) : Prop





axiom IsUnitedStatesOfficial (p : Person) (c : ComplaintText) : Prop




axiom IsFemaleGenitalMutilation (act : Conduct) (c : ComplaintText) : Prop





axiom IsDomesticAssault (act : Conduct) (c : ComplaintText) : Prop




axiom IsRestrictedPersonalInformation (info : Information) (c : ComplaintText) : Prop




axiom IsCoveredPerson (p : Person) (c : ComplaintText) : Prop





axiom IsDebtor (p : Person) (c : ComplaintText) : Prop




axiom IsBankruptcyPetitionPreparer (p : Person) (c : ComplaintText) : Prop




axiom IsDocumentForFiling (d : Document) (c : ComplaintText) : Prop







axiom IsBiologicalAgent (s : Substance) (c : ComplaintText) : Prop





axiom IsToxin (s : Substance) (c : ComplaintText) : Prop




axiom IsDeliverySystem (x : Instrumentality) (c : ComplaintText) : Prop




axiom IsVector (x : Instrumentality) (c : ComplaintText) : Prop





axiom IsForUseAsAWeapon (s : Substance) (c : ComplaintText) : Prop




axiom IsSelectAgent (s : Substance) (c : ComplaintText) : Prop





axiom IsRestrictedPerson (p : Person) (c : ComplaintText) : Prop




axiom IsVariolaVirus (s : Substance) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Ontology
