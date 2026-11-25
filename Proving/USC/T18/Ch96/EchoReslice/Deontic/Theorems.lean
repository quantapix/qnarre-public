










import Proving.USC.T18.Ch96.EchoReslice.Deontic.Types
import Proving.USC.T18.Ch96.EchoReslice.Deontic.Predicates
import Proving.USC.T18.Ch96.EchoReslice.Deontic.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Deontic

open Proving.USC.Common




theorem addresseeInClass_intro {ct : Court} {pr : Proceeding} {c : ComplaintText}
    (h : IsPresidingCourt ct pr c) : AddresseeInClass ct pr c := h


theorem qualifyingCivilAction1967_intro {pr : Proceeding} {c : ComplaintText}
    (hUS : IsCivilActionInstitutedByUnitedStates pr c)
    (hCh : ArisesUnderChapter96 pr c) : QualifyingCivilAction1967 pr c :=
  ⟨hUS, hCh⟩



theorem conditionMet_intro_direct {pr : Proceeding} {c : ComplaintText}
    (h : QualifyingCivilAction1967 pr c) : ConditionMet pr c := Or.inl h



theorem conditionMet_intro_ancillary {pr pr' : Proceeding} {c : ComplaintText}
    (hAnc : IsAncillaryTo pr pr' c) (hQual : QualifyingCivilAction1967 pr' c) :
    ConditionMet pr c := Or.inr ⟨pr', hAnc, hQual⟩




theorem regulatedActOccurred_intro_opened {ct : Court} {pr : Proceeding}
    {c : ComplaintText} (h : DeterminedOpenToPublic ct pr c) :
    RegulatedActOccurred ct pr c := AccessDetermination1967.opened h


theorem regulatedActOccurred_intro_closed {ct : Court} {pr : Proceeding}
    {c : ComplaintText} (h : DeterminedClosedToPublic ct pr c) :
    RegulatedActOccurred ct pr c := AccessDetermination1967.closed h




theorem regulatedAct1967_iff_openOrClosed {ct : Court} {pr : Proceeding}
    {c : ComplaintText} :
    RegulatedActOccurred ct pr c ↔
      (DeterminedOpenToPublic ct pr c ∨ DeterminedClosedToPublic ct pr c) := by
  constructor
  · intro h
    cases h with
    | opened h => exact Or.inl h
    | closed h => exact Or.inr h
  · intro h
    cases h with
    | inl h => exact AccessDetermination1967.opened h
    | inr h => exact AccessDetermination1967.closed h





theorem considerationOfAffectedRightsGiven_intro {ct : Court} {pr : Proceeding}
    {c : ComplaintText}
    (hAll : ∀ p : Person, IsAffectedPerson p pr c → RightsConsidered ct p pr c)
    (hSeq : ConsiderationPrecededDetermination ct pr c) :
    ConsiderationOfAffectedRightsGiven ct pr c := ⟨hAll, hSeq⟩




theorem power1967_intro {ct : Court} {pr : Proceeding} {c : ComplaintText}
    (hAddr : AddresseeInClass ct pr c) (hCond : ConditionMet pr c) :
    Power1967 ct pr c := ⟨hAddr, hCond⟩


theorem powerExercised1967_intro {ct : Court} {pr : Proceeding} {c : ComplaintText}
    (hPow : Power1967 ct pr c) (hAct : RegulatedActOccurred ct pr c)
    (hDisc : DiscretionActuallyExercised ct pr c) :
    PowerExercised1967 ct pr c := ⟨hPow, hAct, hDisc⟩


theorem obligation1967_intro {ct : Court} {pr : Proceeding} {c : ComplaintText}
    (hAddr : AddresseeInClass ct pr c) (hCond : ConditionMet pr c)
    (hAct : RegulatedActOccurred ct pr c) : Obligation1967 ct pr c :=
  ⟨hAddr, hCond, hAct⟩


theorem obligationSatisfied1967_intro {ct : Court} {pr : Proceeding}
    {c : ComplaintText} (hObl : Obligation1967 ct pr c)
    (hCons : ConsiderationOfAffectedRightsGiven ct pr c) :
    ObligationSatisfied1967 ct pr c := ⟨hObl, hCons⟩



theorem obligationBreached1967_intro {ct : Court} {pr : Proceeding}
    {c : ComplaintText} (hObl : Obligation1967 ct pr c)
    (hNo : ¬ ConsiderationOfAffectedRightsGiven ct pr c) :
    ObligationBreached1967 ct pr c := ⟨hObl, hNo⟩


theorem validExercise1967_intro {ct : Court} {pr : Proceeding} {c : ComplaintText}
    (hEx : PowerExercised1967 ct pr c)
    (hCons : ConsiderationOfAffectedRightsGiven ct pr c) :
    ValidExercise1967 ct pr c := ⟨hEx, hCons⟩


theorem unauthorizedByS1967_intro {ct : Court} {pr : Proceeding} {c : ComplaintText}
    (hAct : RegulatedActOccurred ct pr c) (hNo : ¬ ConditionMet pr c) :
    UnauthorizedByS1967 ct pr c := ⟨hAct, hNo⟩






theorem powerExercised1967_requires_condition {ct : Court} {pr : Proceeding}
    {c : ComplaintText} (h : PowerExercised1967 ct pr c) : ConditionMet pr c :=
  h.1.condition


theorem validExercise1967_satisfies_obligation {ct : Court} {pr : Proceeding}
    {c : ComplaintText} (h : ValidExercise1967 ct pr c) :
    ObligationSatisfied1967 ct pr c :=
  ⟨⟨h.1.1.addressee, h.1.1.condition, h.1.2.1⟩, h.2⟩






theorem validExercise1967_not_breached {ct : Court} {pr : Proceeding}
    {c : ComplaintText} (h : ValidExercise1967 ct pr c) :
    ¬ ObligationBreached1967 ct pr c := fun hb => hb.2 h.2

end Proving.USC.T18.Ch96.EchoReslice.Deontic
