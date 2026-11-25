






import Proving.USC.T05.ScopeOfReview.Deontic.Statute

namespace Proving.USC.T05.ScopeOfReview.Deontic
open Proving.USC.Common



theorem permission705Agency_exercised_intro {e : Entity} {c : ComplaintText}
    (hAddr : AgencyIsAddressee705 e c)
    (hCond : JusticeSoRequires705 e c)
    (hAct  : AgencyPostponedEffectiveDate705 e c)
    : Permission705AgencyExercised e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem permission705Court_exercised_intro {p : Person} {c : ComplaintText}
    (hCond : IrreparableInjuryToPrevent705 p c)
    (hAct  : CourtIssuedNecessaryProcess705 p c)
    : Permission705CourtExercised p c :=
  ⟨⟨hCond⟩, hAct⟩



theorem obligation706Chapeau_discharged_intro {c : ComplaintText}
    (hAddr : ReviewingCourtIsAddressee706 c)
    (hCond : QuestionOfLawPresented706 c)
    (hAct  : DecidedQuestionsOfLaw706 c)
    : Obligation706ChapeauDischarged c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem obligation706_1_discharged_intro {e : Entity} {c : ComplaintText}
    (hAddr : ReviewingCourtIsAddressee706 c)
    (hCond : ActionUnlawfullyWithheld706 e c)
    (hAct  : CompelledWithheldAction706 e c)
    : Obligation706_1Discharged e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem obligation706_2_discharged_intro {e : Entity} {d : Defect706} {c : ComplaintText}
    (hAddr : ReviewingCourtIsAddressee706 c)
    (hCond : ActionHasDefect706 e d c)
    (hAct  : HeldUnlawfulAndSetAside706 e c)
    : Obligation706_2Discharged e d c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem obligation706Closing_discharged_intro {c : ComplaintText}
    (hAddr   : ReviewingCourtIsAddressee706 c)
    (hRecord : ReviewedWholeRecord706 c)
    (hPrej   : TookAccountOfPrejudicialError706 c)
    : Obligation706ClosingDischarged c :=
  ⟨hAddr, hRecord, hPrej⟩

end Proving.USC.T05.ScopeOfReview.Deontic
