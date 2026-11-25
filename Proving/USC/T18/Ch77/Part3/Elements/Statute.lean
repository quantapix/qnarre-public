





import Proving.USC.T18.Ch77.Part3.Elements.Types
import Proving.USC.T18.Ch77.Part3.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part3.Elements

open Proving.USC.Common




structure Section1593a (d : Person) (o : Offense) (c : ComplaintText) : Prop where
  chapter77Offense : IsChapter77Offense o c
  convicted : DefendantConvictedOfOffense d o c




structure DirectVictim (v : Person) (o : Offense) (c : ComplaintText) : Prop where
  individualHarmed : IsIndividualHarmed v o c
  causation : ProximateCause v c




inductive RepresentationTrigger (v : Person) (c : ComplaintText) : Prop where
  | underEighteen (h : VictimUnderEighteen v c)
  | incompetent (h : VictimIncompetent v c)
  | incapacitated (h : VictimIncapacitated v c)
  | deceased (h : VictimDeceased v c)



inductive RepresentativeCapacity (r : Person) (v : Person) (c : ComplaintText) : Prop where
  | legalGuardian (h : IsLegalGuardianOfVictim r v c)
  | estateRepresentative (h : IsRepresentativeOfVictimEstate r v c)
  | familyMember (h : IsFamilyMemberOfVictim r v c)
  | courtAppointed (h : IsCourtAppointedSuitablePerson r v c)




structure VictimRepresentative
    (r : Person) (harmed : Person) (o : Offense) (c : ComplaintText) : Prop where
  trigger : RepresentationTrigger harmed c
  capacity : RepresentativeCapacity r harmed c
  notDefendant : ¬ IsDefendantInOffense r o c



inductive Victim1593c
    (payee : Person) (harmed : Person) (o : Offense) (c : ComplaintText) : Prop where
  | direct (h : payee = harmed)
  | representative (h : VictimRepresentative payee harmed o c)





noncomputable def fullAmountOfVictimsLosses (harmed : Person) (d : Person) (c : ComplaintText) : Nat :=
  section2259LossAmount harmed c
    + max (grossIncomeOrValueToDefendantOfVictimServices harmed d c)
          (flsaGuaranteedValueOfVictimLabor harmed c)




abbrev OrderAwardsFullAmountOfVictimsLosses
    (ord : RestitutionOrder) (harmed : Person) (d : Person) (c : ComplaintText) : Prop :=
  orderedRestitutionAmount ord c = fullAmountOfVictimsLosses harmed d c



structure Section1593b
    (ord : RestitutionOrder) (payee : Person) (harmed : Person) (d : Person)
    (c : ComplaintText) : Prop where
  directsPayment : OrderDirectsDefendantToPayVictim ord d payee c
  courtMechanism : PaymentThroughCourtMechanism ord c
  fullAmount : OrderAwardsFullAmountOfVictimsLosses ord harmed d c
  section3664 : OrderIssuedAndEnforcedUnderSection3664 ord c






structure Section1593b4 (pr : Property) (c : ComplaintText) : Prop where
  governedByCSA413 : ForfeitureGovernedBySection853 pr c




structure Section1593
    (d : Person) (o : Offense) (payee : Person) (harmed : Person)
    (ord : RestitutionOrder) (c : ComplaintText) : Prop where
  trigger : Section1593a d o c
  harmedIsVictim : DirectVictim harmed o c
  payeeQualifies : Victim1593c payee harmed o c
  order : Section1593b ord payee harmed d c

end Proving.USC.T18.Ch77.Part3.Elements
