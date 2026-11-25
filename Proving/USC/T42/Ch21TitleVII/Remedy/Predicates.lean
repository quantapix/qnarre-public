import Proving.USC.T42.Ch21TitleVII.Remedy.Types









set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Remedy

open Proving.USC.Common







axiom IsComplainingParty (p : Person) (c : ComplaintText) : Prop





axiom HasPrivateRightOfAction (p : Person) (c : ComplaintText) : Prop





axiom RespondentIsGovernmentEntity (r : Person) (c : ComplaintText) : Prop






axiom InjuryCognizable (p : Person) (c : ComplaintText) : Prop





axiom CausedByViolation (p : Person) (c : ComplaintText) : Prop




axiom DistrictCourtHasJurisdiction (c : ComplaintText) : Prop






axiom VenueProper (c : ComplaintText) : Prop






axiom ChargeFiledWithCommission (ch : Charge) (c : ComplaintText) : Prop





axiom ChargeFiledByOrOnBehalfOfAggrieved (p : Person) (ch : Charge)
    (c : ComplaintText) : Prop






axiom ChargeTimelyFiled (ch : Charge) (c : ComplaintText) : Prop







axiom DeferralRequirementSatisfied (ch : Charge) (c : ComplaintText) : Prop





axiom RightToSueNoticeGiven (p : Person) (c : ComplaintText) : Prop




axiom CivilActionFiledWithinNinetyDays (p : Person) (c : ComplaintText) : Prop




axiom ReasonableCauseDetermined (r : Person) (c : ComplaintText) : Prop




axiom ConciliationUnsuccessful (r : Person) (c : ComplaintText) : Prop







axiom UnlawfulEmploymentPracticeCharged (r : Person) (c : ComplaintText) : Prop






axiom IntentionalViolationFound (r : Person) (c : ComplaintText) : Prop





axiom MotivatingFactorEstablished (r : Person) (c : ComplaintText) : Prop






axiom SameDecisionDemonstrated (r : Person) (c : ComplaintText) : Prop







axiom BackPayWithinTwoYearCap (p : Person) (c : ComplaintText) : Prop




axiom InterimEarningsOffsetApplied (p : Person) (c : ComplaintText) : Prop







axiom RefusedOrDischargedForNondiscriminatoryReason (p : Person)
    (c : ComplaintText) : Prop





axiom PrevailingPartyNotGovernment (p : Person) (c : ComplaintText) : Prop









axiom GoodFaithRelianceOnCommissionInterpretation (r : Person)
    (c : ComplaintText) : Prop









axiom PrecludedByPriorConsentJudgment (p : Person) (j : ConsentJudgment)
    (c : ComplaintText) : Prop







axiom StateLawLiabilityPreserved (r : Person) (c : ComplaintText) : Prop








axiom PromptJudicialActionNecessary (r : Person) (c : ComplaintText) : Prop





axiom CertifiedGeneralPublicImportance (c : ComplaintText) : Prop





axiom PatternOrPracticeOfResistance (r : Person) (c : ComplaintText) : Prop





axiom CourtOrderNotComplied (r : Person) (c : ComplaintText) : Prop




axiom RecordkeepingRequirementViolated (r : Person) (c : ComplaintText) : Prop





axiom UndueHardshipFromRecordkeepingOrder (r : Person) (c : ComplaintText) : Prop







axiom WillfulPostingViolation (r : Person) (c : ComplaintText) : Prop






axiom CommissionConfidentialityBreached (p : Person) (c : ComplaintText) : Prop






axiom AssaultOrKillingOfCommissionPersonnel (p : Person) (c : ComplaintText) : Prop









axiom IsFederalSectorEmployeeOrApplicant (p : Person) (c : ComplaintText) : Prop





axiom FinalAgencyActionOrOneHundredEightyDayLapse (p : Person)
    (c : ComplaintText) : Prop




axiom FederalSuitWithinNinetyDaysOfNotice (p : Person) (c : ComplaintText) : Prop




axiom AgencyHeadNamedAsDefendant (p : Person) (c : ComplaintText) : Prop




axiom DelayInterestAvailable (p : Person) (c : ComplaintText) : Prop








axiom IsGeraCoveredEmployee (p : Person) (c : ComplaintText) : Prop




axiom GeraComplaintWithinOneHundredEightyDays (p : Person)
    (c : ComplaintText) : Prop





axiom CommissionFinalOrderEntered (p : Person) (c : ComplaintText) : Prop






axiom FinalOrderSetAsideGroundShown (p : Person) (c : ComplaintText) : Prop





axiom GeraPrevailingParty (p : Person) (c : ComplaintText) : Prop







axiom AcceptedAffirmativeActionPlanInForce (k : GovernmentContract)
    (c : ComplaintText) : Prop





axiom SubstantialDeviationFromPlan (k : GovernmentContract)
    (c : ComplaintText) : Prop





axiom FullHearingAndAdjudicationAccorded (k : GovernmentContract)
    (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21TitleVII.Remedy
