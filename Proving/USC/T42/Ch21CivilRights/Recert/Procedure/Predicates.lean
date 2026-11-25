import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch21CivilRights.Recert.Procedure.Types

set_option autoImplicit false












namespace Proving.USC.T42.Ch21CivilRights.Recert.Procedure

open Proving.USC.Common (Person ComplaintText)






axiom ReceivesFederalFinancialAssistance (r : Recipient) (c : ComplaintText) : Prop





axiom IsCoveredProgramOrActivity (pa : ProgramOrActivity) (r : Recipient)
    (c : ComplaintText) : Prop







axiom AgencyEmpoweredToExtendAssistance (a : FederalAgency) (c : ComplaintText) : Prop




axiom RuleOfGeneralApplicabilityIssued (a : FederalAgency) (u : AgencyRule)
    (c : ComplaintText) : Prop





axiom RuleConsistentWithAuthorizingStatuteObjectives (u : AgencyRule)
    (c : ComplaintText) : Prop




axiom RuleApprovedByPresident (u : AgencyRule) (c : ComplaintText) : Prop




axiom OpportunityForHearingAfforded (r : Recipient) (c : ComplaintText) : Prop




axiom ExpressFindingOnRecordOfNoncompliance (r : Recipient) (u : AgencyRule)
    (c : ComplaintText) : Prop




axiom RecipientAdvisedOfFailureToComply (a : FederalAgency) (r : Recipient)
    (c : ComplaintText) : Prop




axiom VoluntaryComplianceDeterminedUnobtainable (a : FederalAgency) (r : Recipient)
    (c : ComplaintText) : Prop





axiom TerminationLimitedToFoundRecipient (e : EnforcementAction) (r : Recipient)
    (c : ComplaintText) : Prop




axiom TerminationLimitedToFoundProgram (e : EnforcementAction)
    (pa : ProgramOrActivity) (c : ComplaintText) : Prop





axiom FullWrittenReportFiledWithCommittees (a : FederalAgency)
    (rep : CongressionalReport) (e : EnforcementAction) (c : ComplaintText) : Prop




axiom EffectedByOtherMeansAuthorizedByLaw (a : FederalAgency) (r : Recipient)
    (c : ComplaintText) : Prop






axiom daysFromReportFilingToActionEffective (rep : CongressionalReport)
    (e : EnforcementAction) (c : ComplaintText) : Nat






axiom AttorneyGeneralHasReasonableCause (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop




axiom PatternOrPracticeOfResistance (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop




axiom PatternIntendedToDenyFullExercise (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop




axiom FiledInAppropriateDistrictCourt (act : AttorneyGeneralAction)
    (d : DistrictCourt) (c : ComplaintText) : Prop




axiom ComplaintSignedByAttorneyGeneral (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop




axiom ComplaintSetsForthPatternFacts (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop





axiom ComplaintRequestsPreventiveRelief (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop




axiom ThreeJudgeRequestFiledWithClerk (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop




axiom CertificateOfGeneralPublicImportanceFiled (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop





axiom ClerkFurnishedRequestToChiefCircuitJudge (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop





axiom ChiefCircuitJudgeDesignatedPanel (act : AttorneyGeneralAction)
    (t : ThreeJudgeCourt) (c : ComplaintText) : Prop




axiom NoThreeJudgeRequestFiled (act : AttorneyGeneralAction) (c : ComplaintText) : Prop




axiom ChiefDistrictJudgeDesignatedJudge (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop




axiom NoDistrictJudgeAvailable (act : AttorneyGeneralAction) (c : ComplaintText) : Prop




axiom UnavailabilityCertifiedToChiefCircuitJudge (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop





axiom ChiefCircuitJudgeDesignatedSingleJudge (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop




axiom CaseAssignedAtEarliestPracticableDate (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop



axiom CaseExpedited (act : AttorneyGeneralAction) (c : ComplaintText) : Prop



axiom FinalJudgmentEntered (act : AttorneyGeneralAction) (c : ComplaintText) : Prop




axiom AppealTakenToSupremeCourt (act : AttorneyGeneralAction) (c : ComplaintText) : Prop





axiom designatedJudgeCount (t : ThreeJudgeCourt) (c : ComplaintText) : Nat




axiom designatedCircuitJudgeCount (t : ThreeJudgeCourt) (c : ComplaintText) : Nat





axiom designatedDistrictJudgesOfInstitutingCourtCount (t : ThreeJudgeCourt)
    (c : ComplaintText) : Nat






axiom ComplaintReferredByCourtToService (ref : ServiceReferral)
    (c : ComplaintText) : Prop




axiom FullInvestigationMade (ref : ServiceReferral) (c : ComplaintText) : Prop





axiom HearingsHeldOnReferredComplaint (ref : ServiceReferral)
    (c : ComplaintText) : Prop




axiom HearingsConductedInExecutiveSession (ref : ServiceReferral)
    (c : ComplaintText) : Prop




axiom TestimonyReleased (ref : ServiceReferral) (c : ComplaintText) : Prop




axiom AllPartiesAgreedToRelease (ref : ServiceReferral) (c : ComplaintText) : Prop



axiom CourtPermittedRelease (ref : ServiceReferral) (c : ComplaintText) : Prop




axiom VoluntarySettlementEndeavored (ref : ServiceReferral) (c : ComplaintText) : Prop






axiom SuitAgainstStateInFederalCourt (p : Person) (s : StateDefendant)
    (c : ComplaintText) : Prop






axiom ViolationOfCoveredFundingStatute (s : StateDefendant) (c : ComplaintText) : Prop






axiom daysFromOctober211986ToLatestViolationConduct (s : StateDefendant)
    (c : ComplaintText) : Int

end Proving.USC.T42.Ch21CivilRights.Recert.Procedure
