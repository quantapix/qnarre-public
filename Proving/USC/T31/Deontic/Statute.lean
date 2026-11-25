import Proving.USC.T31.Deontic.Types
import Proving.USC.T31.Deontic.Predicates












namespace Proving.USC.T31.Deontic





structure Obligation5313a (e : Entity) (c : ComplaintText) : Prop where
  addressee : IsDomesticFinancialInstitution e c
  condition : InvolvedInCoveredCurrencyTransaction e c



def ObligationBreached5313a (e : Entity) (c : ComplaintText) : Prop :=
  Obligation5313a e c ∧ ¬ FiledRequiredCurrencyReport e c



structure Obligation5313aAgent (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : ActedAsAgentForAnother p e c
  condition : InvolvedInCoveredCurrencyTransaction e c



def ObligationBreached5313aAgent (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Obligation5313aAgent p e c ∧ ¬ IdentifiedPrincipalInReport p c





structure Power5313b (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  holder    : IsSecretaryOfTreasury p c
  condition : DesignationConsentRequirementMet e c



def PowerExercised5313b (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Power5313b p e c ∧ DesignatedInstitutionAsReportingAgent p e c





structure Obligation5313c1 (p : Person) (c : ComplaintText) : Prop where
  addressee : RequiredToFileCurrencyReport p c



def ObligationBreached5313c1 (p : Person) (c : ComplaintText) : Prop :=
  Obligation5313c1 p c ∧ ¬ FiledReportThroughPrescribedChannel p c





structure Obligation5313d1 (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee  : IsSecretaryOfTreasury p c
  depository : IsDepositoryInstitution e c
  condition  : TransactionWithExemptCategoryEntity e c



def ObligationBreached5313d1 (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Obligation5313d1 p e c ∧ ¬ GrantedRequiredExemption p e c


structure Obligation5313d2 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSecretaryOfTreasury p c



def ObligationBreached5313d2 (p : Person) (c : ComplaintText) : Prop :=
  Obligation5313d2 p c ∧ ¬ PublishedExemptEntityListAnnually p c





structure Power5313e1 (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  holder     : IsSecretaryOfTreasury p c
  depository : IsDepositoryInstitution e c
  condition  : IsQualifiedBusinessCustomer e c



def PowerExercised5313e1 (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Power5313e1 p e c ∧ GrantedDiscretionaryExemption p e c






structure Prohibition5313f1 (e : Entity) (c : ComplaintText) : Prop where
  addressee         : IsDepositoryInstitution e c
  noKnowingFalsity  : ¬ KnowinglyFiledFalseExemptionInfo e c
  noReasonToBelieve : ¬ HadReasonToBelieveExemptionInvalid e c



def ProhibitionViolated5313f1 (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition5313f1 e c ∧ ImposedPenaltyForExemptTransaction e c





inductive EvasiveAct5324a (p : Person) (c : ComplaintText) : Prop where
  | causedFailureToFile
      (h : CausedFailureToFileCurrencyReport p c) : EvasiveAct5324a p c
  | causedMisstatement
      (h : CausedMaterialMisstatementInCurrencyReport p c) : EvasiveAct5324a p c
  | structured
      (h : StructuredDomesticTransaction p c) : EvasiveAct5324a p c



structure Prohibition5324a (p : Person) (c : ComplaintText) : Prop where
  condition : IntendedToEvadeCurrencyReporting p c



def ProhibitionViolated5324a (p : Person) (c : ComplaintText) : Prop :=
  Prohibition5324a p c ∧ EvasiveAct5324a p c





inductive EvasiveAct5324b (p : Person) (c : ComplaintText) : Prop where
  | causedFailureToFile
      (h : CausedFailureToFileNonfinancialReport p c) : EvasiveAct5324b p c
  | causedMisstatement
      (h : CausedMaterialMisstatementInNonfinancialReport p c) : EvasiveAct5324b p c
  | structured
      (h : StructuredNonfinancialTransaction p c) : EvasiveAct5324b p c


structure Prohibition5324b (p : Person) (c : ComplaintText) : Prop where
  condition : IntendedToEvadeNonfinancialReporting p c


def ProhibitionViolated5324b (p : Person) (c : ComplaintText) : Prop :=
  Prohibition5324b p c ∧ EvasiveAct5324b p c





inductive EvasiveAct5324c (p : Person) (c : ComplaintText) : Prop where
  | failedToFile
      (h : FailedToFileTransportReport p c) : EvasiveAct5324c p c
  | causedMisstatement
      (h : CausedMaterialMisstatementInTransportReport p c) : EvasiveAct5324c p c
  | structured
      (h : StructuredMonetaryInstrumentTransport p c) : EvasiveAct5324c p c


structure Prohibition5324c (p : Person) (c : ComplaintText) : Prop where
  condition : IntendedToEvadeTransportReporting p c


def ProhibitionViolated5324c (p : Person) (c : ComplaintText) : Prop :=
  Prohibition5324c p c ∧ EvasiveAct5324c p c

end Proving.USC.T31.Deontic
