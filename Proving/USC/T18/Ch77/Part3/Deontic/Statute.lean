



















import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part3.Deontic.Types
import Proving.USC.T18.Ch77.Part3.Deontic.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part3.Deontic

open Proving.USC.Common




def modality1593aOrder : Modality := Modality.obligation



def modality1593aCumulation : Modality := Modality.permission


def modality1593b1 : Modality := Modality.obligation



def modality1593b2 : Modality := Modality.obligation



def modality1593b3Definition : Modality := Modality.definition



def modality1593b3Inclusion : Modality := Modality.obligation



def modality1593b4 : Modality := Modality.obligation


def modality1593cDefinition : Modality := Modality.definition



def modality1593cProviso : Modality := Modality.prohibition













structure Obligation1593a (ct : Court) (o : ChapterOffense) (c : ComplaintText) : Prop where
  addressee : IsSentencingCourt ct c
  condition : OffenseUnderChapter77 o c



def ObligationBreached1593a (ct : Court) (o : ChapterOffense) (c : ComplaintText) : Prop :=
  Obligation1593a ct o c ∧ ¬ CourtOrderedRestitution ct o c



def ObligationSatisfied1593a (ct : Court) (o : ChapterOffense) (c : ComplaintText) : Prop :=
  Obligation1593a ct o c ∧ CourtOrderedRestitution ct o c





structure Permission1593a (ct : Court) (o : ChapterOffense) (c : ComplaintText) : Prop where
  addressee : IsSentencingCourt ct c
  condition : OtherPenaltyAuthorizedByLaw ct o c



def PermissionExercised1593a (ct : Court) (o : ChapterOffense) (c : ComplaintText) : Prop :=
  Permission1593a ct o c ∧ CourtImposedAdditionalPenalty ct o c





structure Obligation1593b1 (r : RestitutionOrder) (o : ChapterOffense)
    (d : Person) (v : Person) (c : ComplaintText) : Prop where
  subject : IsOrderUnderSection1593 r c
  defendant : IsDefendantForOffense d o c
  condition : IsVictimUnderSection1593 v o c




def ObligationSatisfied1593b1 (r : RestitutionOrder) (o : ChapterOffense)
    (d : Person) (v : Person) (c : ComplaintText) : Prop :=
  Obligation1593b1 r o d v c
    ∧ OrderDirectsDefendantToPayFullAmount r d v c
    ∧ PaymentRoutedThroughCourtMechanism r c




def ObligationBreached1593b1 (r : RestitutionOrder) (o : ChapterOffense)
    (d : Person) (v : Person) (c : ComplaintText) : Prop :=
  Obligation1593b1 r o d v c
    ∧ ¬ (OrderDirectsDefendantToPayFullAmount r d v c ∧ PaymentRoutedThroughCourtMechanism r c)





structure Obligation1593b2 (r : RestitutionOrder) (c : ComplaintText) : Prop where
  subject : IsOrderUnderSection1593 r c



def ObligationSatisfied1593b2 (r : RestitutionOrder) (c : ComplaintText) : Prop :=
  Obligation1593b2 r c ∧ OrderIssuedAndEnforcedUnderSection3664 r c



def ObligationBreached1593b2 (r : RestitutionOrder) (c : ComplaintText) : Prop :=
  Obligation1593b2 r c ∧ ¬ OrderIssuedAndEnforcedUnderSection3664 r c







structure Definition1593b3 (r : RestitutionOrder) (v : Person) (c : ComplaintText) : Prop where
  subject : IsOrderUnderSection1593 r c
  incorporatedMeaning : LossesMeasuredAsUnderSection2259 r v c



structure Obligation1593b3 (r : RestitutionOrder) (o : ChapterOffense)
    (d : Person) (v : Person) (c : ComplaintText) : Prop where
  subject : IsOrderUnderSection1593 r c
  defendant : IsDefendantForOffense d o c
  condition : IsVictimUnderSection1593 v o c




def ObligationSatisfied1593b3 (r : RestitutionOrder) (o : ChapterOffense)
    (d : Person) (v : Person) (c : ComplaintText) : Prop :=
  Obligation1593b3 r o d v c ∧ AmountIncludesGreaterOfGrossIncomeOrLaborValue r d v c



def ObligationBreached1593b3 (r : RestitutionOrder) (o : ChapterOffense)
    (d : Person) (v : Person) (c : ComplaintText) : Prop :=
  Obligation1593b3 r o d v c ∧ ¬ AmountIncludesGreaterOfGrossIncomeOrLaborValue r d v c





structure Obligation1593b4 (f : ForfeitableProperty) (r : RestitutionOrder)
    (c : ComplaintText) : Prop where
  subject : IsOrderUnderSection1593 r c
  condition : IsForfeitureUnderSubsectionB f r c



def ObligationSatisfied1593b4 (f : ForfeitableProperty) (r : RestitutionOrder)
    (c : ComplaintText) : Prop :=
  Obligation1593b4 f r c ∧ ForfeitureGovernedBySection853 f c



def ObligationBreached1593b4 (f : ForfeitableProperty) (r : RestitutionOrder)
    (c : ComplaintText) : Prop :=
  Obligation1593b4 f r c ∧ ¬ ForfeitureGovernedBySection853 f c






inductive VictimRoute1593c (p : Person) (o : ChapterOffense) (c : ComplaintText) : Prop where

  | harmedIndividual : IsIndividualHarmedByChapter77Crime p o c → VictimRoute1593c p o c




  | authorizedStandIn (v : Person) :
      IsIndividualHarmedByChapter77Crime v o c →
      VictimIsMinorIncompetentIncapacitatedOrDeceased v c →
      IsAuthorizedVictimStandIn p v c →
      VictimRoute1593c p o c






structure Prohibition1593c (ct : Court) (o : ChapterOffense)
    (d : Person) (v : Person) (c : ComplaintText) : Prop where
  addressee : IsSentencingCourt ct c
  defendant : IsDefendantForOffense d o c
  condition : IsVictimUnderSection1593 v o c



def ProhibitionViolated1593c (ct : Court) (o : ChapterOffense)
    (d : Person) (v : Person) (c : ComplaintText) : Prop :=
  Prohibition1593c ct o d v c ∧ CourtNamedAsVictimRepresentative ct d v c





inductive Section1593NormBroken (ct : Court) (r : RestitutionOrder) (o : ChapterOffense)
    (d : Person) (v : Person) (f : ForfeitableProperty) (c : ComplaintText) : Prop where

  | restitutionNotOrdered :
      ObligationBreached1593a ct o c → Section1593NormBroken ct r o d v f c


  | orderOmitsFullAmount :
      ObligationBreached1593b1 r o d v c → Section1593NormBroken ct r o d v f c

  | orderNotIssuedUnderSection3664 :
      ObligationBreached1593b2 r c → Section1593NormBroken ct r o d v f c

  | amountOmitsLaborValueFloor :
      ObligationBreached1593b3 r o d v c → Section1593NormBroken ct r o d v f c

  | forfeitureNotGovernedBySection853 :
      ObligationBreached1593b4 f r c → Section1593NormBroken ct r o d v f c


  | defendantNamedAsRepresentative :
      ProhibitionViolated1593c ct o d v c → Section1593NormBroken ct r o d v f c



structure Section1593Complied (ct : Court) (r : RestitutionOrder) (o : ChapterOffense)
    (d : Person) (v : Person) (f : ForfeitableProperty) (c : ComplaintText) : Prop where
  mandatoryOrder : ObligationSatisfied1593a ct o c
  orderContent : ObligationSatisfied1593b1 r o d v c
  issuanceAndEnforcement : ObligationSatisfied1593b2 r c
  laborValueFloor : ObligationSatisfied1593b3 r o d v c
  forfeitureRouting : ObligationSatisfied1593b4 f r c
  noBarredAppointment : ¬ ProhibitionViolated1593c ct o d v c

end Proving.USC.T18.Ch77.Part3.Deontic
