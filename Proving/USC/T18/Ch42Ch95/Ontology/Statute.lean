












import Proving.USC.T18.Ch42Ch95.Ontology.Types
import Proving.USC.T18.Ch42Ch95.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Ontology

open Proving.USC.Common







structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String






structure DanglingTerm where
  term      : String
  usedAt    : String
  definedAt : String





def defEdges : List DefEdge :=
  [
    { defined := "18 USC § 892(a) offense", dependsOn := "extortionate extension of credit",
      citeDefine := "18 USC § 892(a)" },
    { defined := "extortionate extension of credit", dependsOn := "extension of credit",
      citeDefine := "18 USC § 892(a)" },
    { defined := "prima facie extortionate extension of credit", dependsOn := "extension of credit",
      citeDefine := "18 USC § 892(b)" },
    { defined := "prima facie extortionate extension of credit", dependsOn := "debtor",
      citeDefine := "18 USC § 892(b)(1)" },
    { defined := "prima facie extortionate extension of credit", dependsOn := "creditor",
      citeDefine := "18 USC § 892(b)(3)" },
    { defined := "prima facie extortionate extension of credit", dependsOn := "extortionate means",
      citeDefine := "18 USC § 892(b)(3)(A)" },
    { defined := "prima facie extortionate extension of credit", dependsOn := "jurisdiction",
      citeDefine := "18 USC § 892(b)(1)" },

    { defined := "18 USC § 894(a) offense", dependsOn := "extortionate means",
      citeDefine := "18 USC § 894(a)" },
    { defined := "18 USC § 894(a) offense", dependsOn := "extension of credit",
      citeDefine := "18 USC § 894(a)(1)" },
    { defined := "18 USC § 894(a) offense", dependsOn := "person",
      citeDefine := "18 USC § 894(a)(2)" },
    { defined := "implicit threat", dependsOn := "extortionate means",
      citeDefine := "18 USC § 894(b)" },
    { defined := "implicit threat", dependsOn := "creditor",
      citeDefine := "18 USC § 894(b)" },

    { defined := "18 USC § 1952(a) offense", dependsOn := "unlawful activity",
      citeDefine := "18 USC § 1952(a)" },
    { defined := "18 USC § 1952(a) offense", dependsOn := "facility in interstate or foreign commerce",
      citeDefine := "18 USC § 1952(a)" },
    { defined := "unlawful activity", dependsOn := "State",
      citeDefine := "18 USC § 1952(b)(i)(1)" },
    { defined := "unlawful activity", dependsOn := "controlled substance",
      citeDefine := "18 USC § 1952(b)(i)(1)" },
    { defined := "unlawful activity", dependsOn := "18 USC § 1956 offense",
      citeDefine := "18 USC § 1952(b)(i)(3)" },
    { defined := "unlawful activity", dependsOn := "18 USC § 1957 offense",
      citeDefine := "18 USC § 1952(b)(i)(3)" },
    { defined := "18 USC § 1952(d) enhancement", dependsOn := "pre-retail medical product",
      citeDefine := "18 USC § 1952(d)" },
    { defined := "18 USC § 1952(e)(1) exemption", dependsOn := "savings promotion raffle",
      citeDefine := "18 USC § 1952(e)(1)" },
    { defined := "18 USC § 1952(e)(1) exemption", dependsOn := "insured depository institution",
      citeDefine := "18 USC § 1952(e)(1)" },
    { defined := "18 USC § 1952(e)(1) exemption", dependsOn := "insured credit union",
      citeDefine := "18 USC § 1952(e)(1)" },
    { defined := "savings promotion raffle", dependsOn := "appropriate prudential regulator",
      citeDefine := "18 USC § 1952(e)(2)(C)" },

    { defined := "18 USC § 1956(a)(1) offense", dependsOn := "financial transaction",
      citeDefine := "18 USC § 1956(a)(1)" },
    { defined := "18 USC § 1956(a)(1) offense",
      dependsOn := "knowing that the property involved in a financial transaction represents the proceeds of some form of unlawful activity",
      citeDefine := "18 USC § 1956(a)(1)" },
    { defined := "18 USC § 1956(a)(1) offense", dependsOn := "specified unlawful activity",
      citeDefine := "18 USC § 1956(a)(1)" },
    { defined := "18 USC § 1956(a)(2) offense", dependsOn := "monetary instruments",
      citeDefine := "18 USC § 1956(a)(2)" },
    { defined := "18 USC § 1956(a)(3) offense", dependsOn := "represented",
      citeDefine := "18 USC § 1956(a)(3)" },
    { defined := "represented", dependsOn := "specified unlawful activity",
      citeDefine := "18 USC § 1956(a)(3)" },
    { defined := "knowing that the property involved in a financial transaction represents the proceeds of some form of unlawful activity",
      dependsOn := "proceeds", citeDefine := "18 USC § 1956(c)(1)" },
    { defined := "conducts", dependsOn := "transaction",
      citeDefine := "18 USC § 1956(c)(2)" },
    { defined := "transaction", dependsOn := "financial institution",
      citeDefine := "18 USC § 1956(c)(3)" },
    { defined := "transaction", dependsOn := "monetary instruments",
      citeDefine := "18 USC § 1956(c)(3)" },
    { defined := "financial transaction", dependsOn := "transaction",
      citeDefine := "18 USC § 1956(c)(4)" },
    { defined := "financial transaction", dependsOn := "monetary instruments",
      citeDefine := "18 USC § 1956(c)(4)(A)(ii)" },
    { defined := "financial transaction", dependsOn := "financial institution",
      citeDefine := "18 USC § 1956(c)(4)(B)" },
    { defined := "financial institution", dependsOn := "31 USC § 5312(a)(2) financial institution",
      citeDefine := "18 USC § 1956(c)(6)(A)" },
    { defined := "financial institution", dependsOn := "foreign bank",
      citeDefine := "18 USC § 1956(c)(6)(B)" },
    { defined := "specified unlawful activity", dependsOn := "18 USC § 1961(1) offense",
      citeDefine := "18 USC § 1956(c)(7)(A)" },
    { defined := "specified unlawful activity", dependsOn := "financial transaction",
      citeDefine := "18 USC § 1956(c)(7)(B)" },
    { defined := "specified unlawful activity", dependsOn := "controlled substance",
      citeDefine := "18 USC § 1956(c)(7)(B)(i)" },
    { defined := "specified unlawful activity", dependsOn := "crime of violence",
      citeDefine := "18 USC § 1956(c)(7)(B)(ii)" },
    { defined := "specified unlawful activity", dependsOn := "foreign bank",
      citeDefine := "18 USC § 1956(c)(7)(B)(iii)" },
    { defined := "specified unlawful activity", dependsOn := "continuing criminal enterprise",
      citeDefine := "18 USC § 1956(c)(7)(C)" },
    { defined := "specified unlawful activity", dependsOn := "Federal health care offense",
      citeDefine := "18 USC § 1956(c)(7)(F)" },
    { defined := "proceeds", dependsOn := "property",
      citeDefine := "18 USC § 1956(c)(9)" },
    { defined := "proceeds", dependsOn := "unlawful activity",
      citeDefine := "18 USC § 1956(c)(9)" } ]




def danglingTerms : List DanglingTerm :=
  [ { term := "extension of credit", usedAt := "18 USC § 892(a), § 894(a)(1)",
      definedAt := "outside slice" },
    { term := "extortionate extension of credit", usedAt := "18 USC § 892(a)",
      definedAt := "outside slice" },
    { term := "extortionate means", usedAt := "18 USC § 894(a), § 892(b)(3)",
      definedAt := "outside slice" },
    { term := "creditor", usedAt := "18 USC § 892(b)(3), § 894(b)",
      definedAt := "outside slice" },
    { term := "debtor", usedAt := "18 USC § 892(b)(1), § 892(c)",
      definedAt := "outside slice" },
    { term := "repayment", usedAt := "18 USC § 892(b)(1), § 894(a)(2)",
      definedAt := "outside slice" },
    { term := "facility in interstate or foreign commerce", usedAt := "18 USC § 1952(a)",
      definedAt := "outside slice" },
    { term := "crime of violence", usedAt := "18 USC § 1952(a)(2)",
      definedAt := "outside slice (§ 1952 supplies no definition; cf. § 1956(c)(7)(B)(ii), which cites 18 USC § 16)" },
    { term := "controlled substance", usedAt := "18 USC § 1952(b)(i)(1), § 1956(c)(7)(B)(i)",
      definedAt := "§ 102(6) of the Controlled Substances Act (external)" },
    { term := "pre-retail medical product", usedAt := "18 USC § 1952(d)",
      definedAt := "18 USC § 670 (in title, outside slice)" },
    { term := "insured credit union", usedAt := "18 USC § 1952(e)(1)",
      definedAt := "§ 101 Federal Credit Union Act, 12 USC 1752 (external)" },
    { term := "insured depository institution", usedAt := "18 USC § 1952(e)(1)",
      definedAt := "§ 3 Federal Deposit Insurance Act, 12 USC 1813 (external)" },
    { term := "appropriate prudential regulator", usedAt := "18 USC § 1952(e)(2)(C)",
      definedAt := "§ 1002 Consumer Financial Protection Act of 2010, 12 USC 5481 (external)" },
    { term := "unlawful activity (as used in § 1956)", usedAt := "18 USC § 1956(a)(1), (c)(9)",
      definedAt := "undefined standing alone in § 1956; only the composite knowledge phrase is defined at § 1956(c)(1). NOT the § 1952(b)(i) term, which is expressly section-scoped." },
    { term := "31 USC § 5312(a)(2) financial institution", usedAt := "18 USC § 1956(c)(6)(A)",
      definedAt := "31 USC § 5312(a)(2) (external)" },
    { term := "foreign bank", usedAt := "18 USC § 1956(c)(6)(B), (c)(7)(B)(iii)",
      definedAt := "§ 1 International Banking Act of 1978, 12 USC 3101 (external)" },
    { term := "18 USC § 1961(1) offense", usedAt := "18 USC § 1956(c)(7)(A)",
      definedAt := "18 USC § 1961(1) (in title, outside slice)" },
    { term := "continuing criminal enterprise", usedAt := "18 USC § 1956(c)(7)(C)",
      definedAt := "§ 408 Controlled Substances Act, 21 USC 848 (external)" },
    { term := "Federal health care offense", usedAt := "18 USC § 1956(c)(7)(F)",
      definedAt := "outside slice" },
    { term := "property", usedAt := "18 USC § 1956(a)(1), (c)(9)",
      definedAt := "outside slice (§ 1956 defines 'proceeds' over property but never 'property')" } ]







structure ExtortionateExtensionMembership
    (x : ExtensionOfCredit) (c : ComplaintText) : Prop where
  extension    : IsExtensionOfCredit x c
  extortionate : IsExtortionateExtensionOfCredit x c



inductive UnenforceabilityShowing
    (x : ExtensionOfCredit) (dbtr : Person) (c : ComplaintText) : Prop where

  | naturalPerson (j : Jurisdiction)
      (natural : IsNaturalPerson dbtr c)
      (unenforceable : RepaymentUnenforceableInResidenceJurisdiction x dbtr j c)
      : UnenforceabilityShowing x dbtr c


  | organization
      (unenforceable : RepaymentUnenforceableInEveryOrganizationJurisdiction x dbtr c)
      : UnenforceabilityShowing x dbtr c



inductive DebtorBeliefBasis
    (x : ExtensionOfCredit) (dbtr : Person) (cred : Person) (c : ComplaintText) : Prop where


  | priorCollection
      (believed : DebtorBelievedPriorExtortionateCollection x dbtr c)
      : DebtorBeliefBasis x dbtr cred c

  | reputation
      (reputation : CreditorHadExtortionateReputation cred c)
      : DebtorBeliefBasis x dbtr cred c




structure PrimaFacieExtortionateExtension
    (x : ExtensionOfCredit) (dbtr : Person) (cred : Person) (c : ComplaintText) : Prop where
  extension     : IsExtensionOfCredit x c
  debtor        : IsDebtor dbtr x c
  creditor      : IsCreditor cred x c
  unenforceable : UnenforceabilityShowing x dbtr c
  usuriousRate  : RateExceedsFortyFivePercentActuarial x c
  debtorBelief  : DebtorBeliefBasis x dbtr cred c
  overThreshold : OutstandingExtensionsExceedOneHundredDollars x cred dbtr c






structure ReputationEvidenceCondition
    (dbtr : Person) (cred : Person) (c : ComplaintText) : Prop where
  community  : DebtorMemberOfCreditorReputationCommunity dbtr cred c
  reputation : CreditorHadExtortionateReputation cred c


inductive ExtortionateUsePurpose
    (m : ExtortionateMeans) (x : ExtensionOfCredit) (v : Person) (c : ComplaintText) : Prop where

  | collect (h : UsedToCollectExtensionOfCredit m x c)
      : ExtortionateUsePurpose m x v c

  | punish (h : UsedToPunishNonrepayment m v x c)
      : ExtortionateUsePurpose m x v c



structure ExtortionateCollectionMembership
    (p : Person) (m : ExtortionateMeans) (x : ExtensionOfCredit) (v : Person)
    (c : ComplaintText) : Prop where
  meansAreExtortionate : IsExtortionateMeans m c
  extension            : IsExtensionOfCredit x c
  participates         : KnowinglyParticipatesInUseOfExtortionateMeans p m c
  purpose              : ExtortionateUsePurpose m x v c




structure ImplicitThreatShowing
    (m : ExtortionateMeans) (v : Person) (cred : Person) (c : ComplaintText) : Prop where
  targetKnowledge : PriorExtortionateCollectionKnownToTarget v cred c
  threatCarried   : CarriedImplicitThreatAsMeansOfCollection m c







inductive UnlawfulActivityKind (u : UnlawfulActivity) (c : ComplaintText) : Prop where


  | businessEnterprise (h : IsBusinessEnterpriseInvolvingProhibitedActivity u c)
      : UnlawfulActivityKind u c

  | extortionBriberyArson (h : IsExtortionBriberyOrArsonViolation u c)
      : UnlawfulActivityKind u c

  | indictableFinancialOffense (h : IsIndictableFinancialOffense u c)
      : UnlawfulActivityKind u c


structure UnlawfulActivityMembership
    (u : UnlawfulActivity) (c : ComplaintText) : Prop where
  kind : UnlawfulActivityKind u c
  term : IsUnlawfulActivity u c




inductive StateKind (j : Jurisdiction) (c : ComplaintText) : Prop where
  | stateOfTheUnitedStates (h : IsStateOfTheUnitedStates j c) : StateKind j c
  | districtOfColumbia (h : IsDistrictOfColumbia j c) : StateKind j c
  | commonwealthTerritoryOrPossession (h : IsCommonwealthTerritoryOrPossession j c)
      : StateKind j c


structure StateMembership (j : Jurisdiction) (c : ComplaintText) : Prop where
  kind : StateKind j c
  term : IsState j c



structure SavingsPromotionRaffleMembership
    (r : SavingsPromotionRaffle) (c : ComplaintText) : Prop where
  soleConsideration : SoleConsiderationIsSavingsDeposit r c
  equalChance       : EachEntryHasEqualChanceOfBeingDrawn r c
  regulated         : SubjectToPrudentialRegulatorRegulations r c
  term              : IsSavingsPromotionRaffle r c




inductive ExemptRaffleConductor (f : FinancialInstitution) (c : ComplaintText) : Prop where
  | insuredDepositoryInstitution (h : IsInsuredDepositoryInstitution f c)
      : ExemptRaffleConductor f c
  | insuredCreditUnion (h : IsInsuredCreditUnion f c) : ExemptRaffleConductor f c








inductive TransactionKind
    (t : Transaction) (f : FinancialInstitution) (c : ComplaintText) : Prop where
  | disposition (h : IsDispositionOfProperty t c) : TransactionKind t f c
  | financialInstitutionDealing (h : IsFinancialInstitutionDealing t f c)
      : TransactionKind t f c


structure TransactionMembership
    (t : Transaction) (f : FinancialInstitution) (c : ComplaintText) : Prop where
  kind : TransactionKind t f c
  term : IsTransaction t c





inductive FinancialTransactionKind
    (t : Transaction) (m : MonetaryInstrument) (f : FinancialInstitution)
    (c : ComplaintText) : Prop where

  | commerceMovementOfFunds
      (commerce : AffectsInterstateOrForeignCommerce t c)
      (h : InvolvesMovementOfFunds t c) : FinancialTransactionKind t m f c

  | commerceMonetaryInstruments
      (commerce : AffectsInterstateOrForeignCommerce t c)
      (instrument : IsMonetaryInstrument m c)
      (h : InvolvesMonetaryInstruments t m c) : FinancialTransactionKind t m f c

  | commerceTitleTransfer
      (commerce : AffectsInterstateOrForeignCommerce t c)
      (h : InvolvesTransferOfTitleToTitledProperty t c) : FinancialTransactionKind t m f c

  | financialInstitutionUse
      (institution : IsFinancialInstitution f c)
      (h : InvolvesCommerceAffectingFinancialInstitution t f c)
      : FinancialTransactionKind t m f c



structure FinancialTransactionMembership
    (t : Transaction) (m : MonetaryInstrument) (f : FinancialInstitution)
    (c : ComplaintText) : Prop where
  parentTerm : IsTransaction t c
  kind       : FinancialTransactionKind t m f c
  term       : IsFinancialTransaction t c


inductive MonetaryInstrumentKind (m : MonetaryInstrument) (c : ComplaintText) : Prop where
  | coinCurrencyCheckOrMoneyOrder (h : IsCoinCurrencyCheckOrMoneyOrder m c)
      : MonetaryInstrumentKind m c
  | bearerSecurityOrNegotiableInstrument (h : IsBearerSecurityOrNegotiableInstrument m c)
      : MonetaryInstrumentKind m c


structure MonetaryInstrumentMembership
    (m : MonetaryInstrument) (c : ComplaintText) : Prop where
  kind : MonetaryInstrumentKind m c
  term : IsMonetaryInstrument m c




inductive FinancialInstitutionKind (f : FinancialInstitution) (c : ComplaintText) : Prop where
  | title31Institution (h : IsTitle31FinancialInstitution f c) : FinancialInstitutionKind f c
  | foreignBank (h : IsForeignBank f c) : FinancialInstitutionKind f c


structure FinancialInstitutionMembership
    (f : FinancialInstitution) (c : ComplaintText) : Prop where
  kind : FinancialInstitutionKind f c
  term : IsFinancialInstitution f c



inductive SpecifiedUnlawfulActivityKind
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop where


  | section1961Offense (h : IsSection1961ListedOffense s c)
      : SpecifiedUnlawfulActivityKind s c


  | foreignNationOffense (h : IsForeignNationOffenseOfEnumeratedKind s c)
      : SpecifiedUnlawfulActivityKind s c

  | continuingCriminalEnterprise (h : IsContinuingCriminalEnterprise s c)
      : SpecifiedUnlawfulActivityKind s c

  | enumeratedFederalOffense (h : IsEnumeratedFederalOffense s c)
      : SpecifiedUnlawfulActivityKind s c

  | environmentalFelony (h : IsEnvironmentalFelony s c)
      : SpecifiedUnlawfulActivityKind s c

  | federalHealthCareOffense (h : IsFederalHealthCareOffense s c)
      : SpecifiedUnlawfulActivityKind s c

  | wildlifeTrafficking (h : IsWildlifeTraffickingViolationOverThreshold s c)
      : SpecifiedUnlawfulActivityKind s c



structure SpecifiedUnlawfulActivityMembership
    (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop where
  kind : SpecifiedUnlawfulActivityKind s c
  term : IsSpecifiedUnlawfulActivity s c



structure ProceedsMembership (p : Property) (c : ComplaintText) : Prop where
  derived : IsDerivedFromSomeFormOfUnlawfulActivity p c
  term    : IsProceeds p c



inductive ConductKind (per : Person) (t : Transaction) (c : ComplaintText) : Prop where
  | initiates (h : InitiatesTransaction per t c) : ConductKind per t c
  | concludes (h : ConcludesTransaction per t c) : ConductKind per t c
  | participates (h : ParticipatesInInitiatingOrConcludingTransaction per t c)
      : ConductKind per t c


structure ConductsMembership
    (per : Person) (t : Transaction) (c : ComplaintText) : Prop where
  kind : ConductKind per t c
  term : Conducts per t c




structure ProceedsKnowledgeMembership
    (per : Person) (p : Property) (c : ComplaintText) : Prop where
  felonyProceeds : PropertyRepresentsProceedsOfFelonyActivity p c
  proceeds       : IsProceeds p c
  term           : KnowsPropertyRepresentsProceedsOfSomeUnlawfulActivity per p c



inductive RepresentationSource (p : Property) (c : ComplaintText) : Prop where
  | lawEnforcementOfficer (h : RepresentationMadeByLawEnforcementOfficer p c)
      : RepresentationSource p c
  | atDirectionOfFederalOfficial (h : RepresentationMadeAtDirectionOfFederalOfficial p c)
      : RepresentationSource p c


structure RepresentedProceedsMembership (p : Property) (c : ComplaintText) : Prop where
  source : RepresentationSource p c
  term   : IsRepresentedProceeds p c





structure ParallelTransactionDeeming
    (t : Transaction) (s : SpecifiedUnlawfulActivity) (c : ComplaintText) : Prop where
  plan       : PartOfSinglePlanOfParallelOrDependentTransactions t c
  someMember : InvolvesProceedsOfSpecifiedUnlawfulActivity t s c
  activity   : IsSpecifiedUnlawfulActivity s c




structure ContinuingTransferMembership (t : Transaction) (c : ComplaintText) : Prop where
  continuing : IsSingleContinuingFundsTransfer t c
  term       : IsTransaction t c

end Proving.USC.T18.Ch42Ch95.Ontology
