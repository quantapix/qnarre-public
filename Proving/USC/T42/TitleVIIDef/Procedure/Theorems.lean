






import Proving.USC.Common.Types
import Proving.USC.T42.TitleVIIDef.Procedure.Types
import Proving.USC.T42.TitleVIIDef.Procedure.Predicates
import Proving.USC.T42.TitleVIIDef.Procedure.Statute

namespace Proving.USC.T42.TitleVIIDef.Procedure

open Proving.USC.Common


theorem impactEstablishedPrimary_intro {pr : Proceeding} {c : ComplaintText}
    (hRaised : ImpactClaimRaised pr c)
    (hImpact : ComplainantDemonstratedImpact pr c)
    (hNotJust : ¬ RespondentDemonstratedJustification pr c) :
    ImpactEstablishedPrimary pr c :=
  ⟨hRaised, hImpact, hNotJust⟩


theorem impactEstablishedAlternative_intro {pr : Proceeding} {c : ComplaintText}
    (hRaised : ImpactClaimRaised pr c)
    (hImpact : ComplainantDemonstratedImpact pr c)
    (hJust : RespondentDemonstratedJustification pr c)
    (hAlt : ComplainantDemonstratedAlternative pr c) :
    ImpactEstablishedAlternative pr c :=
  ⟨hRaised, hImpact, hJust, hAlt⟩


theorem impactBurdenShiftComplete_primary_intro {pr : Proceeding} {c : ComplaintText}
    (h : ImpactEstablishedPrimary pr c) : ImpactBurdenShiftComplete pr c :=
  .primary h


theorem impactBurdenShiftComplete_alternative_intro {pr : Proceeding} {c : ComplaintText}
    (h : ImpactEstablishedAlternative pr c) : ImpactBurdenShiftComplete pr c :=
  .alternative h


theorem preclusionGateFires_intro {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hJudgment : EmploymentJudgmentEntered pr c)
    (hNotice : ActualNoticeAndOpportunity p pr c)
    (hPrecluded : ChallengePrecluded p pr c) :
    PreclusionGateFires p pr c :=
  ⟨hJudgment, hNotice, hPrecluded⟩


theorem survivingChallengeProperlyVenued_intro {p : Person} {pr : Proceeding} {c : ComplaintText}
    (hJudgment : EmploymentJudgmentEntered pr c)
    (hNotPrecluded : ¬ ChallengePrecluded p pr c)
    (hVenue : ProperVenueEnteringCourt p pr c) :
    SurvivingChallengeProperlyVenued p pr c :=
  ⟨hJudgment, hNotPrecluded, hVenue⟩

end Proving.USC.T42.TitleVIIDef.Procedure
