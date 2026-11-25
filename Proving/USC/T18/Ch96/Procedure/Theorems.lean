










import Proving.USC.T18.Ch96.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.Procedure

open Proving.USC.Common



theorem patternTiming_intro {c : ComplaintText}
    (hCount : PatternActCountMet c) (hTen : PatternWithinTenYears c)
    (hEff : OneActAfterEffectiveDate c) : PatternTiming c :=
  ⟨hCount, hTen, hEff⟩



theorem preConvictionRestraint_postIndictment {asset : Property} {c : ComplaintText}
    (h : IndictmentOrInformationFiled asset c) : PreConvictionRestraintBasis asset c :=
  .postIndictment h

theorem preConvictionRestraint_preIndictment {asset : Property} {c : ComplaintText}
    (hNotice : PreIndictmentNoticeAndHearingGiven asset c)
    (hProb : SubstantialProbabilityOfForfeitureShown asset c)
    (hBal : PreservationOutweighsHardship asset c) : PreConvictionRestraintBasis asset c :=
  .preIndictment hNotice hProb hBal

theorem validTemporaryRestrainingOrder_intro {asset : Property} {c : ComplaintText}
    (hPC : TROProbableCauseShown asset c)
    (hLife : TROWithinFourteenDays asset c ∨ TROExtendedForGoodCauseOrConsent asset c)
    : ValidTemporaryRestrainingOrder asset c :=
  ⟨hPC, hLife⟩

theorem timelyThirdPartyPetition_intro {asset : Property} {c : ComplaintText}
    (hNotice : ForfeitureNoticePublished asset c)
    (hWithin : ThirdPartyPetitionWithinThirtyDays asset c)
    (hSigned : ThirdPartyPetitionSignedUnderPerjury asset c)
    (hInterest : ThirdPartyPetitionAssertsInterest asset c)
    : TimelyThirdPartyPetition asset c :=
  ⟨hNotice, hWithin, hSigned, hInterest⟩

theorem timelyPetitionHearing_intro {asset : Property} {c : ComplaintText}
    (hPet : TimelyThirdPartyPetition asset c)
    (hHear : ThirdPartyHearingWithinThirtyDays asset c) : TimelyPetitionHearing asset c :=
  ⟨hPet, hHear⟩

theorem thirdPartyClaim_superior {asset : Property} {c : ComplaintText}
    (h : SuperiorOrVestedInterestProven asset c) : ThirdPartyClaimGround asset c :=
  .superiorInterest h

theorem thirdPartyClaim_bfp {asset : Property} {c : ComplaintText}
    (h : BonaFidePurchaserProven asset c) : ThirdPartyClaimGround asset c :=
  .bonaFidePurchaser h

theorem ancillaryForfeitureAdjudication_intro {asset : Property} {p : Person} {c : ComplaintText}
    (hConv : ConvictionEnteredForRicoOffense p c)
    (hJudg : ForfeitureJudgmentEntered asset c)
    (hVest : TitleVestedOnCommission asset c)
    (hHear : TimelyPetitionHearing asset c)
    (hGround : ThirdPartyClaimGround asset c)
    (hClear : ClearTitleVestedInUnitedStates asset c)
    : AncillaryForfeitureAdjudication asset p c :=
  ⟨hConv, hJudg, hVest, hHear, hGround, hClear⟩



theorem timelyCivilRicoAction_intro {p : Person} {c : ComplaintText}
    (hWithin : CivilActionFiledWithinFourYears p c)
    (hNotBarred : ¬ SecuritiesFraudExceptionBars p c) : TimelyCivilRicoAction p c :=
  ⟨hWithin, hNotBarred⟩

theorem criminalJudgmentEstoppel_intro {c : ComplaintText}
    (hPrior : PriorFederalCriminalJudgmentForUnitedStates c)
    (hCivil : SubsequentCivilProceedingByUnitedStates c) : CriminalJudgmentEstoppel c :=
  ⟨hPrior, hCivil⟩



theorem validCivilSubpoenaService_intro {p : Person} {c : ComplaintText}
    (hUS : InstitutedByUnitedStates c)
    (hReach : CivilSubpoenaWithinHundredMiles p c
                ∨ SubpoenaServiceJudgeApprovedOnGoodCause p c)
    : ValidCivilSubpoenaService p c :=
  ⟨hUS, hReach⟩

theorem nationwideServiceOfProcess_intro {p : Person} {c : ComplaintText}
    (hEnds : EndsOfJusticeRequireOtherParties c)
    (hSummon : OtherDistrictPartySummoned p c) : NationwideServiceOfProcess p c :=
  ⟨hEnds, hSummon⟩



theorem expeditionSequence_intro {c : ComplaintText}
    (hUS : CivilActionInstitutedByUnitedStates c)
    (hCert : PublicImportanceCertificateFiled c)
    (hFurn : CertificateFurnishedToChiefJudge c)
    (hDesig : JudgeDesignatedToHearAndDetermine c) : ExpeditionSequence c :=
  ⟨hUS, hCert, hFurn, hDesig⟩



theorem discretionaryClosure_intro {c : ComplaintText}
    (hRights : AffectedPersonsRightsConsidered c)
    (hClosed : ProceedingClosedAtCourtDiscretion c) : DiscretionaryClosure c :=
  ⟨hRights, hClosed⟩



theorem wellFormedDemand_intro {d : CivilInvestigativeDemand} {c : ComplaintText}
    (hConduct : DemandStatesNatureOfConduct d c)
    (hDesc : DemandDescribesMaterial d c)
    (hReturn : DemandStatesReturnDate d c)
    (hCust : DemandIdentifiesCustodian d c)
    (hReason : DemandNotUnreasonableAsGrandJurySubpoena d c)
    (hPriv : DemandNotPrivileged d c) : WellFormedDemand d c :=
  ⟨hConduct, hDesc, hReturn, hCust, hReason, hPriv⟩

theorem validDemandIssuanceAndService_intro {d : CivilInvestigativeDemand} {c : ComplaintText}
    (hReason : ReasonToBelieveMaterialRelevant c)
    (hIssued : DemandIssuedInWritingBeforeProceeding d c)
    (hWF : WellFormedDemand d c)
    (hServed : DemandServed d c)
    (hReturn : VerifiedReturnOfService d c)
    (hCust : CustodianDesignated c) : ValidDemandIssuanceAndService d c :=
  ⟨hReason, hIssued, hWF, hServed, hReturn, hCust⟩

theorem timelySetAsidePetition_intro {d : CivilInvestigativeDemand} {c : ComplaintText}
    (hTwenty : SetAsidePetitionWithinTwentyDays d c)
    (hReturn : SetAsidePetitionBeforeReturnDate d c) : TimelySetAsidePetition d c :=
  ⟨hTwenty, hReturn⟩

end Proving.USC.T18.Ch96.Procedure
