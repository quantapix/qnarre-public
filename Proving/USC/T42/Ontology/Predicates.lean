












import Proving.USC.T42.Ontology.Types

namespace Proving.USC.T42.Ontology

open Proving.USC.Common





axiom IsContractRelationship (r : ContractRelationship) (c : ComplaintText) : Prop





axiom IsProtectedContractor (x : ProtectedContractor) (c : ComplaintText) : Prop





axiom IsComplainingParty (x : ComplainingParty) (c : ComplaintText) : Prop





axiom IsDiscriminatoryPractice (d : DiscriminatoryPractice) (c : ComplaintText) : Prop




axiom IsFundedProgram (f : FundedProgram) (c : ComplaintText) : Prop




axiom IsFederalFinancialAssistance (a : FederalFinancialAssistance) (c : ComplaintText) : Prop





axiom IsRecipient (e : Recipient) (c : ComplaintText) : Prop




axiom IsState (s : State) (c : ComplaintText) : Prop




axiom IsPersonInUS (p : ProtectedPerson) (c : ComplaintText) : Prop




axiom IsCivilRightsConspiracy (g : CivilRightsConspiracy) (c : ComplaintText) : Prop




axiom IsNeglectfulPreventor (n : NeglectfulPreventor) (c : ComplaintText) : Prop

end Proving.USC.T42.Ontology
