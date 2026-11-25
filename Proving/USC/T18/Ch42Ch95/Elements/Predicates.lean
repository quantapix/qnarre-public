




import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch42Ch95.Elements.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Elements

open Proving.USC.Common






axiom CulpablePersonCapableOfIntent (p : Person) (c : ComplaintText) : Prop




axiom JoinedTheAgreement (p : Person) (ag : Agreement) (c : ComplaintText) : Prop






axiom MakesExtensionOfCredit (p : Person) (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop




axiom ExtensionOfCreditExists (x : ExtensionOfCredit) (c : ComplaintText) : Prop




axiom CreditorUnderstoodNonrepaymentRiskedViolence (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop




axiom DebtorUnderstoodNonrepaymentRiskedViolence (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop





axiom ContemplatedConsequenceIsViolenceOrCriminalMeans (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop




axiom UnderstandingHeldWhenCreditExtended (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop




axiom RepaymentUnenforceableWhereNaturalDebtorResided (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop





axiom RepaymentUnenforceableInEveryJurisdictionOfEntityDebtor (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop





axiom annualInterestRateHundredthsOfPercent (x : ExtensionOfCredit)
    (c : ComplaintText) : Nat





axiom DebtorReasonablyBelievedCreditorUsedExtortionateMeans (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop




axiom DebtorReasonablyBelievedCreditorHadExtortionateReputation (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop






axiom outstandingExtensionsOfCreditCents (x : ExtensionOfCredit)
    (c : ComplaintText) : Nat




axiom AgreementObjectIsExtortionateExtensionOfCredit (ag : Agreement)
    (c : ComplaintText) : Prop






axiom ParticipatesInUseOfExtortionateMeans (p : Person) (k : CollectionConduct)
    (c : ComplaintText) : Prop




axiom UsesViolenceOrOtherCriminalMeans (k : CollectionConduct)
    (c : ComplaintText) : Prop




axiom MakesExpressThreatOfViolenceOrCriminalMeans (k : CollectionConduct)
    (c : ComplaintText) : Prop





axiom MakesImplicitThreatOfViolenceOrCriminalMeans (k : CollectionConduct)
    (c : ComplaintText) : Prop




axiom HarmDirectedAtPersonReputationOrProperty (k : CollectionConduct)
    (c : ComplaintText) : Prop




axiom PurposeToCollectExtensionOfCredit (k : CollectionConduct)
    (x : ExtensionOfCredit) (c : ComplaintText) : Prop




axiom PurposeToPunishNonrepayment (k : CollectionConduct) (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop




axiom AgreementObjectIsExtortionateCollection (ag : Agreement)
    (c : ComplaintText) : Prop






axiom TravelsInInterstateOrForeignCommerce (p : Person) (a : InterstateAct)
    (c : ComplaintText) : Prop



axiom UsesTheMail (p : Person) (a : InterstateAct) (c : ComplaintText) : Prop




axiom UsesFacilityInInterstateOrForeignCommerce (p : Person) (a : InterstateAct)
    (c : ComplaintText) : Prop




axiom IntendsToDistributeProceedsOfUnlawfulActivity (p : Person)
    (u : UnlawfulActivity) (c : ComplaintText) : Prop




axiom IntendsToCommitCrimeOfViolenceToFurtherUnlawfulActivity (p : Person)
    (u : UnlawfulActivity) (c : ComplaintText) : Prop




axiom IntendsToPromoteManageOrCarryOnUnlawfulActivity (p : Person)
    (u : UnlawfulActivity) (c : ComplaintText) : Prop





axiom IsBusinessEnterpriseInvolvingGamblingLiquorNarcoticsOrProstitution
    (u : UnlawfulActivity) (c : ComplaintText) : Prop




axiom IsExtortionBriberyOrArsonOffense (u : UnlawfulActivity)
    (c : ComplaintText) : Prop




axiom IsActIndictableUnderMoneyLaunderingOrCurrencyReporting (u : UnlawfulActivity)
    (c : ComplaintText) : Prop




axiom PerformsOrAttemptsActDescribedInSubsectionA (p : Person)
    (u : UnlawfulActivity) (c : ComplaintText) : Prop




axiom SubsequentActFollowsTheInterstateAct (a : InterstateAct)
    (u : UnlawfulActivity) (c : ComplaintText) : Prop





axiom SavingsPromotionRaffleByInsuredInstitution (u : UnlawfulActivity)
    (c : ComplaintText) : Prop







axiom KnowsPropertyRepresentsProceedsOfSomeUnlawfulActivity (p : Person)
    (pr : LaunderedProperty) (c : ComplaintText) : Prop





axiom ConductsOrAttemptsFinancialTransaction (p : Person) (t : FinancialTransaction)
    (c : ComplaintText) : Prop




axiom TransactionInFactInvolvesProceedsOfSpecifiedUnlawfulActivity
    (t : FinancialTransaction) (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Prop




axiom PartOfParallelOrDependentTransactionSet (t : FinancialTransaction)
    (c : ComplaintText) : Prop




axiom OneTransactionInSetInvolvesProceedsOfSua (t : FinancialTransaction)
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop




axiom AllTransactionsPartOfSinglePlan (t : FinancialTransaction)
    (c : ComplaintText) : Prop




axiom TransactionAffectsInterstateOrForeignCommerce (t : FinancialTransaction)
    (c : ComplaintText) : Prop




axiom InvolvesMovementOfFunds (t : FinancialTransaction) (c : ComplaintText) : Prop




axiom InvolvesMonetaryInstruments (t : FinancialTransaction)
    (c : ComplaintText) : Prop




axiom InvolvesTransferOfTitleToProperty (t : FinancialTransaction)
    (c : ComplaintText) : Prop




axiom InvolvesUseOfFinancialInstitution (t : FinancialTransaction) (fi : Entity)
    (c : ComplaintText) : Prop




axiom IsOffenseListedInSection1961 (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Prop




axiom IsQualifyingForeignOffense (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Prop




axiom IsContinuingCriminalEnterprise (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Prop



axiom IsEnumeratedFederalOffense (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Prop




axiom IsFelonyEnvironmentalViolation (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Prop



axiom IsFederalHealthCareOffense (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Prop





axiom IsWildlifeTraffickingViolation (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Prop





axiom wildlifeItemsValueCents (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Nat




axiom IntendsToPromoteCarryingOnOfSpecifiedUnlawfulActivity (p : Person)
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop




axiom IntendsToViolateInternalRevenueCodeSection7201Or7206 (p : Person)
    (c : ComplaintText) : Prop





axiom KnowsTransactionDesignedToConcealProceeds (p : Person)
    (t : FinancialTransaction) (c : ComplaintText) : Prop





axiom KnowsTransactionDesignedToAvoidReportingRequirement (p : Person)
    (t : FinancialTransaction) (c : ComplaintText) : Prop





axiom TransfersMonetaryInstrumentOutOfUnitedStates (p : Person)
    (m : MonetaryTransfer) (c : ComplaintText) : Prop





axiom TransfersMonetaryInstrumentIntoUnitedStates (p : Person)
    (m : MonetaryTransfer) (c : ComplaintText) : Prop




axiom KnowsFundsRepresentProceedsOfSomeUnlawfulActivity (p : Person)
    (m : MonetaryTransfer) (c : ComplaintText) : Prop




axiom LawEnforcementRepresentedTheMatterAsTrue (p : Person)
    (c : ComplaintText) : Prop




axiom DefendantsConductIndicatesBeliefInRepresentation (p : Person)
    (c : ComplaintText) : Prop





axiom KnowsTransferDesignedToConcealProceeds (p : Person) (m : MonetaryTransfer)
    (c : ComplaintText) : Prop





axiom KnowsTransferDesignedToAvoidReportingRequirement (p : Person)
    (m : MonetaryTransfer) (c : ComplaintText) : Prop




axiom ConductsOrAttemptsTransactionInvolvingRepresentedProperty (p : Person)
    (t : FinancialTransaction) (pr : LaunderedProperty) (c : ComplaintText) : Prop




axiom PropertyRepresentedToBeProceedsOfSpecifiedUnlawfulActivity
    (pr : LaunderedProperty) (c : ComplaintText) : Prop




axiom PropertyUsedToConductOrFacilitateSpecifiedUnlawfulActivity
    (pr : LaunderedProperty) (c : ComplaintText) : Prop





axiom RepresentationMadeByOrAtDirectionOfFederalAuthority (pr : LaunderedProperty)
    (c : ComplaintText) : Prop





axiom IntendsToConcealNatureOrSourceOfBelievedProceeds (p : Person)
    (pr : LaunderedProperty) (c : ComplaintText) : Prop




axiom IntendsToAvoidTransactionReportingRequirement (p : Person)
    (c : ComplaintText) : Prop




axiom ConductsTransactionDescribedInSection1957 (p : Person)
    (c : ComplaintText) : Prop




axiom IsForeignPerson (p : Person) (c : ComplaintText) : Prop




axiom ServedUnderFederalRulesOrForeignLaw (p : Person) (c : ComplaintText) : Prop





axiom ForeignPersonOffenseOccurredInUnitedStates (p : Person)
    (t : FinancialTransaction) (c : ComplaintText) : Prop





axiom ForeignPersonConvertedForfeitedProperty (p : Person)
    (c : ComplaintText) : Prop




axiom ForeignFinancialInstitutionMaintainsUnitedStatesAccount (p : Person)
    (c : ComplaintText) : Prop




axiom AgreementObjectIsMoneyLaunderingOffense (ag : Agreement)
    (c : ComplaintText) : Prop



axiom IsUnitedStatesCitizen (p : Person) (c : ComplaintText) : Prop




axiom ConductOccursInPartInUnitedStates (p : Person) (c : ComplaintText) : Prop





axiom fundsInvolvedValueCents (t : FinancialTransaction) (c : ComplaintText) : Nat





axiom daysFromOffenseToChargingInstrument (t : FinancialTransaction)
    (c : ComplaintText) : Nat




axiom ProsecutionBroughtWhereTransactionConducted (p : Person)
    (t : FinancialTransaction) (c : ComplaintText) : Prop




axiom ProsecutionBroughtWhereSuaProsecutable (p : Person) (c : ComplaintText) : Prop





axiom DefendantParticipatedInTransferOfProceedsFromThatDistrict (p : Person)
    (c : ComplaintText) : Prop

end Proving.USC.T18.Ch42Ch95.Elements
