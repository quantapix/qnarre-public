





import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch42Ch95.Elements.Types
import Proving.USC.T18.Ch42Ch95.Elements.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Elements

open Proving.USC.Common






structure MutualExtortionateUnderstanding (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop where
  creditorUnderstanding : CreditorUnderstoodNonrepaymentRiskedViolence x c
  debtorUnderstanding : DebtorUnderstoodNonrepaymentRiskedViolence x c
  consequence : ContemplatedConsequenceIsViolenceOrCriminalMeans x c
  atTimeCreditMade : UnderstandingHeldWhenCreditExtended x c



abbrev IsExtortionateExtensionOfCredit (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop := MutualExtortionateUnderstanding x c










inductive UnenforceableRepayment (x : ExtensionOfCredit) (c : ComplaintText) : Prop
  | naturalDebtor (h : RepaymentUnenforceableWhereNaturalDebtorResided x c)
  | entityDebtor (h : RepaymentUnenforceableInEveryJurisdictionOfEntityDebtor x c)



def InterestRateExceedsFortyFivePercent (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop :=
  annualInterestRateHundredthsOfPercent x c > 4500


inductive DebtorBeliefAsToCreditor (x : ExtensionOfCredit) (c : ComplaintText) : Prop
  | priorExtortionateCollection
      (h : DebtorReasonablyBelievedCreditorUsedExtortionateMeans x c)
  | extortionateReputation
      (h : DebtorReasonablyBelievedCreditorHadExtortionateReputation x c)



def OutstandingCreditExceededOneHundredDollars (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop :=
  outstandingExtensionsOfCreditCents x c > 10000



structure PrimaFacieExtortionate892b (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop where
  unenforceable : UnenforceableRepayment x c
  excessiveRate : InterestRateExceedsFortyFivePercent x c
  debtorBelief : DebtorBeliefAsToCreditor x c
  outstandingOverHundredDollars : OutstandingCreditExceededOneHundredDollars x c




structure Section892aMaking (p : Person) (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent p c
  makesExtension : MakesExtensionOfCredit p x c
  extortionate : IsExtortionateExtensionOfCredit x c


structure Section892aConspiracy (p : Person) (ag : Agreement)
    (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent p c
  agreement : AgreementAmongTwoOrMore ag c
  object : AgreementObjectIsExtortionateExtensionOfCredit ag c
  joined : JoinedTheAgreement p ag c


inductive Section892a (p : Person) (x : ExtensionOfCredit) (ag : Agreement)
    (c : ComplaintText) : Prop
  | making (h : Section892aMaking p x c)
  | conspiracy (h : Section892aConspiracy p ag c)




inductive ExtortionateMeansRoute (k : CollectionConduct) (c : ComplaintText) : Prop
  | actualUse (h : UsesViolenceOrOtherCriminalMeans k c)
  | expressThreat (h : MakesExpressThreatOfViolenceOrCriminalMeans k c)
  | implicitThreat (h : MakesImplicitThreatOfViolenceOrCriminalMeans k c)



structure ExtortionateMeans (k : CollectionConduct) (c : ComplaintText) : Prop where
  route : ExtortionateMeansRoute k c
  harm : HarmDirectedAtPersonReputationOrProperty k c


abbrev IsExtortionateMeans (k : CollectionConduct) (c : ComplaintText) : Prop :=
  ExtortionateMeans k c




inductive ExtortionatePurpose894 (k : CollectionConduct) (x : ExtensionOfCredit)
    (c : ComplaintText) : Prop
  | collect (h : PurposeToCollectExtensionOfCredit k x c)
  | punishNonrepayment (h : PurposeToPunishNonrepayment k x c)


structure Section894aParticipation (p : Person) (k : CollectionConduct)
    (x : ExtensionOfCredit) (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent p c
  knowingly : ActedWithScienter p c
  participates : ParticipatesInUseOfExtortionateMeans p k c
  extortionateMeans : IsExtortionateMeans k c
  creditExists : ExtensionOfCreditExists x c
  purpose : ExtortionatePurpose894 k x c


structure Section894aConspiracy (p : Person) (ag : Agreement)
    (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent p c
  agreement : AgreementAmongTwoOrMore ag c
  object : AgreementObjectIsExtortionateCollection ag c
  joined : JoinedTheAgreement p ag c


inductive Section894a (p : Person) (k : CollectionConduct) (x : ExtensionOfCredit)
    (ag : Agreement) (c : ComplaintText) : Prop
  | participation (h : Section894aParticipation p k x c)
  | conspiracy (h : Section894aConspiracy p ag c)




inductive InterstateNexus1952 (p : Person) (a : InterstateAct)
    (c : ComplaintText) : Prop
  | travel (h : TravelsInInterstateOrForeignCommerce p a c)
  | mail (h : UsesTheMail p a c)
  | facility (h : UsesFacilityInInterstateOrForeignCommerce p a c)


inductive UnlawfulPurpose1952 (p : Person) (u : UnlawfulActivity)
    (c : ComplaintText) : Prop
  | distributeProceeds (h : IntendsToDistributeProceedsOfUnlawfulActivity p u c)
  | crimeOfViolence
      (h : IntendsToCommitCrimeOfViolenceToFurtherUnlawfulActivity p u c)
  | promoteOrCarryOn (h : IntendsToPromoteManageOrCarryOnUnlawfulActivity p u c)


inductive UnlawfulActivity1952 (u : UnlawfulActivity) (c : ComplaintText) : Prop
  | businessEnterprise
      (h : IsBusinessEnterpriseInvolvingGamblingLiquorNarcoticsOrProstitution u c)
  | extortionBriberyArson (h : IsExtortionBriberyOrArsonOffense u c)
  | launderingOrCurrencyReporting
      (h : IsActIndictableUnderMoneyLaunderingOrCurrencyReporting u c)


abbrev IsUnlawfulActivity (u : UnlawfulActivity) (c : ComplaintText) : Prop :=
  UnlawfulActivity1952 u c




structure Section1952a (p : Person) (a : InterstateAct) (u : UnlawfulActivity)
    (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent p c
  interstateNexus : InterstateNexus1952 p a c
  purpose : UnlawfulPurpose1952 p u c
  unlawfulActivity : IsUnlawfulActivity u c
  thereafterActs : PerformsOrAttemptsActDescribedInSubsectionA p u c
  actFollowsNexus : SubsequentActFollowsTheInterstateAct a u c
  notSavingsPromotionRaffle : ¬ SavingsPromotionRaffleByInsuredInstitution u c




inductive TransactionModality1956 (t : FinancialTransaction)
    (c : ComplaintText) : Prop
  | movementOfFunds (h : InvolvesMovementOfFunds t c)
  | monetaryInstruments (h : InvolvesMonetaryInstruments t c)
  | transferOfTitle (h : InvolvesTransferOfTitleToProperty t c)




inductive FinancialTransaction1956 (t : FinancialTransaction)
    (c : ComplaintText) : Prop
  | commerceAffecting (hNexus : TransactionAffectsInterstateOrForeignCommerce t c)
      (hModality : TransactionModality1956 t c)
  | throughFinancialInstitution (fi : Entity)
      (hUse : InvolvesUseOfFinancialInstitution t fi c)
      (hCommerce : EngagedInInterstateCommerce fi c)


abbrev IsFinancialTransaction (t : FinancialTransaction)
    (c : ComplaintText) : Prop := FinancialTransaction1956 t c



def WildlifeValueExceedsTenThousandDollars (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Prop :=
  wildlifeItemsValueCents s c > 1000000



structure QualifyingWildlifeViolation (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Prop where
  violation : IsWildlifeTraffickingViolation s c
  value : WildlifeValueExceedsTenThousandDollars s c


inductive SpecifiedUnlawfulActivity1956 (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Prop
  | listedInSection1961 (h : IsOffenseListedInSection1961 s c)
  | qualifyingForeignOffense (h : IsQualifyingForeignOffense s c)
  | continuingCriminalEnterprise (h : IsContinuingCriminalEnterprise s c)
  | enumeratedFederalOffense (h : IsEnumeratedFederalOffense s c)
  | environmentalFelony (h : IsFelonyEnvironmentalViolation s c)
  | federalHealthCareOffense (h : IsFederalHealthCareOffense s c)
  | wildlifeTrafficking (h : QualifyingWildlifeViolation s c)


abbrev IsSpecifiedUnlawfulActivity (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Prop := SpecifiedUnlawfulActivity1956 s c






inductive InvolvesProceedsOfSua1956 (t : FinancialTransaction)
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop
  | direct (h : TransactionInFactInvolvesProceedsOfSpecifiedUnlawfulActivity t s c)
  | parallelSet (hSet : PartOfParallelOrDependentTransactionSet t c)
      (hOne : OneTransactionInSetInvolvesProceedsOfSua t s c)
      (hPlan : AllTransactionsPartOfSinglePlan t c)


inductive LaunderingPurpose1956a1 (p : Person) (t : FinancialTransaction)
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop
  | promoteSua (h : IntendsToPromoteCarryingOnOfSpecifiedUnlawfulActivity p s c)
  | taxViolation (h : IntendsToViolateInternalRevenueCodeSection7201Or7206 p c)
  | conceal (h : KnowsTransactionDesignedToConcealProceeds p t c)
  | avoidReporting (h : KnowsTransactionDesignedToAvoidReportingRequirement p t c)


structure Section1956a1 (p : Person) (pr : LaunderedProperty)
    (t : FinancialTransaction) (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent p c
  knowsProceeds : KnowsPropertyRepresentsProceedsOfSomeUnlawfulActivity p pr c
  conducts : ConductsOrAttemptsFinancialTransaction p t c
  financialTransaction : IsFinancialTransaction t c
  specifiedUnlawfulActivity : IsSpecifiedUnlawfulActivity s c
  involvesProceeds : InvolvesProceedsOfSua1956 t s c
  purpose : LaunderingPurpose1956a1 p t s c




inductive CrossBorderTransfer1956 (p : Person) (m : MonetaryTransfer)
    (c : ComplaintText) : Prop
  | outbound (h : TransfersMonetaryInstrumentOutOfUnitedStates p m c)
  | inbound (h : TransfersMonetaryInstrumentIntoUnitedStates p m c)



inductive TransferKnowledge1956a2 (p : Person) (m : MonetaryTransfer)
    (c : ComplaintText) : Prop
  | actual (h : KnowsFundsRepresentProceedsOfSomeUnlawfulActivity p m c)
  | byRepresentation (hRep : LawEnforcementRepresentedTheMatterAsTrue p c)
      (hBelief : DefendantsConductIndicatesBeliefInRepresentation p c)


inductive TransferDesign1956a2 (p : Person) (m : MonetaryTransfer)
    (c : ComplaintText) : Prop
  | conceal (h : KnowsTransferDesignedToConcealProceeds p m c)
  | avoidReporting (h : KnowsTransferDesignedToAvoidReportingRequirement p m c)


structure ConcealmentTransfer1956a2B (p : Person) (m : MonetaryTransfer)
    (c : ComplaintText) : Prop where
  knowledge : TransferKnowledge1956a2 p m c
  design : TransferDesign1956a2 p m c


inductive TransferPurpose1956a2 (p : Person) (m : MonetaryTransfer)
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop
  | promoteSua (h : IntendsToPromoteCarryingOnOfSpecifiedUnlawfulActivity p s c)
  | knowingConcealment (h : ConcealmentTransfer1956a2B p m c)


structure Section1956a2 (p : Person) (m : MonetaryTransfer)
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent p c
  crossBorder : CrossBorderTransfer1956 p m c
  specifiedUnlawfulActivity : IsSpecifiedUnlawfulActivity s c
  purpose : TransferPurpose1956a2 p m s c




inductive RepresentedProperty1956a3 (pr : LaunderedProperty)
    (c : ComplaintText) : Prop
  | representedProceeds
      (h : PropertyRepresentedToBeProceedsOfSpecifiedUnlawfulActivity pr c)
  | usedToFacilitate
      (h : PropertyUsedToConductOrFacilitateSpecifiedUnlawfulActivity pr c)


inductive StingPurpose1956a3 (p : Person) (pr : LaunderedProperty)
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop
  | promoteSua (h : IntendsToPromoteCarryingOnOfSpecifiedUnlawfulActivity p s c)
  | conceal (h : IntendsToConcealNatureOrSourceOfBelievedProceeds p pr c)
  | avoidReporting (h : IntendsToAvoidTransactionReportingRequirement p c)




structure Section1956a3 (p : Person) (pr : LaunderedProperty)
    (t : FinancialTransaction) (s : SpecifiedUnlawfulActivity)
    (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent p c
  conducts : ConductsOrAttemptsTransactionInvolvingRepresentedProperty p t pr c
  financialTransaction : IsFinancialTransaction t c
  propertyCharacter : RepresentedProperty1956a3 pr c
  federallyBackedRepresentation :
    RepresentationMadeByOrAtDirectionOfFederalAuthority pr c
  specifiedUnlawfulActivity : IsSpecifiedUnlawfulActivity s c
  purpose : StingPurpose1956a3 p pr s c





structure Section1956hConspiracy (p : Person) (ag : Agreement)
    (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent p c
  agreement : AgreementAmongTwoOrMore ag c
  object : AgreementObjectIsMoneyLaunderingOffense ag c
  joined : JoinedTheAgreement p ag c




inductive Section1956Offense (p : Person) (pr : LaunderedProperty)
    (t : FinancialTransaction) (m : MonetaryTransfer)
    (s : SpecifiedUnlawfulActivity) (ag : Agreement) (c : ComplaintText) : Prop
  | transactionLaundering (h : Section1956a1 p pr t s c)
  | crossBorderTransfer (h : Section1956a2 p m s c)
  | stingTransaction (h : Section1956a3 p pr t s c)
  | conspiracy (h : Section1956hConspiracy p ag c)


inductive Venue1956i (p : Person) (t : FinancialTransaction)
    (c : ComplaintText) : Prop
  | districtOfTransaction (h : ProsecutionBroughtWhereTransactionConducted p t c)
  | districtOfSua (hDistrict : ProsecutionBroughtWhereSuaProsecutable p c)
      (hTransfer : DefendantParticipatedInTransferOfProceedsFromThatDistrict p c)



def WithinSevenYearLimitations (t : FinancialTransaction)
    (c : ComplaintText) : Prop :=
  daysFromOffenseToChargingInstrument t c ≤ 2557



structure Limitations1956j (t : FinancialTransaction)
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop where
  timelyIfForeignSua : IsQualifyingForeignOffense s c → WithinSevenYearLimitations t c



structure ValidSection1956Prosecution (p : Person) (pr : LaunderedProperty)
    (t : FinancialTransaction) (m : MonetaryTransfer)
    (s : SpecifiedUnlawfulActivity) (ag : Agreement)
    (c : ComplaintText) : Prop where
  offense : Section1956Offense p pr t m s ag c
  venue : Venue1956i p t c
  limitations : Limitations1956j t s c




inductive CivilPenaltyPredicate1956b1 (p : Person) (pr : LaunderedProperty)
    (t : FinancialTransaction) (m : MonetaryTransfer)
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop
  | subsectionA1 (h : Section1956a1 p pr t s c)
  | subsectionA3 (h : Section1956a3 p pr t s c)
  | subsectionA2 (h : Section1956a2 p m s c)
  | section1957 (h : ConductsTransactionDescribedInSection1957 p c)


inductive PersonalJurisdiction1956b2 (p : Person) (t : FinancialTransaction)
    (c : ComplaintText) : Prop
  | domesticPerson (h : IsPersonInUS p c)
  | foreignOffenseInUnitedStates (hForeign : IsForeignPerson p c)
      (hService : ServedUnderFederalRulesOrForeignLaw p c)
      (h : ForeignPersonOffenseOccurredInUnitedStates p t c)
  | foreignConversion (hForeign : IsForeignPerson p c)
      (hService : ServedUnderFederalRulesOrForeignLaw p c)
      (h : ForeignPersonConvertedForfeitedProperty p c)
  | foreignBankWithUnitedStatesAccount (hForeign : IsForeignPerson p c)
      (hService : ServedUnderFederalRulesOrForeignLaw p c)
      (h : ForeignFinancialInstitutionMaintainsUnitedStatesAccount p c)


structure Section1956b1CivilPenalty (p : Person) (pr : LaunderedProperty)
    (t : FinancialTransaction) (m : MonetaryTransfer)
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop where
  liableConduct : CivilPenaltyPredicate1956b1 p pr t m s c
  jurisdictionOverDefendant : PersonalJurisdiction1956b2 p t c




inductive ExtraterritorialActor1956f (p : Person) (c : ComplaintText) : Prop
  | unitedStatesCitizen (h : IsUnitedStatesCitizen p c)
  | conductInPartInUnitedStates (h : ConductOccursInPartInUnitedStates p c)


def FundsValueExceedsTenThousandDollars (t : FinancialTransaction)
    (c : ComplaintText) : Prop :=
  fundsInvolvedValueCents t c > 1000000


structure ExtraterritorialJurisdiction1956f (p : Person)
    (t : FinancialTransaction) (c : ComplaintText) : Prop where
  actor : ExtraterritorialActor1956f p c
  value : FundsValueExceedsTenThousandDollars t c

end Proving.USC.T18.Ch42Ch95.Elements
