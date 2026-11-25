









import Proving.USC.T42.Ch21Misc.Procedure.Predicates

namespace Proving.USC.T42.Ch21Misc.Procedure

open Proving.USC.Common




inductive CategoryMatch (e : CoveredEntity) (c : ComplaintText) : Prop
  | government  : IsGovernmentOperation e c   → CategoryMatch e c
  | education   : IsEducationOperation e c    → CategoryMatch e c
  | private_    : IsPrivateOperation e c      → CategoryMatch e c
  | joint       : IsJointEntityOperation e c  → CategoryMatch e c






structure WithinCoverage (e : CoveredEntity) (c : ComplaintText) : Prop where
  category : OperativeCategoryMatched e c
  funded   : FundingExtendedToPart e c




inductive Section2000e1ExemptionGate (e : Entity) (c : ComplaintText) : Prop
  | aliensAbroad
      (h : EmploysAliensOutsideAnyState e c) :
      Section2000e1ExemptionGate e c
  | religiousEntity
      (h : IsReligiousEntityEmployingCoreligionists e c) :
      Section2000e1ExemptionGate e c
  | foreignLawDefense
      (h : ForeignLawComplianceConflict e c) :
      Section2000e1ExemptionGate e c
  | foreignEmployer
      (h : IsForeignPersonNotControlledByAmericanEmployer e c) :
      Section2000e1ExemptionGate e c




structure Section2000e1Attribution (e corp : Entity) (c : ComplaintText) : Prop where
  controls : EmployerControlsForeignCorporation e corp c
  practice : PracticeEngagedInByForeignCorporation corp c




structure Section2000e7StateLawPreserved (c : ComplaintText) : Prop where
  imposes    : StateLawImposesLiabilityOrPenalty c
  noConflict : StateLawDoesNotRequireUnlawfulPractice c



structure Section2000e10PostingCompliance (e : Entity) (c : ComplaintText) : Prop where
  duty   : NoticePostingDutyApplies e c
  posted : ApprovedNoticePostedAndMaintained e c




structure Section2000e10PenaltyTrigger (e : Entity) (c : ComplaintText) : Prop where
  duty      : NoticePostingDutyApplies e c
  willful   : WillfulFailureToPost e c
  withinCap : FineWithinHundredDollarCap e c




structure Section2000e11VeteransPreferenceSaved (c : ComplaintText) : Prop where
  preferenceLaw : LawCreatesVeteransPreference c




structure Section2000e13PenaltyTrigger (perp victim : Person) (c : ComplaintText) : Prop where
  officialDuty : VictimWasCommissionPersonnelOnOfficialDuty victim c
  killing      : KillingInViolationOfSection1114 perp victim c



structure Section2000e14TimelyAnnualReport (c : ComplaintText) : Prop where
  transmitted : AnnualReportTransmitted c
  deadlineMet : TransmittedOnOrBeforeOctoberFirst c



structure Section2000e15TimelyConference (c : ComplaintText) : Prop where
  convened : ConferenceConvened c
  timely   : ConvenedAsSoonAsFeasibleAfterEnactment c
  invited  : RequiredParticipantsInvited c




structure Section2000e17PlanDeemedAccepted
    (pl : AffirmativeActionPlan) (e : Entity) (c : ComplaintText) : Prop where
  accepted            : PlanAcceptedByComplianceAgency pl e c
  noTimelyDisapproval : OfccDidNotDisapproveWithinFortyFiveDays pl c




structure Section2000e17HearingProtection
    (pl : AffirmativeActionPlan) (e : Entity) (c : ComplaintText) : Prop where
  deemedAccepted : Section2000e17PlanDeemedAccepted pl e c
  recent         : AcceptanceWithinPastTwelveMonths pl e c
  noDeviation    : NoSubstantialDeviationFromPlan pl e c




structure Section2000e17LawfulContractAction
    (k : GovernmentContract) (pl : AffirmativeActionPlan) (e : Entity)
    (c : ComplaintText) : Prop where
  protection : Section2000e17HearingProtection pl e c
  hearing    : FullHearingAndAdjudicationAccorded e c
  action     : ContractActionTaken k e c

end Proving.USC.T42.Ch21Misc.Procedure
