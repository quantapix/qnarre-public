



import Proving.USC.T31.Ontology.Types
import Proving.USC.T31.Ontology.Predicates
import Proving.USC.T31.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T31.Ontology

open Proving.USC.Common (ComplaintText Person Entity)


theorem depositoryInstitutionDef_intro {e : Entity} {c : ComplaintText}
    (h : HasFederalReserveActMeaning e c) : DepositoryInstitutionDef e c :=
  .fraMeaning h


theorem qualifiedBusinessCustomerDef_intro {b inst : Entity} {c : ComplaintText}
    (hA : MaintainsTransactionAccount b inst c)
    (hB : FrequentlyEngagesInReportableTransactions b inst c)
    (hC : MeetsSecretaryCriteria b c)
    (hInst : IsDepositoryInstitution inst c)
    : QualifiedBusinessCustomerDef b inst c :=
  ⟨hA, hB, hC, hInst⟩


theorem exemptCounterpartyDef_intro {e : Entity} {c : ComplaintText}
    (h : IsDepositoryInstitution e c) : ExemptCounterpartyDef e c :=
  .depository h

end Proving.USC.T31.Ontology
