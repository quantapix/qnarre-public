












import Proving.USC.Common.Types
import Proving.USC.T18.Ch1Ch47.Recert.Deontic.Types
import Proving.USC.T18.Ch1Ch47.Recert.Deontic.Predicates
import Proving.USC.T18.Ch1Ch47.Recert.Deontic.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Deontic

open Proving.USC.Common



theorem specialMaritimeAndTerritorialJurisdiction_intro
    {pl : Place} {c : ComplaintText}
    (h : WithinSpecialMaritimeAndTerritorialJurisdiction pl c) :
    SpecialMaritimeAndTerritorialJurisdiction pl c := h

theorem section7Paragraph9Applies_intro
    {p : Person} {pl : Place} {o : Offense} {c : ComplaintText}
    (hLocus : LocusOfUnitedStatesMissionPremisesOrResidence pl c)
    (hNational : OffenseByOrAgainstNationalOfTheUnitedStates o c)
    (hNot3261 : ¬ IsPersonDescribedInSection3261a p c) :
    Section7Paragraph9Applies p pl o c :=
  ⟨hLocus, hNational, hNot3261⟩


theorem section7Paragraph9Applies_section3261a_excluded
    {p : Person} {pl : Place} {o : Offense} {c : ComplaintText}
    (h : IsPersonDescribedInSection3261a p c) :
    ¬ Section7Paragraph9Applies p pl o c := by
  intro hApplies; exact hApplies.2.2 h

theorem prohibition7Paragraph9NonSupersession_intro
    {c : ComplaintText}
    (hCond : ConflictsWithTreatyOrInternationalAgreement c) :
    Prohibition7Paragraph9NonSupersession c := ⟨hCond⟩

theorem prohibition7Paragraph9NonSupersessionViolated_intro
    {c : ComplaintText}
    (hCond : ConflictsWithTreatyOrInternationalAgreement c)
    (hAct : ParagraphNineDeemedToSupersedeTreaty c) :
    Prohibition7Paragraph9NonSupersessionViolated c := ⟨⟨hCond⟩, hAct⟩



theorem financialInstitution20_intro
    {x : Institution} {c : ComplaintText} (h : IsFinancialInstitution x c) :
    FinancialInstitution20 x c := h



theorem officialRepresentation21b_intro
    {officer : Person} {subject : Person} {pr : Property} {c : ComplaintText}
    (hWho : IsFederalLawEnforcementOfficer officer c
              ∨ ActedAtDirectionOrWithApprovalOfFederalLawEnforcementOfficer officer c)
    (hSaid : RepresentationAsToNatureOfPropertyMade officer subject pr c) :
    OfficialRepresentation21b officer subject pr c := ⟨hWho, hSaid⟩

theorem permission21a_intro
    {o : Offense} {c : ComplaintText}
    (hCond : OffenseHasStolenOrCounterfeitCharacterElements o c) :
    Permission21a o c := ⟨hCond⟩

theorem permission21aExercised_intro
    {officer : Person} {subject : Person} {pr : Property} {o : Offense}
    {c : ComplaintText}
    (hCond : OffenseHasStolenOrCounterfeitCharacterElements o c)
    (hRep : OfficialRepresentation21b officer subject pr c)
    (hBelief : BelievedPropertyOfProscribedCharacterAfterRepresentation subject pr c) :
    Permission21aExercised officer subject pr o c := ⟨⟨hCond⟩, hRep, hBelief⟩

theorem section21Elements_intro
    {p : Person} {pr : Property} {c : ComplaintText}
    (hChar : PropertyOfProscribedCharacter pr c)
    (hKnew : KnewPropertyOfProscribedCharacter p pr c) :
    Section21Elements p pr c := ⟨hChar, hKnew⟩

theorem section21ElementsProvenOrSubstituted_intro
    {officer : Person} {subject : Person} {pr : Property} {o : Offense}
    {c : ComplaintText}
    (h : Section21Elements subject pr c
          ∨ Permission21aExercised officer subject pr o c) :
    Section21ElementsProvenOrSubstituted officer subject pr o c := h



theorem courtOfTheUnitedStates23_intro
    {ct : Court} {c : ComplaintText}
    (hIs : IsCourtOfTheUnitedStates ct c)
    (hNoOverride : ¬ ExpresslyProvidedOtherwise c) :
    CourtOfTheUnitedStates23 ct c := ⟨hIs, hNoOverride⟩


theorem courtOfTheUnitedStates23_expressly_provided_otherwise_excluded
    {ct : Court} {c : ComplaintText} (h : ExpresslyProvidedOtherwise c) :
    ¬ CourtOfTheUnitedStates23 ct c := by
  intro hIn; exact hIn.2 h



theorem violationOrConspiracyToViolate_intro
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : CommittedTheOffense p o c ∨ CriminalConspiracyToViolate p o c) :
    ViolationOrConspiracyToViolate p o c := h

theorem federalHealthCareOffenseCoreBranch_intro
    {p : Person} {o : Offense} {c : ComplaintText}
    (hMode : ViolationOrConspiracyToViolate p o c)
    (hList : ViolationOfEnumeratedCoreHealthCareStatute o c) :
    FederalHealthCareOffenseCoreBranch p o c := ⟨hMode, hList⟩

theorem federalHealthCareOffenseGeneralBranch_intro
    {p : Person} {o : Offense} {hp : HealthCareBenefitProgram} {c : ComplaintText}
    (hMode : ViolationOrConspiracyToViolate p o c)
    (hList : ViolationOfEnumeratedGeneralFraudStatute o c)
    (hProgram : IsHealthCareBenefitProgram hp c)
    (hRelates : RelatesToHealthCareBenefitProgram o hp c) :
    FederalHealthCareOffenseGeneralBranch p o hp c :=
  ⟨hMode, hList, hProgram, hRelates⟩

theorem federalHealthCareOffense24_intro
    {p : Person} {o : Offense} {hp : HealthCareBenefitProgram} {c : ComplaintText}
    (h : FederalHealthCareOffenseCoreBranch p o c
          ∨ FederalHealthCareOffenseGeneralBranch p o hp c) :
    FederalHealthCareOffense24 p o hp c := h



theorem act1028a1_intro
    {p : Person} {c : ComplaintText} (it : IdentificationItem)
    (hItem : IsSection1028Item it c)
    (hAct : ProducesItemWithoutLawfulAuthority p it c) :
    Act1028a1 p c := ⟨it, hItem, hAct⟩

theorem act1028a2_intro
    {p : Person} {c : ComplaintText} (it : IdentificationItem)
    (hItem : IsSection1028Item it c)
    (hAct : TransfersItemKnowingStolenOrUnlawfullyProduced p it c) :
    Act1028a2 p c := ⟨it, hItem, hAct⟩

theorem act1028a3_intro
    {p : Person} {c : ComplaintText}
    (hAct : KnowinglyPossessesItemsWithUnlawfulIntent p c)
    (hCount : identificationItemsPossessedWithUnlawfulIntent p c ≥ 5) :
    Act1028a3 p c := ⟨hAct, hCount⟩

theorem act1028a4_intro
    {p : Person} {c : ComplaintText} (it : IdentificationItem)
    (hItem : IsSection1028Item it c)
    (hAct : PossessesItemWithIntentToDefraudTheUnitedStates p it c) :
    Act1028a4 p c := ⟨it, hItem, hAct⟩

theorem act1028a5_intro_implement
    {p : Person} {c : ComplaintText} (im : DocumentMakingImplement)
    (hIs : IsDocumentMakingImplement im c)
    (hAct : ProducesTransfersOrPossessesDocumentMakingImplement p im c) :
    Act1028a5 p c := Or.inl ⟨im, hIs, hAct⟩

theorem act1028a5_intro_feature
    {p : Person} {c : ComplaintText} (it : IdentificationItem)
    (hIs : IsAuthenticationFeature it c)
    (hAct : ProducesTransfersOrPossessesAuthenticationFeatureForUnlawfulProduction p it c) :
    Act1028a5 p c := Or.inr ⟨it, hIs, hAct⟩

theorem act1028a6_intro
    {p : Person} {c : ComplaintText} (it : IdentificationItem)
    (hItem : IsSection1028Item it c)
    (hAct : PossessesStolenOrUnlawfullyProducedUnitedStatesItem p it c) :
    Act1028a6 p c := ⟨it, hItem, hAct⟩

theorem act1028a7_intro
    {p : Person} {c : ComplaintText} (m : MeansOfIdentification)
    (hIs : IsMeansOfIdentification m c)
    (hAct : TransfersPossessesOrUsesMeansOfIdentificationOfAnother p m c) :
    Act1028a7 p c := ⟨m, hIs, hAct⟩

theorem act1028a8_intro
    {p : Person} {c : ComplaintText} (it : IdentificationItem)
    (hIs : IsAuthenticationFeature it c)
    (hAct : TrafficsInAuthenticationFeatures p it c) :
    Act1028a8 p c := ⟨it, hIs, hAct⟩

theorem prohibitedAct1028a_intro
    {p : Person} {c : ComplaintText}
    (h : Act1028a1 p c ∨ Act1028a2 p c ∨ Act1028a3 p c ∨ Act1028a4 p c
          ∨ Act1028a5 p c ∨ Act1028a6 p c ∨ Act1028a7 p c ∨ Act1028a8 p c) :
    ProhibitedAct1028a p c := h

theorem circumstance1028c_intro
    {p : Person} {c : ComplaintText}
    (h : (∃ it : IdentificationItem,
            ItemIsOrAppearsIssuedByUnitedStatesOrSponsoringEntity it c)
          ∨ (∃ im : DocumentMakingImplement,
              ImplementDesignedOrSuitedForMakingSuchDocument im c)
          ∨ Act1028a4 p c
          ∨ AffectsInterstateOrForeignCommerce c
          ∨ TransportedInTheMailInCourseOfProhibitedConduct c) :
    Circumstance1028c p c := h



theorem prohibition1028a_intro
    {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1028 p c)
    (hCond : Circumstance1028c p c) :
    Prohibition1028a p c := ⟨hAddr, hCond⟩

theorem prohibition1028aViolated_intro
    {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1028 p c)
    (hCond : Circumstance1028c p c)
    (hAct : ProhibitedAct1028a p c)
    (hNoExempt : ¬ Exempt1028 p c) :
    Prohibition1028aViolated p c := ⟨⟨hAddr, hCond⟩, hAct, hNoExempt⟩


theorem prohibition1028aViolated_exempt_not_violated
    {p : Person} {c : ComplaintText} (h : Exempt1028 p c) :
    ¬ Prohibition1028aViolated p c := by
  intro hv; exact hv.2.2 h

theorem prohibition1028f_intro
    {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1028 p c)
    (hCond : Circumstance1028c p c) :
    Prohibition1028f p c := ⟨hAddr, hCond⟩

theorem prohibition1028fViolated_intro
    {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1028 p c)
    (hCond : Circumstance1028c p c)
    (hAct : AttemptsOrConspiresToCommitOffenseUnderSection1028 p c)
    (hNoExempt : ¬ Exempt1028 p c) :
    Prohibition1028fViolated p c := ⟨⟨hAddr, hCond⟩, hAct, hNoExempt⟩


theorem prohibition1028fViolated_exempt_not_violated
    {p : Person} {c : ComplaintText} (h : Exempt1028 p c) :
    ¬ Prohibition1028fViolated p c := by
  intro hv; exact hv.2.2 h

theorem obligation1028Sanction_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hAddr : IsCourtOfTheUnitedStates ct c)
    (hCond : ConvictedOfViolationOfSection1028a p c) :
    Obligation1028Sanction ct p c := ⟨hAddr, hCond⟩

theorem obligation1028SanctionBreached_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hAddr : IsCourtOfTheUnitedStates ct c)
    (hCond : ConvictedOfViolationOfSection1028a p c)
    (hOmitted : ¬ PunishmentImposedAsProvidedInSection1028b ct p c) :
    Obligation1028SanctionBreached ct p c := ⟨⟨hAddr, hCond⟩, hOmitted⟩

theorem obligation1028SanctionDischarged_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hAddr : IsCourtOfTheUnitedStates ct c)
    (hCond : ConvictedOfViolationOfSection1028a p c)
    (hDone : PunishmentImposedAsProvidedInSection1028b ct p c) :
    Obligation1028SanctionDischarged ct p c := ⟨⟨hAddr, hCond⟩, hDone⟩

theorem obligation1028SanctionBreached_not_discharged
    {ct : Court} {p : Person} {c : ComplaintText}
    (h : Obligation1028SanctionBreached ct p c) :
    ¬ Obligation1028SanctionDischarged ct p c := by
  intro hd; exact h.2 hd.2

theorem obligation1028h_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hAddr : IsCourtOfTheUnitedStates ct c)
    (hCond : ConvictedOfViolationOfSection1028a p c) :
    Obligation1028h ct p c := ⟨hAddr, hCond⟩

theorem obligation1028hBreached_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hAddr : IsCourtOfTheUnitedStates ct c)
    (hCond : ConvictedOfViolationOfSection1028a p c)
    (hOmitted : ¬ CourtOrderedForfeitureAndDestructionOfIllicitItems ct p c) :
    Obligation1028hBreached ct p c := ⟨⟨hAddr, hCond⟩, hOmitted⟩

theorem obligation1028hDischarged_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hAddr : IsCourtOfTheUnitedStates ct c)
    (hCond : ConvictedOfViolationOfSection1028a p c)
    (hDone : CourtOrderedForfeitureAndDestructionOfIllicitItems ct p c) :
    Obligation1028hDischarged ct p c := ⟨⟨hAddr, hCond⟩, hDone⟩

theorem obligation1028hBreached_not_discharged
    {ct : Court} {p : Person} {c : ComplaintText}
    (h : Obligation1028hBreached ct p c) :
    ¬ Obligation1028hDischarged ct p c := by
  intro hd; exact h.2 hd.2

theorem forfeiture1028b5Owed_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hObl : Obligation1028Sanction ct p c)
    (hProp : PersonalPropertyUsedOrIntendedToBeUsedToCommitTheOffense c) :
    Forfeiture1028b5Owed ct p c := ⟨hObl, hProp⟩



theorem act1029a1_intro
    {p : Person} {c : ComplaintText} (d : AccessDevice)
    (hIs : IsCounterfeitAccessDevice d c)
    (hAct : ProducesUsesOrTrafficsInCounterfeitAccessDevices p d c) :
    Act1029a1 p c := ⟨d, hIs, hAct⟩

theorem act1029a2_intro
    {p : Person} {c : ComplaintText} (d : AccessDevice)
    (hIs : IsUnauthorizedAccessDevice d c)
    (hAct : TrafficsInOrUsesUnauthorizedAccessDevices p d c)
    (hValue : aggregateValueObtainedInOneYearPeriod p c ≥ 1000) :
    Act1029a2 p c := ⟨⟨d, hIs, hAct⟩, hValue⟩

theorem act1029a3_intro
    {p : Person} {c : ComplaintText}
    (hAct : KnowinglyPossessesCounterfeitOrUnauthorizedAccessDevices p c)
    (hCount : counterfeitOrUnauthorizedAccessDevicesPossessed p c ≥ 15) :
    Act1029a3 p c := ⟨hAct, hCount⟩

theorem act1029a4_intro
    {p : Person} {c : ComplaintText} (q : DeviceMakingEquipment)
    (hIs : IsDeviceMakingEquipment q c)
    (hAct : ProducesTrafficsInOrPossessesDeviceMakingEquipment p q c) :
    Act1029a4 p c := ⟨q, hIs, hAct⟩

theorem act1029a5_intro
    {p : Person} {c : ComplaintText} (d : AccessDevice)
    (hIs : IsAccessDevice d c)
    (hAct : EffectsTransactionsWithAccessDevicesIssuedToAnother p d c)
    (hValue : aggregateValueReceivedInOneYearPeriod p c ≥ 1000) :
    Act1029a5 p c := ⟨⟨d, hIs, hAct⟩, hValue⟩

theorem act1029a6_intro
    {p : Person} {c : ComplaintText} (d : AccessDevice)
    (hIs : IsAccessDevice d c)
    (hAct : SolicitsWithoutIssuerAuthorizationToOfferAccessDevice p d c
              ∨ SolicitsWithoutIssuerAuthorizationToSellAccessDeviceInformation p d c) :
    Act1029a6 p c := ⟨d, hIs, hAct⟩

theorem act1029a7_intro
    {p : Person} {c : ComplaintText} (t : TelecommunicationsInstrument)
    (hAct : UsesOrPossessesModifiedTelecommunicationsInstrument p t c) :
    Act1029a7 p c := ⟨t, hAct⟩

theorem act1029a8_intro
    {p : Person} {c : ComplaintText}
    (hAct : UsesOrPossessesScanningReceiver p c) :
    Act1029a8 p c := hAct

theorem act1029a9_intro
    {p : Person} {c : ComplaintText}
    (hAct : UsesOrPossessesTelecommunicationIdentifyingInformationModifyingHardwareOrSoftware p c) :
    Act1029a9 p c := hAct

theorem act1029a10_intro
    {p : Person} {c : ComplaintText} (x : Institution)
    (hIs : IsCreditCardSystemMember x c)
    (hAct : CausesPresentationOfTransactionRecordsWithoutMemberAuthorization p x c) :
    Act1029a10 p c := ⟨x, hIs, hAct⟩

theorem prohibitedAct1029a_intro
    {p : Person} {c : ComplaintText}
    (h : Act1029a1 p c ∨ Act1029a2 p c ∨ Act1029a3 p c ∨ Act1029a4 p c
          ∨ Act1029a5 p c ∨ Act1029a6 p c ∨ Act1029a7 p c ∨ Act1029a8 p c
          ∨ Act1029a9 p c ∨ Act1029a10 p c) :
    ProhibitedAct1029a p c := h

theorem carrierProtectionExemption1029g1_intro
    {p : Person} {c : ComplaintText} (x : Institution)
    (hCarrier : IsFacilitiesBasedCarrier x c)
    (hConduct : EngagedInNonTraffickingConductToProtectCarrierPropertyOrLegalRights p x c)
    (hNotForOtherCarrier :
      ¬ PurposeToObtainAnotherCarriersTelecommunicationsServiceWithoutAuthorization p c) :
    CarrierProtectionExemption1029g1 p c :=
  ⟨⟨x, hCarrier, hConduct⟩, hNotForOtherCarrier⟩



theorem prohibition1029a_intro
    {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1029 p c)
    (hCond : AffectsInterstateOrForeignCommerce c) :
    Prohibition1029a p c := ⟨hAddr, hCond⟩

theorem prohibition1029aViolated_intro
    {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1029 p c)
    (hCond : AffectsInterstateOrForeignCommerce c)
    (hAct : ProhibitedAct1029a p c)
    (hNoExempt : ¬ Exempt1029 p c) :
    Prohibition1029aViolated p c := ⟨⟨hAddr, hCond⟩, hAct, hNoExempt⟩



theorem prohibition1029aViolated_exempt_not_violated
    {p : Person} {c : ComplaintText} (h : Exempt1029 p c) :
    ¬ Prohibition1029aViolated p c := by
  intro hv; exact hv.2.2 h

theorem prohibition1029a9Violated_intro
    {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1029 p c)
    (hCond : AffectsInterstateOrForeignCommerce c)
    (hAct : Act1029a9 p c)
    (hNoExempt : ¬ Exempt1029 p c)
    (hNoCarrierExemption : ¬ CarrierProtectionExemption1029g1 p c) :
    Prohibition1029a9Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNoExempt, hNoCarrierExemption⟩



theorem prohibition1029a9Violated_carrier_exemption_not_violated
    {p : Person} {c : ComplaintText} (h : CarrierProtectionExemption1029g1 p c) :
    ¬ Prohibition1029a9Violated p c := by
  intro hv; exact hv.2.2.2 h

theorem prohibition1029b1_intro
    {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1029 p c)
    (hCond : AffectsInterstateOrForeignCommerce c) :
    Prohibition1029b1 p c := ⟨hAddr, hCond⟩

theorem prohibition1029b1Violated_intro
    {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1029 p c)
    (hCond : AffectsInterstateOrForeignCommerce c)
    (hAct : AttemptsToCommitOffenseUnderSection1029 p c)
    (hNoExempt : ¬ Exempt1029 p c) :
    Prohibition1029b1Violated p c := ⟨⟨hAddr, hCond⟩, hAct, hNoExempt⟩

theorem prohibition1029b2_intro
    {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1029 p c)
    (hCommerce : AffectsInterstateOrForeignCommerce c)
    (hCond : AnyPartyEngagedInConductInFurtheranceOfTheOffense c) :
    Prohibition1029b2 p c := ⟨hAddr, hCommerce, hCond⟩

theorem prohibition1029b2Violated_intro
    {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1029 p c)
    (hCommerce : AffectsInterstateOrForeignCommerce c)
    (hCond : AnyPartyEngagedInConductInFurtheranceOfTheOffense c)
    (hAct : IsPartyToConspiracyOfTwoOrMoreToCommitOffenseUnderSection1029 p c)
    (hNoExempt : ¬ Exempt1029 p c) :
    Prohibition1029b2Violated p c := ⟨⟨hAddr, hCommerce, hCond⟩, hAct, hNoExempt⟩

theorem power1029d_intro
    {ag : Agency} {c : ComplaintText}
    (hAddr : IsUnitedStatesSecretService ag c) :
    Power1029d ag c := ⟨hAddr⟩

theorem power1029dExercised_intro
    {ag : Agency} {c : ComplaintText}
    (hAddr : IsUnitedStatesSecretService ag c)
    (hAct : InvestigatesOffenseUnderSection1029 ag c) :
    Power1029dExercised ag c := ⟨⟨hAddr⟩, hAct⟩

theorem obligation1029dAgreement_intro
    {ag : Agency} {c : ComplaintText}
    (hAddr : IsUnitedStatesSecretService ag c)
    (hCond : InvestigatesOffenseUnderSection1029 ag c) :
    Obligation1029dAgreement ag c := ⟨hAddr, hCond⟩

theorem obligation1029dAgreementBreached_intro
    {ag : Agency} {c : ComplaintText}
    (hAddr : IsUnitedStatesSecretService ag c)
    (hCond : InvestigatesOffenseUnderSection1029 ag c)
    (hOmitted : ¬ AgreementBetweenSecretaryOfTheTreasuryAndAttorneyGeneralEntered c) :
    Obligation1029dAgreementBreached ag c := ⟨⟨hAddr, hCond⟩, hOmitted⟩

theorem obligation1029dAgreementDischarged_intro
    {ag : Agency} {c : ComplaintText}
    (hAddr : IsUnitedStatesSecretService ag c)
    (hCond : InvestigatesOffenseUnderSection1029 ag c)
    (hDone : AgreementBetweenSecretaryOfTheTreasuryAndAttorneyGeneralEntered c) :
    Obligation1029dAgreementDischarged ag c := ⟨⟨hAddr, hCond⟩, hDone⟩

theorem obligation1029dAgreementBreached_not_discharged
    {ag : Agency} {c : ComplaintText}
    (h : Obligation1029dAgreementBreached ag c) :
    ¬ Obligation1029dAgreementDischarged ag c := by
  intro hd; exact h.2 hd.2

theorem affirmativeDefense1029g2_intro
    {p : Person} {c : ComplaintText}
    (hCharged : Act1029a9 p c)
    (hNotProdOrTraffic : ¬ ConductConsistingOfProducingOrTrafficking p c) :
    AffirmativeDefense1029g2 p c := ⟨hCharged, hNotProdOrTraffic⟩

theorem affirmativeDefense1029g2Established_intro
    {p : Person} {c : ComplaintText}
    (hCharged : Act1029a9 p c)
    (hNotProdOrTraffic : ¬ ConductConsistingOfProducingOrTrafficking p c)
    (hPurpose : ResearchOrDevelopmentInConnectionWithLawfulPurpose p c)
    (hBurden : EstablishedByPreponderanceOfTheEvidence p c) :
    AffirmativeDefense1029g2Established p c :=
  ⟨⟨hCharged, hNotProdOrTraffic⟩, hPurpose, hBurden⟩

theorem extraterritorialReach1029h_intro
    {p : Person} {c : ComplaintText} (d : AccessDevice) (x : Institution)
    (hOutside : ActOutsideJurisdictionOfTheUnitedStates p c)
    (hWould : ActWouldConstituteOffenseUnderSection1029aOrB p c)
    (hIs : IsAccessDevice d c)
    (hNexus : AccessDeviceIssuedOwnedManagedOrControlledByUnitedStatesEntity d x c) :
    ExtraterritorialReach1029h p c :=
  ⟨hOutside, hWould, ⟨d, x, hIs, hNexus⟩⟩

end Proving.USC.T18.Ch1Ch47.Recert.Deontic
