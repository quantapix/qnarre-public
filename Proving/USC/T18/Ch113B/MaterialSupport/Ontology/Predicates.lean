









import Proving.USC.T18.Ch113B.MaterialSupport.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Ontology

open Proving.USC.Common








axiom IsEnumeratedTerrorismOffenseUnder2339 (a : PredicateAct) (c : ComplaintText) : Prop




axiom IsHarborOrConcealConduct (x : Conduct) (c : ComplaintText) : Prop







axiom IsEnumeratedOffenseUnder2339A (a : PredicateAct) (c : ComplaintText) : Prop





axiom IsMaterialSupportOrResources (x : SupportItem) (c : ComplaintText) : Prop




axiom IsProperty (x : SupportItem) (c : ComplaintText) : Prop




axiom IsService (x : SupportItem) (c : ComplaintText) : Prop




axiom IsTraining (x : SupportItem) (c : ComplaintText) : Prop




axiom IsExpertAdviceOrAssistance (x : SupportItem) (c : ComplaintText) : Prop




axiom IsPersonnel (x : SupportItem) (c : ComplaintText) : Prop




axiom IsMedicine (x : SupportItem) (c : ComplaintText) : Prop




axiom IsReligiousMaterials (x : SupportItem) (c : ComplaintText) : Prop







axiom IsClassifiedInformation (i : ClassifiedInfo) (c : ComplaintText) : Prop




axiom IsFinancialInstitution (o : Organization) (c : ComplaintText) : Prop






axiom IsFundsUnder2339B (x : FundsItem) (c : ComplaintText) : Prop



axiom IsSecretaryOfTheTreasury (p : Person) (c : ComplaintText) : Prop





axiom IsTerroristOrganization (o : Organization) (c : ComplaintText) : Prop






axiom IsPersonnelUnderOrganizationDirectionOrControl (x : SupportItem) (c : ComplaintText) : Prop








axiom IsFundsUnder2339C (x : FundsItem) (c : ComplaintText) : Prop







axiom IsGovernmentFacility (f : Facility) (c : ComplaintText) : Prop





axiom IsProceeds (x : FundsItem) (c : ComplaintText) : Prop




axiom IsProvides (x : Conduct) (c : ComplaintText) : Prop



axiom IsCollects (x : Conduct) (c : ComplaintText) : Prop




axiom IsPredicateAct (a : PredicateAct) (c : ComplaintText) : Prop




axiom IsActWithinScopeOfSpecifiedTreaty (a : PredicateAct) (c : ComplaintText) : Prop







axiom IsActIntendedToIntimidateOrCompel (a : PredicateAct) (c : ComplaintText) : Prop




axiom IsSpecifiedTreaty (t : Treaty) (c : ComplaintText) : Prop




axiom IsIntergovernmentalOrganization (o : Organization) (c : ComplaintText) : Prop





axiom IsInternationalOrganization (o : Organization) (c : ComplaintText) : Prop





axiom IsArmedConflict (s : ArmedConflictSituation) (c : ComplaintText) : Prop





axiom IsInternalDisturbanceOrTension (s : ArmedConflictSituation) (c : ComplaintText) : Prop






axiom IsSeriousBodilyInjury (i : Injury) (c : ComplaintText) : Prop






axiom IsNationalOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom IsForeignState (s : ForeignState) (c : ComplaintText) : Prop









axiom IsMilitaryTypeTraining (x : SupportItem) (c : ComplaintText) : Prop





axiom IsCriticalInfrastructure (f : Facility) (c : ComplaintText) : Prop






axiom IsWeaponOfMassDestruction (w : Weapon) (c : ComplaintText) : Prop





axiom IsForeignTerroristOrganization (o : Organization) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.MaterialSupport.Ontology
