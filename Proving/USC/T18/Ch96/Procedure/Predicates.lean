















import Proving.USC.T18.Ch96.Procedure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.Procedure

open Proving.USC.Common









axiom RacketeeringActCount (c : ComplaintText) : Nat



axiom PriorActDay (c : ComplaintText) : Nat



axiom LastActDay (c : ComplaintText) : Nat




axiom ImprisonmentExclusionDays (c : ComplaintText) : Nat




axiom ChapterEffectiveDay (c : ComplaintText) : Nat






axiom IndictmentOrInformationFiled (asset : Property) (c : ComplaintText) : Prop




axiom PreIndictmentNoticeAndHearingGiven (asset : Property) (c : ComplaintText) : Prop





axiom SubstantialProbabilityOfForfeitureShown (asset : Property) (c : ComplaintText) : Prop




axiom PreservationOutweighsHardship (asset : Property) (c : ComplaintText) : Prop



axiom RestraintOrderEntered (asset : Property) (c : ComplaintText) : Prop





axiom TROProbableCauseShown (asset : Property) (c : ComplaintText) : Prop



axiom TROEntryDay (asset : Property) (c : ComplaintText) : Nat



axiom TROExpiryDay (asset : Property) (c : ComplaintText) : Nat




axiom TROExtendedForGoodCauseOrConsent (asset : Property) (c : ComplaintText) : Prop




axiom ConvictionEnteredForRicoOffense (p : Person) (c : ComplaintText) : Prop



axiom ForfeitureJudgmentEntered (asset : Property) (c : ComplaintText) : Prop




axiom TitleVestedOnCommission (asset : Property) (c : ComplaintText) : Prop




axiom ForfeitureNoticePublished (asset : Property) (c : ComplaintText) : Prop




axiom ThirdPartyNoticeDay (asset : Property) (c : ComplaintText) : Nat



axiom ThirdPartyPetitionFilingDay (asset : Property) (c : ComplaintText) : Nat



axiom ThirdPartyPetitionSignedUnderPerjury (asset : Property) (c : ComplaintText) : Prop




axiom ThirdPartyPetitionAssertsInterest (asset : Property) (c : ComplaintText) : Prop



axiom ThirdPartyHearingDay (asset : Property) (c : ComplaintText) : Nat




axiom SuperiorOrVestedInterestProven (asset : Property) (c : ComplaintText) : Prop




axiom BonaFidePurchaserProven (asset : Property) (c : ComplaintText) : Prop




axiom InterventionInCriminalCaseBarred (asset : Property) (c : ComplaintText) : Prop




axiom ClearTitleVestedInUnitedStates (asset : Property) (c : ComplaintText) : Prop






axiom DistrictCourtHasJurisdictionToRestrain (c : ComplaintText) : Prop



axiom AttorneyGeneralInstitutedProceeding (c : ComplaintText) : Prop




axiom InterimRestraintPendingFinalDetermination (c : ComplaintText) : Prop




axiom ClaimAccrualDay (p : Person) (c : ComplaintText) : Nat



axiom CivilActionFilingDay (p : Person) (c : ComplaintText) : Nat




axiom ConvictionBecameFinalDay (p : Person) (c : ComplaintText) : Nat




axiom ReliesOnSecuritiesFraudConduct (p : Person) (c : ComplaintText) : Prop




axiom CriminallyConvictedInConnectionWithFraud (p : Person) (c : ComplaintText) : Prop




axiom PriorFederalCriminalJudgmentForUnitedStates (c : ComplaintText) : Prop




axiom SubsequentCivilProceedingByUnitedStates (c : ComplaintText) : Prop






axiom HasVenueNexus (p : Person) (c : ComplaintText) : Prop




axiom EndsOfJusticeRequireOtherParties (c : ComplaintText) : Prop




axiom OtherDistrictPartySummoned (p : Person) (c : ComplaintText) : Prop




axiom InstitutedByUnitedStates (c : ComplaintText) : Prop




axiom SubpoenaServiceDistanceMiles (p : Person) (c : ComplaintText) : Nat




axiom SubpoenaServiceJudgeApprovedOnGoodCause (p : Person) (c : ComplaintText) : Prop




axiom OtherProcessServedAtNexus (p : Person) (c : ComplaintText) : Prop






axiom CivilActionInstitutedByUnitedStates (c : ComplaintText) : Prop




axiom PublicImportanceCertificateFiled (c : ComplaintText) : Prop




axiom CertificateFurnishedToChiefJudge (c : ComplaintText) : Prop




axiom JudgeDesignatedToHearAndDetermine (c : ComplaintText) : Prop






axiom AffectedPersonsRightsConsidered (c : ComplaintText) : Prop



axiom ProceedingClosedAtCourtDiscretion (c : ComplaintText) : Prop






axiom ReasonToBelieveMaterialRelevant (c : ComplaintText) : Prop




axiom DemandIssuedInWritingBeforeProceeding (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop




axiom DemandStatesNatureOfConduct (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop




axiom DemandDescribesMaterial (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop




axiom DemandStatesReturnDate (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop



axiom DemandIdentifiesCustodian (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop




axiom DemandNotUnreasonableAsGrandJurySubpoena (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop




axiom DemandNotPrivileged (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop



axiom DemandServed (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop




axiom VerifiedReturnOfService (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop



axiom CustodianDesignated (c : ComplaintText) : Prop




axiom MaterialProducedOnReturnDate (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop




axiom DemandServiceDay (d : CivilInvestigativeDemand) (c : ComplaintText) : Nat



axiom SetAsidePetitionFilingDay (d : CivilInvestigativeDemand) (c : ComplaintText) : Nat




axiom DemandReturnDateDay (d : CivilInvestigativeDemand) (c : ComplaintText) : Nat




axiom EnforcementPetitionFiledByAG (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop




axiom CustodianPerformancePetitionFiled (d : CivilInvestigativeDemand) (c : ComplaintText) : Prop




axiom CourtJurisdictionOverCidPetition (c : ComplaintText) : Prop

end Proving.USC.T18.Ch96.Procedure
