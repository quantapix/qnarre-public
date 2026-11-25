import Proving.USC.T18.Ch47.Elements.Types
import Proving.USC.T18.Ch47.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false












namespace Proving.USC.T18.Ch47.Elements

open Proving.USC.Common





inductive DocumentOrFeature1028 (i : Item) (c : ComplaintText) : Prop where
  | identificationDocument (h : IsIdentificationDocument i c)
  | authenticationFeature (h : IsAuthenticationFeature i c)
  | falseIdentificationDocument (h : IsFalseIdentificationDocument i c)


inductive DocumentOrAuthenticationFeature (i : Item) (c : ComplaintText) : Prop where
  | identificationDocument (h : IsIdentificationDocument i c)
  | authenticationFeature (h : IsAuthenticationFeature i c)




inductive PossessoryObject1028 (i : Item) (c : ComplaintText) : Prop where
  | identificationDocument (h : IsIdentificationDocument i c)
      (hNotOwn : NotIssuedLawfullyForUseOfPossessor i c)
  | authenticationFeature (h : IsAuthenticationFeature i c)
  | falseIdentificationDocument (h : IsFalseIdentificationDocument i c)


inductive ImplementOrFeature1028 (i : Item) (c : ComplaintText) : Prop where
  | documentMakingImplement (h : IsDocumentMakingImplement i c)
  | authenticationFeature (h : IsAuthenticationFeature i c)


inductive FalseOrActualAuthenticationFeature (i : Item) (c : ComplaintText) : Prop where
  | actual (h : IsAuthenticationFeature i c)
  | falsified (h : IsFalseAuthenticationFeature i c)


structure MeansOfIdentificationOfAnother (i : Item) (c : ComplaintText) : Prop where
  meansOfIdentification : IsMeansOfIdentification i c
  ofAnotherPerson : BelongsToAnotherPerson i c



abbrev IsMeansOfIdentificationOfAnotherPerson (i : Item) (c : ComplaintText) : Prop :=
  MeansOfIdentificationOfAnother i c




inductive ProduceTransferPossess1028 (p : Person) (i : Item) (c : ComplaintText) : Prop where
  | produced (h : Produced p i c)
  | transferred (h : Transferred p i c)
  | possessed (h : Possessed p i c)


inductive TransferPossessUse1028 (p : Person) (i : Item) (c : ComplaintText) : Prop where
  | transferred (h : Transferred p i c)
  | possessed (h : Possessed p i c)
  | used (h : Used p i c)


inductive ProductionOrTransfer1028 (p : Person) (i : Item) (c : ComplaintText) : Prop where
  | produced (h : Produced p i c)
  | transferred (h : Transferred p i c)




structure Section1028a1 (p : Person) (i : Item) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  withoutAuthority : WithoutLawfulAuthority p c
  produced : Produced p i c
  object : DocumentOrFeature1028 i c



structure Section1028a2 (p : Person) (i : Item) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  transferred : Transferred p i c
  object : DocumentOrFeature1028 i c
  tainted : ItemStolenOrProducedWithoutLawfulAuthority i c
  knewTaint : KnewItemStolenOrProducedWithoutLawfulAuthority p i c




structure Section1028a3 (p : Person) (items : List Item) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  possessed : ∀ i ∈ items, Possessed p i c
  objects : ∀ i ∈ items, PossessoryObject1028 i c
  intent : IntentToUseOrTransferUnlawfully p c
  fiveOrMore : items.length ≥ 5



structure Section1028a4 (p : Person) (i : Item) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  possessed : Possessed p i c
  object : PossessoryObject1028 i c
  intent : IntentToDefraudUnitedStates p c



structure Section1028a5 (p : Person) (i : Item) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  conduct : ProduceTransferPossess1028 p i c
  object : ImplementOrFeature1028 i c
  intent : IntentImplementUsedToProduceFalseDocument p i c




structure Section1028a6 (p : Person) (i : Item) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  possessed : Possessed p i c
  object : DocumentOrAuthenticationFeature i c
  governmental : AppearsToBeDocumentOfUnitedStatesOrSponsoringEntity i c
  tainted : ItemStolenOrProducedWithoutLawfulAuthority i c
  knewTaint : KnewItemStolenOrProducedWithoutLawfulAuthority p i c



structure Section1028a7 (p : Person) (i : Item) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  conduct : TransferPossessUse1028 p i c
  withoutAuthority : WithoutLawfulAuthority p c
  object : IsMeansOfIdentificationOfAnotherPerson i c
  intent : IntentToCommitOrAidUnlawfulActivity p c


structure Section1028a8 (p : Person) (i : Item) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  trafficked : TraffickedIn p i c
  object : FalseOrActualAuthenticationFeature i c
  forUse : ForUseInFalseDocumentsOrMeansOfIdentification p i c


inductive ProhibitedConduct1028a
    (p : Person) (i : Item) (items : List Item) (c : ComplaintText) : Prop where
  | produce (h : Section1028a1 p i c)
  | transferStolen (h : Section1028a2 p i c)
  | possessFiveOrMore (h : Section1028a3 p items c)
  | possessToDefraudUnitedStates (h : Section1028a4 p i c)
  | implement (h : Section1028a5 p i c)
  | possessGovernmental (h : Section1028a6 p i c)
  | meansOfIdentification (h : Section1028a7 p i c)
  | traffickAuthenticationFeature (h : Section1028a8 p i c)






inductive Circumstance1028c (p : Person) (i : Item) (c : ComplaintText) : Prop where
  | governmentalDocument (h : DocumentIssuedOrAppearsIssuedUnderUnitedStatesAuthority i c)
  | implementSuited (h : ImplementSuitedForUnitedStatesDocument i c)
  | offenseUnderA4 (h : Section1028a4 p i c)
  | commerce (h : EngagedInInterstateOrForeignCommerce p c)
  | mail (h : ItemTransportedInTheMail i c)



structure ViolationOfSection1028
    (p : Person) (i : Item) (items : List Item) (c : ComplaintText) : Prop where
  conduct : ProhibitedConduct1028a p i items c
  circumstance : Circumstance1028c p i c
  notExcluded : ¬ LawfullyAuthorizedInvestigativeOrIntelligenceActivity p c




inductive InchoateSection1028
    (p : Person) (o : Offense) (ag : Agreement) (c : ComplaintText) : Prop where
  | attempt (hObject : IsObjectOffenseUnderSection1028 o c)
      (h : AttemptedOffenseUnderSection1028 p o c)
  | conspiracy (hObject : IsObjectOffenseUnderSection1028 o c)
      (hAgreement : AgreementAmongTwoOrMore ag c)
      (h : ConspiredToCommitOffenseUnderSection1028 p o c)






inductive HeightenedDocumentClass1028b1A (i : Item) (c : ComplaintText) : Prop where
  | unitedStates (h : DocumentIssuedOrAppearsIssuedUnderUnitedStatesAuthority i c)
  | vitalRecord (h : IsBirthCertificateDriversLicenseOrPersonalIdentificationCard i c)


structure Aggravator1028b1A (p : Person) (i : Item) (c : ComplaintText) : Prop where
  conduct : ProductionOrTransfer1028 p i c
  object : DocumentOrFeature1028 i c
  heightened : HeightenedDocumentClass1028b1A i c



structure Aggravator1028b1B (p : Person) (items : List Item) (c : ComplaintText) : Prop where
  conduct : ∀ i ∈ items, ProductionOrTransfer1028 p i c
  objects : ∀ i ∈ items, DocumentOrFeature1028 i c
  moreThanFive : items.length > 5





structure ValueAggravator1028b1D
    (p : Person) (i : Item) (aggregateValueUSD : Nat) (spanDays : Nat)
    (c : ComplaintText) : Prop where
  route : Section1028a7 p i c
  threshold : aggregateValueUSD ≥ 1000
  window : spanDays ≤ 365


inductive PenaltyTier1028b1
    (p : Person) (i : Item) (items : List Item)
    (aggregateValueUSD : Nat) (spanDays : Nat) (c : ComplaintText) : Prop where
  | heightenedDocument (h : Aggravator1028b1A p i c)
  | multipleDocuments (h : Aggravator1028b1B p items c)
  | implementOffense (h : Section1028a5 p i c)
  | valueThreshold (h : ValueAggravator1028b1D p i aggregateValueUSD spanDays c)




inductive Aggravator1028b (p : Person) (c : ComplaintText) : Prop where
  | drugTrafficking (h : ToFacilitateDrugTraffickingCrime p c)
  | crimeOfViolence (h : InConnectionWithCrimeOfViolence p c)
  | priorConviction (h : AfterPriorConvictionUnderThisSectionFinal p c)
  | terrorism (h : ToFacilitateActOfTerrorism p c)




inductive CounterfeitOrUnauthorizedDevice (d : Device) (c : ComplaintText) : Prop where
  | counterfeit (h : IsCounterfeitAccessDevice d c)
  | unauthorized (h : IsUnauthorizedAccessDevice d c)


abbrev IsCounterfeitOrUnauthorizedAccessDevice (d : Device) (c : ComplaintText) : Prop :=
  CounterfeitOrUnauthorizedDevice d c


inductive ProduceUseTraffic1029 (p : Person) (d : Device) (c : ComplaintText) : Prop where
  | produced (h : ProducedDevice p d c)
  | used (h : UsedDevice p d c)
  | trafficked (h : TraffickedInDevice p d c)


inductive TrafficOrUse1029 (p : Person) (d : Device) (c : ComplaintText) : Prop where
  | trafficked (h : TraffickedInDevice p d c)
  | used (h : UsedDevice p d c)



inductive ProduceTrafficControlPossess1029
    (p : Person) (d : Device) (c : ComplaintText) : Prop where
  | produced (h : ProducedDevice p d c)
  | trafficked (h : TraffickedInDevice p d c)
  | controlOrCustody (h : HadControlOrCustodyOfDevice p d c)
  | possessed (h : PossessedDevice p d c)



inductive UseProduceTrafficControlPossess1029
    (p : Person) (d : Device) (c : ComplaintText) : Prop where
  | used (h : UsedDevice p d c)
  | produced (h : ProducedDevice p d c)
  | trafficked (h : TraffickedInDevice p d c)
  | controlOrCustody (h : HadControlOrCustodyOfDevice p d c)
  | possessed (h : PossessedDevice p d c)







structure CarrierProtectionExclusion1029g1 (p : Person) (c : ComplaintText) : Prop where
  carrierActor : IsCarrierAffiliatedActor p c
  notTrafficking : ¬ ConductConstitutedTrafficking p c
  protectivePurpose : ForPurposeOfProtectingCarrierPropertyOrRights p c
  noOtherCarrierObjective :
    ¬ ForPurposeOfObtainingAnotherCarriersServiceWithoutAuthorization p c




structure Section1029a1 (p : Person) (devices : List Device) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  intent : IntentToDefraud p c
  conduct : ∀ d ∈ devices, ProduceUseTraffic1029 p d c
  objects : ∀ d ∈ devices, IsCounterfeitAccessDevice d c
  oneOrMore : devices.length ≥ 1


structure Section1029a2
    (p : Person) (devices : List Device) (aggregateValueUSD : Nat) (spanDays : Nat)
    (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  intent : IntentToDefraud p c
  conduct : ∀ d ∈ devices, TrafficOrUse1029 p d c
  objects : ∀ d ∈ devices, IsUnauthorizedAccessDevice d c
  oneOrMore : devices.length ≥ 1
  obtainedByConduct : ObtainedValueByProhibitedConduct p c
  window : spanDays ≤ 365
  aggregate : aggregateValueUSD ≥ 1000


structure Section1029a3 (p : Person) (devices : List Device) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  intent : IntentToDefraud p c
  possessed : ∀ d ∈ devices, PossessedDevice p d c
  objects : ∀ d ∈ devices, IsCounterfeitOrUnauthorizedAccessDevice d c
  fifteenOrMore : devices.length ≥ 15


structure Section1029a4 (p : Person) (d : Device) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  intent : IntentToDefraud p c
  conduct : ProduceTrafficControlPossess1029 p d c
  object : IsDeviceMakingEquipment d c



structure Section1029a5
    (p : Person) (devices : List Device) (aggregateValueUSD : Nat) (spanDays : Nat)
    (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  intent : IntentToDefraud p c
  effected : EffectedTransactionsToReceivePayment p c
  objects : ∀ d ∈ devices, IsAccessDevice d c
  issuedToAnother : ∀ d ∈ devices, AccessDeviceIssuedToAnotherPerson d c
  oneOrMore : devices.length ≥ 1
  window : spanDays ≤ 365
  aggregate : aggregateValueUSD ≥ 1000


inductive SolicitationPurpose1029a6 (p : Person) (c : ComplaintText) : Prop where
  | offering (h : SolicitedPersonToOfferAccessDevice p c)
  | sellingInformation (h : SolicitedPersonToSellAccessDeviceInformation p c)


structure Section1029a6 (p : Person) (c : ComplaintText) : Prop where
  withoutIssuerAuthorization : WithoutAuthorizationOfIssuer p c
  knowingly : ActedWithScienter p c
  intent : IntentToDefraud p c
  purpose : SolicitationPurpose1029a6 p c


structure Section1029a7 (p : Person) (d : Device) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  intent : IntentToDefraud p c
  conduct : UseProduceTrafficControlPossess1029 p d c
  object : IsModifiedTelecommunicationsInstrument d c


structure Section1029a8 (p : Person) (d : Device) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  intent : IntentToDefraud p c
  conduct : UseProduceTrafficControlPossess1029 p d c
  object : IsScanningReceiver d c





structure Section1029a9 (p : Person) (d : Device) (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter p c
  conduct : UseProduceTrafficControlPossess1029 p d c
  object : IsHardwareOrSoftwareConfiguredForTelecomIdentifyingInformation d c
  knewConfiguration : KnewHardwareConfiguredToModifyTelecomIdentifyingInformation p d c
  notCarrierProtected : ¬ CarrierProtectionExclusion1029g1 p c


structure Section1029a10 (p : Person) (c : ComplaintText) : Prop where
  withoutMemberAuthorization : WithoutAuthorizationOfCreditCardSystemMember p c
  knowingly : ActedWithScienter p c
  intent : IntentToDefraud p c
  caused : CausedAnotherToPresentTransactionRecords p c


inductive ProhibitedConduct1029a
    (p : Person) (d : Device) (devices : List Device)
    (aggregateValueUSD : Nat) (spanDays : Nat) (c : ComplaintText) : Prop where
  | counterfeitDevices (h : Section1029a1 p devices c)
  | unauthorizedDevices (h : Section1029a2 p devices aggregateValueUSD spanDays c)
  | fifteenOrMoreDevices (h : Section1029a3 p devices c)
  | deviceMakingEquipment (h : Section1029a4 p d c)
  | transactionsWithAnothersDevice (h : Section1029a5 p devices aggregateValueUSD spanDays c)
  | solicitation (h : Section1029a6 p c)
  | modifiedInstrument (h : Section1029a7 p d c)
  | scanningReceiver (h : Section1029a8 p d c)
  | configuredHardware (h : Section1029a9 p d c)
  | transactionRecords (h : Section1029a10 p c)


inductive Jurisdiction1029 (p : Person) (d : Device) (c : ComplaintText) : Prop where
  | commerce (h : EngagedInInterstateOrForeignCommerce p c)
  | extraterritorial (hOutside : ActOutsideUnitedStatesJurisdiction p c)
      (hDevice : DeviceLinkedToUnitedStatesEntity d c)



structure ViolationOfSection1029
    (p : Person) (d : Device) (devices : List Device)
    (aggregateValueUSD : Nat) (spanDays : Nat) (c : ComplaintText) : Prop where
  conduct : ProhibitedConduct1029a p d devices aggregateValueUSD spanDays c
  jurisdiction : Jurisdiction1029 p d c
  notExcluded : ¬ LawfullyAuthorizedInvestigativeOrIntelligenceActivity p c





inductive InchoateSection1029
    (p : Person) (o : Offense) (ag : Agreement) (c : ComplaintText) : Prop where
  | attempt (hObject : IsObjectOffenseUnderSection1029 o c)
      (h : AttemptedOffenseUnderSection1029 p o c)
  | conspiracy (hObject : IsObjectOffenseUnderSection1029 o c)
      (hAgreement : AgreementAmongTwoOrMore ag c)
      (hParty : PartyToConspiracyOfTwoOrMore p o c)
      (hFurtherance : PartyEngagedInConductInFurtherance o c)




inductive Aggravator1029c (p : Person) (c : ComplaintText) : Prop where
  | priorConviction (h : AfterConvictionForAnotherOffenseUnderSection1029 p c)








structure ResearchDefense1029g2 (p : Person) (c : ComplaintText) : Prop where
  notProducingOrTrafficking : ¬ ConductConstitutedProducingOrTrafficking p c
  researchPurpose : ForResearchOrDevelopmentInConnectionWithLawfulPurpose p c

end Proving.USC.T18.Ch47.Elements
