




import Proving.USC.T18.Ch77.Part3.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part3.Elements

open Proving.USC.Common




axiom IsChapter77Offense (o : Offense) (c : ComplaintText) : Prop




axiom DefendantConvictedOfOffense (d : Person) (o : Offense) (c : ComplaintText) : Prop




axiom IsIndividualHarmed (v : Person) (o : Offense) (c : ComplaintText) : Prop



axiom VictimUnderEighteen (v : Person) (c : ComplaintText) : Prop



axiom VictimIncompetent (v : Person) (c : ComplaintText) : Prop



axiom VictimIncapacitated (v : Person) (c : ComplaintText) : Prop



axiom VictimDeceased (v : Person) (c : ComplaintText) : Prop



axiom IsLegalGuardianOfVictim (r : Person) (v : Person) (c : ComplaintText) : Prop




axiom IsRepresentativeOfVictimEstate (r : Person) (v : Person) (c : ComplaintText) : Prop



axiom IsFamilyMemberOfVictim (r : Person) (v : Person) (c : ComplaintText) : Prop




axiom IsCourtAppointedSuitablePerson (r : Person) (v : Person) (c : ComplaintText) : Prop





axiom IsDefendantInOffense (p : Person) (o : Offense) (c : ComplaintText) : Prop



axiom OrderDirectsDefendantToPayVictim
    (ord : RestitutionOrder) (d : Person) (v : Person) (c : ComplaintText) : Prop



axiom PaymentThroughCourtMechanism (ord : RestitutionOrder) (c : ComplaintText) : Prop




axiom OrderIssuedAndEnforcedUnderSection3664 (ord : RestitutionOrder) (c : ComplaintText) : Prop




axiom ForfeitureGovernedBySection853 (pr : Property) (c : ComplaintText) : Prop




axiom section2259LossAmount (v : Person) (c : ComplaintText) : Nat




axiom grossIncomeOrValueToDefendantOfVictimServices
    (v : Person) (d : Person) (c : ComplaintText) : Nat





axiom flsaGuaranteedValueOfVictimLabor (v : Person) (c : ComplaintText) : Nat



axiom orderedRestitutionAmount (ord : RestitutionOrder) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch77.Part3.Elements
