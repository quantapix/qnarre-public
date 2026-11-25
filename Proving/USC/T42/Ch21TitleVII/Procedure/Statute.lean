import Proving.USC.T42.Ch21TitleVII.Procedure.Predicates


















set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Procedure

open Proving.USC.Common





def ChargeFiledWithinBaseWindow (c : ComplaintText) : Prop :=
  PracticeOccurrenceDay c ≤ ChargeFilingDay c ∧
    ChargeFilingDay c ≤ PracticeOccurrenceDay c + 180






noncomputable def DeferralFilingDeadlineDay (c : ComplaintText) : Day :=
  min (PracticeOccurrenceDay c + 300) (StateProceedingTerminationNoticeDay c + 30)


def ChargeFiledWithinDeferralDeadline (c : ComplaintText) : Prop :=
  PracticeOccurrenceDay c ≤ ChargeFilingDay c ∧
    ChargeFilingDay c ≤ DeferralFilingDeadlineDay c



def NoticeOfChargeServedTimely (c : ComplaintText) : Prop :=
  ChargeFilingDay c ≤ ChargeServiceDay c ∧
    ChargeServiceDay c ≤ ChargeFilingDay c + 10








def SixtyDayDeferralElapsed (c : ComplaintText) : Prop :=
  StateProceedingCommencementDay c + 60 ≤ ChargeFilingDay c



def StateDeferralSatisfied (c : ComplaintText) : Prop :=
  SixtyDayDeferralElapsed c ∨ StateProceedingTerminated c



def SuitFiledWithinNinetyDays (c : ComplaintText) : Prop :=
  RightToSueNoticeDay c ≤ CivilActionFilingDay c ∧
    CivilActionFilingDay c ≤ RightToSueNoticeDay c + 90




def CommissionInactionPeriodElapsed (c : ComplaintText) : Prop :=
  max (ChargeFilingDay c) (PeriodOfReferenceExpiryDay c) + 180 ≤ RightToSueNoticeDay c




def CommissionSuitAfterThirtyDays (c : ComplaintText) : Prop :=
  max (ChargeFilingDay c) (PeriodOfReferenceExpiryDay c) + 30
    ≤ CommissionCivilActionFilingDay c




noncomputable def BackPayAccrualFloorDay (c : ComplaintText) : Day :=
  ChargeFilingDay c - 730


def BackPayClaimWithinTwoYears (c : ComplaintText) : Prop :=
  BackPayAccrualFloorDay c ≤ BackPayClaimEarliestDay c



def FederalSuitWithinNinetyDaysOfFinalAction (c : ComplaintText) : Prop :=
  FinalAgencyActionNoticeDay c ≤ CivilActionFilingDay c ∧
    CivilActionFilingDay c ≤ FinalAgencyActionNoticeDay c + 90



def FederalOneHundredEightyDaysElapsed (c : ComplaintText) : Prop :=
  InitialAgencyComplaintFilingDay c + 180 ≤ CivilActionFilingDay c



def GeraComplaintWithinOneHundredEightyDays (c : ComplaintText) : Prop :=
  GeraViolationDay c ≤ GeraComplaintFilingDay c ∧
    GeraComplaintFilingDay c ≤ GeraViolationDay c + 180



def PlanAcceptedWithinTwelveMonths (c : ComplaintText) : Prop :=
  ComplianceAgencyAcceptanceDay c ≤ ContractActionDay c ∧
    ContractActionDay c ≤ ComplianceAgencyAcceptanceDay c + 365




def PlanDeemedAccepted (a : AffirmativeActionPlan) (c : ComplaintText) : Prop :=
  ¬ (OfccpDisapprovedPlan a c ∧
      OfccpDisapprovalDay c ≤ ComplianceAgencyAcceptanceDay c + 45)



def MeetsEmployerWeekThreshold (c : ComplaintText) : Prop :=
  20 ≤ EmployerQualifyingWeeks c





structure CoveredRespondent (r : Respondent) (c : ComplaintText) : Prop where
  commerce : EmployerEngagedInIndustryAffectingCommerce r c
  weeks : MeetsEmployerWeekThreshold c
  notExempt : ¬ SubchapterExemptionApplies r c




def VenueProper (p : Person) (r : Respondent) (d : JudicialDistrict)
    (c : ComplaintText) : Prop :=
  PracticeCommittedInDistrict d c ∨
    EmploymentRecordsMaintainedInDistrict d c ∨
    AggrievedWouldHaveWorkedInDistrict p d c ∨
    (RespondentNotFoundInStatutoryDistrict r c ∧
      RespondentPrincipalOfficeInDistrict r d c)




structure ValidChargeForm (p : Person) (c : ComplaintText) : Prop where
  inWriting : ChargeInWritingUnderOath c
  properFiler : ChargeFiledByAggrievedOrCommissioner p c


structure TimelyChargeNonDeferral (p : Person) (c : ComplaintText) : Prop where
  form : ValidChargeForm p c
  notDeferral : ¬ DeferralJurisdiction c
  withinWindow : ChargeFiledWithinBaseWindow c


structure TimelyChargeDeferral (p : Person) (c : ComplaintText) : Prop where
  form : ValidChargeForm p c
  deferral : DeferralJurisdiction c
  proceedingCommenced : StateProceedingCommenced c
  deferralSatisfied : StateDeferralSatisfied c
  withinWindow : ChargeFiledWithinDeferralDeadline c


inductive TimelyCharge (p : Person) (c : ComplaintText) : Prop where
  | nonDeferral : TimelyChargeNonDeferral p c → TimelyCharge p c
  | deferral : TimelyChargeDeferral p c → TimelyCharge p c


structure CommissionProcessing (c : ComplaintText) : Prop where
  noticeServed : CommissionServedNoticeOfCharge c
  noticeTimely : NoticeOfChargeServedTimely c
  investigated : CommissionInvestigatedCharge c


structure ConciliationExhausted (c : ComplaintText) : Prop where
  cause : ReasonableCauseDetermined c
  endeavored : ConciliationEndeavored c
  noAgreement : ¬ ConciliationAgreementSecured c



structure AdministrativeExhaustion (p : Person) (c : ComplaintText) : Prop where
  timelyCharge : TimelyCharge p c
  processing : CommissionProcessing c
  terminated : ChargeDismissedForNoReasonableCause c ∨ ConciliationExhausted c
  rightToSue : RightToSueNoticeGiven c


structure TimelyPrivateCivilAction (p : Person) (r : Respondent)
    (d : JudicialDistrict) (c : ComplaintText) : Prop where
  covered : CoveredRespondent r c
  exhausted : AdministrativeExhaustion p c
  properPlaintiff : PlaintiffIsAggrievedOrChargingParty p c
  namedRespondent : CivilActionAgainstNamedRespondent c
  withinNinetyDays : SuitFiledWithinNinetyDays c
  venue : VenueProper p r d c



structure CommissionCivilAction (c : ComplaintText) : Prop where
  charge : ConciliationExhausted c
  ripe : CommissionSuitAfterThirtyDays c



structure AttorneyGeneralReferral (r : Respondent) (c : ComplaintText) : Prop where
  governmental : RespondentIsGovernmentEntity r c
  noAgreement : ¬ ConciliationAgreementSecured c
  referred : AttorneyGeneralReferralMade c


structure PreliminaryReliefProceeding (c : ComplaintText) : Prop where
  necessary : PromptJudicialActionNecessary c
  brought : PreliminaryReliefActionBrought c






structure TimelyFederalSectorCivilAction (p : Person) (r : Respondent)
    (d : JudicialDistrict) (c : ComplaintText) : Prop where
  covered : CoveredFederalPersonnelAction c
  aggrieved : AggrievedByFinalDisposition p c
  agencyHeadDefendant : AgencyHeadNamedAsDefendant c
  ripe : (FederalAgencyFinalActionTaken c ∧ FederalSuitWithinNinetyDaysOfFinalAction c)
    ∨ FederalOneHundredEightyDaysElapsed c
  venue : VenueProper p r d c




structure TimelyGeraComplaint (p : Person) (c : ComplaintText) : Prop where
  covered : GeraCoveredEmployee p c
  filed : GeraComplaintFiledWithCommission c
  withinWindow : GeraComplaintWithinOneHundredEightyDays c


structure GeraJudicialReview (p : Person) (c : ComplaintText) : Prop where
  complaint : TimelyGeraComplaint p c
  apaProcedures : GeraApaProceduresFollowed c
  finalOrder : GeraFinalOrderIssued c
  petitionFiled : GeraPetitionForReviewFiled c



inductive GeraSetAsideGround (c : ComplaintText) : Prop where
  | arbitrary : GeraOrderArbitraryOrCapricious c → GeraSetAsideGround c
  | procedural : GeraOrderProcedurallyDefective c → GeraSetAsideGround c
  | unsupported : GeraOrderUnsupportedBySubstantialEvidence c → GeraSetAsideGround c




structure PatternOrPracticeAction (c : ComplaintText) : Prop where
  reasonableCause : AttorneyGeneralReasonableCauseBelief c
  signed : PatternOrPracticeComplaintSigned c
  factsSetForth : PatternOrPracticeFactsSetForth c
  reliefRequested : PatternOrPracticeReliefRequested c


structure ThreeJudgeCourtConvened (c : ComplaintText) : Prop where
  action : PatternOrPracticeAction c
  requested : ThreeJudgeCourtRequested c
  certified : GeneralPublicImportanceCertified c




structure ChallengePrecludedByNotice (p : Person) (j : Judgment)
    (c : ComplaintText) : Prop where
  withinScope : PracticeImplementsConsentJudgment j c
  actualNotice : ActualNoticeOfProposedJudgment p j c
  opportunity : ReasonableOpportunityToObject p j c
  notCarvedOut : ¬ PartyOrClassMemberInPriorAction p j c



structure ChallengePrecludedByRepresentation (p : Person) (j : Judgment)
    (c : ComplaintText) : Prop where
  withinScope : PracticeImplementsConsentJudgment j c
  represented : InterestsAdequatelyRepresented p j c
  noIntervening : ¬ InterveningChangeInLawOrFact j c
  notCarvedOut : ¬ PartyOrClassMemberInPriorAction p j c


inductive ChallengePrecluded (p : Person) (j : Judgment) (c : ComplaintText) : Prop where
  | byNotice : ChallengePrecludedByNotice p j c → ChallengePrecluded p j c
  | byRepresentation : ChallengePrecludedByRepresentation p j c → ChallengePrecluded p j c




structure GoodFaithRelianceDefense (c : ComplaintText) : Prop where
  writtenInterpretation : WrittenCommissionInterpretationRelied c
  goodFaith : GoodFaithConformity c
  pleadedAndProved : PleadedAndProvedReliance c


structure RecordkeepingCompliance (c : ComplaintText) : Prop where
  made : RecordsMadeAndKept c
  preserved : RecordsPreservedForPrescribedPeriod c
  reported : ReportsFurnishedAsPrescribed c



structure NoticePostingCompliance (c : ComplaintText) : Prop where
  posted : StatutoryNoticePosted c
  noWillfulViolation : ¬ WillfulPostingViolation c



structure ContractActionProcedure (a : AffirmativeActionPlan)
    (k : GovernmentContract) (c : ComplaintText) : Prop where
  planAccepted : AffirmativeActionPlanAccepted a k c
  deemedAccepted : PlanDeemedAccepted a c
  withinTwelveMonths : PlanAcceptedWithinTwelveMonths c
  noSubstantialDeviation : ¬ SubstantialDeviationFromPlan a c
  hearingAccorded : FullHearingAndAdjudicationAccorded k c




inductive Step (p : Person) (r : Respondent) (d : JudicialDistrict)
    (c : ComplaintText) : Stage → Stage → Prop where
  | commenceState : DeferralJurisdiction c → StateProceedingCommenced c →
      Step p r d c Stage.practiceOccurred Stage.stateProceedingCommenced
  | fileChargeDirect : TimelyChargeNonDeferral p c →
      Step p r d c Stage.practiceOccurred Stage.chargeFiled
  | fileChargeAfterDeferral : TimelyChargeDeferral p c →
      Step p r d c Stage.stateProceedingCommenced Stage.chargeFiled
  | serveNotice : CommissionServedNoticeOfCharge c → NoticeOfChargeServedTimely c →
      Step p r d c Stage.chargeFiled Stage.chargeServed
  | investigate : CommissionInvestigatedCharge c →
      Step p r d c Stage.chargeServed Stage.investigated
  | findCause : ReasonableCauseDetermined c →
      Step p r d c Stage.investigated Stage.reasonableCauseFound
  | dismissNoCause : ChargeDismissedForNoReasonableCause c →
      Step p r d c Stage.investigated Stage.chargeDismissed
  | conciliationFails : ConciliationEndeavored c → ¬ ConciliationAgreementSecured c →
      Step p r d c Stage.reasonableCauseFound Stage.conciliationFailed
  | rightToSueAfterDismissal : RightToSueNoticeGiven c →
      Step p r d c Stage.chargeDismissed Stage.rightToSueIssued
  | rightToSueAfterConciliation : RightToSueNoticeGiven c →
      CommissionInactionPeriodElapsed c →
      Step p r d c Stage.conciliationFailed Stage.rightToSueIssued
  | sue : SuitFiledWithinNinetyDays c → VenueProper p r d c →
      CivilActionAgainstNamedRespondent c →
      Step p r d c Stage.rightToSueIssued Stage.civilActionFiled
  | lapse : ¬ SuitFiledWithinNinetyDays c →
      Step p r d c Stage.rightToSueIssued Stage.timeBarred
  | untimelyCharge : ¬ ChargeFiledWithinBaseWindow c → ¬ ChargeFiledWithinDeferralDeadline c →
      Step p r d c Stage.practiceOccurred Stage.timeBarred
  | adjudicate : CoveredRespondent r c →
      Step p r d c Stage.civilActionFiled Stage.adjudicated


inductive Reachable (p : Person) (r : Respondent) (d : JudicialDistrict)
    (c : ComplaintText) : Stage → Stage → Prop where
  | refl (s : Stage) : Reachable p r d c s s
  | cons {a b e : Stage} : Step p r d c a b → Reachable p r d c b e →
      Reachable p r d c a e

end Proving.USC.T42.Ch21TitleVII.Procedure
