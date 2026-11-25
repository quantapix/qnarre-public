




import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch42Ch95.Elements.Types
import Proving.USC.T18.Ch42Ch95.Elements.Predicates
import Proving.USC.T18.Ch42Ch95.Elements.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Elements

open Proving.USC.Common



theorem mutualExtortionateUnderstanding_intro {x : ExtensionOfCredit}
    {c : ComplaintText}
    (hCreditor : CreditorUnderstoodNonrepaymentRiskedViolence x c)
    (hDebtor : DebtorUnderstoodNonrepaymentRiskedViolence x c)
    (hConsequence : ContemplatedConsequenceIsViolenceOrCriminalMeans x c)
    (hTime : UnderstandingHeldWhenCreditExtended x c) :
    MutualExtortionateUnderstanding x c :=
  ⟨hCreditor, hDebtor, hConsequence, hTime⟩

theorem isExtortionateExtensionOfCredit_intro {x : ExtensionOfCredit}
    {c : ComplaintText}
    (hCreditor : CreditorUnderstoodNonrepaymentRiskedViolence x c)
    (hDebtor : DebtorUnderstoodNonrepaymentRiskedViolence x c)
    (hConsequence : ContemplatedConsequenceIsViolenceOrCriminalMeans x c)
    (hTime : UnderstandingHeldWhenCreditExtended x c) :
    IsExtortionateExtensionOfCredit x c :=
  ⟨hCreditor, hDebtor, hConsequence, hTime⟩

theorem unenforceableRepayment_intro_naturalDebtor {x : ExtensionOfCredit}
    {c : ComplaintText} (h : RepaymentUnenforceableWhereNaturalDebtorResided x c) :
    UnenforceableRepayment x c := .naturalDebtor h

theorem unenforceableRepayment_intro_entityDebtor {x : ExtensionOfCredit}
    {c : ComplaintText}
    (h : RepaymentUnenforceableInEveryJurisdictionOfEntityDebtor x c) :
    UnenforceableRepayment x c := .entityDebtor h

theorem debtorBeliefAsToCreditor_intro_priorExtortionateCollection
    {x : ExtensionOfCredit} {c : ComplaintText}
    (h : DebtorReasonablyBelievedCreditorUsedExtortionateMeans x c) :
    DebtorBeliefAsToCreditor x c := .priorExtortionateCollection h

theorem debtorBeliefAsToCreditor_intro_extortionateReputation
    {x : ExtensionOfCredit} {c : ComplaintText}
    (h : DebtorReasonablyBelievedCreditorHadExtortionateReputation x c) :
    DebtorBeliefAsToCreditor x c := .extortionateReputation h

theorem primaFacieExtortionate892b_intro {x : ExtensionOfCredit}
    {c : ComplaintText}
    (hUnenforceable : UnenforceableRepayment x c)
    (hRate : InterestRateExceedsFortyFivePercent x c)
    (hBelief : DebtorBeliefAsToCreditor x c)
    (hOutstanding : OutstandingCreditExceededOneHundredDollars x c) :
    PrimaFacieExtortionate892b x c :=
  ⟨hUnenforceable, hRate, hBelief, hOutstanding⟩

theorem section892aMaking_intro {p : Person} {x : ExtensionOfCredit}
    {c : ComplaintText}
    (hCulpable : CulpablePersonCapableOfIntent p c)
    (hMakes : MakesExtensionOfCredit p x c)
    (hExtortionate : IsExtortionateExtensionOfCredit x c) :
    Section892aMaking p x c :=
  ⟨hCulpable, hMakes, hExtortionate⟩

theorem section892aConspiracy_intro {p : Person} {ag : Agreement}
    {c : ComplaintText}
    (hCulpable : CulpablePersonCapableOfIntent p c)
    (hAgreement : AgreementAmongTwoOrMore ag c)
    (hObject : AgreementObjectIsExtortionateExtensionOfCredit ag c)
    (hJoined : JoinedTheAgreement p ag c) :
    Section892aConspiracy p ag c :=
  ⟨hCulpable, hAgreement, hObject, hJoined⟩

theorem section892a_intro_making {p : Person} {x : ExtensionOfCredit}
    {ag : Agreement} {c : ComplaintText} (h : Section892aMaking p x c) :
    Section892a p x ag c := .making h

theorem section892a_intro_conspiracy {p : Person} {x : ExtensionOfCredit}
    {ag : Agreement} {c : ComplaintText} (h : Section892aConspiracy p ag c) :
    Section892a p x ag c := .conspiracy h



theorem extortionateMeansRoute_intro_actualUse {k : CollectionConduct}
    {c : ComplaintText} (h : UsesViolenceOrOtherCriminalMeans k c) :
    ExtortionateMeansRoute k c := .actualUse h

theorem extortionateMeansRoute_intro_expressThreat {k : CollectionConduct}
    {c : ComplaintText} (h : MakesExpressThreatOfViolenceOrCriminalMeans k c) :
    ExtortionateMeansRoute k c := .expressThreat h

theorem extortionateMeansRoute_intro_implicitThreat {k : CollectionConduct}
    {c : ComplaintText} (h : MakesImplicitThreatOfViolenceOrCriminalMeans k c) :
    ExtortionateMeansRoute k c := .implicitThreat h

theorem extortionateMeans_intro {k : CollectionConduct} {c : ComplaintText}
    (hRoute : ExtortionateMeansRoute k c)
    (hHarm : HarmDirectedAtPersonReputationOrProperty k c) :
    ExtortionateMeans k c := ⟨hRoute, hHarm⟩

theorem isExtortionateMeans_intro {k : CollectionConduct} {c : ComplaintText}
    (hRoute : ExtortionateMeansRoute k c)
    (hHarm : HarmDirectedAtPersonReputationOrProperty k c) :
    IsExtortionateMeans k c := ⟨hRoute, hHarm⟩

theorem extortionatePurpose894_intro_collect {k : CollectionConduct}
    {x : ExtensionOfCredit} {c : ComplaintText}
    (h : PurposeToCollectExtensionOfCredit k x c) :
    ExtortionatePurpose894 k x c := .collect h

theorem extortionatePurpose894_intro_punishNonrepayment {k : CollectionConduct}
    {x : ExtensionOfCredit} {c : ComplaintText}
    (h : PurposeToPunishNonrepayment k x c) :
    ExtortionatePurpose894 k x c := .punishNonrepayment h

theorem section894aParticipation_intro {p : Person} {k : CollectionConduct}
    {x : ExtensionOfCredit} {c : ComplaintText}
    (hCulpable : CulpablePersonCapableOfIntent p c)
    (hKnowingly : ActedWithScienter p c)
    (hParticipates : ParticipatesInUseOfExtortionateMeans p k c)
    (hMeans : IsExtortionateMeans k c)
    (hCredit : ExtensionOfCreditExists x c)
    (hPurpose : ExtortionatePurpose894 k x c) :
    Section894aParticipation p k x c :=
  ⟨hCulpable, hKnowingly, hParticipates, hMeans, hCredit, hPurpose⟩

theorem section894aConspiracy_intro {p : Person} {ag : Agreement}
    {c : ComplaintText}
    (hCulpable : CulpablePersonCapableOfIntent p c)
    (hAgreement : AgreementAmongTwoOrMore ag c)
    (hObject : AgreementObjectIsExtortionateCollection ag c)
    (hJoined : JoinedTheAgreement p ag c) :
    Section894aConspiracy p ag c :=
  ⟨hCulpable, hAgreement, hObject, hJoined⟩

theorem section894a_intro_participation {p : Person} {k : CollectionConduct}
    {x : ExtensionOfCredit} {ag : Agreement} {c : ComplaintText}
    (h : Section894aParticipation p k x c) : Section894a p k x ag c :=
  .participation h

theorem section894a_intro_conspiracy {p : Person} {k : CollectionConduct}
    {x : ExtensionOfCredit} {ag : Agreement} {c : ComplaintText}
    (h : Section894aConspiracy p ag c) : Section894a p k x ag c := .conspiracy h



theorem interstateNexus1952_intro_travel {p : Person} {a : InterstateAct}
    {c : ComplaintText} (h : TravelsInInterstateOrForeignCommerce p a c) :
    InterstateNexus1952 p a c := .travel h

theorem interstateNexus1952_intro_mail {p : Person} {a : InterstateAct}
    {c : ComplaintText} (h : UsesTheMail p a c) :
    InterstateNexus1952 p a c := .mail h

theorem interstateNexus1952_intro_facility {p : Person} {a : InterstateAct}
    {c : ComplaintText} (h : UsesFacilityInInterstateOrForeignCommerce p a c) :
    InterstateNexus1952 p a c := .facility h

theorem unlawfulPurpose1952_intro_distributeProceeds {p : Person}
    {u : UnlawfulActivity} {c : ComplaintText}
    (h : IntendsToDistributeProceedsOfUnlawfulActivity p u c) :
    UnlawfulPurpose1952 p u c := .distributeProceeds h

theorem unlawfulPurpose1952_intro_crimeOfViolence {p : Person}
    {u : UnlawfulActivity} {c : ComplaintText}
    (h : IntendsToCommitCrimeOfViolenceToFurtherUnlawfulActivity p u c) :
    UnlawfulPurpose1952 p u c := .crimeOfViolence h

theorem unlawfulPurpose1952_intro_promoteOrCarryOn {p : Person}
    {u : UnlawfulActivity} {c : ComplaintText}
    (h : IntendsToPromoteManageOrCarryOnUnlawfulActivity p u c) :
    UnlawfulPurpose1952 p u c := .promoteOrCarryOn h

theorem unlawfulActivity1952_intro_businessEnterprise {u : UnlawfulActivity}
    {c : ComplaintText}
    (h : IsBusinessEnterpriseInvolvingGamblingLiquorNarcoticsOrProstitution u c) :
    UnlawfulActivity1952 u c := .businessEnterprise h

theorem unlawfulActivity1952_intro_extortionBriberyArson {u : UnlawfulActivity}
    {c : ComplaintText} (h : IsExtortionBriberyOrArsonOffense u c) :
    UnlawfulActivity1952 u c := .extortionBriberyArson h

theorem unlawfulActivity1952_intro_launderingOrCurrencyReporting
    {u : UnlawfulActivity} {c : ComplaintText}
    (h : IsActIndictableUnderMoneyLaunderingOrCurrencyReporting u c) :
    UnlawfulActivity1952 u c := .launderingOrCurrencyReporting h

theorem section1952a_intro {p : Person} {a : InterstateAct} {u : UnlawfulActivity}
    {c : ComplaintText}
    (hCulpable : CulpablePersonCapableOfIntent p c)
    (hNexus : InterstateNexus1952 p a c)
    (hPurpose : UnlawfulPurpose1952 p u c)
    (hActivity : IsUnlawfulActivity u c)
    (hThereafter : PerformsOrAttemptsActDescribedInSubsectionA p u c)
    (hFollows : SubsequentActFollowsTheInterstateAct a u c)
    (hNotExempt : ¬ SavingsPromotionRaffleByInsuredInstitution u c) :
    Section1952a p a u c :=
  ⟨hCulpable, hNexus, hPurpose, hActivity, hThereafter, hFollows, hNotExempt⟩



theorem transactionModality1956_intro_movementOfFunds {t : FinancialTransaction}
    {c : ComplaintText} (h : InvolvesMovementOfFunds t c) :
    TransactionModality1956 t c := .movementOfFunds h

theorem transactionModality1956_intro_monetaryInstruments
    {t : FinancialTransaction} {c : ComplaintText}
    (h : InvolvesMonetaryInstruments t c) :
    TransactionModality1956 t c := .monetaryInstruments h

theorem transactionModality1956_intro_transferOfTitle {t : FinancialTransaction}
    {c : ComplaintText} (h : InvolvesTransferOfTitleToProperty t c) :
    TransactionModality1956 t c := .transferOfTitle h

theorem financialTransaction1956_intro_commerceAffecting
    {t : FinancialTransaction} {c : ComplaintText}
    (hNexus : TransactionAffectsInterstateOrForeignCommerce t c)
    (hModality : TransactionModality1956 t c) :
    FinancialTransaction1956 t c := .commerceAffecting hNexus hModality

theorem financialTransaction1956_intro_throughFinancialInstitution
    {t : FinancialTransaction} {fi : Entity} {c : ComplaintText}
    (hUse : InvolvesUseOfFinancialInstitution t fi c)
    (hCommerce : EngagedInInterstateCommerce fi c) :
    FinancialTransaction1956 t c := .throughFinancialInstitution fi hUse hCommerce

theorem qualifyingWildlifeViolation_intro {s : SpecifiedUnlawfulActivity}
    {c : ComplaintText}
    (hViolation : IsWildlifeTraffickingViolation s c)
    (hValue : WildlifeValueExceedsTenThousandDollars s c) :
    QualifyingWildlifeViolation s c := ⟨hViolation, hValue⟩

theorem specifiedUnlawfulActivity1956_intro_listedInSection1961
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : IsOffenseListedInSection1961 s c) :
    SpecifiedUnlawfulActivity1956 s c := .listedInSection1961 h

theorem specifiedUnlawfulActivity1956_intro_qualifyingForeignOffense
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : IsQualifyingForeignOffense s c) :
    SpecifiedUnlawfulActivity1956 s c := .qualifyingForeignOffense h

theorem specifiedUnlawfulActivity1956_intro_continuingCriminalEnterprise
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : IsContinuingCriminalEnterprise s c) :
    SpecifiedUnlawfulActivity1956 s c := .continuingCriminalEnterprise h

theorem specifiedUnlawfulActivity1956_intro_enumeratedFederalOffense
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : IsEnumeratedFederalOffense s c) :
    SpecifiedUnlawfulActivity1956 s c := .enumeratedFederalOffense h

theorem specifiedUnlawfulActivity1956_intro_environmentalFelony
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : IsFelonyEnvironmentalViolation s c) :
    SpecifiedUnlawfulActivity1956 s c := .environmentalFelony h

theorem specifiedUnlawfulActivity1956_intro_federalHealthCareOffense
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : IsFederalHealthCareOffense s c) :
    SpecifiedUnlawfulActivity1956 s c := .federalHealthCareOffense h

theorem specifiedUnlawfulActivity1956_intro_wildlifeTrafficking
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : QualifyingWildlifeViolation s c) :
    SpecifiedUnlawfulActivity1956 s c := .wildlifeTrafficking h



theorem involvesProceedsOfSua1956_intro_direct {t : FinancialTransaction}
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : TransactionInFactInvolvesProceedsOfSpecifiedUnlawfulActivity t s c) :
    InvolvesProceedsOfSua1956 t s c := .direct h

theorem involvesProceedsOfSua1956_intro_parallelSet {t : FinancialTransaction}
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (hSet : PartOfParallelOrDependentTransactionSet t c)
    (hOne : OneTransactionInSetInvolvesProceedsOfSua t s c)
    (hPlan : AllTransactionsPartOfSinglePlan t c) :
    InvolvesProceedsOfSua1956 t s c := .parallelSet hSet hOne hPlan

theorem launderingPurpose1956a1_intro_promoteSua {p : Person}
    {t : FinancialTransaction} {s : SpecifiedUnlawfulActivity}
    {c : ComplaintText}
    (h : IntendsToPromoteCarryingOnOfSpecifiedUnlawfulActivity p s c) :
    LaunderingPurpose1956a1 p t s c := .promoteSua h

theorem launderingPurpose1956a1_intro_taxViolation {p : Person}
    {t : FinancialTransaction} {s : SpecifiedUnlawfulActivity}
    {c : ComplaintText}
    (h : IntendsToViolateInternalRevenueCodeSection7201Or7206 p c) :
    LaunderingPurpose1956a1 p t s c := .taxViolation h

theorem launderingPurpose1956a1_intro_conceal {p : Person}
    {t : FinancialTransaction} {s : SpecifiedUnlawfulActivity}
    {c : ComplaintText} (h : KnowsTransactionDesignedToConcealProceeds p t c) :
    LaunderingPurpose1956a1 p t s c := .conceal h

theorem launderingPurpose1956a1_intro_avoidReporting {p : Person}
    {t : FinancialTransaction} {s : SpecifiedUnlawfulActivity}
    {c : ComplaintText}
    (h : KnowsTransactionDesignedToAvoidReportingRequirement p t c) :
    LaunderingPurpose1956a1 p t s c := .avoidReporting h

theorem section1956a1_intro {p : Person} {pr : LaunderedProperty}
    {t : FinancialTransaction} {s : SpecifiedUnlawfulActivity}
    {c : ComplaintText}
    (hCulpable : CulpablePersonCapableOfIntent p c)
    (hKnows : KnowsPropertyRepresentsProceedsOfSomeUnlawfulActivity p pr c)
    (hConducts : ConductsOrAttemptsFinancialTransaction p t c)
    (hTransaction : IsFinancialTransaction t c)
    (hSua : IsSpecifiedUnlawfulActivity s c)
    (hProceeds : InvolvesProceedsOfSua1956 t s c)
    (hPurpose : LaunderingPurpose1956a1 p t s c) :
    Section1956a1 p pr t s c :=
  ⟨hCulpable, hKnows, hConducts, hTransaction, hSua, hProceeds, hPurpose⟩



theorem crossBorderTransfer1956_intro_outbound {p : Person}
    {m : MonetaryTransfer} {c : ComplaintText}
    (h : TransfersMonetaryInstrumentOutOfUnitedStates p m c) :
    CrossBorderTransfer1956 p m c := .outbound h

theorem crossBorderTransfer1956_intro_inbound {p : Person}
    {m : MonetaryTransfer} {c : ComplaintText}
    (h : TransfersMonetaryInstrumentIntoUnitedStates p m c) :
    CrossBorderTransfer1956 p m c := .inbound h

theorem transferKnowledge1956a2_intro_actual {p : Person} {m : MonetaryTransfer}
    {c : ComplaintText}
    (h : KnowsFundsRepresentProceedsOfSomeUnlawfulActivity p m c) :
    TransferKnowledge1956a2 p m c := .actual h

theorem transferKnowledge1956a2_intro_byRepresentation {p : Person}
    {m : MonetaryTransfer} {c : ComplaintText}
    (hRep : LawEnforcementRepresentedTheMatterAsTrue p c)
    (hBelief : DefendantsConductIndicatesBeliefInRepresentation p c) :
    TransferKnowledge1956a2 p m c := .byRepresentation hRep hBelief

theorem transferDesign1956a2_intro_conceal {p : Person} {m : MonetaryTransfer}
    {c : ComplaintText} (h : KnowsTransferDesignedToConcealProceeds p m c) :
    TransferDesign1956a2 p m c := .conceal h

theorem transferDesign1956a2_intro_avoidReporting {p : Person}
    {m : MonetaryTransfer} {c : ComplaintText}
    (h : KnowsTransferDesignedToAvoidReportingRequirement p m c) :
    TransferDesign1956a2 p m c := .avoidReporting h

theorem concealmentTransfer1956a2B_intro {p : Person} {m : MonetaryTransfer}
    {c : ComplaintText}
    (hKnowledge : TransferKnowledge1956a2 p m c)
    (hDesign : TransferDesign1956a2 p m c) :
    ConcealmentTransfer1956a2B p m c := ⟨hKnowledge, hDesign⟩

theorem transferPurpose1956a2_intro_promoteSua {p : Person}
    {m : MonetaryTransfer} {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : IntendsToPromoteCarryingOnOfSpecifiedUnlawfulActivity p s c) :
    TransferPurpose1956a2 p m s c := .promoteSua h

theorem transferPurpose1956a2_intro_knowingConcealment {p : Person}
    {m : MonetaryTransfer} {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : ConcealmentTransfer1956a2B p m c) :
    TransferPurpose1956a2 p m s c := .knowingConcealment h

theorem section1956a2_intro {p : Person} {m : MonetaryTransfer}
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (hCulpable : CulpablePersonCapableOfIntent p c)
    (hCrossBorder : CrossBorderTransfer1956 p m c)
    (hSua : IsSpecifiedUnlawfulActivity s c)
    (hPurpose : TransferPurpose1956a2 p m s c) :
    Section1956a2 p m s c :=
  ⟨hCulpable, hCrossBorder, hSua, hPurpose⟩



theorem representedProperty1956a3_intro_representedProceeds
    {pr : LaunderedProperty} {c : ComplaintText}
    (h : PropertyRepresentedToBeProceedsOfSpecifiedUnlawfulActivity pr c) :
    RepresentedProperty1956a3 pr c := .representedProceeds h

theorem representedProperty1956a3_intro_usedToFacilitate
    {pr : LaunderedProperty} {c : ComplaintText}
    (h : PropertyUsedToConductOrFacilitateSpecifiedUnlawfulActivity pr c) :
    RepresentedProperty1956a3 pr c := .usedToFacilitate h

theorem stingPurpose1956a3_intro_promoteSua {p : Person} {pr : LaunderedProperty}
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : IntendsToPromoteCarryingOnOfSpecifiedUnlawfulActivity p s c) :
    StingPurpose1956a3 p pr s c := .promoteSua h

theorem stingPurpose1956a3_intro_conceal {p : Person} {pr : LaunderedProperty}
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : IntendsToConcealNatureOrSourceOfBelievedProceeds p pr c) :
    StingPurpose1956a3 p pr s c := .conceal h

theorem stingPurpose1956a3_intro_avoidReporting {p : Person}
    {pr : LaunderedProperty} {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : IntendsToAvoidTransactionReportingRequirement p c) :
    StingPurpose1956a3 p pr s c := .avoidReporting h

theorem section1956a3_intro {p : Person} {pr : LaunderedProperty}
    {t : FinancialTransaction} {s : SpecifiedUnlawfulActivity}
    {c : ComplaintText}
    (hCulpable : CulpablePersonCapableOfIntent p c)
    (hConducts : ConductsOrAttemptsTransactionInvolvingRepresentedProperty p t pr c)
    (hTransaction : IsFinancialTransaction t c)
    (hCharacter : RepresentedProperty1956a3 pr c)
    (hRepresentation : RepresentationMadeByOrAtDirectionOfFederalAuthority pr c)
    (hSua : IsSpecifiedUnlawfulActivity s c)
    (hPurpose : StingPurpose1956a3 p pr s c) :
    Section1956a3 p pr t s c :=
  ⟨hCulpable, hConducts, hTransaction, hCharacter, hRepresentation, hSua, hPurpose⟩



theorem section1956hConspiracy_intro {p : Person} {ag : Agreement}
    {c : ComplaintText}
    (hCulpable : CulpablePersonCapableOfIntent p c)
    (hAgreement : AgreementAmongTwoOrMore ag c)
    (hObject : AgreementObjectIsMoneyLaunderingOffense ag c)
    (hJoined : JoinedTheAgreement p ag c) :
    Section1956hConspiracy p ag c :=
  ⟨hCulpable, hAgreement, hObject, hJoined⟩

theorem section1956Offense_intro_transactionLaundering {p : Person}
    {pr : LaunderedProperty} {t : FinancialTransaction} {m : MonetaryTransfer}
    {s : SpecifiedUnlawfulActivity} {ag : Agreement} {c : ComplaintText}
    (h : Section1956a1 p pr t s c) :
    Section1956Offense p pr t m s ag c := .transactionLaundering h

theorem section1956Offense_intro_crossBorderTransfer {p : Person}
    {pr : LaunderedProperty} {t : FinancialTransaction} {m : MonetaryTransfer}
    {s : SpecifiedUnlawfulActivity} {ag : Agreement} {c : ComplaintText}
    (h : Section1956a2 p m s c) :
    Section1956Offense p pr t m s ag c := .crossBorderTransfer h

theorem section1956Offense_intro_stingTransaction {p : Person}
    {pr : LaunderedProperty} {t : FinancialTransaction} {m : MonetaryTransfer}
    {s : SpecifiedUnlawfulActivity} {ag : Agreement} {c : ComplaintText}
    (h : Section1956a3 p pr t s c) :
    Section1956Offense p pr t m s ag c := .stingTransaction h

theorem section1956Offense_intro_conspiracy {p : Person}
    {pr : LaunderedProperty} {t : FinancialTransaction} {m : MonetaryTransfer}
    {s : SpecifiedUnlawfulActivity} {ag : Agreement} {c : ComplaintText}
    (h : Section1956hConspiracy p ag c) :
    Section1956Offense p pr t m s ag c := .conspiracy h

theorem venue1956i_intro_districtOfTransaction {p : Person}
    {t : FinancialTransaction} {c : ComplaintText}
    (h : ProsecutionBroughtWhereTransactionConducted p t c) :
    Venue1956i p t c := .districtOfTransaction h

theorem venue1956i_intro_districtOfSua {p : Person} {t : FinancialTransaction}
    {c : ComplaintText}
    (hDistrict : ProsecutionBroughtWhereSuaProsecutable p c)
    (hTransfer : DefendantParticipatedInTransferOfProceedsFromThatDistrict p c) :
    Venue1956i p t c := .districtOfSua hDistrict hTransfer

theorem limitations1956j_intro {t : FinancialTransaction}
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : IsQualifyingForeignOffense s c → WithinSevenYearLimitations t c) :
    Limitations1956j t s c := ⟨h⟩

theorem validSection1956Prosecution_intro {p : Person} {pr : LaunderedProperty}
    {t : FinancialTransaction} {m : MonetaryTransfer}
    {s : SpecifiedUnlawfulActivity} {ag : Agreement} {c : ComplaintText}
    (hOffense : Section1956Offense p pr t m s ag c)
    (hVenue : Venue1956i p t c)
    (hLimitations : Limitations1956j t s c) :
    ValidSection1956Prosecution p pr t m s ag c :=
  ⟨hOffense, hVenue, hLimitations⟩



theorem civilPenaltyPredicate1956b1_intro_subsectionA1 {p : Person}
    {pr : LaunderedProperty} {t : FinancialTransaction} {m : MonetaryTransfer}
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : Section1956a1 p pr t s c) :
    CivilPenaltyPredicate1956b1 p pr t m s c := .subsectionA1 h

theorem civilPenaltyPredicate1956b1_intro_subsectionA3 {p : Person}
    {pr : LaunderedProperty} {t : FinancialTransaction} {m : MonetaryTransfer}
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : Section1956a3 p pr t s c) :
    CivilPenaltyPredicate1956b1 p pr t m s c := .subsectionA3 h

theorem civilPenaltyPredicate1956b1_intro_subsectionA2 {p : Person}
    {pr : LaunderedProperty} {t : FinancialTransaction} {m : MonetaryTransfer}
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : Section1956a2 p m s c) :
    CivilPenaltyPredicate1956b1 p pr t m s c := .subsectionA2 h

theorem civilPenaltyPredicate1956b1_intro_section1957 {p : Person}
    {pr : LaunderedProperty} {t : FinancialTransaction} {m : MonetaryTransfer}
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (h : ConductsTransactionDescribedInSection1957 p c) :
    CivilPenaltyPredicate1956b1 p pr t m s c := .section1957 h

theorem personalJurisdiction1956b2_intro_domesticPerson {p : Person}
    {t : FinancialTransaction} {c : ComplaintText} (h : IsPersonInUS p c) :
    PersonalJurisdiction1956b2 p t c := .domesticPerson h

theorem personalJurisdiction1956b2_intro_foreignOffenseInUnitedStates
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (hForeign : IsForeignPerson p c)
    (hService : ServedUnderFederalRulesOrForeignLaw p c)
    (h : ForeignPersonOffenseOccurredInUnitedStates p t c) :
    PersonalJurisdiction1956b2 p t c :=
  .foreignOffenseInUnitedStates hForeign hService h

theorem personalJurisdiction1956b2_intro_foreignConversion {p : Person}
    {t : FinancialTransaction} {c : ComplaintText}
    (hForeign : IsForeignPerson p c)
    (hService : ServedUnderFederalRulesOrForeignLaw p c)
    (h : ForeignPersonConvertedForfeitedProperty p c) :
    PersonalJurisdiction1956b2 p t c := .foreignConversion hForeign hService h

theorem personalJurisdiction1956b2_intro_foreignBankWithUnitedStatesAccount
    {p : Person} {t : FinancialTransaction} {c : ComplaintText}
    (hForeign : IsForeignPerson p c)
    (hService : ServedUnderFederalRulesOrForeignLaw p c)
    (h : ForeignFinancialInstitutionMaintainsUnitedStatesAccount p c) :
    PersonalJurisdiction1956b2 p t c :=
  .foreignBankWithUnitedStatesAccount hForeign hService h

theorem section1956b1CivilPenalty_intro {p : Person} {pr : LaunderedProperty}
    {t : FinancialTransaction} {m : MonetaryTransfer}
    {s : SpecifiedUnlawfulActivity} {c : ComplaintText}
    (hConduct : CivilPenaltyPredicate1956b1 p pr t m s c)
    (hJurisdiction : PersonalJurisdiction1956b2 p t c) :
    Section1956b1CivilPenalty p pr t m s c := ⟨hConduct, hJurisdiction⟩

theorem extraterritorialActor1956f_intro_unitedStatesCitizen {p : Person}
    {c : ComplaintText} (h : IsUnitedStatesCitizen p c) :
    ExtraterritorialActor1956f p c := .unitedStatesCitizen h

theorem extraterritorialActor1956f_intro_conductInPartInUnitedStates
    {p : Person} {c : ComplaintText} (h : ConductOccursInPartInUnitedStates p c) :
    ExtraterritorialActor1956f p c := .conductInPartInUnitedStates h

theorem extraterritorialJurisdiction1956f_intro {p : Person}
    {t : FinancialTransaction} {c : ComplaintText}
    (hActor : ExtraterritorialActor1956f p c)
    (hValue : FundsValueExceedsTenThousandDollars t c) :
    ExtraterritorialJurisdiction1956f p t c := ⟨hActor, hValue⟩

end Proving.USC.T18.Ch42Ch95.Elements
