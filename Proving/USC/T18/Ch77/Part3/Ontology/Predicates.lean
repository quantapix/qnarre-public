










import Proving.USC.T18.Ch77.Part3.Ontology.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part3.Ontology

open Proving.USC.Common






axiom IsOffenseUnderThisChapter (o : Offense) (c : ComplaintText) : Prop




axiom HarmResultedFromOffense (p : Person) (o : Offense) (c : ComplaintText) : Prop




axiom IsUnderEighteen (p : Person) (c : ComplaintText) : Prop



axiom IsIncompetent (p : Person) (c : ComplaintText) : Prop



axiom IsIncapacitated (p : Person) (c : ComplaintText) : Prop



axiom IsDeceased (p : Person) (c : ComplaintText) : Prop




axiom IsLegalGuardianOf (r p : Person) (c : ComplaintText) : Prop



axiom IsRepresentativeOfEstateOf (r p : Person) (c : ComplaintText) : Prop



axiom IsFamilyMemberOf (r p : Person) (c : ComplaintText) : Prop



axiom IsCourtAppointedSuitablePerson (r p : Person) (c : ComplaintText) : Prop





axiom IsDefendant (r : Person) (c : ComplaintText) : Prop






axiom IsOrderOfRestitutionUnderSection1593 (ord : RestitutionOrder) (c : ComplaintText) : Prop




axiom DirectsPaymentToVictim (ord : RestitutionOrder) (p : Person) (c : ComplaintText) : Prop




axiom IssuedAndEnforcedUnderSection3664 (ord : RestitutionOrder) (c : ComplaintText) : Prop






axiom IsPropertySubjectToForfeiture (pr : Property) (c : ComplaintText) : Prop





axiom GovernedBySection853 (pr : Property) (c : ComplaintText) : Prop









axiom section2259c2LossAmount (p : Person) (c : ComplaintText) : Nat




axiom grossIncomeOrValueToDefendant (p : Person) (c : ComplaintText) : Nat





axiom flsaGuaranteedLaborValue (p : Person) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch77.Part3.Ontology
