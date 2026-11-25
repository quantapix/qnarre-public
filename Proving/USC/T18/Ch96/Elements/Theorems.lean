import Proving.USC.T18.Ch96.Elements.Statute
set_option autoImplicit false
set_option relaxedAutoImplicit false







namespace Proving.USC.T18.Ch96.Elements

open Proving.USC.Common


theorem associationInFact_intro {e c}
    (hPurpose : HasSharedPurpose e c) (hRel : HasOngoingRelationships e c)
    (hLong : HasLongevity e c) (hDist : DistinctFromPattern e c) :
    AssociationInFact e c :=
  ⟨hPurpose, hRel, hLong, hDist⟩


theorem patternOfRacketeering_intro {acts c}
    (hCount : 2 ≤ RacketeeringActCount c) (hEff : OneActAfterEffectiveDate c)
    (hSpan : YearsBetweenPriorAndLastAct c ≤ 10) (hRel : ActsAreRelated acts c)
    (hCont : ActsShowContinuity acts c) :
    PatternOfRacketeering acts c :=
  ⟨hCount, hEff, hSpan, hRel, hCont⟩


theorem isUnlawfulDebt_intro {d c}
    (hA : DebtUnenforceableGamblingOrUsury d c) (hB : DebtInUnlawfulBusiness d c) :
    IsUnlawfulDebt d c :=
  ⟨hA, hB⟩


theorem section1962a_intro {p i e c}
    (hCulp : CulpablePersonCapableOfIntent p c) (hInc : ReceivedIncomeFromPatternOrDebt p i c)
    (hPrin : ParticipatedAsPrincipal p c) (hInv : UsedOrInvestedIncomeInEnterprise p i e c)
    (hEnt : IsEnterprise e c) (hICC : EngagedInInterstateCommerce e c)
    (hSafe : ¬ WithinSecuritiesSafeHarbor p c) :
    Section1962a p i e c :=
  ⟨hCulp, hInc, hPrin, hInv, hEnt, hICC, hSafe⟩


theorem section1962b_intro {p e acts d c}
    (hCulp : CulpablePersonCapableOfIntent p c)
    (hAcq : AcquiredOrMaintainedInterestOrControl p e c)
    (hBasis : PatternOrUnlawfulDebt acts d c) (hEnt : IsEnterprise e c)
    (hICC : EngagedInInterstateCommerce e c) :
    Section1962b p e acts d c :=
  ⟨hCulp, hAcq, hBasis, hEnt, hICC⟩


theorem section1962c_intro {p e acts d c}
    (hCulp : CulpablePersonCapableOfIntent p c) (hEnt : IsEnterprise e c)
    (hICC : EngagedInInterstateCommerce e c) (hDist : PersonEnterpriseDistinct p e c)
    (hAssoc : EmployedOrAssociated p e c) (hCond : ConductsOrParticipates p e c)
    (hBasis : PatternOrUnlawfulDebt acts d c) :
    Section1962c p e acts d c :=
  ⟨hCulp, hEnt, hICC, hDist, hAssoc, hCond, hBasis⟩


theorem section1962d_intro {p c}
    (hCulp : CulpablePersonCapableOfIntent p c) (hAgree : AgreementAmongTwoOrMore p c)
    (hViol : AgreedToViolateSubstantiveProvision p c) (hSci : ActedWithScienter p c) :
    Section1962d p c :=
  ⟨hCulp, hAgree, hViol, hSci⟩


theorem criminalForfeiture_intro {p e i acts d pr c}
    (hViol : ViolationOfSection1962 p e i acts d c) (hProp : ForfeitableProperty pr c) :
    CriminalForfeiture p e i acts d pr c :=
  ⟨hViol, hProp⟩


theorem validThirdPartyPetition_intro {p pr c}
    (hTimely : PetitionFiledWithinThirtyDays c) (hInt : PetitionerInterest p pr c) :
    ValidThirdPartyPetition p pr c :=
  ⟨hTimely, hInt⟩


theorem substituteAssetForfeiture_intro {p e i acts d pr c}
    (hForf : CriminalForfeiture p e i acts d pr c)
    (hUnavail : OriginalPropertyUnavailableForForfeiture pr c) :
    SubstituteAssetForfeiture p e i acts d pr c :=
  ⟨hForf, hUnavail⟩


theorem equitableRicoClaim_intro {p e i acts d c}
    (hViol : ViolationOfSection1962 p e i acts d c) :
    EquitableRicoClaim p e i acts d c :=
  ⟨hViol⟩


theorem validCivilRicoClaim_intro {plaintiff defendant e i acts d pr c}
    (hViol : ViolationOfSection1962 defendant e i acts d c)
    (hInj : InjuredInBusinessOrProperty plaintiff pr c)
    (hCause : ProximateCause plaintiff c)
    (hBar : SecuritiesFraudBarOvercome plaintiff c)
    (hTime : WithinLimitations plaintiff c) :
    ValidCivilRicoClaim plaintiff defendant e i acts d pr c :=
  ⟨hViol, hInj, hCause, hBar, hTime⟩


theorem validCivilInvestigativeDemand_intro {p dem c}
    (hReason : AttorneyGeneralReasonToBelievePossession p c)
    (hNature : DemandStatesNatureOfConduct dem c) (hDesc : DemandDescribesMaterial dem c)
    (hDate : DemandStatesReturnDate dem c) (hCust : DemandIdentifiesCustodian dem c) :
    ValidCivilInvestigativeDemand p dem c :=
  ⟨hReason, hNature, hDesc, hDate, hCust⟩


theorem validCIDPetition_intro {dem c}
    (hTimely : PetitionFiledWithinTwentyDays c) (hGround : CIDPetitionGround dem c) :
    ValidCIDPetition dem c :=
  ⟨hTimely, hGround⟩

end Proving.USC.T18.Ch96.Elements
