









import Proving.USC.T42.Ch21Misc.Procedure.Statute

namespace Proving.USC.T42.Ch21Misc.Procedure

open Proving.USC.Common



theorem categoryMatch_government_intro {e : CoveredEntity}
    {c : ComplaintText} (h : IsGovernmentOperation e c) :
    CategoryMatch e c :=
  .government h

theorem categoryMatch_education_intro {e : CoveredEntity}
    {c : ComplaintText} (h : IsEducationOperation e c) :
    CategoryMatch e c :=
  .education h

theorem categoryMatch_private_intro {e : CoveredEntity}
    {c : ComplaintText} (h : IsPrivateOperation e c) :
    CategoryMatch e c :=
  .private_ h

theorem categoryMatch_joint_intro {e : CoveredEntity}
    {c : ComplaintText} (h : IsJointEntityOperation e c) :
    CategoryMatch e c :=
  .joint h



theorem withinCoverage_intro {e : CoveredEntity} {c : ComplaintText}
    (hCat : OperativeCategoryMatched e c)
    (hFund : FundingExtendedToPart e c) :
    WithinCoverage e c :=
  ⟨hCat, hFund⟩



theorem section2000e1ExemptionGate_aliensAbroad_intro {e : Entity}
    {c : ComplaintText} (h : EmploysAliensOutsideAnyState e c) :
    Section2000e1ExemptionGate e c :=
  .aliensAbroad h

theorem section2000e1ExemptionGate_religiousEntity_intro {e : Entity}
    {c : ComplaintText} (h : IsReligiousEntityEmployingCoreligionists e c) :
    Section2000e1ExemptionGate e c :=
  .religiousEntity h

theorem section2000e1ExemptionGate_foreignLawDefense_intro {e : Entity}
    {c : ComplaintText} (h : ForeignLawComplianceConflict e c) :
    Section2000e1ExemptionGate e c :=
  .foreignLawDefense h

theorem section2000e1ExemptionGate_foreignEmployer_intro {e : Entity}
    {c : ComplaintText} (h : IsForeignPersonNotControlledByAmericanEmployer e c) :
    Section2000e1ExemptionGate e c :=
  .foreignEmployer h

theorem section2000e1Attribution_intro {e corp : Entity} {c : ComplaintText}
    (hControls : EmployerControlsForeignCorporation e corp c)
    (hPractice : PracticeEngagedInByForeignCorporation corp c) :
    Section2000e1Attribution e corp c :=
  ⟨hControls, hPractice⟩



theorem section2000e7StateLawPreserved_intro {c : ComplaintText}
    (hImposes : StateLawImposesLiabilityOrPenalty c)
    (hNoConflict : StateLawDoesNotRequireUnlawfulPractice c) :
    Section2000e7StateLawPreserved c :=
  ⟨hImposes, hNoConflict⟩



theorem section2000e10PostingCompliance_intro {e : Entity} {c : ComplaintText}
    (hDuty : NoticePostingDutyApplies e c)
    (hPosted : ApprovedNoticePostedAndMaintained e c) :
    Section2000e10PostingCompliance e c :=
  ⟨hDuty, hPosted⟩

theorem section2000e10PenaltyTrigger_intro {e : Entity} {c : ComplaintText}
    (hDuty : NoticePostingDutyApplies e c)
    (hWillful : WillfulFailureToPost e c)
    (hCap : FineWithinHundredDollarCap e c) :
    Section2000e10PenaltyTrigger e c :=
  ⟨hDuty, hWillful, hCap⟩



theorem section2000e11VeteransPreferenceSaved_intro {c : ComplaintText}
    (hLaw : LawCreatesVeteransPreference c) :
    Section2000e11VeteransPreferenceSaved c :=
  ⟨hLaw⟩



theorem section2000e13PenaltyTrigger_intro {perp victim : Person}
    {c : ComplaintText}
    (hDuty : VictimWasCommissionPersonnelOnOfficialDuty victim c)
    (hKilling : KillingInViolationOfSection1114 perp victim c) :
    Section2000e13PenaltyTrigger perp victim c :=
  ⟨hDuty, hKilling⟩



theorem section2000e14TimelyAnnualReport_intro {c : ComplaintText}
    (hTransmitted : AnnualReportTransmitted c)
    (hDeadline : TransmittedOnOrBeforeOctoberFirst c) :
    Section2000e14TimelyAnnualReport c :=
  ⟨hTransmitted, hDeadline⟩



theorem section2000e15TimelyConference_intro {c : ComplaintText}
    (hConvened : ConferenceConvened c)
    (hTimely : ConvenedAsSoonAsFeasibleAfterEnactment c)
    (hInvited : RequiredParticipantsInvited c) :
    Section2000e15TimelyConference c :=
  ⟨hConvened, hTimely, hInvited⟩



theorem section2000e17PlanDeemedAccepted_intro {pl : AffirmativeActionPlan}
    {e : Entity} {c : ComplaintText}
    (hAccepted : PlanAcceptedByComplianceAgency pl e c)
    (hWindow : OfccDidNotDisapproveWithinFortyFiveDays pl c) :
    Section2000e17PlanDeemedAccepted pl e c :=
  ⟨hAccepted, hWindow⟩

theorem section2000e17HearingProtection_intro {pl : AffirmativeActionPlan}
    {e : Entity} {c : ComplaintText}
    (hDeemed : Section2000e17PlanDeemedAccepted pl e c)
    (hRecent : AcceptanceWithinPastTwelveMonths pl e c)
    (hNoDev : NoSubstantialDeviationFromPlan pl e c) :
    Section2000e17HearingProtection pl e c :=
  ⟨hDeemed, hRecent, hNoDev⟩

theorem section2000e17LawfulContractAction_intro {k : GovernmentContract}
    {pl : AffirmativeActionPlan} {e : Entity} {c : ComplaintText}
    (hProtection : Section2000e17HearingProtection pl e c)
    (hHearing : FullHearingAndAdjudicationAccorded e c)
    (hAction : ContractActionTaken k e c) :
    Section2000e17LawfulContractAction k pl e c :=
  ⟨hProtection, hHearing, hAction⟩

end Proving.USC.T42.Ch21Misc.Procedure
