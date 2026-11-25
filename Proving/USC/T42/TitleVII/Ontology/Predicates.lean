















import Proving.USC.T42.TitleVII.Ontology.Types

namespace Proving.USC.T42.TitleVII.Ontology

open Proving.USC.Common




axiom IsPerson (p : TPerson) (c : ComplaintText) : Prop





axiom IsEmployer (e : Employer) (c : ComplaintText) : Prop



axiom IsEmploymentAgency (a : EmploymentAgency) (c : ComplaintText) : Prop




axiom IsLaborOrganization (l : LaborOrganization) (c : ComplaintText) : Prop





axiom IsEmployee (e : Employee) (c : ComplaintText) : Prop




axiom IsCommerce (x : Commerce) (c : ComplaintText) : Prop




axiom AffectsCommerce (e : Entity) (c : ComplaintText) : Prop




axiom IsRespondent (r : Respondent) (c : ComplaintText) : Prop




axiom IsComplainingParty (p : ComplainingParty) (c : ComplaintText) : Prop



axiom IsCommission (k : Commission) (c : ComplaintText) : Prop




axiom IsUnlawfulEmploymentPractice (x : EmploymentPractice) (c : ComplaintText) : Prop




axiom IsMotivatingFactor (x : EmploymentPractice) (c : ComplaintText) : Prop




axiom IsProtectedActivity (x : ProtectedActivity) (c : ComplaintText) : Prop




axiom IsPersonnelAction (x : PersonnelAction) (c : ComplaintText) : Prop




axiom IsCharge (x : Charge) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVII.Ontology
