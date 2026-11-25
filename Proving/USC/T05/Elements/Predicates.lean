












import Proving.USC.T05.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T05.Elements

open Proving.USC.Common







axiom IsAgency (a : Agency) (c : ComplaintText) : Prop




axiom IsAgencyAction (act : AgencyAction) (c : ComplaintText) : Prop








axiom ReviewPrecludedByStatute (act : AgencyAction) (c : ComplaintText) : Prop





axiom CommittedToAgencyDiscretion (act : AgencyAction) (c : ComplaintText) : Prop








axiom AdverselyAffectedWithinZoneOfInterests (p : Person) (act : AgencyAction) (c : ComplaintText) : Prop




axiom SeeksReliefOtherThanMoneyDamages (p : Person) (c : ComplaintText) : Prop





axiom ActedInOfficialCapacity (a : Agency) (act : AgencyAction) (c : ComplaintText) : Prop





axiom ReliefForbiddenByOtherStatute (p : Person) (c : ComplaintText) : Prop







axiom IsReviewableFinalAction (act : AgencyAction) (c : ComplaintText) : Prop




axiom NoOtherAdequateRemedy (act : AgencyAction) (c : ComplaintText) : Prop








axiom UnlawfullyWithheldOrDelayed (act : AgencyAction) (c : ComplaintText) : Prop




axiom ArbitraryOrCapricious (act : AgencyAction) (c : ComplaintText) : Prop




axiom ContraryToConstitutionalRight (act : AgencyAction) (c : ComplaintText) : Prop




axiom InExcessOfStatutoryAuthority (act : AgencyAction) (c : ComplaintText) : Prop




axiom WithoutObservanceOfProcedure (act : AgencyAction) (pr : Proceeding) (c : ComplaintText) : Prop





axiom UnsupportedBySubstantialEvidence (act : AgencyAction) (pr : Proceeding) (c : ComplaintText) : Prop




axiom UnwarrantedByFactsDeNovo (act : AgencyAction) (c : ComplaintText) : Prop









axiom IsFormalOnTheRecordAdjudication (pr : Proceeding) (c : ComplaintText) : Prop





axiom NoticeOfHearingGiven (pr : Proceeding) (c : ComplaintText) : Prop





axiom OpportunityToBeHeard (pr : Proceeding) (c : ComplaintText) : Prop





axiom BurdenAndRecordSupport (pr : Proceeding) (c : ComplaintText) : Prop




axiom ReasonedFindingsOnTheRecord (pr : Proceeding) (c : ComplaintText) : Prop





axiom FreeOfProhibitedExParte (pr : Proceeding) (c : ComplaintText) : Prop

end Proving.USC.T05.Elements
