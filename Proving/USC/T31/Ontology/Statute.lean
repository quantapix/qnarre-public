







import Proving.USC.T31.Ontology.Types
import Proving.USC.T31.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T31.Ontology

open Proving.USC.Common (ComplaintText Person Entity)





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_depositoryInstitution_dependsOn_fraMeaning : DefEdge :=
  { defined := "depository institution",
    dependsOn := "depository institution (FRA § 19(b)(1)(A) meaning)",
    citeDefine := "31 USC § 5313(g)(1)" }



def edge_depositoryInstitution_dependsOn_branchAgencyCLC : DefEdge :=
  { defined := "depository institution",
    dependsOn := "branch, agency, or commercial lending company (IBA § 1(b))",
    citeDefine := "31 USC § 5313(g)(2)(A)" }


def edge_depositoryInstitution_dependsOn_edgeActCorporation : DefEdge :=
  { defined := "depository institution",
    dependsOn := "corporation chartered under FRA § 25A",
    citeDefine := "31 USC § 5313(g)(2)(B)" }


def edge_depositoryInstitution_dependsOn_agreementCorporation : DefEdge :=
  { defined := "depository institution",
    dependsOn := "corporation with FRA § 25 agreement with Board of Governors",
    citeDefine := "31 USC § 5313(g)(2)(C)" }



def edge_qualifiedBusinessCustomer_dependsOn_depositoryInstitution : DefEdge :=
  { defined := "qualified business customer",
    dependsOn := "depository institution",
    citeDefine := "31 USC § 5313(e)(2)" }



def edge_qualifiedBusinessCustomer_dependsOn_transactionAccount : DefEdge :=
  { defined := "qualified business customer",
    dependsOn := "transaction account (FRA § 19(b)(1)(C))",
    citeDefine := "31 USC § 5313(e)(2)(A)" }



def edge_qualifiedBusinessCustomer_dependsOn_reportableTransaction : DefEdge :=
  { defined := "qualified business customer",
    dependsOn := "transaction subject to reporting under § 5313(a)",
    citeDefine := "31 USC § 5313(e)(2)(B)" }



def edge_exemptCounterparty_dependsOn_depositoryInstitution : DefEdge :=
  { defined := "exempt counterparty (§ 5313(d))",
    dependsOn := "depository institution",
    citeDefine := "31 USC § 5313(d)(1)(A)" }




def edge_reportableTransaction_dependsOn_domesticFinancialInstitution : DefEdge :=
  { defined := "reportable transaction (§ 5313(a))",
    dependsOn := "domestic financial institution",
    citeDefine := "31 USC § 5313(a)" }

def edge_reportableTransaction_dependsOn_monetaryInstrument : DefEdge :=
  { defined := "reportable transaction (§ 5313(a))",
    dependsOn := "monetary instruments",
    citeDefine := "31 USC § 5313(a)" }





inductive DepositoryInstitutionDef (e : Entity) (c : ComplaintText) : Prop
  | fraMeaning (h : HasFederalReserveActMeaning e c)
  | branchAgencyOrCLC (h : IsBranchAgencyOrCommercialLendingCompany e c)
  | edgeActCorporation (h : IsEdgeActCorporation e c)
  | agreementCorporation (h : IsAgreementCorporation e c)




structure QualifiedBusinessCustomerDef (b inst : Entity) (c : ComplaintText) : Prop where
  maintainsAccount   : MaintainsTransactionAccount b inst c
  frequentTransactor : FrequentlyEngagesInReportableTransactions b inst c
  meetsCriteria      : MeetsSecretaryCriteria b c
  hostIsDepository   : IsDepositoryInstitution inst c




inductive ExemptCounterpartyDef (e : Entity) (c : ComplaintText) : Prop
  | depository (h : IsDepositoryInstitution e c)
  | governmentAgency (h : IsGovernmentAgency e c)
  | governmentalAuthority (h : IsGovernmentalAuthorityEntity e c)
  | lowValueBusiness (h : IsLimitedLawEnforcementValueBusiness e c)

end Proving.USC.T31.Ontology
