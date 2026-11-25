import Proving.USC.T18.Ch47.Elements.Types
import Proving.USC.T18.Ch47.Elements.Predicates
import Proving.USC.T18.Ch47.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false









namespace Proving.USC.T18.Ch47.Elements

open Proving.USC.Common



theorem meansOfIdentificationOfAnother_intro {i : Item} {c : ComplaintText}
    (hMeans : IsMeansOfIdentification i c) (hAnother : BelongsToAnotherPerson i c) :
    MeansOfIdentificationOfAnother i c :=
  ⟨hMeans, hAnother⟩

theorem section1028a1_intro {p : Person} {i : Item} {c : ComplaintText}
    (hKnow : ActedWithScienter p c) (hAuth : WithoutLawfulAuthority p c)
    (hProd : Produced p i c) (hObj : DocumentOrFeature1028 i c) :
    Section1028a1 p i c :=
  ⟨hKnow, hAuth, hProd, hObj⟩

theorem section1028a2_intro {p : Person} {i : Item} {c : ComplaintText}
    (hKnow : ActedWithScienter p c) (hTrans : Transferred p i c)
    (hObj : DocumentOrFeature1028 i c)
    (hTaint : ItemStolenOrProducedWithoutLawfulAuthority i c)
    (hKnewTaint : KnewItemStolenOrProducedWithoutLawfulAuthority p i c) :
    Section1028a2 p i c :=
  ⟨hKnow, hTrans, hObj, hTaint, hKnewTaint⟩

theorem section1028a3_intro {p : Person} {items : List Item} {c : ComplaintText}
    (hKnow : ActedWithScienter p c)
    (hPoss : ∀ i ∈ items, Possessed p i c)
    (hObjs : ∀ i ∈ items, PossessoryObject1028 i c)
    (hIntent : IntentToUseOrTransferUnlawfully p c)
    (hCount : items.length ≥ 5) :
    Section1028a3 p items c :=
  ⟨hKnow, hPoss, hObjs, hIntent, hCount⟩

theorem section1028a4_intro {p : Person} {i : Item} {c : ComplaintText}
    (hKnow : ActedWithScienter p c) (hPoss : Possessed p i c)
    (hObj : PossessoryObject1028 i c) (hIntent : IntentToDefraudUnitedStates p c) :
    Section1028a4 p i c :=
  ⟨hKnow, hPoss, hObj, hIntent⟩

theorem section1028a5_intro {p : Person} {i : Item} {c : ComplaintText}
    (hKnow : ActedWithScienter p c) (hConduct : ProduceTransferPossess1028 p i c)
    (hObj : ImplementOrFeature1028 i c)
    (hIntent : IntentImplementUsedToProduceFalseDocument p i c) :
    Section1028a5 p i c :=
  ⟨hKnow, hConduct, hObj, hIntent⟩

theorem section1028a6_intro {p : Person} {i : Item} {c : ComplaintText}
    (hKnow : ActedWithScienter p c) (hPoss : Possessed p i c)
    (hObj : DocumentOrAuthenticationFeature i c)
    (hGov : AppearsToBeDocumentOfUnitedStatesOrSponsoringEntity i c)
    (hTaint : ItemStolenOrProducedWithoutLawfulAuthority i c)
    (hKnewTaint : KnewItemStolenOrProducedWithoutLawfulAuthority p i c) :
    Section1028a6 p i c :=
  ⟨hKnow, hPoss, hObj, hGov, hTaint, hKnewTaint⟩

theorem section1028a7_intro {p : Person} {i : Item} {c : ComplaintText}
    (hKnow : ActedWithScienter p c) (hConduct : TransferPossessUse1028 p i c)
    (hAuth : WithoutLawfulAuthority p c)
    (hObj : IsMeansOfIdentificationOfAnotherPerson i c)
    (hIntent : IntentToCommitOrAidUnlawfulActivity p c) :
    Section1028a7 p i c :=
  ⟨hKnow, hConduct, hAuth, hObj, hIntent⟩

theorem section1028a8_intro {p : Person} {i : Item} {c : ComplaintText}
    (hKnow : ActedWithScienter p c) (hTraffic : TraffickedIn p i c)
    (hObj : FalseOrActualAuthenticationFeature i c)
    (hForUse : ForUseInFalseDocumentsOrMeansOfIdentification p i c) :
    Section1028a8 p i c :=
  ⟨hKnow, hTraffic, hObj, hForUse⟩

theorem violationOfSection1028_intro
    {p : Person} {i : Item} {items : List Item} {c : ComplaintText}
    (hConduct : ProhibitedConduct1028a p i items c)
    (hCircumstance : Circumstance1028c p i c)
    (hNotExcluded : ¬ LawfullyAuthorizedInvestigativeOrIntelligenceActivity p c) :
    ViolationOfSection1028 p i items c :=
  ⟨hConduct, hCircumstance, hNotExcluded⟩

theorem aggravator1028b1A_intro {p : Person} {i : Item} {c : ComplaintText}
    (hConduct : ProductionOrTransfer1028 p i c) (hObj : DocumentOrFeature1028 i c)
    (hHeightened : HeightenedDocumentClass1028b1A i c) :
    Aggravator1028b1A p i c :=
  ⟨hConduct, hObj, hHeightened⟩

theorem aggravator1028b1B_intro {p : Person} {items : List Item} {c : ComplaintText}
    (hConduct : ∀ i ∈ items, ProductionOrTransfer1028 p i c)
    (hObjs : ∀ i ∈ items, DocumentOrFeature1028 i c)
    (hCount : items.length > 5) :
    Aggravator1028b1B p items c :=
  ⟨hConduct, hObjs, hCount⟩

theorem valueAggravator1028b1D_intro
    {p : Person} {i : Item} {aggregateValueUSD spanDays : Nat} {c : ComplaintText}
    (hRoute : Section1028a7 p i c) (hValue : aggregateValueUSD ≥ 1000)
    (hWindow : spanDays ≤ 365) :
    ValueAggravator1028b1D p i aggregateValueUSD spanDays c :=
  ⟨hRoute, hValue, hWindow⟩



theorem carrierProtectionExclusion1029g1_intro {p : Person} {c : ComplaintText}
    (hActor : IsCarrierAffiliatedActor p c)
    (hNotTraffic : ¬ ConductConstitutedTrafficking p c)
    (hPurpose : ForPurposeOfProtectingCarrierPropertyOrRights p c)
    (hNoOther : ¬ ForPurposeOfObtainingAnotherCarriersServiceWithoutAuthorization p c) :
    CarrierProtectionExclusion1029g1 p c :=
  ⟨hActor, hNotTraffic, hPurpose, hNoOther⟩

theorem section1029a1_intro {p : Person} {devices : List Device} {c : ComplaintText}
    (hKnow : ActedWithScienter p c) (hIntent : IntentToDefraud p c)
    (hConduct : ∀ d ∈ devices, ProduceUseTraffic1029 p d c)
    (hObjs : ∀ d ∈ devices, IsCounterfeitAccessDevice d c)
    (hCount : devices.length ≥ 1) :
    Section1029a1 p devices c :=
  ⟨hKnow, hIntent, hConduct, hObjs, hCount⟩

theorem section1029a2_intro
    {p : Person} {devices : List Device} {aggregateValueUSD spanDays : Nat}
    {c : ComplaintText}
    (hKnow : ActedWithScienter p c) (hIntent : IntentToDefraud p c)
    (hConduct : ∀ d ∈ devices, TrafficOrUse1029 p d c)
    (hObjs : ∀ d ∈ devices, IsUnauthorizedAccessDevice d c)
    (hCount : devices.length ≥ 1)
    (hObtained : ObtainedValueByProhibitedConduct p c)
    (hWindow : spanDays ≤ 365) (hValue : aggregateValueUSD ≥ 1000) :
    Section1029a2 p devices aggregateValueUSD spanDays c :=
  ⟨hKnow, hIntent, hConduct, hObjs, hCount, hObtained, hWindow, hValue⟩

theorem section1029a3_intro {p : Person} {devices : List Device} {c : ComplaintText}
    (hKnow : ActedWithScienter p c) (hIntent : IntentToDefraud p c)
    (hPoss : ∀ d ∈ devices, PossessedDevice p d c)
    (hObjs : ∀ d ∈ devices, IsCounterfeitOrUnauthorizedAccessDevice d c)
    (hCount : devices.length ≥ 15) :
    Section1029a3 p devices c :=
  ⟨hKnow, hIntent, hPoss, hObjs, hCount⟩

theorem section1029a4_intro {p : Person} {d : Device} {c : ComplaintText}
    (hKnow : ActedWithScienter p c) (hIntent : IntentToDefraud p c)
    (hConduct : ProduceTrafficControlPossess1029 p d c)
    (hObj : IsDeviceMakingEquipment d c) :
    Section1029a4 p d c :=
  ⟨hKnow, hIntent, hConduct, hObj⟩

theorem section1029a5_intro
    {p : Person} {devices : List Device} {aggregateValueUSD spanDays : Nat}
    {c : ComplaintText}
    (hKnow : ActedWithScienter p c) (hIntent : IntentToDefraud p c)
    (hEffected : EffectedTransactionsToReceivePayment p c)
    (hObjs : ∀ d ∈ devices, IsAccessDevice d c)
    (hAnother : ∀ d ∈ devices, AccessDeviceIssuedToAnotherPerson d c)
    (hCount : devices.length ≥ 1)
    (hWindow : spanDays ≤ 365) (hValue : aggregateValueUSD ≥ 1000) :
    Section1029a5 p devices aggregateValueUSD spanDays c :=
  ⟨hKnow, hIntent, hEffected, hObjs, hAnother, hCount, hWindow, hValue⟩

theorem section1029a6_intro {p : Person} {c : ComplaintText}
    (hNoAuth : WithoutAuthorizationOfIssuer p c) (hKnow : ActedWithScienter p c)
    (hIntent : IntentToDefraud p c) (hPurpose : SolicitationPurpose1029a6 p c) :
    Section1029a6 p c :=
  ⟨hNoAuth, hKnow, hIntent, hPurpose⟩

theorem section1029a7_intro {p : Person} {d : Device} {c : ComplaintText}
    (hKnow : ActedWithScienter p c) (hIntent : IntentToDefraud p c)
    (hConduct : UseProduceTrafficControlPossess1029 p d c)
    (hObj : IsModifiedTelecommunicationsInstrument d c) :
    Section1029a7 p d c :=
  ⟨hKnow, hIntent, hConduct, hObj⟩

theorem section1029a8_intro {p : Person} {d : Device} {c : ComplaintText}
    (hKnow : ActedWithScienter p c) (hIntent : IntentToDefraud p c)
    (hConduct : UseProduceTrafficControlPossess1029 p d c)
    (hObj : IsScanningReceiver d c) :
    Section1029a8 p d c :=
  ⟨hKnow, hIntent, hConduct, hObj⟩

theorem section1029a9_intro {p : Person} {d : Device} {c : ComplaintText}
    (hKnow : ActedWithScienter p c)
    (hConduct : UseProduceTrafficControlPossess1029 p d c)
    (hObj : IsHardwareOrSoftwareConfiguredForTelecomIdentifyingInformation d c)
    (hKnewConfig : KnewHardwareConfiguredToModifyTelecomIdentifyingInformation p d c)
    (hNotExcluded : ¬ CarrierProtectionExclusion1029g1 p c) :
    Section1029a9 p d c :=
  ⟨hKnow, hConduct, hObj, hKnewConfig, hNotExcluded⟩

theorem section1029a10_intro {p : Person} {c : ComplaintText}
    (hNoAuth : WithoutAuthorizationOfCreditCardSystemMember p c)
    (hKnow : ActedWithScienter p c) (hIntent : IntentToDefraud p c)
    (hCaused : CausedAnotherToPresentTransactionRecords p c) :
    Section1029a10 p c :=
  ⟨hNoAuth, hKnow, hIntent, hCaused⟩

theorem violationOfSection1029_intro
    {p : Person} {d : Device} {devices : List Device}
    {aggregateValueUSD spanDays : Nat} {c : ComplaintText}
    (hConduct : ProhibitedConduct1029a p d devices aggregateValueUSD spanDays c)
    (hJurisdiction : Jurisdiction1029 p d c)
    (hNotExcluded : ¬ LawfullyAuthorizedInvestigativeOrIntelligenceActivity p c) :
    ViolationOfSection1029 p d devices aggregateValueUSD spanDays c :=
  ⟨hConduct, hJurisdiction, hNotExcluded⟩

theorem researchDefense1029g2_intro {p : Person} {c : ComplaintText}
    (hNotProdTraffic : ¬ ConductConstitutedProducingOrTrafficking p c)
    (hResearch : ForResearchOrDevelopmentInConnectionWithLawfulPurpose p c) :
    ResearchDefense1029g2 p c :=
  ⟨hNotProdTraffic, hResearch⟩

end Proving.USC.T18.Ch47.Elements
