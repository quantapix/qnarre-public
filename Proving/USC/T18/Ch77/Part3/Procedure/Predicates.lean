import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part3.Procedure.Types

set_option autoImplicit false











namespace Proving.USC.T18.Ch77.Part3.Procedure

open Proving.USC.Common




axiom OffenseUnderChapter77Established (d : Person) (c : ComplaintText) : Prop





axiom RestitutionNotWithheldUnderGeneralRestitutionProvisions (o : RestitutionOrder) (c : ComplaintText) : Prop




axiom CourtOrderedRestitution (o : RestitutionOrder) (d : Person) (c : ComplaintText) : Prop





axiom RestitutionAdditionalToOtherPenalties (o : RestitutionOrder) (c : ComplaintText) : Prop




axiom OrderDirectsDefendantToPayVictim (o : RestitutionOrder) (d payee : Person) (c : ComplaintText) : Prop




axiom PaymentRoutedThroughCourtMechanism (o : RestitutionOrder) (c : ComplaintText) : Prop




axiom orderedRestitutionAmount (o : RestitutionOrder) (c : ComplaintText) : Nat




axiom section2259LossAmount (v : Person) (c : ComplaintText) : Nat




axiom grossIncomeOrValueToDefendantOfVictimServices (v d : Person) (c : ComplaintText) : Nat





axiom flsaGuaranteedValueOfVictimLabor (v : Person) (c : ComplaintText) : Nat




axiom OrderIssuedInAccordanceWithSection3664 (o : RestitutionOrder) (c : ComplaintText) : Prop




axiom OrderEnforcedInAccordanceWithSection3664 (o : RestitutionOrder) (c : ComplaintText) : Prop





axiom ForfeitureGovernedBySection853ExceptSubsectionD (p : ForfeitableProperty) (c : ComplaintText) : Prop




axiom IsIndividualHarmedByChapter77Crime (v : Person) (c : ComplaintText) : Prop





axiom victimAgeInYears (v : Person) (c : ComplaintText) : Nat



axiom VictimIsIncompetent (v : Person) (c : ComplaintText) : Prop



axiom VictimIsIncapacitated (v : Person) (c : ComplaintText) : Prop



axiom VictimIsDeceased (v : Person) (c : ComplaintText) : Prop



axiom IsLegalGuardianOfVictim (r v : Person) (c : ComplaintText) : Prop



axiom IsRepresentativeOfVictimsEstate (r v : Person) (c : ComplaintText) : Prop




axiom IsFamilyMemberOfVictim (r v : Person) (c : ComplaintText) : Prop




axiom IsCourtAppointedSuitableRepresentative (r v : Person) (c : ComplaintText) : Prop







axiom IsDefendantInChapter77Proceeding (x : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Part3.Procedure
