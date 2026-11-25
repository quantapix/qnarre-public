import Proving.USC.T42.Ch21TitleVII.Remedy.Predicates


















set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Remedy

open Proving.USC.Common





structure Exhaustion2000e5 (p : Person) (ch : Charge) (c : ComplaintText) : Prop where
  chargeFiled  : ChargeFiledWithCommission ch c
  byClaimant   : ChargeFiledByOrOnBehalfOfAggrieved p ch c
  timely       : ChargeTimelyFiled ch c
  deferral     : DeferralRequirementSatisfied ch c
  noticeGiven  : RightToSueNoticeGiven p c
  suitTimely   : CivilActionFiledWithinNinetyDays p c




structure Standing2000e5 (p : Person) (ch : Charge) (c : ComplaintText) : Prop where
  complainingParty : IsComplainingParty p c
  privateRight     : HasPrivateRightOfAction p c
  injury           : InjuryCognizable p c
  causation        : CausedByViolation p c
  exhaustion       : Exhaustion2000e5 p ch c


structure PrivateAction2000e5 (p : Person) (ch : Charge) (c : ComplaintText) : Prop where
  standing     : Standing2000e5 p ch c
  jurisdiction : DistrictCourtHasJurisdiction c
  venue        : VenueProper c







structure MakeWholeRelief2000e5g (p r : Person) (ch : Charge)
    (c : ComplaintText) : Prop where
  action         : PrivateAction2000e5 p ch c
  violation      : UnlawfulEmploymentPracticeCharged r c
  intentional    : IntentionalViolationFound r c
  noStatutoryBar : ¬ RefusedOrDischargedForNondiscriminatoryReason p c
  backPayCapped  : BackPayWithinTwoYearCap p c
  mitigation     : InterimEarningsOffsetApplied p c






structure LimitedRelief2000e5g2B (p r : Person) (ch : Charge)
    (c : ComplaintText) : Prop where
  action       : PrivateAction2000e5 p ch c
  motivating   : MotivatingFactorEstablished r c
  sameDecision : SameDecisionDemonstrated r c



structure FeeAward2000e5k (p : Person) (c : ComplaintText) : Prop where
  prevailing : PrevailingPartyNotGovernment p c







structure RelianceDefense2000e12b (r : Person) (c : ComplaintText) : Prop where
  goodFaithReliance : GoodFaithRelianceOnCommissionInterpretation r c




structure PreclusionBar2000e2n (p : Person) (j : ConsentJudgment)
    (c : ComplaintText) : Prop where
  precluded : PrecludedByPriorConsentJudgment p j c



structure StateRemedyUnaffected2000e7 (r : Person) (c : ComplaintText) : Prop where
  preserved : StateLawLiabilityPreserved r c






structure CommissionCivilAction2000e5f (r : Person) (ch : Charge)
    (c : ComplaintText) : Prop where
  chargeOnFile       : ChargeFiledWithCommission ch c
  reasonableCause    : ReasonableCauseDetermined r c
  conciliationFailed : ConciliationUnsuccessful r c
  notGovernment      : ¬ RespondentIsGovernmentEntity r c




structure AttorneyGeneralCivilAction2000e5f (r : Person) (ch : Charge)
    (c : ComplaintText) : Prop where
  chargeOnFile       : ChargeFiledWithCommission ch c
  conciliationFailed : ConciliationUnsuccessful r c
  government         : RespondentIsGovernmentEntity r c



structure PreliminaryRelief2000e5f2 (r : Person) (ch : Charge)
    (c : ComplaintText) : Prop where
  chargeOnFile       : ChargeFiledWithCommission ch c
  promptActionNeeded : PromptJudicialActionNecessary r c




structure Intervention2000e5f (r : Person) (c : ComplaintText) : Prop where
  certified     : CertifiedGeneralPublicImportance c
  notGovernment : ¬ RespondentIsGovernmentEntity r c



structure ComplianceProceeding2000e5i (r : Person) (c : ComplaintText) : Prop where
  noncompliance : CourtOrderNotComplied r c




structure PatternOrPracticeAction2000e6 (r : Person) (c : ComplaintText) : Prop where
  patternOrPractice : PatternOrPracticeOfResistance r c
  reasonableCause   : ReasonableCauseDetermined r c





structure RecordkeepingComplianceOrder2000e8c (r : Person)
    (c : ComplaintText) : Prop where
  violation  : RecordkeepingRequirementViolated r c
  noHardship : ¬ UndueHardshipFromRecordkeepingOrder r c





structure PostingPenalty2000e10 (r : Person) (c : ComplaintText) : Prop where
  willful : WillfulPostingViolation r c




structure ConfidentialityOffense2000e8e (p : Person) (c : ComplaintText) : Prop where
  breach : CommissionConfidentialityBreached p c



structure PersonnelProtectionOffense2000e13 (p : Person)
    (c : ComplaintText) : Prop where
  offense : AssaultOrKillingOfCommissionPersonnel p c




structure FederalSectorAction2000e16 (p : Person) (c : ComplaintText) : Prop where
  covered         : IsFederalSectorEmployeeOrApplicant p c
  finalOrLapse    : FinalAgencyActionOrOneHundredEightyDayLapse p c
  timely          : FederalSuitWithinNinetyDaysOfNotice p c
  properDefendant : AgencyHeadNamedAsDefendant p c




structure GeraAdministrativeRemedy2000e16c (p : Person)
    (c : ComplaintText) : Prop where
  covered    : IsGeraCoveredEmployee p c
  timely     : GeraComplaintWithinOneHundredEightyDays p c
  finalOrder : CommissionFinalOrderEntered p c




structure GeraJudicialReview2000e16c (p : Person) (c : ComplaintText) : Prop where
  administrative : GeraAdministrativeRemedy2000e16c p c
  ground         : FinalOrderSetAsideGroundShown p c


structure GeraFeeAward2000e16c (p : Person) (c : ComplaintText) : Prop where
  prevailing : GeraPrevailingParty p c








inductive ContractSanctionPermitted2000e17 (k : GovernmentContract)
    (c : ComplaintText) : Prop
  | noAcceptedPlan :
      ¬ AcceptedAffirmativeActionPlanInForce k c →
      ContractSanctionPermitted2000e17 k c
  | substantialDeviation :
      SubstantialDeviationFromPlan k c →
      ContractSanctionPermitted2000e17 k c
  | afterFullHearing :
      FullHearingAndAdjudicationAccorded k c →
      ContractSanctionPermitted2000e17 k c







inductive Title7EnforcementRoute (p r : Person) (ch : Charge)
    (c : ComplaintText) : Prop
  | privateSuit :
      PrivateAction2000e5 p ch c → Title7EnforcementRoute p r ch c
  | commissionSuit :
      CommissionCivilAction2000e5f r ch c → Title7EnforcementRoute p r ch c
  | attorneyGeneralSuit :
      AttorneyGeneralCivilAction2000e5f r ch c → Title7EnforcementRoute p r ch c
  | patternOrPractice :
      PatternOrPracticeAction2000e6 r c → Title7EnforcementRoute p r ch c
  | federalSector :
      FederalSectorAction2000e16 p c → Title7EnforcementRoute p r ch c
  | geraAdministrative :
      GeraAdministrativeRemedy2000e16c p c → Title7EnforcementRoute p r ch c






def s2000eEnforcer : Option Enforcer := none



def s2000e1Enforcer : Option Enforcer := none



def s2000e2Enforcer : Option Enforcer := some .mixed



def s2000e3Enforcer : Option Enforcer := some .mixed




def s2000e4Enforcer : Option Enforcer := some .agencyOnly



def s2000e5Enforcer : Option Enforcer := some .mixed




def s2000e5Relief : List Relief :=
  [.injunction, .temporaryOrPreliminaryRelief, .declaratory, .affirmativeAction,
   .reinstatement, .hiring, .backPay, .otherEquitableRelief, .complianceOrder,
   .attorneysFees, .expertFees, .costs]



def s2000e5g2BRelief : List Relief :=
  [.declaratory, .injunction, .attorneysFees, .costs]


def s2000e5bRelief : List Relief := [.criminalFine, .imprisonment]



def s2000e6Enforcer : Option Enforcer := some .agencyOnly


def s2000e6Relief : List Relief := [.injunction, .temporaryOrPreliminaryRelief]


def s2000e7Enforcer : Option Enforcer := none



def s2000e8Enforcer : Option Enforcer := some .mixed


def s2000e8Relief : List Relief := [.complianceOrder, .otherEquitableRelief]


def s2000e8eRelief : List Relief := [.criminalFine, .imprisonment]



def s2000e9Enforcer : Option Enforcer := some .agencyOnly


def s2000e10Enforcer : Option Enforcer := some .criminal


def s2000e10Relief : List Relief := [.criminalFine]


def s2000e11Enforcer : Option Enforcer := none



def s2000e12Enforcer : Option Enforcer := some .agencyOnly


def s2000e13Enforcer : Option Enforcer := some .criminal


def s2000e13Relief : List Relief := [.criminalFine, .imprisonment]


def s2000e14Enforcer : Option Enforcer := none


def s2000e15Enforcer : Option Enforcer := none



def s2000e16Enforcer : Option Enforcer := some .mixed




def s2000e16Relief : List Relief :=
  [.injunction, .affirmativeAction, .reinstatement, .hiring, .backPay,
   .otherEquitableRelief, .delayInterest, .attorneysFees, .expertFees, .costs]



def s2000e16aEnforcer : Option Enforcer := none



def s2000e16bEnforcer : Option Enforcer := some .agencyOnly



def s2000e16bRelief : List Relief :=
  [.injunction, .affirmativeAction, .reinstatement, .hiring, .backPay,
   .otherEquitableRelief, .compensatoryDamages, .delayInterest, .attorneysFees,
   .expertFees, .costs]



def s2000e16cEnforcer : Option Enforcer := some .agencyOnly



def s2000e17Enforcer : Option Enforcer := some .agencyOnly





def s2000e5fPublicPlaintiff : RespondentClass → Option Enforcer
  | .privateRespondent  => some .agencyOnly
  | .governmentRespondent => some .agencyOnly
  | .federalEntity      => none



def geraForums : List Forum := [.commissionAdministrative, .courtOfAppeals]


def s2000e5Forums : List Forum := [.federalDistrictCourt]

end Proving.USC.T42.Ch21TitleVII.Remedy
