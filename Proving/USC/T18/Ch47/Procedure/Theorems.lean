






import Proving.USC.T18.Ch47.Procedure.Types
import Proving.USC.T18.Ch47.Procedure.Predicates
import Proving.USC.T18.Ch47.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch47.Procedure

open Proving.USC.Common




theorem section1028Circumstance_of_commerce
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : AffectsInterstateOrForeignCommerce d pr c) : Section1028Circumstance d pr c :=
  .inr (.inr (.inl h))


theorem section1029ExtraterritorialReach_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hOut : ConductOutsideUnitedStatesJurisdiction d pr c)
    (hNexus : AccessDeviceControlledByUnitedStatesEntity d pr c) :
    Section1029ExtraterritorialReach d pr c :=
  ⟨hOut, hNexus⟩


theorem section1029JurisdictionalBasis_of_commerce
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : AffectsInterstateOrForeignCommerce d pr c) : Section1029JurisdictionalBasis d pr c :=
  .inl h


theorem section1029JurisdictionalBasis_of_extraterritorial
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : Section1029ExtraterritorialReach d pr c) : Section1029JurisdictionalBasis d pr c :=
  .inr h





theorem withinOneYearPeriod_of_span
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : AggregationPeriodEndDay d pr c ≤ AggregationPeriodStartDay d pr c + 200) :
    WithinOneYearPeriod d pr c := by
  unfold WithinOneYearPeriod
  omega


theorem oneYearThousandDollarWindow_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hWin : WithinOneYearPeriod d pr c) (hVal : AggregateValueThresholdMet d pr c) :
    OneYearThousandDollarWindow d pr c :=
  ⟨hWin, hVal⟩


theorem priorConvictionFinalBeforeOffense_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hPrior : PriorConvictionUnderThisSectionExists d pr c)
    (hOrder : PriorConvictionFinalDay d pr c ≤ OffenseCommencementDay d pr c) :
    PriorConvictionFinalBeforeOffense d pr c :=
  ⟨hPrior, hOrder⟩


theorem offenseAfterPriorConviction_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hPrior : PriorConvictionUnderThisSectionExists d pr c)
    (hOrder : PriorConvictionEntryDay d pr c ≤ OffenseCommencementDay d pr c) :
    OffenseAfterPriorConviction d pr c :=
  ⟨hPrior, hOrder⟩



theorem conspiracyMaxImprisonmentMonths1029_tenYears :
    conspiracyMaxImprisonmentMonths1029 .tenYears = 60 := rfl




theorem tierAssigned1028_thirty_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : FacilitatesDomesticOrInternationalTerrorism d pr c) :
    TierAssigned1028 d pr c .thirtyYears :=
  .thirty h


theorem tierAssigned1028_twenty_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hNot30 : ¬ FacilitatesDomesticOrInternationalTerrorism d pr c)
    (h : Tier20Ground1028 d pr c) : TierAssigned1028 d pr c .twentyYears :=
  .twenty hNot30 h


theorem tierAssigned1028_fifteen_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hNot30 : ¬ FacilitatesDomesticOrInternationalTerrorism d pr c)
    (hNot20 : ¬ Tier20Ground1028 d pr c)
    (h : Tier15Ground1028 d pr c) : TierAssigned1028 d pr c .fifteenYears :=
  .fifteen hNot30 hNot20 h


theorem tierAssigned1028_five_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hNot30 : ¬ FacilitatesDomesticOrInternationalTerrorism d pr c)
    (hNot20 : ¬ Tier20Ground1028 d pr c)
    (hNot15 : ¬ Tier15Ground1028 d pr c)
    (h : Tier5Ground1028 d pr c) : TierAssigned1028 d pr c .fiveYears :=
  .five hNot30 hNot20 hNot15 h


theorem tierAssigned1028_one_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hNot30 : ¬ FacilitatesDomesticOrInternationalTerrorism d pr c)
    (hNot20 : ¬ Tier20Ground1028 d pr c)
    (hNot15 : ¬ Tier15Ground1028 d pr c)
    (hNot5 : ¬ Tier5Ground1028 d pr c) : TierAssigned1028 d pr c .oneYear :=
  .one hNot30 hNot20 hNot15 hNot5




theorem tierAssigned1029_twenty_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : OffenseAfterPriorConviction d pr c) : TierAssigned1029 d pr c .twentyYears :=
  .twenty h


theorem tierAssigned1029_fifteen_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hNoPrior : ¬ OffenseAfterPriorConviction d pr c)
    (h : OffenseUnderHigherPenaltyParagraph1029 d pr c) :
    TierAssigned1029 d pr c .fifteenYears :=
  .fifteen hNoPrior h


theorem tierAssigned1029_ten_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hNoPrior : ¬ OffenseAfterPriorConviction d pr c)
    (h : OffenseUnderStandardPenaltyParagraph1029 d pr c) :
    TierAssigned1029 d pr c .tenYears :=
  .ten hNoPrior h




theorem prosecutionCognizable1028_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hCirc : Section1028Circumstance d pr c)
    (hCharge : ChargeInstituted d pr c)
    (hEsc : ¬ LawfullyAuthorizedInvestigativeActivity d pr c) :
    ProsecutionCognizable1028 d pr c :=
  ⟨hCirc, hCharge, hEsc⟩


theorem prosecutionCognizable1029_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hJur : Section1029JurisdictionalBasis d pr c)
    (hCharge : ChargeInstituted d pr c)
    (hEsc : ¬ LawfullyAuthorizedInvestigativeActivity d pr c) :
    ProsecutionCognizable1029 d pr c :=
  ⟨hJur, hCharge, hEsc⟩


theorem section1029g2DefenseEstablished_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hCount : ChargedUnderSubsectionA9 d pr c)
    (hNotTraffic : ¬ ChargedConductIsProducingOrTrafficking d pr c)
    (hPurpose : ResearchOrDevelopmentLawfulPurpose d pr c)
    (hBurden : DefendantEstablishedByPreponderance d pr c) :
    Section1029g2DefenseEstablished d pr c :=
  ⟨hCount, hNotTraffic, hPurpose, hBurden⟩


theorem convictionSustainable1029A9_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hCog : ProsecutionCognizable1029 d pr c)
    (hCount : ChargedUnderSubsectionA9 d pr c)
    (hNoCarrier : ¬ CarrierProtectivePurposeConduct d pr c)
    (hNoDefense : ¬ Section1029g2DefenseEstablished d pr c)
    (hConv : ConvictionEntered d pr c) :
    ConvictionSustainable1029A9 d pr c :=
  ⟨hCog, hCount, hNoCarrier, hNoDefense, hConv⟩


theorem mandatoryForfeiture1028_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hConv : ConvictionEntered d pr c)
    (hOrder : ForfeitureAndDestructionOrdered d pr c)
    (hProc : ForfeitureProcedureFollowedSection413 d pr c) :
    MandatoryForfeiture1028 d pr c :=
  ⟨hConv, hOrder, hProc⟩


theorem investigationAuthorized1029_intro
    {a : Agency} {pr : Prosecution} {c : ComplaintText}
    (hAuth : AgencyHasInvestigativeAuthority a pr c)
    (hAgree : TreasuryAttorneyGeneralAgreementInEffect a pr c) :
    InvestigationAuthorized1029 a pr c :=
  ⟨hAuth, hAgree⟩


theorem conspiracyLiability1029_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hConsp : ConspiracyOfTwoOrMore d pr c) (hOvert : OvertActInFurtherance d pr c) :
    ConspiracyLiability1029 d pr c :=
  ⟨hConsp, hOvert⟩


theorem inchoateLiability1028_attempt_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : AttemptedOffense d pr c) : InchoateLiability1028 d pr c :=
  .attempt h



theorem inchoateLiability1028_conspiracy_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : ConspiracyOfTwoOrMore d pr c) : InchoateLiability1028 d pr c :=
  .conspiracy h





theorem reachable1028_sentenced_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText} {t : PenaltyTier1028}
    (hCirc : Section1028Circumstance d pr c)
    (hCharge : ChargeInstituted d pr c)
    (hEsc : ¬ LawfullyAuthorizedInvestigativeActivity d pr c)
    (hConv : ConvictionEntered d pr c)
    (hTier : TierAssigned1028 d pr c t) :
    Reachable1028 d pr c .Sentenced :=
  .sentence (.convict (.charge (.circumstance .start hCirc) hCharge hEsc) hConv) t hTier


theorem reachable1028_forfeitureOrdered_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hCirc : Section1028Circumstance d pr c)
    (hCharge : ChargeInstituted d pr c)
    (hEsc : ¬ LawfullyAuthorizedInvestigativeActivity d pr c)
    (hConv : ConvictionEntered d pr c)
    (hForf : MandatoryForfeiture1028 d pr c) :
    Reachable1028 d pr c .ForfeitureOrdered :=
  .forfeit (.convict (.charge (.circumstance .start hCirc) hCharge hEsc) hConv) hForf





theorem reachable1028_exempt_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : LawfullyAuthorizedInvestigativeActivity d pr c) :
    Reachable1028 d pr c .Exempt :=
  .exempt .start h

end Proving.USC.T18.Ch47.Procedure
