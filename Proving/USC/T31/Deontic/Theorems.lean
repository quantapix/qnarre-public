import Proving.USC.T31.Deontic.Types
import Proving.USC.T31.Deontic.Predicates
import Proving.USC.T31.Deontic.Statute






namespace Proving.USC.T31.Deontic



theorem obligationBreached5313a_intro {e c}
    (hAddr : IsDomesticFinancialInstitution e c)
    (hCond : InvolvedInCoveredCurrencyTransaction e c)
    (hNoAct : ¬ FiledRequiredCurrencyReport e c) :
    ObligationBreached5313a e c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩


theorem obligationBreached5313aAgent_intro {p e c}
    (hAddr : ActedAsAgentForAnother p e c)
    (hCond : InvolvedInCoveredCurrencyTransaction e c)
    (hNoAct : ¬ IdentifiedPrincipalInReport p c) :
    ObligationBreached5313aAgent p e c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩


theorem powerExercised5313b_intro {p e c}
    (hHolder : IsSecretaryOfTreasury p c)
    (hCond : DesignationConsentRequirementMet e c)
    (hAct : DesignatedInstitutionAsReportingAgent p e c) :
    PowerExercised5313b p e c :=
  ⟨⟨hHolder, hCond⟩, hAct⟩



theorem obligationBreached5313c1_intro {p c}
    (hAddr : RequiredToFileCurrencyReport p c)
    (hNoAct : ¬ FiledReportThroughPrescribedChannel p c) :
    ObligationBreached5313c1 p c :=
  ⟨⟨hAddr⟩, hNoAct⟩


theorem obligationBreached5313d1_intro {p e c}
    (hAddr : IsSecretaryOfTreasury p c)
    (hDep : IsDepositoryInstitution e c)
    (hCond : TransactionWithExemptCategoryEntity e c)
    (hNoAct : ¬ GrantedRequiredExemption p e c) :
    ObligationBreached5313d1 p e c :=
  ⟨⟨hAddr, hDep, hCond⟩, hNoAct⟩


theorem obligationBreached5313d2_intro {p c}
    (hAddr : IsSecretaryOfTreasury p c)
    (hNoAct : ¬ PublishedExemptEntityListAnnually p c) :
    ObligationBreached5313d2 p c :=
  ⟨⟨hAddr⟩, hNoAct⟩


theorem powerExercised5313e1_intro {p e c}
    (hHolder : IsSecretaryOfTreasury p c)
    (hDep : IsDepositoryInstitution e c)
    (hCond : IsQualifiedBusinessCustomer e c)
    (hAct : GrantedDiscretionaryExemption p e c) :
    PowerExercised5313e1 p e c :=
  ⟨⟨hHolder, hDep, hCond⟩, hAct⟩


theorem prohibitionViolated5313f1_intro {e c}
    (hAddr : IsDepositoryInstitution e c)
    (hNoFalsity : ¬ KnowinglyFiledFalseExemptionInfo e c)
    (hNoBelief : ¬ HadReasonToBelieveExemptionInvalid e c)
    (hAct : ImposedPenaltyForExemptTransaction e c) :
    ProhibitionViolated5313f1 e c :=
  ⟨⟨hAddr, hNoFalsity, hNoBelief⟩, hAct⟩


theorem prohibitionViolated5324a_intro {p c}
    (hCond : IntendedToEvadeCurrencyReporting p c)
    (hAct : EvasiveAct5324a p c) :
    ProhibitionViolated5324a p c :=
  ⟨⟨hCond⟩, hAct⟩


theorem prohibitionViolated5324b_intro {p c}
    (hCond : IntendedToEvadeNonfinancialReporting p c)
    (hAct : EvasiveAct5324b p c) :
    ProhibitionViolated5324b p c :=
  ⟨⟨hCond⟩, hAct⟩


theorem prohibitionViolated5324c_intro {p c}
    (hCond : IntendedToEvadeTransportReporting p c)
    (hAct : EvasiveAct5324c p c) :
    ProhibitionViolated5324c p c :=
  ⟨⟨hCond⟩, hAct⟩

end Proving.USC.T31.Deontic
