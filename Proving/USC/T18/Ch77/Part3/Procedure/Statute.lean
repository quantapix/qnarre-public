import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part3.Procedure.Types
import Proving.USC.T18.Ch77.Part3.Procedure.Predicates

set_option autoImplicit false









namespace Proving.USC.T18.Ch77.Part3.Procedure

open Proving.USC.Common








noncomputable def fullAmountOfVictimsLosses (v d : Person) (c : ComplaintText) : Nat :=
  section2259LossAmount v c
    + max (grossIncomeOrValueToDefendantOfVictimServices v d c)
          (flsaGuaranteedValueOfVictimLabor v c)





def OrderedAmountIsFullAmount (o : RestitutionOrder) (v d : Person) (c : ComplaintText) : Prop :=
  orderedRestitutionAmount o c = fullAmountOfVictimsLosses v d c






def VictimIsUnderEighteen (v : Person) (c : ComplaintText) : Prop :=
  victimAgeInYears v c < 18




def RepresentationTriggered (v : Person) (c : ComplaintText) : Prop :=
  VictimIsUnderEighteen v c ∨ VictimIsIncompetent v c ∨
    VictimIsIncapacitated v c ∨ VictimIsDeceased v c



inductive RepresentativeCapacity (r v : Person) (c : ComplaintText) : Prop where
  | legalGuardian : IsLegalGuardianOfVictim r v c → RepresentativeCapacity r v c
  | estateRepresentative : IsRepresentativeOfVictimsEstate r v c → RepresentativeCapacity r v c
  | familyMember : IsFamilyMemberOfVictim r v c → RepresentativeCapacity r v c
  | courtAppointed : IsCourtAppointedSuitableRepresentative r v c → RepresentativeCapacity r v c










inductive VictimForRestitution (payee victim : Person) (c : ComplaintText) : Prop where
  | direct
      (harmed : IsIndividualHarmedByChapter77Crime victim c)
      (isTheVictim : payee = victim) :
      VictimForRestitution payee victim c
  | throughRepresentative
      (harmed : IsIndividualHarmedByChapter77Crime victim c)
      (triggered : RepresentationTriggered victim c)
      (capacity : RepresentativeCapacity payee victim c)
      (notDefendant : ¬ IsDefendantInChapter77Proceeding payee c) :
      VictimForRestitution payee victim c







structure MandatoryRestitutionOrdered (d : Person) (o : RestitutionOrder) (c : ComplaintText) : Prop where
  offenseEstablished : OffenseUnderChapter77Established d c
  notWithheld : RestitutionNotWithheldUnderGeneralRestitutionProvisions o c
  ordered : CourtOrderedRestitution o d c
  additionalToOtherPenalties : RestitutionAdditionalToOtherPenalties o c




structure OrderContentCompliant (o : RestitutionOrder) (d payee victim : Person) (c : ComplaintText) : Prop where
  directsPayment : OrderDirectsDefendantToPayVictim o d payee c
  throughCourtMechanism : PaymentRoutedThroughCourtMechanism o c
  fullAmount : OrderedAmountIsFullAmount o victim d c


structure OrderProcedurallyCompliant (o : RestitutionOrder) (c : ComplaintText) : Prop where
  issuedUnder3664 : OrderIssuedInAccordanceWithSection3664 o c
  enforcedUnder3664 : OrderEnforcedInAccordanceWithSection3664 o c


structure ForfeitureProcedureCompliant (p : ForfeitableProperty) (c : ComplaintText) : Prop where
  governedBySection853 : ForfeitureGovernedBySection853ExceptSubsectionD p c



structure Section1593Compliant (d payee victim : Person) (o : RestitutionOrder) (c : ComplaintText) : Prop where
  mandate : MandatoryRestitutionOrdered d o c
  standing : VictimForRestitution payee victim c
  content : OrderContentCompliant o d payee victim c
  route : OrderProcedurallyCompliant o c





def s1593TransitionTable (d payee victim : Person) (o : RestitutionOrder) (c : ComplaintText) :
    List RestitutionTransition :=
  [ { source := RestitutionStage.offenseAdjudicated
    , target := RestitutionStage.victimIdentified
    , guard := VictimForRestitution payee victim c }
  , { source := RestitutionStage.victimIdentified
    , target := RestitutionStage.lossAmountDetermined
    , guard := OrderedAmountIsFullAmount o victim d c }
  , { source := RestitutionStage.lossAmountDetermined
    , target := RestitutionStage.restitutionOrdered
    , guard := MandatoryRestitutionOrdered d o c ∧ OrderContentCompliant o d payee victim c ∧
        OrderIssuedInAccordanceWithSection3664 o c }
  , { source := RestitutionStage.restitutionOrdered
    , target := RestitutionStage.orderEnforced
    , guard := OrderEnforcedInAccordanceWithSection3664 o c } ]




inductive RestitutionStageReached (d payee victim : Person) (o : RestitutionOrder) (c : ComplaintText) :
    RestitutionStage → Prop where
  | adjudicated
      (trigger : OffenseUnderChapter77Established d c) :
      RestitutionStageReached d payee victim o c RestitutionStage.offenseAdjudicated
  | victimIdentified
      (prev : RestitutionStageReached d payee victim o c RestitutionStage.offenseAdjudicated)
      (standing : VictimForRestitution payee victim c) :
      RestitutionStageReached d payee victim o c RestitutionStage.victimIdentified
  | lossDetermined
      (prev : RestitutionStageReached d payee victim o c RestitutionStage.victimIdentified)
      (amount : OrderedAmountIsFullAmount o victim d c) :
      RestitutionStageReached d payee victim o c RestitutionStage.lossAmountDetermined
  | ordered
      (prev : RestitutionStageReached d payee victim o c RestitutionStage.lossAmountDetermined)
      (mandate : MandatoryRestitutionOrdered d o c)
      (content : OrderContentCompliant o d payee victim c)
      (issued : OrderIssuedInAccordanceWithSection3664 o c) :
      RestitutionStageReached d payee victim o c RestitutionStage.restitutionOrdered
  | enforced
      (prev : RestitutionStageReached d payee victim o c RestitutionStage.restitutionOrdered)
      (enforcement : OrderEnforcedInAccordanceWithSection3664 o c) :
      RestitutionStageReached d payee victim o c RestitutionStage.orderEnforced

end Proving.USC.T18.Ch77.Part3.Procedure
