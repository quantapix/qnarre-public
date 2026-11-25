import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part3.Procedure.Types
import Proving.USC.T18.Ch77.Part3.Procedure.Predicates
import Proving.USC.T18.Ch77.Part3.Procedure.Statute

set_option autoImplicit false








namespace Proving.USC.T18.Ch77.Part3.Procedure

open Proving.USC.Common



theorem mandatoryRestitutionOrdered_intro
    {d : Person} {o : RestitutionOrder} {c : ComplaintText}
    (hOffense : OffenseUnderChapter77Established d c)
    (hNotWithheld : RestitutionNotWithheldUnderGeneralRestitutionProvisions o c)
    (hOrdered : CourtOrderedRestitution o d c)
    (hAdditional : RestitutionAdditionalToOtherPenalties o c) :
    MandatoryRestitutionOrdered d o c :=
  ⟨hOffense, hNotWithheld, hOrdered, hAdditional⟩



theorem orderContentCompliant_intro
    {o : RestitutionOrder} {d payee victim : Person} {c : ComplaintText}
    (hDirects : OrderDirectsDefendantToPayVictim o d payee c)
    (hMechanism : PaymentRoutedThroughCourtMechanism o c)
    (hAmount : OrderedAmountIsFullAmount o victim d c) :
    OrderContentCompliant o d payee victim c :=
  ⟨hDirects, hMechanism, hAmount⟩





theorem orderedAmountIsFullAmount_intro
    {o : RestitutionOrder} {v d : Person} {c : ComplaintText}
    (hEq : orderedRestitutionAmount o c = fullAmountOfVictimsLosses v d c) :
    OrderedAmountIsFullAmount o v d c :=
  hEq





theorem orderedAmountIsFullAmount_of_facts
    {o : RestitutionOrder} {v d : Person} {c : ComplaintText}
    {ordered s2259 gross flsa : Nat}
    (hOrdered : orderedRestitutionAmount o c = ordered)
    (hLosses : section2259LossAmount v c = s2259)
    (hGross : grossIncomeOrValueToDefendantOfVictimServices v d c = gross)
    (hFlsa : flsaGuaranteedValueOfVictimLabor v c = flsa)
    (hCalc : ordered = s2259 + max gross flsa) :
    OrderedAmountIsFullAmount o v d c := by
  unfold OrderedAmountIsFullAmount fullAmountOfVictimsLosses
  omega


theorem fullAmountOfVictimsLosses_eq (v d : Person) (c : ComplaintText) :
    fullAmountOfVictimsLosses v d c
      = section2259LossAmount v c
        + max (grossIncomeOrValueToDefendantOfVictimServices v d c)
              (flsaGuaranteedValueOfVictimLabor v c) :=
  rfl




theorem fullAmountOfVictimsLosses_ge_grossIncome (v d : Person) (c : ComplaintText) :
    grossIncomeOrValueToDefendantOfVictimServices v d c ≤ fullAmountOfVictimsLosses v d c := by
  unfold fullAmountOfVictimsLosses
  omega



theorem fullAmountOfVictimsLosses_ge_flsaValue (v d : Person) (c : ComplaintText) :
    flsaGuaranteedValueOfVictimLabor v c ≤ fullAmountOfVictimsLosses v d c := by
  unfold fullAmountOfVictimsLosses
  omega



theorem orderProcedurallyCompliant_intro
    {o : RestitutionOrder} {c : ComplaintText}
    (hIssued : OrderIssuedInAccordanceWithSection3664 o c)
    (hEnforced : OrderEnforcedInAccordanceWithSection3664 o c) :
    OrderProcedurallyCompliant o c :=
  ⟨hIssued, hEnforced⟩



theorem forfeitureProcedureCompliant_intro
    {p : ForfeitableProperty} {c : ComplaintText}
    (hGoverned : ForfeitureGovernedBySection853ExceptSubsectionD p c) :
    ForfeitureProcedureCompliant p c :=
  ⟨hGoverned⟩



theorem victimIsUnderEighteen_intro
    {v : Person} {c : ComplaintText}
    (hAge : victimAgeInYears v c < 18) :
    VictimIsUnderEighteen v c :=
  hAge




theorem victimIsUnderEighteen_of_facts
    {v : Person} {c : ComplaintText} {age : Nat}
    (hAge : victimAgeInYears v c = age) (hMinor : age < 18) :
    VictimIsUnderEighteen v c := by
  unfold VictimIsUnderEighteen
  omega

theorem representationTriggered_ofMinority_intro
    {v : Person} {c : ComplaintText}
    (h : VictimIsUnderEighteen v c) : RepresentationTriggered v c :=
  Or.inl h

theorem representationTriggered_ofIncompetence_intro
    {v : Person} {c : ComplaintText}
    (h : VictimIsIncompetent v c) : RepresentationTriggered v c :=
  Or.inr (Or.inl h)

theorem representationTriggered_ofIncapacity_intro
    {v : Person} {c : ComplaintText}
    (h : VictimIsIncapacitated v c) : RepresentationTriggered v c :=
  Or.inr (Or.inr (Or.inl h))

theorem representationTriggered_ofDeath_intro
    {v : Person} {c : ComplaintText}
    (h : VictimIsDeceased v c) : RepresentationTriggered v c :=
  Or.inr (Or.inr (Or.inr h))

theorem representativeCapacity_legalGuardian_intro
    {r v : Person} {c : ComplaintText}
    (h : IsLegalGuardianOfVictim r v c) : RepresentativeCapacity r v c :=
  .legalGuardian h

theorem representativeCapacity_estateRepresentative_intro
    {r v : Person} {c : ComplaintText}
    (h : IsRepresentativeOfVictimsEstate r v c) : RepresentativeCapacity r v c :=
  .estateRepresentative h

theorem representativeCapacity_familyMember_intro
    {r v : Person} {c : ComplaintText}
    (h : IsFamilyMemberOfVictim r v c) : RepresentativeCapacity r v c :=
  .familyMember h

theorem representativeCapacity_courtAppointed_intro
    {r v : Person} {c : ComplaintText}
    (h : IsCourtAppointedSuitableRepresentative r v c) : RepresentativeCapacity r v c :=
  .courtAppointed h

theorem victimForRestitution_direct_intro
    {victim : Person} {c : ComplaintText}
    (hHarmed : IsIndividualHarmedByChapter77Crime victim c) :
    VictimForRestitution victim victim c :=
  .direct hHarmed rfl





theorem victimForRestitution_throughRepresentative_intro
    {payee victim : Person} {c : ComplaintText}
    (hHarmed : IsIndividualHarmedByChapter77Crime victim c)
    (hTriggered : RepresentationTriggered victim c)
    (hCapacity : RepresentativeCapacity payee victim c)
    (hNotDefendant : ¬ IsDefendantInChapter77Proceeding payee c) :
    VictimForRestitution payee victim c :=
  .throughRepresentative hHarmed hTriggered hCapacity hNotDefendant



theorem section1593Compliant_intro
    {d payee victim : Person} {o : RestitutionOrder} {c : ComplaintText}
    (hMandate : MandatoryRestitutionOrdered d o c)
    (hStanding : VictimForRestitution payee victim c)
    (hContent : OrderContentCompliant o d payee victim c)
    (hRoute : OrderProcedurallyCompliant o c) :
    Section1593Compliant d payee victim o c :=
  ⟨hMandate, hStanding, hContent, hRoute⟩



theorem restitutionStageReached_orderEnforced_intro
    {d payee victim : Person} {o : RestitutionOrder} {c : ComplaintText}
    (hTrigger : OffenseUnderChapter77Established d c)
    (hStanding : VictimForRestitution payee victim c)
    (hAmount : OrderedAmountIsFullAmount o victim d c)
    (hMandate : MandatoryRestitutionOrdered d o c)
    (hContent : OrderContentCompliant o d payee victim c)
    (hIssued : OrderIssuedInAccordanceWithSection3664 o c)
    (hEnforced : OrderEnforcedInAccordanceWithSection3664 o c) :
    RestitutionStageReached d payee victim o c RestitutionStage.orderEnforced :=
  .enforced (.ordered (.lossDetermined (.victimIdentified (.adjudicated hTrigger) hStanding)
    hAmount) hMandate hContent hIssued) hEnforced


theorem section1593Compliant_of_stageReached
    {d payee victim : Person} {o : RestitutionOrder} {c : ComplaintText}
    (hRun : RestitutionStageReached d payee victim o c RestitutionStage.orderEnforced) :
    Section1593Compliant d payee victim o c := by
  cases hRun with
  | enforced prev enforcement =>
    cases prev with
    | ordered prev' mandate content issued =>
      cases prev' with
      | lossDetermined prev'' _ =>
        cases prev'' with
        | victimIdentified _ standing =>
          exact ⟨mandate, standing, content, ⟨issued, enforcement⟩⟩

end Proving.USC.T18.Ch77.Part3.Procedure
