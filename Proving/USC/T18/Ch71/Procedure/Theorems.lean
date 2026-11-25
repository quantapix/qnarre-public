





import Proving.USC.T18.Ch71.Procedure.Statute
import Proving.USC.T18.Ch71.Procedure.Predicates
import Proving.USC.T18.Ch71.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch71.Procedure

open Proving.USC.Common


theorem nonmailableWithdrawal_intro {p : Person} {c : ComplaintText}
    (hDep : MatterDeposited p c)
    (hDet : NonmailableDeterminationMade c)
    (hWith : WithdrawnFromMails c) : NonmailableWithdrawal p c :=
  ⟨hDep, hDet, hWith⟩



theorem subsequentOffense_intro {p : Person} {c : ComplaintText}
    (hOff : OffenseCommitted p c)
    (hPrior : PriorSuchOffenseOccurred p c)
    (hTiming : IsSubsequentOffenseTiming c) : SubsequentOffense p c :=
  ⟨hOff, hPrior, hTiming⟩



theorem distributionPresumption_intro {p : Person} {c : ComplaintText}
    (hOff : OffenseCommitted p c)
    (hThr : QuantityThresholdMet c)
    (hNotReb : ¬ PresumptionRebutted p c) : DistributionPresumption p c :=
  ⟨hOff, hThr, hNotReb⟩


theorem broadcastOffense_intro {p : Person} {c : ComplaintText}
    (hUtt : ObsceneLanguageUttered p c) : BroadcastOffense p c :=
  ⟨hUtt⟩

end Proving.USC.T18.Ch71.Procedure
