






import Proving.USC.T18.Ch42Ch95.Ontology.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Ontology

open Proving.USC.Common








axiom IsExtensionOfCredit (x : ExtensionOfCredit) (c : ComplaintText) : Prop





axiom IsExtortionateExtensionOfCredit (x : ExtensionOfCredit) (c : ComplaintText) : Prop




axiom IsCreditor (p : Person) (x : ExtensionOfCredit) (c : ComplaintText) : Prop




axiom IsDebtor (p : Person) (x : ExtensionOfCredit) (c : ComplaintText) : Prop




axiom IsNaturalPerson (p : Person) (c : ComplaintText) : Prop






axiom RepaymentUnenforceableInResidenceJurisdiction
    (x : ExtensionOfCredit) (p : Person) (j : Jurisdiction) (c : ComplaintText) : Prop





axiom RepaymentUnenforceableInEveryOrganizationJurisdiction
    (x : ExtensionOfCredit) (p : Person) (c : ComplaintText) : Prop




axiom RateExceedsFortyFivePercentActuarial
    (x : ExtensionOfCredit) (c : ComplaintText) : Prop





axiom DebtorBelievedPriorExtortionateCollection
    (x : ExtensionOfCredit) (p : Person) (c : ComplaintText) : Prop




axiom CreditorHadExtortionateReputation (p : Person) (c : ComplaintText) : Prop





axiom OutstandingExtensionsExceedOneHundredDollars
    (x : ExtensionOfCredit) (cred : Person) (dbtr : Person) (c : ComplaintText) : Prop




axiom DebtorMemberOfCreditorReputationCommunity
    (dbtr : Person) (cred : Person) (c : ComplaintText) : Prop








axiom IsExtortionateMeans (m : ExtortionateMeans) (c : ComplaintText) : Prop




axiom KnowinglyParticipatesInUseOfExtortionateMeans
    (p : Person) (m : ExtortionateMeans) (c : ComplaintText) : Prop




axiom UsedToCollectExtensionOfCredit
    (m : ExtortionateMeans) (x : ExtensionOfCredit) (c : ComplaintText) : Prop




axiom UsedToPunishNonrepayment
    (m : ExtortionateMeans) (v : Person) (x : ExtensionOfCredit) (c : ComplaintText) : Prop




axiom CarriedImplicitThreatAsMeansOfCollection
    (m : ExtortionateMeans) (c : ComplaintText) : Prop




axiom PriorExtortionateCollectionKnownToTarget
    (v : Person) (cred : Person) (c : ComplaintText) : Prop







axiom IsUnlawfulActivity (u : UnlawfulActivity) (c : ComplaintText) : Prop





axiom IsBusinessEnterpriseInvolvingProhibitedActivity
    (u : UnlawfulActivity) (c : ComplaintText) : Prop




axiom IsExtortionBriberyOrArsonViolation
    (u : UnlawfulActivity) (c : ComplaintText) : Prop




axiom IsIndictableFinancialOffense
    (u : UnlawfulActivity) (c : ComplaintText) : Prop




axiom IsState (j : Jurisdiction) (c : ComplaintText) : Prop



axiom IsStateOfTheUnitedStates (j : Jurisdiction) (c : ComplaintText) : Prop



axiom IsDistrictOfColumbia (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsCommonwealthTerritoryOrPossession (j : Jurisdiction) (c : ComplaintText) : Prop





axiom UsesInterstateCommerceFacilityOrTravels (p : Person) (c : ComplaintText) : Prop





axiom IsInsuredCreditUnion (f : FinancialInstitution) (c : ComplaintText) : Prop





axiom IsInsuredDepositoryInstitution (f : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsSavingsPromotionRaffle (r : SavingsPromotionRaffle) (c : ComplaintText) : Prop





axiom SoleConsiderationIsSavingsDeposit
    (r : SavingsPromotionRaffle) (c : ComplaintText) : Prop




axiom EachEntryHasEqualChanceOfBeingDrawn
    (r : SavingsPromotionRaffle) (c : ComplaintText) : Prop




axiom SubjectToPrudentialRegulatorRegulations
    (r : SavingsPromotionRaffle) (c : ComplaintText) : Prop







axiom IsTransaction (t : Transaction) (c : ComplaintText) : Prop




axiom IsDispositionOfProperty (t : Transaction) (c : ComplaintText) : Prop






axiom IsFinancialInstitutionDealing
    (t : Transaction) (f : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsFinancialTransaction (t : Transaction) (c : ComplaintText) : Prop




axiom AffectsInterstateOrForeignCommerce (t : Transaction) (c : ComplaintText) : Prop




axiom InvolvesMovementOfFunds (t : Transaction) (c : ComplaintText) : Prop



axiom InvolvesMonetaryInstruments
    (t : Transaction) (m : MonetaryInstrument) (c : ComplaintText) : Prop




axiom InvolvesTransferOfTitleToTitledProperty (t : Transaction) (c : ComplaintText) : Prop





axiom InvolvesCommerceAffectingFinancialInstitution
    (t : Transaction) (f : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsMonetaryInstrument (m : MonetaryInstrument) (c : ComplaintText) : Prop




axiom IsCoinCurrencyCheckOrMoneyOrder (m : MonetaryInstrument) (c : ComplaintText) : Prop




axiom IsBearerSecurityOrNegotiableInstrument
    (m : MonetaryInstrument) (c : ComplaintText) : Prop



axiom IsFinancialInstitution (f : FinancialInstitution) (c : ComplaintText) : Prop





axiom IsTitle31FinancialInstitution (f : FinancialInstitution) (c : ComplaintText) : Prop





axiom IsForeignBank (f : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsSpecifiedUnlawfulActivity
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop




axiom IsSection1961ListedOffense
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop





axiom IsForeignNationOffenseOfEnumeratedKind
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop




axiom IsContinuingCriminalEnterprise
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop




axiom IsEnumeratedFederalOffense
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop




axiom IsEnvironmentalFelony (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop




axiom IsFederalHealthCareOffense
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop




axiom IsWildlifeTraffickingViolationOverThreshold
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop



axiom IsProceeds (p : Property) (c : ComplaintText) : Prop





axiom IsDerivedFromSomeFormOfUnlawfulActivity (p : Property) (c : ComplaintText) : Prop



axiom Conducts (per : Person) (t : Transaction) (c : ComplaintText) : Prop



axiom InitiatesTransaction (per : Person) (t : Transaction) (c : ComplaintText) : Prop



axiom ConcludesTransaction (per : Person) (t : Transaction) (c : ComplaintText) : Prop




axiom ParticipatesInInitiatingOrConcludingTransaction
    (per : Person) (t : Transaction) (c : ComplaintText) : Prop





axiom KnowsPropertyRepresentsProceedsOfSomeUnlawfulActivity
    (per : Person) (p : Property) (c : ComplaintText) : Prop





axiom PropertyRepresentsProceedsOfFelonyActivity (p : Property) (c : ComplaintText) : Prop




axiom IsRepresentedProceeds (p : Property) (c : ComplaintText) : Prop




axiom RepresentationMadeByLawEnforcementOfficer (p : Property) (c : ComplaintText) : Prop




axiom RepresentationMadeAtDirectionOfFederalOfficial (p : Property) (c : ComplaintText) : Prop





axiom PartOfSinglePlanOfParallelOrDependentTransactions
    (t : Transaction) (c : ComplaintText) : Prop




axiom InvolvesProceedsOfSpecifiedUnlawfulActivity
    (t : Transaction) (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop




axiom IsSingleContinuingFundsTransfer (t : Transaction) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch42Ch95.Ontology
