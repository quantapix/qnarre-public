





























import Proving.USC.T29.SelfOrgRep.Ontology.Predicates
import Proving.USC.T29.Ontology.Predicates

namespace Proving.USC.T29.SelfOrgRep.JoinBridge

open Proving.USC.Common





axiom mapLaborOrg :
    Proving.USC.T29.SelfOrgRep.Ontology.LaborOrganization →
    Proving.USC.T29.Ontology.LaborOrganization


axiom mapEmployee : Person → Proving.USC.T29.Ontology.Employee






axiom corr_isLaborOrganization {l c} :
    Proving.USC.T29.SelfOrgRep.Ontology.IsLaborOrganization l c →
    Proving.USC.T29.Ontology.IsLaborOrganization (mapLaborOrg l) c




axiom corr_isEmployee {p c} :
    Proving.USC.T29.SelfOrgRep.Ontology.IsEmployee p c →
    Proving.USC.T29.Ontology.IsEmployee (mapEmployee p) c






theorem join_isLaborOrganization {l c}
    (h : Proving.USC.T29.SelfOrgRep.Ontology.IsLaborOrganization l c) :
    Proving.USC.T29.Ontology.IsLaborOrganization (mapLaborOrg l) c :=
  corr_isLaborOrganization h




theorem join_isEmployee {p c}
    (h : Proving.USC.T29.SelfOrgRep.Ontology.IsEmployee p c) :
    Proving.USC.T29.Ontology.IsEmployee (mapEmployee p) c :=
  corr_isEmployee h

end Proving.USC.T29.SelfOrgRep.JoinBridge
