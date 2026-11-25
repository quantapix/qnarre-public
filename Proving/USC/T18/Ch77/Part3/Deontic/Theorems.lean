






import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part3.Deontic.Types
import Proving.USC.T18.Ch77.Part3.Deontic.Predicates
import Proving.USC.T18.Ch77.Part3.Deontic.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part3.Deontic

open Proving.USC.Common




theorem obligation1593a_intro {ct : Court} {o : ChapterOffense} {c : ComplaintText}
    (hAddr : IsSentencingCourt ct c) (hCond : OffenseUnderChapter77 o c) :
    Obligation1593a ct o c :=
  ⟨hAddr, hCond⟩


theorem obligationBreached1593a_intro {ct : Court} {o : ChapterOffense} {c : ComplaintText}
    (hAddr : IsSentencingCourt ct c) (hCond : OffenseUnderChapter77 o c)
    (hNoAct : ¬ CourtOrderedRestitution ct o c) :
    ObligationBreached1593a ct o c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩


theorem obligationSatisfied1593a_intro {ct : Court} {o : ChapterOffense} {c : ComplaintText}
    (hAddr : IsSentencingCourt ct c) (hCond : OffenseUnderChapter77 o c)
    (hAct : CourtOrderedRestitution ct o c) :
    ObligationSatisfied1593a ct o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem permission1593a_intro {ct : Court} {o : ChapterOffense} {c : ComplaintText}
    (hAddr : IsSentencingCourt ct c) (hCond : OtherPenaltyAuthorizedByLaw ct o c) :
    Permission1593a ct o c :=
  ⟨hAddr, hCond⟩


theorem permissionExercised1593a_intro {ct : Court} {o : ChapterOffense} {c : ComplaintText}
    (hAddr : IsSentencingCourt ct c) (hCond : OtherPenaltyAuthorizedByLaw ct o c)
    (hAct : CourtImposedAdditionalPenalty ct o c) :
    PermissionExercised1593a ct o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem obligation1593b1_intro {r : RestitutionOrder} {o : ChapterOffense}
    {d : Person} {v : Person} {c : ComplaintText}
    (hSubj : IsOrderUnderSection1593 r c) (hDef : IsDefendantForOffense d o c)
    (hCond : IsVictimUnderSection1593 v o c) :
    Obligation1593b1 r o d v c :=
  ⟨hSubj, hDef, hCond⟩


theorem obligationSatisfied1593b1_intro {r : RestitutionOrder} {o : ChapterOffense}
    {d : Person} {v : Person} {c : ComplaintText}
    (hSubj : IsOrderUnderSection1593 r c) (hDef : IsDefendantForOffense d o c)
    (hCond : IsVictimUnderSection1593 v o c)
    (hPay : OrderDirectsDefendantToPayFullAmount r d v c)
    (hMech : PaymentRoutedThroughCourtMechanism r c) :
    ObligationSatisfied1593b1 r o d v c :=
  ⟨⟨hSubj, hDef, hCond⟩, hPay, hMech⟩


theorem obligationBreached1593b1_intro {r : RestitutionOrder} {o : ChapterOffense}
    {d : Person} {v : Person} {c : ComplaintText}
    (hSubj : IsOrderUnderSection1593 r c) (hDef : IsDefendantForOffense d o c)
    (hCond : IsVictimUnderSection1593 v o c)
    (hNoAct : ¬ (OrderDirectsDefendantToPayFullAmount r d v c
                  ∧ PaymentRoutedThroughCourtMechanism r c)) :
    ObligationBreached1593b1 r o d v c :=
  ⟨⟨hSubj, hDef, hCond⟩, hNoAct⟩




theorem obligation1593b2_intro {r : RestitutionOrder} {c : ComplaintText}
    (hSubj : IsOrderUnderSection1593 r c) :
    Obligation1593b2 r c :=
  ⟨hSubj⟩


theorem obligationSatisfied1593b2_intro {r : RestitutionOrder} {c : ComplaintText}
    (hSubj : IsOrderUnderSection1593 r c)
    (hAct : OrderIssuedAndEnforcedUnderSection3664 r c) :
    ObligationSatisfied1593b2 r c :=
  ⟨⟨hSubj⟩, hAct⟩


theorem obligationBreached1593b2_intro {r : RestitutionOrder} {c : ComplaintText}
    (hSubj : IsOrderUnderSection1593 r c)
    (hNoAct : ¬ OrderIssuedAndEnforcedUnderSection3664 r c) :
    ObligationBreached1593b2 r c :=
  ⟨⟨hSubj⟩, hNoAct⟩




theorem definition1593b3_intro {r : RestitutionOrder} {v : Person} {c : ComplaintText}
    (hSubj : IsOrderUnderSection1593 r c)
    (hMeaning : LossesMeasuredAsUnderSection2259 r v c) :
    Definition1593b3 r v c :=
  ⟨hSubj, hMeaning⟩


theorem obligation1593b3_intro {r : RestitutionOrder} {o : ChapterOffense}
    {d : Person} {v : Person} {c : ComplaintText}
    (hSubj : IsOrderUnderSection1593 r c) (hDef : IsDefendantForOffense d o c)
    (hCond : IsVictimUnderSection1593 v o c) :
    Obligation1593b3 r o d v c :=
  ⟨hSubj, hDef, hCond⟩


theorem obligationSatisfied1593b3_intro {r : RestitutionOrder} {o : ChapterOffense}
    {d : Person} {v : Person} {c : ComplaintText}
    (hSubj : IsOrderUnderSection1593 r c) (hDef : IsDefendantForOffense d o c)
    (hCond : IsVictimUnderSection1593 v o c)
    (hAct : AmountIncludesGreaterOfGrossIncomeOrLaborValue r d v c) :
    ObligationSatisfied1593b3 r o d v c :=
  ⟨⟨hSubj, hDef, hCond⟩, hAct⟩


theorem obligationBreached1593b3_intro {r : RestitutionOrder} {o : ChapterOffense}
    {d : Person} {v : Person} {c : ComplaintText}
    (hSubj : IsOrderUnderSection1593 r c) (hDef : IsDefendantForOffense d o c)
    (hCond : IsVictimUnderSection1593 v o c)
    (hNoAct : ¬ AmountIncludesGreaterOfGrossIncomeOrLaborValue r d v c) :
    ObligationBreached1593b3 r o d v c :=
  ⟨⟨hSubj, hDef, hCond⟩, hNoAct⟩




theorem obligation1593b4_intro {f : ForfeitableProperty} {r : RestitutionOrder}
    {c : ComplaintText}
    (hSubj : IsOrderUnderSection1593 r c) (hCond : IsForfeitureUnderSubsectionB f r c) :
    Obligation1593b4 f r c :=
  ⟨hSubj, hCond⟩


theorem obligationSatisfied1593b4_intro {f : ForfeitableProperty} {r : RestitutionOrder}
    {c : ComplaintText}
    (hSubj : IsOrderUnderSection1593 r c) (hCond : IsForfeitureUnderSubsectionB f r c)
    (hAct : ForfeitureGovernedBySection853 f c) :
    ObligationSatisfied1593b4 f r c :=
  ⟨⟨hSubj, hCond⟩, hAct⟩


theorem obligationBreached1593b4_intro {f : ForfeitableProperty} {r : RestitutionOrder}
    {c : ComplaintText}
    (hSubj : IsOrderUnderSection1593 r c) (hCond : IsForfeitureUnderSubsectionB f r c)
    (hNoAct : ¬ ForfeitureGovernedBySection853 f c) :
    ObligationBreached1593b4 f r c :=
  ⟨⟨hSubj, hCond⟩, hNoAct⟩





theorem victimRoute1593c_intro {p : Person} {o : ChapterOffense} {c : ComplaintText}
    (hHarmed : IsIndividualHarmedByChapter77Crime p o c) :
    VictimRoute1593c p o c :=
  VictimRoute1593c.harmedIndividual hHarmed


theorem victimRoute1593c_intro_ofStandIn {p : Person} {v : Person}
    {o : ChapterOffense} {c : ComplaintText}
    (hHarmed : IsIndividualHarmedByChapter77Crime v o c)
    (hStatus : VictimIsMinorIncompetentIncapacitatedOrDeceased v c)
    (hStandIn : IsAuthorizedVictimStandIn p v c) :
    VictimRoute1593c p o c :=
  VictimRoute1593c.authorizedStandIn v hHarmed hStatus hStandIn




theorem prohibition1593c_intro {ct : Court} {o : ChapterOffense}
    {d : Person} {v : Person} {c : ComplaintText}
    (hAddr : IsSentencingCourt ct c) (hDef : IsDefendantForOffense d o c)
    (hCond : IsVictimUnderSection1593 v o c) :
    Prohibition1593c ct o d v c :=
  ⟨hAddr, hDef, hCond⟩


theorem prohibitionViolated1593c_intro {ct : Court} {o : ChapterOffense}
    {d : Person} {v : Person} {c : ComplaintText}
    (hAddr : IsSentencingCourt ct c) (hDef : IsDefendantForOffense d o c)
    (hCond : IsVictimUnderSection1593 v o c)
    (hAct : CourtNamedAsVictimRepresentative ct d v c) :
    ProhibitionViolated1593c ct o d v c :=
  ⟨⟨hAddr, hDef, hCond⟩, hAct⟩




theorem section1593NormBroken_intro {ct : Court} {r : RestitutionOrder}
    {o : ChapterOffense} {d : Person} {v : Person} {f : ForfeitableProperty}
    {c : ComplaintText}
    (h : ObligationBreached1593a ct o c) :
    Section1593NormBroken ct r o d v f c :=
  Section1593NormBroken.restitutionNotOrdered h


theorem section1593NormBroken_intro_ofOrderContent {ct : Court} {r : RestitutionOrder}
    {o : ChapterOffense} {d : Person} {v : Person} {f : ForfeitableProperty}
    {c : ComplaintText}
    (h : ObligationBreached1593b1 r o d v c) :
    Section1593NormBroken ct r o d v f c :=
  Section1593NormBroken.orderOmitsFullAmount h


theorem section1593NormBroken_intro_ofIssuance {ct : Court} {r : RestitutionOrder}
    {o : ChapterOffense} {d : Person} {v : Person} {f : ForfeitableProperty}
    {c : ComplaintText}
    (h : ObligationBreached1593b2 r c) :
    Section1593NormBroken ct r o d v f c :=
  Section1593NormBroken.orderNotIssuedUnderSection3664 h


theorem section1593NormBroken_intro_ofLaborValueFloor {ct : Court} {r : RestitutionOrder}
    {o : ChapterOffense} {d : Person} {v : Person} {f : ForfeitableProperty}
    {c : ComplaintText}
    (h : ObligationBreached1593b3 r o d v c) :
    Section1593NormBroken ct r o d v f c :=
  Section1593NormBroken.amountOmitsLaborValueFloor h


theorem section1593NormBroken_intro_ofForfeitureRouting {ct : Court} {r : RestitutionOrder}
    {o : ChapterOffense} {d : Person} {v : Person} {f : ForfeitableProperty}
    {c : ComplaintText}
    (h : ObligationBreached1593b4 f r c) :
    Section1593NormBroken ct r o d v f c :=
  Section1593NormBroken.forfeitureNotGovernedBySection853 h


theorem section1593NormBroken_intro_ofBarredAppointment {ct : Court} {r : RestitutionOrder}
    {o : ChapterOffense} {d : Person} {v : Person} {f : ForfeitableProperty}
    {c : ComplaintText}
    (h : ProhibitionViolated1593c ct o d v c) :
    Section1593NormBroken ct r o d v f c :=
  Section1593NormBroken.defendantNamedAsRepresentative h


theorem section1593Complied_intro {ct : Court} {r : RestitutionOrder}
    {o : ChapterOffense} {d : Person} {v : Person} {f : ForfeitableProperty}
    {c : ComplaintText}
    (hOrder : ObligationSatisfied1593a ct o c)
    (hContent : ObligationSatisfied1593b1 r o d v c)
    (hIssuance : ObligationSatisfied1593b2 r c)
    (hFloor : ObligationSatisfied1593b3 r o d v c)
    (hForfeiture : ObligationSatisfied1593b4 f r c)
    (hNoAppointment : ¬ ProhibitionViolated1593c ct o d v c) :
    Section1593Complied ct r o d v f c :=
  ⟨hOrder, hContent, hIssuance, hFloor, hForfeiture, hNoAppointment⟩

end Proving.USC.T18.Ch77.Part3.Deontic
