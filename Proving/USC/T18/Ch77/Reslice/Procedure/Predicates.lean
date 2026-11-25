









import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Reslice.Procedure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Procedure

open Proving.USC.Common







axiom PerformedListedActUponPerson
    (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom InOrAffectingInterstateOrForeignCommerce
    (d : Person) (c : ComplaintText) : Prop





axiom WithinSpecialMaritimeAndTerritorialJurisdiction
    (d : Person) (c : ComplaintText) : Prop









axiom BenefitedFromParticipationInVenture
    (d : Person) (c : ComplaintText) : Prop







axiom ProsecutionCommencedUnderSection1591a1
    (pr : Prosecution) (c : ComplaintText) : Prop






axiom AdvertisingIsTheChargedAct
    (pr : Prosecution) (c : ComplaintText) : Prop







axiom GovernmentProvedKnowledgeOfMeansOrMinority
    (pr : Prosecution) (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom GovernmentProvedRecklessDisregardOfMeansOrMinority
    (pr : Prosecution) (d : Person) (v : Person) (c : ComplaintText) : Prop






axiom ReasonableOpportunityToObserve
    (pr : Prosecution) (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom GovernmentProvedDefendantsKnowledgeOfMinority
    (pr : Prosecution) (d : Person) (v : Person) (c : ComplaintText) : Prop









axiom EffectedByForceThreatsFraudOrCoercion
    (pr : Prosecution) (c : ComplaintText) : Prop






axiom RecruitedOrObtainedForLaborOrServices
    (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom LaborOrServicesInViolationOfThisChapter
    (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom DeathResultedFromViolation
    (pr : Prosecution) (c : ComplaintText) : Prop




axiom ViolationIncludedKidnappingOrAttempt
    (pr : Prosecution) (c : ComplaintText) : Prop




axiom ViolationIncludedAggravatedSexualAbuseOrAttempt
    (pr : Prosecution) (c : ComplaintText) : Prop



axiom ViolationIncludedAttemptToKill
    (pr : Prosecution) (c : ComplaintText) : Prop









axiom ObstructedEnforcement
    (sec : Ch77ObstructionSection) (d : Person) (c : ComplaintText) : Prop







axiom KnowinglyHandledIdentityDocument
    (d : Person) (doc : IdentityDocument) (c : ComplaintText) : Prop





axiom InTheCourseOfPredicateViolation
    (d : Person) (sec : Ch77PredicateSection) (c : ComplaintText) : Prop




axiom WithIntentToViolatePredicateSection
    (d : Person) (sec : Ch77PredicateSection) (c : ComplaintText) : Prop





axiom ToPreventOrRestrictLibertyToMove
    (d : Person) (v : Person) (c : ComplaintText) : Prop



axiom WithoutLawfulAuthority
    (d : Person) (c : ComplaintText) : Prop







axiom VictimOfSevereFormOfTrafficking
    (p : Person) (c : ComplaintText) : Prop






axiom ConductCausedByOrIncidentToTrafficking
    (d : Person) (c : ComplaintText) : Prop







axiom FineImposedUnderThisTitle
    (s : SentenceRecord) (c : ComplaintText) : Prop





axiom ImprisonmentImposed
    (s : SentenceRecord) (c : ComplaintText) : Prop







axiom LifeSentenceImposed
    (s : SentenceRecord) (c : ComplaintText) : Prop







axiom offenseTime
    (pr : Prosecution) (c : ComplaintText) : Time







axiom victimAgeYearsAt
    (v : Person) (t : Time) (c : ComplaintText) : Nat







axiom imposedImprisonmentYears
    (s : SentenceRecord) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch77.Reslice.Procedure
