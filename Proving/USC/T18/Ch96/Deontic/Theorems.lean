import Proving.USC.T18.Ch96.Deontic.Statute

set_option autoImplicit false








namespace Proving.USC.T18.Ch96.Deontic

open Proving.USC.Common


theorem normApplies_intro {n : NormId} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass n p c) (hCond : ConditionMet n c) :
    NormApplies n p c :=
  ⟨hAddr, hCond⟩



theorem prohibitionViolated_intro {n : NormId} {p : Person} {c : ComplaintText}
    (hApplies : NormApplies n p c) (hAct : RegulatedActOccurred n p c) :
    ProhibitionViolated n p c :=
  ⟨hApplies, hAct⟩



theorem obligationBreached_intro {n : NormId} {p : Person} {c : ComplaintText}
    (hApplies : NormApplies n p c) (hNotAct : ¬ RegulatedActOccurred n p c) :
    ObligationBreached n p c :=
  ⟨hApplies, hNotAct⟩


theorem permissionExercisable_intro {n : NormId} {p : Person} {c : ComplaintText}
    (hApplies : NormApplies n p c) : PermissionExercisable n p c :=
  hApplies


theorem powerExercisable_intro {n : NormId} {p : Person} {c : ComplaintText}
    (hApplies : NormApplies n p c) : PowerExercisable n p c :=
  hApplies



theorem prohibitionViolatedWF_intro {n : NormId} {p : Person} {c : ComplaintText}
    (hClass : IsProhibition n) (hViol : ProhibitionViolated n p c) :
    ProhibitionViolatedWF n p c :=
  ⟨hClass, hViol⟩


theorem obligationBreachedWF_intro {n : NormId} {p : Person} {c : ComplaintText}
    (hClass : IsObligation n) (hBreach : ObligationBreached n p c) :
    ObligationBreachedWF n p c :=
  ⟨hClass, hBreach⟩



theorem prohibition1962cViolated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass NormId.s1962c p c)
    (hCond : ConditionMet NormId.s1962c c)
    (hAct : RegulatedActOccurred NormId.s1962c p c) :
    Prohibition1962cViolated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T18.Ch96.Deontic
