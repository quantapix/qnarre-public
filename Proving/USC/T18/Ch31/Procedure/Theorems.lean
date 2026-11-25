








import Proving.USC.T18.Ch31.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch31.Procedure

open Proving.USC.Common



theorem prosecutableTaking659_intro {p : Person} {c : ComplaintText}
    (hCommenced : ProsecutionCommenced p c)
    (hVenue : VenueProperTaking p c)
    (hNotBarred : ¬ PriorStateJudgmentOnMerits p c) :
    ProsecutableTaking659 p c :=
  ⟨hCommenced, hVenue, hNotBarred⟩



theorem prosecutableTransport659_intro {p : Person} {c : ComplaintText}
    (hCommenced : ProsecutionCommenced p c)
    (hVenue : VenueProperTransport p c)
    (hNotBarred : ¬ PriorStateJudgmentOnMerits p c) :
    ProsecutableTransport659 p c :=
  ⟨hCommenced, hVenue, hNotBarred⟩



theorem stateProsecutionBar659_intro {p : Person} {c : ComplaintText}
    (hPrior : PriorStateJudgmentOnMerits p c) :
    StateProsecutionBar659 p c :=
  ⟨hPrior⟩



theorem penaltyEligible664_intro {p : Person} {c : ComplaintText}
    (hConviction : ConvictionEntered664 p c) :
    PenaltyEligible664 p c :=
  ⟨hConviction⟩

end Proving.USC.T18.Ch31.Procedure
