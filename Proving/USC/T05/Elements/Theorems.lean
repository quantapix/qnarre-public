





import Proving.USC.T05.Elements.Types
import Proving.USC.T05.Elements.Predicates
import Proving.USC.T05.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T05.Elements

open Proving.USC.Common


theorem apaReviewGate_intro {p a act c}
    (hPerson : IsPersonInUS p c)
    (hAgency : IsAgency a c)
    (hAction : IsAgencyAction act c)
    (hNotPrecluded : ¬ ReviewPrecludedByStatute act c)
    (hNotDiscretionary : ¬ CommittedToAgencyDiscretion act c)
    (hAggrieved : AdverselyAffectedWithinZoneOfInterests p act c)
    (hNonMonetary : SeeksReliefOtherThanMoneyDamages p c)
    (hOfficial : ActedInOfficialCapacity a act c)
    (hNotForbidden : ¬ ReliefForbiddenByOtherStatute p c)
    (hReviewable : IsReviewableFinalAction act c)
    (hNoAdequate : NoOtherAdequateRemedy act c)
    : APAReviewGate p a act c :=
  ⟨hPerson, hAgency, hAction, hNotPrecluded, hNotDiscretionary, hAggrieved,
   hNonMonetary, hOfficial, hNotForbidden, hReviewable, hNoAdequate⟩



theorem formalAdjudicationRegularity_intro {pr c}
    (hFormal : IsFormalOnTheRecordAdjudication pr c)
    (hNotice : NoticeOfHearingGiven pr c)
    (hHeard : OpportunityToBeHeard pr c)
    (hRecord : BurdenAndRecordSupport pr c)
    (hFindings : ReasonedFindingsOnTheRecord pr c)
    (hNoExParte : FreeOfProhibitedExParte pr c)
    : FormalAdjudicationRegularity pr c :=
  ⟨hFormal, hNotice, hHeard, hRecord, hFindings, hNoExParte⟩



theorem validAPAReviewClaim_intro {p a act pr c}
    (hGate : APAReviewGate p a act c)
    (hGround : Section706Ground act pr c)
    : ValidAPAReviewClaim p a act pr c :=
  ⟨hGate, hGround⟩

end Proving.USC.T05.Elements
