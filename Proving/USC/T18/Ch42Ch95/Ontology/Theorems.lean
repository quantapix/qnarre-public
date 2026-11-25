








import Proving.USC.T18.Ch42Ch95.Ontology.Types
import Proving.USC.T18.Ch42Ch95.Ontology.Predicates
import Proving.USC.T18.Ch42Ch95.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Ontology

open Proving.USC.Common



theorem extortionateExtensionMembership_intro
    (x : ExtensionOfCredit) (c : ComplaintText)
    (hExt : IsExtensionOfCredit x c)
    (hExtortionate : IsExtortionateExtensionOfCredit x c)
    : ExtortionateExtensionMembership x c :=
  ⟨hExt, hExtortionate⟩

theorem unenforceabilityShowing_naturalPerson_intro
    (x : ExtensionOfCredit) (dbtr : Person) (j : Jurisdiction) (c : ComplaintText)
    (hNatural : IsNaturalPerson dbtr c)
    (hUnenforceable : RepaymentUnenforceableInResidenceJurisdiction x dbtr j c)
    : UnenforceabilityShowing x dbtr c :=
  .naturalPerson j hNatural hUnenforceable

theorem unenforceabilityShowing_organization_intro
    (x : ExtensionOfCredit) (dbtr : Person) (c : ComplaintText)
    (hUnenforceable : RepaymentUnenforceableInEveryOrganizationJurisdiction x dbtr c)
    : UnenforceabilityShowing x dbtr c :=
  .organization hUnenforceable

theorem debtorBeliefBasis_priorCollection_intro
    (x : ExtensionOfCredit) (dbtr : Person) (cred : Person) (c : ComplaintText)
    (hBelief : DebtorBelievedPriorExtortionateCollection x dbtr c)
    : DebtorBeliefBasis x dbtr cred c :=
  .priorCollection hBelief

theorem debtorBeliefBasis_reputation_intro
    (x : ExtensionOfCredit) (dbtr : Person) (cred : Person) (c : ComplaintText)
    (hReputation : CreditorHadExtortionateReputation cred c)
    : DebtorBeliefBasis x dbtr cred c :=
  .reputation hReputation

theorem primaFacieExtortionateExtension_intro
    (x : ExtensionOfCredit) (dbtr : Person) (cred : Person) (c : ComplaintText)
    (hExt : IsExtensionOfCredit x c)
    (hDebtor : IsDebtor dbtr x c)
    (hCreditor : IsCreditor cred x c)
    (hUnenforceable : UnenforceabilityShowing x dbtr c)
    (hRate : RateExceedsFortyFivePercentActuarial x c)
    (hBelief : DebtorBeliefBasis x dbtr cred c)
    (hThreshold : OutstandingExtensionsExceedOneHundredDollars x cred dbtr c)
    : PrimaFacieExtortionateExtension x dbtr cred c :=
  ⟨hExt, hDebtor, hCreditor, hUnenforceable, hRate, hBelief, hThreshold⟩

theorem reputationEvidenceCondition_intro
    (dbtr : Person) (cred : Person) (c : ComplaintText)
    (hCommunity : DebtorMemberOfCreditorReputationCommunity dbtr cred c)
    (hReputation : CreditorHadExtortionateReputation cred c)
    : ReputationEvidenceCondition dbtr cred c :=
  ⟨hCommunity, hReputation⟩



theorem extortionateUsePurpose_collect_intro
    (m : ExtortionateMeans) (x : ExtensionOfCredit) (v : Person) (c : ComplaintText)
    (h : UsedToCollectExtensionOfCredit m x c)
    : ExtortionateUsePurpose m x v c :=
  .collect h

theorem extortionateUsePurpose_punish_intro
    (m : ExtortionateMeans) (x : ExtensionOfCredit) (v : Person) (c : ComplaintText)
    (h : UsedToPunishNonrepayment m v x c)
    : ExtortionateUsePurpose m x v c :=
  .punish h

theorem extortionateCollectionMembership_intro
    (p : Person) (m : ExtortionateMeans) (x : ExtensionOfCredit) (v : Person)
    (c : ComplaintText)
    (hMeans : IsExtortionateMeans m c)
    (hExt : IsExtensionOfCredit x c)
    (hParticipates : KnowinglyParticipatesInUseOfExtortionateMeans p m c)
    (hPurpose : ExtortionateUsePurpose m x v c)
    : ExtortionateCollectionMembership p m x v c :=
  ⟨hMeans, hExt, hParticipates, hPurpose⟩

theorem implicitThreatShowing_intro
    (m : ExtortionateMeans) (v : Person) (cred : Person) (c : ComplaintText)
    (hKnowledge : PriorExtortionateCollectionKnownToTarget v cred c)
    (hThreat : CarriedImplicitThreatAsMeansOfCollection m c)
    : ImplicitThreatShowing m v cred c :=
  ⟨hKnowledge, hThreat⟩



theorem unlawfulActivityKind_businessEnterprise_intro
    (u : UnlawfulActivity) (c : ComplaintText)
    (h : IsBusinessEnterpriseInvolvingProhibitedActivity u c)
    : UnlawfulActivityKind u c :=
  .businessEnterprise h

theorem unlawfulActivityKind_extortionBriberyArson_intro
    (u : UnlawfulActivity) (c : ComplaintText)
    (h : IsExtortionBriberyOrArsonViolation u c)
    : UnlawfulActivityKind u c :=
  .extortionBriberyArson h

theorem unlawfulActivityKind_indictableFinancialOffense_intro
    (u : UnlawfulActivity) (c : ComplaintText)
    (h : IsIndictableFinancialOffense u c)
    : UnlawfulActivityKind u c :=
  .indictableFinancialOffense h

theorem unlawfulActivityMembership_intro
    (u : UnlawfulActivity) (c : ComplaintText)
    (hKind : UnlawfulActivityKind u c) (hTerm : IsUnlawfulActivity u c)
    : UnlawfulActivityMembership u c :=
  ⟨hKind, hTerm⟩

theorem stateKind_stateOfTheUnitedStates_intro
    (j : Jurisdiction) (c : ComplaintText) (h : IsStateOfTheUnitedStates j c)
    : StateKind j c :=
  .stateOfTheUnitedStates h

theorem stateKind_districtOfColumbia_intro
    (j : Jurisdiction) (c : ComplaintText) (h : IsDistrictOfColumbia j c)
    : StateKind j c :=
  .districtOfColumbia h

theorem stateKind_commonwealthTerritoryOrPossession_intro
    (j : Jurisdiction) (c : ComplaintText) (h : IsCommonwealthTerritoryOrPossession j c)
    : StateKind j c :=
  .commonwealthTerritoryOrPossession h

theorem stateMembership_intro
    (j : Jurisdiction) (c : ComplaintText)
    (hKind : StateKind j c) (hTerm : IsState j c)
    : StateMembership j c :=
  ⟨hKind, hTerm⟩

theorem savingsPromotionRaffleMembership_intro
    (r : SavingsPromotionRaffle) (c : ComplaintText)
    (hSole : SoleConsiderationIsSavingsDeposit r c)
    (hEqual : EachEntryHasEqualChanceOfBeingDrawn r c)
    (hRegulated : SubjectToPrudentialRegulatorRegulations r c)
    (hTerm : IsSavingsPromotionRaffle r c)
    : SavingsPromotionRaffleMembership r c :=
  ⟨hSole, hEqual, hRegulated, hTerm⟩

theorem exemptRaffleConductor_insuredDepositoryInstitution_intro
    (f : FinancialInstitution) (c : ComplaintText)
    (h : IsInsuredDepositoryInstitution f c)
    : ExemptRaffleConductor f c :=
  .insuredDepositoryInstitution h

theorem exemptRaffleConductor_insuredCreditUnion_intro
    (f : FinancialInstitution) (c : ComplaintText)
    (h : IsInsuredCreditUnion f c)
    : ExemptRaffleConductor f c :=
  .insuredCreditUnion h



theorem transactionKind_disposition_intro
    (t : Transaction) (f : FinancialInstitution) (c : ComplaintText)
    (h : IsDispositionOfProperty t c)
    : TransactionKind t f c :=
  .disposition h

theorem transactionKind_financialInstitutionDealing_intro
    (t : Transaction) (f : FinancialInstitution) (c : ComplaintText)
    (h : IsFinancialInstitutionDealing t f c)
    : TransactionKind t f c :=
  .financialInstitutionDealing h

theorem transactionMembership_intro
    (t : Transaction) (f : FinancialInstitution) (c : ComplaintText)
    (hKind : TransactionKind t f c) (hTerm : IsTransaction t c)
    : TransactionMembership t f c :=
  ⟨hKind, hTerm⟩

theorem financialTransactionKind_commerceMovementOfFunds_intro
    (t : Transaction) (m : MonetaryInstrument) (f : FinancialInstitution)
    (c : ComplaintText)
    (hCommerce : AffectsInterstateOrForeignCommerce t c)
    (h : InvolvesMovementOfFunds t c)
    : FinancialTransactionKind t m f c :=
  .commerceMovementOfFunds hCommerce h

theorem financialTransactionKind_commerceMonetaryInstruments_intro
    (t : Transaction) (m : MonetaryInstrument) (f : FinancialInstitution)
    (c : ComplaintText)
    (hCommerce : AffectsInterstateOrForeignCommerce t c)
    (hInstrument : IsMonetaryInstrument m c)
    (h : InvolvesMonetaryInstruments t m c)
    : FinancialTransactionKind t m f c :=
  .commerceMonetaryInstruments hCommerce hInstrument h

theorem financialTransactionKind_commerceTitleTransfer_intro
    (t : Transaction) (m : MonetaryInstrument) (f : FinancialInstitution)
    (c : ComplaintText)
    (hCommerce : AffectsInterstateOrForeignCommerce t c)
    (h : InvolvesTransferOfTitleToTitledProperty t c)
    : FinancialTransactionKind t m f c :=
  .commerceTitleTransfer hCommerce h

theorem financialTransactionKind_financialInstitutionUse_intro
    (t : Transaction) (m : MonetaryInstrument) (f : FinancialInstitution)
    (c : ComplaintText)
    (hInstitution : IsFinancialInstitution f c)
    (h : InvolvesCommerceAffectingFinancialInstitution t f c)
    : FinancialTransactionKind t m f c :=
  .financialInstitutionUse hInstitution h

theorem financialTransactionMembership_intro
    (t : Transaction) (m : MonetaryInstrument) (f : FinancialInstitution)
    (c : ComplaintText)
    (hParent : IsTransaction t c)
    (hKind : FinancialTransactionKind t m f c)
    (hTerm : IsFinancialTransaction t c)
    : FinancialTransactionMembership t m f c :=
  ⟨hParent, hKind, hTerm⟩

theorem monetaryInstrumentKind_coinCurrencyCheckOrMoneyOrder_intro
    (m : MonetaryInstrument) (c : ComplaintText)
    (h : IsCoinCurrencyCheckOrMoneyOrder m c)
    : MonetaryInstrumentKind m c :=
  .coinCurrencyCheckOrMoneyOrder h

theorem monetaryInstrumentKind_bearerSecurityOrNegotiableInstrument_intro
    (m : MonetaryInstrument) (c : ComplaintText)
    (h : IsBearerSecurityOrNegotiableInstrument m c)
    : MonetaryInstrumentKind m c :=
  .bearerSecurityOrNegotiableInstrument h

theorem monetaryInstrumentMembership_intro
    (m : MonetaryInstrument) (c : ComplaintText)
    (hKind : MonetaryInstrumentKind m c) (hTerm : IsMonetaryInstrument m c)
    : MonetaryInstrumentMembership m c :=
  ⟨hKind, hTerm⟩

theorem financialInstitutionKind_title31Institution_intro
    (f : FinancialInstitution) (c : ComplaintText)
    (h : IsTitle31FinancialInstitution f c)
    : FinancialInstitutionKind f c :=
  .title31Institution h

theorem financialInstitutionKind_foreignBank_intro
    (f : FinancialInstitution) (c : ComplaintText)
    (h : IsForeignBank f c)
    : FinancialInstitutionKind f c :=
  .foreignBank h

theorem financialInstitutionMembership_intro
    (f : FinancialInstitution) (c : ComplaintText)
    (hKind : FinancialInstitutionKind f c) (hTerm : IsFinancialInstitution f c)
    : FinancialInstitutionMembership f c :=
  ⟨hKind, hTerm⟩

theorem specifiedUnlawfulActivityKind_section1961Offense_intro
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText)
    (h : IsSection1961ListedOffense s c)
    : SpecifiedUnlawfulActivityKind s c :=
  .section1961Offense h

theorem specifiedUnlawfulActivityKind_foreignNationOffense_intro
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText)
    (h : IsForeignNationOffenseOfEnumeratedKind s c)
    : SpecifiedUnlawfulActivityKind s c :=
  .foreignNationOffense h

theorem specifiedUnlawfulActivityKind_continuingCriminalEnterprise_intro
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText)
    (h : IsContinuingCriminalEnterprise s c)
    : SpecifiedUnlawfulActivityKind s c :=
  .continuingCriminalEnterprise h

theorem specifiedUnlawfulActivityKind_enumeratedFederalOffense_intro
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText)
    (h : IsEnumeratedFederalOffense s c)
    : SpecifiedUnlawfulActivityKind s c :=
  .enumeratedFederalOffense h

theorem specifiedUnlawfulActivityKind_environmentalFelony_intro
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText)
    (h : IsEnvironmentalFelony s c)
    : SpecifiedUnlawfulActivityKind s c :=
  .environmentalFelony h

theorem specifiedUnlawfulActivityKind_federalHealthCareOffense_intro
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText)
    (h : IsFederalHealthCareOffense s c)
    : SpecifiedUnlawfulActivityKind s c :=
  .federalHealthCareOffense h

theorem specifiedUnlawfulActivityKind_wildlifeTrafficking_intro
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText)
    (h : IsWildlifeTraffickingViolationOverThreshold s c)
    : SpecifiedUnlawfulActivityKind s c :=
  .wildlifeTrafficking h

theorem specifiedUnlawfulActivityMembership_intro
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText)
    (hKind : SpecifiedUnlawfulActivityKind s c)
    (hTerm : IsSpecifiedUnlawfulActivity s c)
    : SpecifiedUnlawfulActivityMembership s c :=
  ⟨hKind, hTerm⟩

theorem proceedsMembership_intro
    (p : Property) (c : ComplaintText)
    (hDerived : IsDerivedFromSomeFormOfUnlawfulActivity p c)
    (hTerm : IsProceeds p c)
    : ProceedsMembership p c :=
  ⟨hDerived, hTerm⟩

theorem conductKind_initiates_intro
    (per : Person) (t : Transaction) (c : ComplaintText)
    (h : InitiatesTransaction per t c)
    : ConductKind per t c :=
  .initiates h

theorem conductKind_concludes_intro
    (per : Person) (t : Transaction) (c : ComplaintText)
    (h : ConcludesTransaction per t c)
    : ConductKind per t c :=
  .concludes h

theorem conductKind_participates_intro
    (per : Person) (t : Transaction) (c : ComplaintText)
    (h : ParticipatesInInitiatingOrConcludingTransaction per t c)
    : ConductKind per t c :=
  .participates h

theorem conductsMembership_intro
    (per : Person) (t : Transaction) (c : ComplaintText)
    (hKind : ConductKind per t c) (hTerm : Conducts per t c)
    : ConductsMembership per t c :=
  ⟨hKind, hTerm⟩

theorem proceedsKnowledgeMembership_intro
    (per : Person) (p : Property) (c : ComplaintText)
    (hFelony : PropertyRepresentsProceedsOfFelonyActivity p c)
    (hProceeds : IsProceeds p c)
    (hTerm : KnowsPropertyRepresentsProceedsOfSomeUnlawfulActivity per p c)
    : ProceedsKnowledgeMembership per p c :=
  ⟨hFelony, hProceeds, hTerm⟩

theorem representationSource_lawEnforcementOfficer_intro
    (p : Property) (c : ComplaintText)
    (h : RepresentationMadeByLawEnforcementOfficer p c)
    : RepresentationSource p c :=
  .lawEnforcementOfficer h

theorem representationSource_atDirectionOfFederalOfficial_intro
    (p : Property) (c : ComplaintText)
    (h : RepresentationMadeAtDirectionOfFederalOfficial p c)
    : RepresentationSource p c :=
  .atDirectionOfFederalOfficial h

theorem representedProceedsMembership_intro
    (p : Property) (c : ComplaintText)
    (hSource : RepresentationSource p c) (hTerm : IsRepresentedProceeds p c)
    : RepresentedProceedsMembership p c :=
  ⟨hSource, hTerm⟩

theorem parallelTransactionDeeming_intro
    (t : Transaction) (s : SpecifiedUnlawfulActivity) (c : ComplaintText)
    (hPlan : PartOfSinglePlanOfParallelOrDependentTransactions t c)
    (hMember : InvolvesProceedsOfSpecifiedUnlawfulActivity t s c)
    (hActivity : IsSpecifiedUnlawfulActivity s c)
    : ParallelTransactionDeeming t s c :=
  ⟨hPlan, hMember, hActivity⟩

theorem continuingTransferMembership_intro
    (t : Transaction) (c : ComplaintText)
    (hContinuing : IsSingleContinuingFundsTransfer t c)
    (hTerm : IsTransaction t c)
    : ContinuingTransferMembership t c :=
  ⟨hContinuing, hTerm⟩

end Proving.USC.T18.Ch42Ch95.Ontology
