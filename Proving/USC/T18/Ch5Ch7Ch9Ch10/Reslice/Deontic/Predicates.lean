import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false











open Proving.USC.Common

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic




axiom AddresseeIsAnyPerson (p : Person) (c : ComplaintText) : Prop




axiom ActedKnowingly (p : Person) (c : ComplaintText) : Prop




axiom ActedWillfully (p : Person) (c : ComplaintText) : Prop




axiom ActedFraudulently (p : Person) (c : ComplaintText) : Prop




axiom AffectsInterstateOrForeignCommerce (c : ComplaintText) : Prop




axiom WithinSpecialMaritimeTerritorialJurisdiction (c : ComplaintText) : Prop




axiom WithinExtraterritorialJurisdiction (c : ComplaintText) : Prop




axiom AddresseeIsAttorneyGeneral (g : PublicOfficer) (c : ComplaintText) : Prop




axiom AddresseeIsUnitedStates (g : PublicOfficer) (c : ComplaintText) : Prop




axiom AddresseeIsDesignatedUnitedStatesAttorney (g : PublicOfficer) (c : ComplaintText) : Prop




axiom AddresseeIsBankruptcyCourt (g : PublicOfficer) (c : ComplaintText) : Prop




axiom AddresseeIsParentGuardianOrCaretaker (p : Person) (c : ComplaintText) : Prop




axiom AddresseeIsEstateAdministrationOfficer (p : Person) (c : ComplaintText) : Prop




axiom AddresseeIsCourtOfficerInCase (p : Person) (k : Case11) (c : ComplaintText) : Prop




axiom AddresseeIsPartyInInterest (p : Person) (k : Case11) (c : ComplaintText) : Prop




axiom AddresseeIsBankruptcyPetitionPreparer (p : Person) (c : ComplaintText) : Prop




axiom AddresseeIsRestrictedPerson (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS111_a1 (p : Person) (o : Official) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS111_a2 (p : Person) (o : Official) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS111_b (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS112_a (p : Person) (o : Official) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS112_b1 (p : Person) (o : Official) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS112_b3 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS112_d (g : PublicOfficer) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS112_e (g : PublicOfficer) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS112_f (g : PublicOfficer) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS113_a (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS114 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS115_a1A (p : Person) (o : Official) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS115_a1B (p : Person) (o : Official) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS115_a2 (p : Person) (o : Official) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS115_d (g : PublicOfficer) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS116_a1 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS116_a2 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS116_a3 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS116_b (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS116_c (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS117_a (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS118 (p : Person) (o : Official) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS119_a (p : Person) (o : Official) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS152_p1 (p : Person) (e : EstateProperty) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS152_p2 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS152_p3 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS152_p4 (p : Person) (e : EstateProperty) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS152_p5 (p : Person) (e : EstateProperty) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS152_p6 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS152_p7 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS152_p8 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS152_p9 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS153_a (p : Person) (e : EstateProperty) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS154_p1 (p : Person) (e : EstateProperty) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS154_p2 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS154_p3 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS155 (p : Person) (k : Case11) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS156_b (p : Person) (k : Case11) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS157_p1 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS157_p2 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS157_p3 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS158_a (g : PublicOfficer) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS158_c (g : PublicOfficer) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS158_d (g : PublicOfficer) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS175_a (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS175_b (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS175a (g : PublicOfficer) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS175b_a1A (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS175b_a1B (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS175b_b1 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS175b_b2 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS175b_c1 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS175b_c2 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS175c_a1 (p : Person) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS176_a1 (g : PublicOfficer) (b : BioMaterial) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS176_a2 (g : PublicOfficer) (b : BioMaterial) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS176_b (g : PublicOfficer) (b : BioMaterial) (c : ComplaintText) : Prop




axiom RegulatedActOccurredS177_a (g : PublicOfficer) (c : ComplaintText) : Prop




axiom ConditionMetS111_a1 (o : Official) (c : ComplaintText) : Prop




axiom ConditionMetS111_a2 (o : Official) (c : ComplaintText) : Prop




axiom ConditionMetS112_a (o : Official) (c : ComplaintText) : Prop




axiom ConditionMetS112_b3 (c : ComplaintText) : Prop




axiom ConditionMetS112_d (p : Person) (c : ComplaintText) : Prop




axiom ConditionMetS112_e (c : ComplaintText) : Prop




axiom ConditionMetS112_f (c : ComplaintText) : Prop




axiom ConditionMetS114 (p : Person) (c : ComplaintText) : Prop




axiom ConditionMetS115_a1 (p : Person) (o : Official) (c : ComplaintText) : Prop




axiom ConditionMetS115_a2 (p : Person) (o : Official) (c : ComplaintText) : Prop




axiom ConditionMetS116_d (c : ComplaintText) : Prop




axiom ConditionMetS116_b (p : Person) (c : ComplaintText) : Prop




axiom ConditionMetS117_a (p : Person) (c : ComplaintText) : Prop




axiom ConditionMetS117_juris (c : ComplaintText) : Prop




axiom ConditionMetS118 (o : Official) (c : ComplaintText) : Prop




axiom ConditionMetS119_a1 (p : Person) (o : Official) (c : ComplaintText) : Prop




axiom ConditionMetS119_a2 (p : Person) (o : Official) (c : ComplaintText) : Prop




axiom ConditionMetS152 (k : Case11) (c : ComplaintText) : Prop




axiom ConditionMetS153 (e : EstateProperty) (c : ComplaintText) : Prop




axiom ConditionMetS154_p2 (c : ComplaintText) : Prop




axiom ConditionMetS155 (k : Case11) (c : ComplaintText) : Prop




axiom ConditionMetS156_b (k : Case11) (c : ComplaintText) : Prop




axiom ConditionMetS157 (p : Person) (c : ComplaintText) : Prop




axiom ConditionMetS175_a (b : BioMaterial) (c : ComplaintText) : Prop




axiom ConditionMetS175_b (b : BioMaterial) (c : ComplaintText) : Prop




axiom ConditionMetS175a (c : ComplaintText) : Prop




axiom ConditionMetS175b_a2 (b : BioMaterial) (c : ComplaintText) : Prop




axiom ConditionMetS175b_b1 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop




axiom ConditionMetS175b_b2 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop




axiom ConditionMetS175b_c1 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop




axiom ConditionMetS175b_c2 (p : Person) (b : BioMaterial) (c : ComplaintText) : Prop




axiom ConditionMetS175b_exempt (c : ComplaintText) : Prop




axiom ConditionMetS175c_b (c : ComplaintText) : Prop




axiom ConditionMetS175c_a2 (p : Person) (c : ComplaintText) : Prop




axiom ConditionMetS176_a1 (b : BioMaterial) (c : ComplaintText) : Prop




axiom ConditionMetS176_a2 (c : ComplaintText) : Prop




axiom ConditionMetS176_b (b : BioMaterial) (c : ComplaintText) : Prop




axiom ConditionMetS176_c (b : BioMaterial) (c : ComplaintText) : Prop




axiom ConditionMetS177_a1 (c : ComplaintText) : Prop




axiom ConditionMetS177_a2 (c : ComplaintText) : Prop




axiom ConditionMetS177_a3 (b : BioMaterial) (c : ComplaintText) : Prop




axiom ConditionMetS177_b (b : BioMaterial) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic
