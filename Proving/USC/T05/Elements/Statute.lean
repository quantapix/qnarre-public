











import Proving.USC.T05.Elements.Types
import Proving.USC.T05.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T05.Elements

open Proving.USC.Common




inductive Section706Ground (act : AgencyAction) (pr : Proceeding) (c : ComplaintText) : Prop

  | withheld    (h : UnlawfullyWithheldOrDelayed act c)

  | arbitrary   (h : ArbitraryOrCapricious act c)

  | unconstitutional (h : ContraryToConstitutionalRight act c)

  | ultraVires  (h : InExcessOfStatutoryAuthority act c)

  | procedural  (h : WithoutObservanceOfProcedure act pr c)

  | noSubstantialEvidence (h : UnsupportedBySubstantialEvidence act pr c)

  | deNovo      (h : UnwarrantedByFactsDeNovo act c)





structure APAReviewGate (p : Person) (a : Agency) (act : AgencyAction)
    (c : ComplaintText) : Prop where

  person            : IsPersonInUS p c

  agency            : IsAgency a c

  agencyAction      : IsAgencyAction act c

  notPrecluded      : ¬ ReviewPrecludedByStatute act c

  notDiscretionary  : ¬ CommittedToAgencyDiscretion act c

  aggrieved         : AdverselyAffectedWithinZoneOfInterests p act c

  nonMonetaryRelief : SeeksReliefOtherThanMoneyDamages p c

  officialCapacity  : ActedInOfficialCapacity a act c

  notForbidden      : ¬ ReliefForbiddenByOtherStatute p c

  reviewable        : IsReviewableFinalAction act c

  noAdequateRemedy  : NoOtherAdequateRemedy act c





structure FormalAdjudicationRegularity (pr : Proceeding) (c : ComplaintText) : Prop where

  formalAdjudication : IsFormalOnTheRecordAdjudication pr c

  notice             : NoticeOfHearingGiven pr c

  heard              : OpportunityToBeHeard pr c

  recordSupport      : BurdenAndRecordSupport pr c

  findings           : ReasonedFindingsOnTheRecord pr c

  noExParte          : FreeOfProhibitedExParte pr c




structure ValidAPAReviewClaim (p : Person) (a : Agency) (act : AgencyAction)
    (pr : Proceeding) (c : ComplaintText) : Prop where

  gate   : APAReviewGate p a act c

  ground : Section706Ground act pr c

end Proving.USC.T05.Elements
