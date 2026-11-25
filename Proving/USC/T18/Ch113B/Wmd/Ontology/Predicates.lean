








import Proving.USC.T18.Ch113B.Wmd.Ontology.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Ontology

open Proving.USC.Common








axiom IsNationalOfTheUnitedStates (p : Person) (c : ComplaintText) : Prop






axiom IsDestructiveDevice (w : Weapon) (c : ComplaintText) : Prop





axiom IsToxicChemicalWeapon (w : Weapon) (c : ComplaintText) : Prop




axiom InvolvesBiologicalAgentToxinOrVector (w : Weapon) (c : ComplaintText) : Prop




axiom IsRadiologicalWeapon (w : Weapon) (c : ComplaintText) : Prop






axiom IsRealProperty (x : Property) (c : ComplaintText) : Prop




axiom IsPersonalProperty (x : Property) (c : ComplaintText) : Prop






axiom IsPropertyOtherwiseIncluded (x : Property) (c : ComplaintText) : Prop






axiom OccursOutsideTheUnitedStates (x : Conduct) (c : ComplaintText) : Prop




axiom OccursWithinTheUnitedStates (x : Conduct) (c : ComplaintText) : Prop






axiom IsFacilityOfInterstateOrForeignCommerce (f : Facility) (c : ComplaintText) : Prop







axiom IsSeriousBodilyInjury (i : Injury) (c : ComplaintText) : Prop






axiom ExtendsSeawardWithinTwelveNauticalMiles (z : MaritimeZone) (c : ComplaintText) : Prop




axiom MeasuredFromUnitedStatesBaselines (z : MaritimeZone) (c : ComplaintText) : Prop







axiom CalculatedToInfluenceOrRetaliateAgainstGovernmentConduct
    (o : Offense) (c : ComplaintText) : Prop







axiom ViolatesEnumeratedTitle18Provision (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesEnumeratedAtomicEnergyActProvision (o : Offense) (c : ComplaintText) : Prop





axiom ViolatesEnumeratedTitle49Provision (o : Offense) (c : ComplaintText) : Prop




axiom ViolatesNarcoTerrorismProvision (o : Offense) (c : ComplaintText) : Prop







axiom MailOrFacilityOfCommerceUsedInFurtherance (cir : Circumstance) (c : ComplaintText) : Prop





axiom OffenseObstructsDelaysOrAffectsCommerce (cir : Circumstance) (c : ComplaintText) : Prop






axiom VictimIsUnitedStatesGovernmentOrOfficial (cir : Circumstance) (c : ComplaintText) : Prop





axiom PropertyOwnedPossessedOrLeasedByUnitedStates (cir : Circumstance) (c : ComplaintText) : Prop







axiom CommittedInTerritorialSeaOfTheUnitedStates (cir : Circumstance) (c : ComplaintText) : Prop




axiom CommittedWithinSpecialMaritimeAndTerritorialJurisdiction
    (cir : Circumstance) (c : ComplaintText) : Prop








axiom AppliesToAtLeastOneOffender (cir : Circumstance) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Wmd.Ontology
