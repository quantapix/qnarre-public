








import Proving.USC.T29.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T29.Ontology

open Proving.USC.Common





axiom IsPerson (p : Person) (c : ComplaintText) : Prop




axiom IsEmployer (e : Employer) (c : ComplaintText) : Prop






axiom IsSection152EmployerExcluded (e : Employer) (c : ComplaintText) : Prop





axiom IsEmployee (e : Employee) (c : ComplaintText) : Prop




axiom IsSection152EmployeeExcluded (e : Employee) (c : ComplaintText) : Prop




axiom IsSupervisor (s : Supervisor) (c : ComplaintText) : Prop





axiom IsLaborOrganization (l : LaborOrganization) (c : ComplaintText) : Prop




axiom IsRepresentative (r : Representative) (c : ComplaintText) : Prop




axiom IsCommerce (k : Commerce) (c : ComplaintText) : Prop





axiom IsAffectingCommerce (k : Commerce) (c : ComplaintText) : Prop





axiom IsLaborDispute (d : LaborDispute) (c : ComplaintText) : Prop




axiom IsUnfairLaborPractice (u : UnfairLaborPractice) (c : ComplaintText) : Prop



axiom IsHealthCareInstitution (h : HealthCareInstitution) (c : ComplaintText) : Prop




axiom IsBoard (b : Board) (c : ComplaintText) : Prop

end Proving.USC.T29.Ontology
