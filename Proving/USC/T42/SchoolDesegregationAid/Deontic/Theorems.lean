






import Proving.USC.T42.SchoolDesegregationAid.Deontic.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.SchoolDesegregationAid.Deontic

open Proving.USC.Common



theorem power2000c2Exercised_intro {b c}
    (hAddr : ApplicantInClass b c) (hCond : ApplicationMade b c)
    (hAct : TechnicalAssistanceRendered b c) : Power2000c2Exercised b c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem power2000c3Exercised_intro {c}
    (hAct : TrainingInstituteArranged c) : Power2000c3Exercised c :=
  hAct



theorem power2000c4aExercised_intro {b c}
    (hAddr : ApplicantInClass b c) (hCond : ApplicationMade b c)
    (hAct : GrantMade b c) : Power2000c4aExercised b c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation2000c4bSatisfied_intro {b c}
    (hCond : GrantMade b c) (hAct : GrantFactorsConsidered b c)
    : Obligation2000c4bSatisfied b c :=
  ⟨hCond, hAct⟩


theorem obligation2000c4bBreached_intro {b c}
    (hCond : GrantMade b c) (hNotAct : ¬ GrantFactorsConsidered b c)
    : Obligation2000c4bBreached b c :=
  ⟨hCond, hNotAct⟩


theorem permission2000c5Exercised_intro {b c}
    (hAct : PaymentMade b c) : Permission2000c5Exercised b c :=
  hAct


theorem obligation2000c7Satisfied_intro {c}
    (hCond : ActionUnderSubchapter c) (hAct : UnitedStatesLiableForCosts c)
    : Obligation2000c7Satisfied c :=
  ⟨hCond, hAct⟩


theorem obligation2000c7Breached_intro {c}
    (hCond : ActionUnderSubchapter c) (hNotAct : ¬ UnitedStatesLiableForCosts c)
    : Obligation2000c7Breached c :=
  ⟨hCond, hNotAct⟩



theorem permission2000c9Exercised_intro {c}
    (hCond : NonProtectedBasis c) (hAct : ClassificationAndAssignmentMade c)
    : Permission2000c9Exercised c :=
  ⟨hCond, hAct⟩

end Proving.USC.T42.SchoolDesegregationAid.Deontic
