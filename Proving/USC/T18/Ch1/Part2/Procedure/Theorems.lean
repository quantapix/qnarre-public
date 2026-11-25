








import Proving.USC.T18.Ch1.Part2.Procedure.Types
import Proving.USC.T18.Ch1.Part2.Procedure.Predicates
import Proving.USC.T18.Ch1.Part2.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch1.Part2.Procedure

open Proving.USC.Common (Person ComplaintText)


theorem establishInsanityDefense_intro {p : Person} {c : ComplaintText}
    (hRaised : RaisedInsanityDefense p c)
    (hBurden : ProvedInsanityByClearAndConvincing p c) :
    EstablishInsanityDefense p c :=
  ⟨hRaised, hBurden⟩


theorem firstConvictionPenaltyTrigger_intro {p : Person} {c : ComplaintText}
    (hProsec : ProsecutableInUSCourt p c)
    (hFirst : FirstConvictionUnderMinorUse p c) :
    FirstConvictionPenaltyTrigger p c :=
  ⟨hProsec, hFirst⟩


theorem subsequentConvictionPenaltyTrigger_intro {p : Person} {c : ComplaintText}
    (hProsec : ProsecutableInUSCourt p c)
    (hPrior : HasPriorConvictionUnderMinorUse p c) :
    SubsequentConvictionPenaltyTrigger p c :=
  ⟨hProsec, hPrior⟩



theorem properSeal_intro {p : Person} {c : ComplaintText} {d : SealDates}
    (hDuress : RaisedDuressDefense p c)
    (hMotion : SealMotionMade p c)
    (hDates : SealDatesExtracted c d)
    (hWindow : WellFormedSealWindow d) :
    ProperSeal p c d :=
  ⟨hDuress, hMotion, hDates, hWindow⟩









example : WithinSealWindow ⟨10, 20⟩ 15 := by decide



example : ¬ WithinSealWindow ⟨10, 20⟩ 25 := by decide


example : WellFormedSealWindow ⟨10, 20⟩ := by decide

end Proving.USC.T18.Ch1.Part2.Procedure
