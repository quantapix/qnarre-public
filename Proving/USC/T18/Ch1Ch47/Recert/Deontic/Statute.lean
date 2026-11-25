















import Proving.USC.Common.Types
import Proving.USC.T18.Ch1Ch47.Recert.Deontic.Types
import Proving.USC.T18.Ch1Ch47.Recert.Deontic.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Deontic

open Proving.USC.Common





def modality7 : Modality := Modality.Definition



def SpecialMaritimeAndTerritorialJurisdiction
    (pl : Place) (c : ComplaintText) : Prop :=
  WithinSpecialMaritimeAndTerritorialJurisdiction pl c




def Section7Paragraph9Applies
    (p : Person) (pl : Place) (o : Offense) (c : ComplaintText) : Prop :=
  LocusOfUnitedStatesMissionPremisesOrResidence pl c
    ∧ OffenseByOrAgainstNationalOfTheUnitedStates o c
    ∧ ¬ IsPersonDescribedInSection3261a p c



def modality7Paragraph9NonSupersession : Modality := Modality.Prohibition





structure Prohibition7Paragraph9NonSupersession (c : ComplaintText) : Prop where
  condition : ConflictsWithTreatyOrInternationalAgreement c



def Prohibition7Paragraph9NonSupersessionViolated (c : ComplaintText) : Prop :=
  Prohibition7Paragraph9NonSupersession c ∧ ParagraphNineDeemedToSupersedeTreaty c




def modality20 : Modality := Modality.Definition


def FinancialInstitution20 (x : Institution) (c : ComplaintText) : Prop :=
  IsFinancialInstitution x c





def modality21a : Modality := Modality.Permission





def OfficialRepresentation21b
    (officer : Person) (subject : Person) (pr : Property) (c : ComplaintText) : Prop :=
  (IsFederalLawEnforcementOfficer officer c
     ∨ ActedAtDirectionOrWithApprovalOfFederalLawEnforcementOfficer officer c)
    ∧ RepresentationAsToNatureOfPropertyMade officer subject pr c




structure Permission21a (o : Offense) (c : ComplaintText) : Prop where
  condition : OffenseHasStolenOrCounterfeitCharacterElements o c




def Permission21aExercised
    (officer : Person) (subject : Person) (pr : Property) (o : Offense)
    (c : ComplaintText) : Prop :=
  Permission21a o c
    ∧ OfficialRepresentation21b officer subject pr c
    ∧ BelievedPropertyOfProscribedCharacterAfterRepresentation subject pr c


def Section21Elements
    (p : Person) (pr : Property) (c : ComplaintText) : Prop :=
  PropertyOfProscribedCharacter pr c ∧ KnewPropertyOfProscribedCharacter p pr c



def Section21ElementsProvenOrSubstituted
    (officer : Person) (subject : Person) (pr : Property) (o : Offense)
    (c : ComplaintText) : Prop :=
  Section21Elements subject pr c
    ∨ Permission21aExercised officer subject pr o c




def modality23 : Modality := Modality.Definition





def CourtOfTheUnitedStates23 (ct : Court) (c : ComplaintText) : Prop :=
  IsCourtOfTheUnitedStates ct c ∧ ¬ ExpresslyProvidedOtherwise c




def modality24 : Modality := Modality.Definition




def ViolationOrConspiracyToViolate
    (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  CommittedTheOffense p o c ∨ CriminalConspiracyToViolate p o c




def FederalHealthCareOffenseCoreBranch
    (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  ViolationOrConspiracyToViolate p o c
    ∧ ViolationOfEnumeratedCoreHealthCareStatute o c








def FederalHealthCareOffenseGeneralBranch
    (p : Person) (o : Offense) (hp : HealthCareBenefitProgram)
    (c : ComplaintText) : Prop :=
  ViolationOrConspiracyToViolate p o c
    ∧ ViolationOfEnumeratedGeneralFraudStatute o c
    ∧ IsHealthCareBenefitProgram hp c
    ∧ RelatesToHealthCareBenefitProgram o hp c


def FederalHealthCareOffense24
    (p : Person) (o : Offense) (hp : HealthCareBenefitProgram)
    (c : ComplaintText) : Prop :=
  FederalHealthCareOffenseCoreBranch p o c
    ∨ FederalHealthCareOffenseGeneralBranch p o hp c




def modality1028a : Modality := Modality.Prohibition


def IsSection1028Item (it : IdentificationItem) (c : ComplaintText) : Prop :=
  IsIdentificationDocument it c
    ∨ IsFalseIdentificationDocument it c
    ∨ IsAuthenticationFeature it c


def Act1028a1 (p : Person) (c : ComplaintText) : Prop :=
  ∃ it : IdentificationItem,
    IsSection1028Item it c ∧ ProducesItemWithoutLawfulAuthority p it c


def Act1028a2 (p : Person) (c : ComplaintText) : Prop :=
  ∃ it : IdentificationItem,
    IsSection1028Item it c ∧ TransfersItemKnowingStolenOrUnlawfullyProduced p it c


def Act1028a3 (p : Person) (c : ComplaintText) : Prop :=
  KnowinglyPossessesItemsWithUnlawfulIntent p c
    ∧ identificationItemsPossessedWithUnlawfulIntent p c ≥ 5


def Act1028a4 (p : Person) (c : ComplaintText) : Prop :=
  ∃ it : IdentificationItem,
    IsSection1028Item it c ∧ PossessesItemWithIntentToDefraudTheUnitedStates p it c



def Act1028a5 (p : Person) (c : ComplaintText) : Prop :=
  (∃ im : DocumentMakingImplement,
      IsDocumentMakingImplement im c
        ∧ ProducesTransfersOrPossessesDocumentMakingImplement p im c)
  ∨ (∃ it : IdentificationItem,
      IsAuthenticationFeature it c
        ∧ ProducesTransfersOrPossessesAuthenticationFeatureForUnlawfulProduction p it c)


def Act1028a6 (p : Person) (c : ComplaintText) : Prop :=
  ∃ it : IdentificationItem,
    IsSection1028Item it c ∧ PossessesStolenOrUnlawfullyProducedUnitedStatesItem p it c


def Act1028a7 (p : Person) (c : ComplaintText) : Prop :=
  ∃ m : MeansOfIdentification,
    IsMeansOfIdentification m c
      ∧ TransfersPossessesOrUsesMeansOfIdentificationOfAnother p m c


def Act1028a8 (p : Person) (c : ComplaintText) : Prop :=
  ∃ it : IdentificationItem,
    IsAuthenticationFeature it c ∧ TrafficsInAuthenticationFeatures p it c


def ProhibitedAct1028a (p : Person) (c : ComplaintText) : Prop :=
  Act1028a1 p c ∨ Act1028a2 p c ∨ Act1028a3 p c ∨ Act1028a4 p c
    ∨ Act1028a5 p c ∨ Act1028a6 p c ∨ Act1028a7 p c ∨ Act1028a8 p c



def Circumstance1028c (p : Person) (c : ComplaintText) : Prop :=
  (∃ it : IdentificationItem,
      ItemIsOrAppearsIssuedByUnitedStatesOrSponsoringEntity it c)
  ∨ (∃ im : DocumentMakingImplement,
      ImplementDesignedOrSuitedForMakingSuchDocument im c)
  ∨ Act1028a4 p c
  ∨ AffectsInterstateOrForeignCommerce c
  ∨ TransportedInTheMailInCourseOfProhibitedConduct c


def Exempt1028 (p : Person) (c : ComplaintText) : Prop :=
  LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity p c



structure Prohibition1028a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever1028 p c
  condition : Circumstance1028c p c





def Prohibition1028aViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1028a p c ∧ ProhibitedAct1028a p c ∧ ¬ Exempt1028 p c



structure Prohibition1028f (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever1028 p c
  condition : Circumstance1028c p c


def Prohibition1028fViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1028f p c
    ∧ AttemptsOrConspiresToCommitOffenseUnderSection1028 p c
    ∧ ¬ Exempt1028 p c



def modality1028Sanction : Modality := Modality.Obligation



structure Obligation1028Sanction
    (ct : Court) (p : Person) (c : ComplaintText) : Prop where
  addressee : IsCourtOfTheUnitedStates ct c
  condition : ConvictedOfViolationOfSection1028a p c



def Obligation1028SanctionBreached
    (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Obligation1028Sanction ct p c ∧ ¬ PunishmentImposedAsProvidedInSection1028b ct p c


def Obligation1028SanctionDischarged
    (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Obligation1028Sanction ct p c ∧ PunishmentImposedAsProvidedInSection1028b ct p c


def modality1028h : Modality := Modality.Obligation



structure Obligation1028h (ct : Court) (p : Person) (c : ComplaintText) : Prop where
  addressee : IsCourtOfTheUnitedStates ct c
  condition : ConvictedOfViolationOfSection1028a p c


def Obligation1028hBreached (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Obligation1028h ct p c ∧ ¬ CourtOrderedForfeitureAndDestructionOfIllicitItems ct p c


def Obligation1028hDischarged (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Obligation1028h ct p c ∧ CourtOrderedForfeitureAndDestructionOfIllicitItems ct p c



def Forfeiture1028b5Owed (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Obligation1028Sanction ct p c
    ∧ PersonalPropertyUsedOrIntendedToBeUsedToCommitTheOffense c




def modality1029a : Modality := Modality.Prohibition


def Act1029a1 (p : Person) (c : ComplaintText) : Prop :=
  ∃ d : AccessDevice,
    IsCounterfeitAccessDevice d c ∧ ProducesUsesOrTrafficsInCounterfeitAccessDevices p d c



def Act1029a2 (p : Person) (c : ComplaintText) : Prop :=
  (∃ d : AccessDevice,
      IsUnauthorizedAccessDevice d c ∧ TrafficsInOrUsesUnauthorizedAccessDevices p d c)
    ∧ aggregateValueObtainedInOneYearPeriod p c ≥ 1000


def Act1029a3 (p : Person) (c : ComplaintText) : Prop :=
  KnowinglyPossessesCounterfeitOrUnauthorizedAccessDevices p c
    ∧ counterfeitOrUnauthorizedAccessDevicesPossessed p c ≥ 15


def Act1029a4 (p : Person) (c : ComplaintText) : Prop :=
  ∃ q : DeviceMakingEquipment,
    IsDeviceMakingEquipment q c ∧ ProducesTrafficsInOrPossessesDeviceMakingEquipment p q c


def Act1029a5 (p : Person) (c : ComplaintText) : Prop :=
  (∃ d : AccessDevice,
      IsAccessDevice d c ∧ EffectsTransactionsWithAccessDevicesIssuedToAnother p d c)
    ∧ aggregateValueReceivedInOneYearPeriod p c ≥ 1000


def Act1029a6 (p : Person) (c : ComplaintText) : Prop :=
  ∃ d : AccessDevice,
    IsAccessDevice d c
      ∧ (SolicitsWithoutIssuerAuthorizationToOfferAccessDevice p d c
          ∨ SolicitsWithoutIssuerAuthorizationToSellAccessDeviceInformation p d c)


def Act1029a7 (p : Person) (c : ComplaintText) : Prop :=
  ∃ t : TelecommunicationsInstrument,
    UsesOrPossessesModifiedTelecommunicationsInstrument p t c


def Act1029a8 (p : Person) (c : ComplaintText) : Prop :=
  UsesOrPossessesScanningReceiver p c


def Act1029a9 (p : Person) (c : ComplaintText) : Prop :=
  UsesOrPossessesTelecommunicationIdentifyingInformationModifyingHardwareOrSoftware p c


def Act1029a10 (p : Person) (c : ComplaintText) : Prop :=
  ∃ x : Institution,
    IsCreditCardSystemMember x c
      ∧ CausesPresentationOfTransactionRecordsWithoutMemberAuthorization p x c


def ProhibitedAct1029a (p : Person) (c : ComplaintText) : Prop :=
  Act1029a1 p c ∨ Act1029a2 p c ∨ Act1029a3 p c ∨ Act1029a4 p c ∨ Act1029a5 p c
    ∨ Act1029a6 p c ∨ Act1029a7 p c ∨ Act1029a8 p c ∨ Act1029a9 p c ∨ Act1029a10 p c


def Exempt1029 (p : Person) (c : ComplaintText) : Prop :=
  LawfullyAuthorizedInvestigativeProtectiveOrIntelligenceActivity p c




def CarrierProtectionExemption1029g1 (p : Person) (c : ComplaintText) : Prop :=
  (∃ x : Institution,
      IsFacilitiesBasedCarrier x c
        ∧ EngagedInNonTraffickingConductToProtectCarrierPropertyOrLegalRights p x c)
    ∧ ¬ PurposeToObtainAnotherCarriersTelecommunicationsServiceWithoutAuthorization p c



structure Prohibition1029a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever1029 p c
  condition : AffectsInterstateOrForeignCommerce c


def Prohibition1029aViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1029a p c ∧ ProhibitedAct1029a p c ∧ ¬ Exempt1029 p c





def Prohibition1029a9Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1029a p c
    ∧ Act1029a9 p c
    ∧ ¬ Exempt1029 p c
    ∧ ¬ CarrierProtectionExemption1029g1 p c


structure Prohibition1029b1 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever1029 p c
  condition : AffectsInterstateOrForeignCommerce c


def Prohibition1029b1Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1029b1 p c ∧ AttemptsToCommitOffenseUnderSection1029 p c ∧ ¬ Exempt1029 p c



structure Prohibition1029b2 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever1029 p c
  commerce : AffectsInterstateOrForeignCommerce c
  condition : AnyPartyEngagedInConductInFurtheranceOfTheOffense c


def Prohibition1029b2Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1029b2 p c
    ∧ IsPartyToConspiracyOfTwoOrMoreToCommitOffenseUnderSection1029 p c
    ∧ ¬ Exempt1029 p c


def modality1029dPower : Modality := Modality.Power



structure Power1029d (ag : Agency) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesSecretService ag c


def Power1029dExercised (ag : Agency) (c : ComplaintText) : Prop :=
  Power1029d ag c ∧ InvestigatesOffenseUnderSection1029 ag c



def modality1029dAgreement : Modality := Modality.Obligation




structure Obligation1029dAgreement (ag : Agency) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesSecretService ag c
  condition : InvestigatesOffenseUnderSection1029 ag c


def Obligation1029dAgreementBreached (ag : Agency) (c : ComplaintText) : Prop :=
  Obligation1029dAgreement ag c
    ∧ ¬ AgreementBetweenSecretaryOfTheTreasuryAndAttorneyGeneralEntered c


def Obligation1029dAgreementDischarged (ag : Agency) (c : ComplaintText) : Prop :=
  Obligation1029dAgreement ag c
    ∧ AgreementBetweenSecretaryOfTheTreasuryAndAttorneyGeneralEntered c


def modality1029g2 : Modality := Modality.Permission




structure AffirmativeDefense1029g2 (p : Person) (c : ComplaintText) : Prop where
  charged : Act1029a9 p c
  notProducingOrTrafficking : ¬ ConductConsistingOfProducingOrTrafficking p c


def AffirmativeDefense1029g2Established (p : Person) (c : ComplaintText) : Prop :=
  AffirmativeDefense1029g2 p c
    ∧ ResearchOrDevelopmentInConnectionWithLawfulPurpose p c
    ∧ EstablishedByPreponderanceOfTheEvidence p c


def ExtraterritorialReach1029h (p : Person) (c : ComplaintText) : Prop :=
  ActOutsideJurisdictionOfTheUnitedStates p c
    ∧ ActWouldConstituteOffenseUnderSection1029aOrB p c
    ∧ (∃ d : AccessDevice, ∃ x : Institution,
        IsAccessDevice d c
          ∧ AccessDeviceIssuedOwnedManagedOrControlledByUnitedStatesEntity d x c)

end Proving.USC.T18.Ch1Ch47.Recert.Deontic
