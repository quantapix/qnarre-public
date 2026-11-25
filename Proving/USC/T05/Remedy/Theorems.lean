






import Proving.USC.T05.Remedy.Types
import Proving.USC.T05.Remedy.Predicates
import Proving.USC.T05.Remedy.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T05.Remedy

open Proving.USC.Common


theorem standingApa_intro {p c}
    (hPR : HasPrivateRightOfAction p c) (hInj : InjuryCognizable p c)
    (hCaus : CausedByViolation p c) (hRed : ReliefRedressable p c)
    : StandingApa p c :=
  ⟨hPR, hInj, hCaus, hRed⟩


theorem interimRelief705_intro {p c}
    (hStanding : StandingApa p c) (hIrr : IrreparableInjuryPendingReview p c)
    (hAvail : DispositionAvailable .stayEffectiveDate p c)
    : InterimRelief705 p c :=
  ⟨hStanding, hIrr, hAvail⟩


theorem compelRelief706_1_intro {p c}
    (hStanding : StandingApa p c) (hWith : AgencyActionUnlawfullyWithheld p c)
    (hAvail : DispositionAvailable .compelAgencyAction p c)
    : CompelRelief706_1 p c :=
  ⟨hStanding, hWith, hAvail⟩



theorem setAsideRelief706_2_intro {g p c}
    (hStanding : StandingApa p c) (hGround : AgencyActionSetAsideGround g p c)
    (hPrej : PrejudicialError p c)
    (hAvail : DispositionAvailable .setAside p c)
    : SetAsideRelief706_2 g p c :=
  ⟨hStanding, hGround, hPrej, hAvail⟩


theorem apaReliefAvailable_intro_interim {p c}
    (h : InterimRelief705 p c) : ApaReliefAvailable p c :=
  .interim h

theorem apaReliefAvailable_intro_compel {p c}
    (h : CompelRelief706_1 p c) : ApaReliefAvailable p c :=
  .compel h

theorem apaReliefAvailable_intro_setAside {g p c}
    (h : SetAsideRelief706_2 g p c) : ApaReliefAvailable p c :=
  .setAside h

end Proving.USC.T05.Remedy
