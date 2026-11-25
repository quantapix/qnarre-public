













import Proving.USC.T42.TitleVIIDef.Ontology.Types

namespace Proving.USC.T42.TitleVIIDef.Ontology

open Proving.USC.Common





axiom IsEmployer (x : Employer) (c : ComplaintText) : Prop




axiom IsEmploymentAgency (x : EmploymentAgency) (c : ComplaintText) : Prop




axiom IsLaborOrganization (x : LaborOrganization) (c : ComplaintText) : Prop





axiom IsEmployee (x : Employee) (c : ComplaintText) : Prop




axiom IsCommerce (x : Commerce) (c : ComplaintText) : Prop




axiom IsIndustryAffectingCommerce (x : IndustryAffectingCommerce) (c : ComplaintText) : Prop




axiom IsState (x : State) (c : ComplaintText) : Prop




axiom IsComplainingParty (x : ComplainingParty) (c : ComplaintText) : Prop





axiom IsRespondent (x : Respondent) (c : ComplaintText) : Prop






axiom IsUnlawfulEmploymentPractice (x : UnlawfulEmploymentPractice) (c : ComplaintText) : Prop









axiom EngagedInIndustryAffectingCommerce (x : Employer) (c : ComplaintText) : Prop




axiom MeetsEmployerCoverageThreshold (x : Employer) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVIIDef.Ontology
