













import Proving.USC.T18.Ch96.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.Procedure

open Proving.USC.Common




def tenYearsDays : Nat := 3650

def fourYearsDays : Nat := 1460

def fourteenDays : Nat := 14

def thirtyDays : Nat := 30

def twentyDays : Nat := 20

def hundredMiles : Nat := 100




def PatternActCountMet (c : ComplaintText) : Prop :=
  2 ≤ RacketeeringActCount c



def PatternWithinTenYears (c : ComplaintText) : Prop :=
  (LastActDay c - ImprisonmentExclusionDays c) - PriorActDay c ≤ tenYearsDays


def OneActAfterEffectiveDate (c : ComplaintText) : Prop :=
  ChapterEffectiveDay c ≤ LastActDay c


structure PatternTiming (c : ComplaintText) : Prop where
  countMet    : PatternActCountMet c
  withinTen   : PatternWithinTenYears c
  afterEffect : OneActAfterEffectiveDate c




def TROWithinFourteenDays (asset : Property) (c : ComplaintText) : Prop :=
  TROExpiryDay asset c - TROEntryDay asset c ≤ fourteenDays


def ThirdPartyPetitionWithinThirtyDays (asset : Property) (c : ComplaintText) : Prop :=
  ThirdPartyPetitionFilingDay asset c - ThirdPartyNoticeDay asset c ≤ thirtyDays


def ThirdPartyHearingWithinThirtyDays (asset : Property) (c : ComplaintText) : Prop :=
  ThirdPartyHearingDay asset c - ThirdPartyPetitionFilingDay asset c ≤ thirtyDays




inductive PreConvictionRestraintBasis (asset : Property) (c : ComplaintText) : Prop

  | postIndictment (h : IndictmentOrInformationFiled asset c)

  | preIndictment
      (hNotice : PreIndictmentNoticeAndHearingGiven asset c)
      (hProb   : SubstantialProbabilityOfForfeitureShown asset c)
      (hBal    : PreservationOutweighsHardship asset c)



structure ValidTemporaryRestrainingOrder (asset : Property) (c : ComplaintText) : Prop where
  probableCause  : TROProbableCauseShown asset c
  withinOrExtend : TROWithinFourteenDays asset c ∨ TROExtendedForGoodCauseOrConsent asset c


structure TimelyThirdPartyPetition (asset : Property) (c : ComplaintText) : Prop where
  noticePublished : ForfeitureNoticePublished asset c
  withinThirty    : ThirdPartyPetitionWithinThirtyDays asset c
  signedPerjury   : ThirdPartyPetitionSignedUnderPerjury asset c
  assertsInterest : ThirdPartyPetitionAssertsInterest asset c


structure TimelyPetitionHearing (asset : Property) (c : ComplaintText) : Prop where
  petition     : TimelyThirdPartyPetition asset c
  hearingTimely : ThirdPartyHearingWithinThirtyDays asset c



inductive ThirdPartyClaimGround (asset : Property) (c : ComplaintText) : Prop
  | superiorInterest (h : SuperiorOrVestedInterestProven asset c)
  | bonaFidePurchaser (h : BonaFidePurchaserProven asset c)



structure AncillaryForfeitureAdjudication (asset : Property) (p : Person) (c : ComplaintText) : Prop where
  conviction  : ConvictionEnteredForRicoOffense p c
  judgment    : ForfeitureJudgmentEntered asset c
  vested      : TitleVestedOnCommission asset c
  hearing     : TimelyPetitionHearing asset c
  ground      : ThirdPartyClaimGround asset c
  clearTitle  : ClearTitleVestedInUnitedStates asset c





def CivilActionFiledWithinFourYears (p : Person) (c : ComplaintText) : Prop :=
  CivilActionFilingDay p c - ClaimAccrualDay p c ≤ fourYearsDays



def CivilActionFiledWithinFourYearsOfConviction (p : Person) (c : ComplaintText) : Prop :=
  CivilActionFilingDay p c - ConvictionBecameFinalDay p c ≤ fourYearsDays




def SecuritiesFraudExceptionBars (p : Person) (c : ComplaintText) : Prop :=
  ReliesOnSecuritiesFraudConduct p c ∧ ¬ CriminallyConvictedInConnectionWithFraud p c



structure TimelyCivilRicoAction (p : Person) (c : ComplaintText) : Prop where
  withinFourYears : CivilActionFiledWithinFourYears p c
  notBarred       : ¬ SecuritiesFraudExceptionBars p c



structure CriminalJudgmentEstoppel (c : ComplaintText) : Prop where
  priorJudgment  : PriorFederalCriminalJudgmentForUnitedStates c
  subsequentCivil : SubsequentCivilProceedingByUnitedStates c




def CivilSubpoenaWithinHundredMiles (p : Person) (c : ComplaintText) : Prop :=
  SubpoenaServiceDistanceMiles p c ≤ hundredMiles



structure ValidCivilSubpoenaService (p : Person) (c : ComplaintText) : Prop where
  byUnitedStates    : InstitutedByUnitedStates c
  withinOrApproved  : CivilSubpoenaWithinHundredMiles p c
                        ∨ SubpoenaServiceJudgeApprovedOnGoodCause p c


structure NationwideServiceOfProcess (p : Person) (c : ComplaintText) : Prop where
  endsOfJustice : EndsOfJusticeRequireOtherParties c
  summoned      : OtherDistrictPartySummoned p c





structure ExpeditionSequence (c : ComplaintText) : Prop where
  byUnitedStates    : CivilActionInstitutedByUnitedStates c
  certificateFiled  : PublicImportanceCertificateFiled c
  furnished         : CertificateFurnishedToChiefJudge c
  judgeDesignated   : JudgeDesignatedToHearAndDetermine c





structure DiscretionaryClosure (c : ComplaintText) : Prop where
  rightsConsidered : AffectedPersonsRightsConsidered c
  closed           : ProceedingClosedAtCourtDiscretion c




structure WellFormedDemand (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop where
  statesConduct   : DemandStatesNatureOfConduct d c
  describesMat    : DemandDescribesMaterial d c
  statesReturn    : DemandStatesReturnDate d c
  identifiesCust  : DemandIdentifiesCustodian d c
  notUnreasonable : DemandNotUnreasonableAsGrandJurySubpoena d c
  notPrivileged   : DemandNotPrivileged d c



structure ValidDemandIssuanceAndService (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop where
  reasonToBelieve : ReasonToBelieveMaterialRelevant c
  issued          : DemandIssuedInWritingBeforeProceeding d c
  wellFormed      : WellFormedDemand d c
  served          : DemandServed d c
  verifiedReturn  : VerifiedReturnOfService d c
  custodian       : CustodianDesignated c


def SetAsidePetitionWithinTwentyDays (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop :=
  SetAsidePetitionFilingDay d c - DemandServiceDay d c ≤ twentyDays


def SetAsidePetitionBeforeReturnDate (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop :=
  SetAsidePetitionFilingDay d c ≤ DemandReturnDateDay d c



structure TimelySetAsidePetition (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop where
  withinTwenty : SetAsidePetitionWithinTwentyDays d c
  beforeReturn : SetAsidePetitionBeforeReturnDate d c

end Proving.USC.T18.Ch96.Procedure
