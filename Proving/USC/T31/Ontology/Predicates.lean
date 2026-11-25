





import Proving.USC.T31.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T31.Ontology

open Proving.USC.Common (ComplaintText Person Entity)






axiom IsDepositoryInstitution (e : Entity) (c : ComplaintText) : Prop




axiom HasFederalReserveActMeaning (e : Entity) (c : ComplaintText) : Prop





axiom IsBranchAgencyOrCommercialLendingCompany (e : Entity) (c : ComplaintText) : Prop




axiom IsEdgeActCorporation (e : Entity) (c : ComplaintText) : Prop





axiom IsAgreementCorporation (e : Entity) (c : ComplaintText) : Prop




axiom IsQualifiedBusinessCustomer (b : Entity) (c : ComplaintText) : Prop





axiom MaintainsTransactionAccount (b inst : Entity) (c : ComplaintText) : Prop





axiom FrequentlyEngagesInReportableTransactions (b inst : Entity) (c : ComplaintText) : Prop





axiom MeetsSecretaryCriteria (b : Entity) (c : ComplaintText) : Prop





axiom IsDesignatedReportingAgent (e : Entity) (c : ComplaintText) : Prop




axiom IsGovernmentAgency (e : Entity) (c : ComplaintText) : Prop





axiom IsGovernmentalAuthorityEntity (e : Entity) (c : ComplaintText) : Prop




axiom IsLimitedLawEnforcementValueBusiness (e : Entity) (c : ComplaintText) : Prop






axiom IsReportableTransaction (t : Transaction) (c : ComplaintText) : Prop






axiom IsDomesticFinancialInstitution (e : Entity) (c : ComplaintText) : Prop




axiom IsMonetaryInstrument (m : MonetaryInstrument) (c : ComplaintText) : Prop




axiom IsNonfinancialTradeOrBusiness (e : Entity) (c : ComplaintText) : Prop





axiom IsStructuringTransaction (t : Transaction) (c : ComplaintText) : Prop




axiom IsPerson (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T31.Ontology
