













import Proving.USC.T42.EqualRights.Ontology.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.EqualRights.Ontology

open Proving.USC.Common





axiom IsProtectedPerson (p : Person) (c : ComplaintText) : Prop






axiom IsContractRelationship (r : ContractRelationship) (c : ComplaintText) : Prop





axiom IsCitizen (p : Person) (c : ComplaintText) : Prop




axiom IsProperty (x : Property) (c : ComplaintText) : Prop





axiom IsComplainingParty (p : Person) (c : ComplaintText) : Prop




axiom IsDiscriminatoryPractice (d : DiscriminatoryPractice) (c : ComplaintText) : Prop

end Proving.USC.T42.EqualRights.Ontology
