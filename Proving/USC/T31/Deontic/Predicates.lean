import Proving.USC.T31.Deontic.Types







namespace Proving.USC.T31.Deontic





axiom IsDomesticFinancialInstitution (e : Entity) (c : ComplaintText) : Prop






axiom InvolvedInCoveredCurrencyTransaction (e : Entity) (c : ComplaintText) : Prop




axiom FiledRequiredCurrencyReport (e : Entity) (c : ComplaintText) : Prop




axiom ActedAsAgentForAnother (p : Person) (e : Entity) (c : ComplaintText) : Prop




axiom IdentifiedPrincipalInReport (p : Person) (c : ComplaintText) : Prop





axiom IsSecretaryOfTreasury (p : Person) (c : ComplaintText) : Prop





axiom DesignationConsentRequirementMet (e : Entity) (c : ComplaintText) : Prop




axiom DesignatedInstitutionAsReportingAgent (p : Person) (e : Entity) (c : ComplaintText) : Prop






axiom RequiredToFileCurrencyReport (p : Person) (c : ComplaintText) : Prop





axiom FiledReportThroughPrescribedChannel (p : Person) (c : ComplaintText) : Prop





axiom IsDepositoryInstitution (e : Entity) (c : ComplaintText) : Prop




axiom TransactionWithExemptCategoryEntity (e : Entity) (c : ComplaintText) : Prop





axiom GrantedRequiredExemption (p : Person) (e : Entity) (c : ComplaintText) : Prop





axiom PublishedExemptEntityListAnnually (p : Person) (c : ComplaintText) : Prop




axiom IsQualifiedBusinessCustomer (e : Entity) (c : ComplaintText) : Prop





axiom GrantedDiscretionaryExemption (p : Person) (e : Entity) (c : ComplaintText) : Prop







axiom ImposedPenaltyForExemptTransaction (e : Entity) (c : ComplaintText) : Prop




axiom KnowinglyFiledFalseExemptionInfo (e : Entity) (c : ComplaintText) : Prop





axiom HadReasonToBelieveExemptionInvalid (e : Entity) (c : ComplaintText) : Prop







axiom IntendedToEvadeCurrencyReporting (p : Person) (c : ComplaintText) : Prop





axiom CausedFailureToFileCurrencyReport (p : Person) (c : ComplaintText) : Prop





axiom CausedMaterialMisstatementInCurrencyReport (p : Person) (c : ComplaintText) : Prop




axiom StructuredDomesticTransaction (p : Person) (c : ComplaintText) : Prop






axiom IntendedToEvadeNonfinancialReporting (p : Person) (c : ComplaintText) : Prop




axiom CausedFailureToFileNonfinancialReport (p : Person) (c : ComplaintText) : Prop





axiom CausedMaterialMisstatementInNonfinancialReport (p : Person) (c : ComplaintText) : Prop




axiom StructuredNonfinancialTransaction (p : Person) (c : ComplaintText) : Prop






axiom IntendedToEvadeTransportReporting (p : Person) (c : ComplaintText) : Prop




axiom FailedToFileTransportReport (p : Person) (c : ComplaintText) : Prop




axiom CausedMaterialMisstatementInTransportReport (p : Person) (c : ComplaintText) : Prop




axiom StructuredMonetaryInstrumentTransport (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T31.Deontic
