








import Proving.USC.T42.TitleVIIEnf.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIEnf.Ontology

open Proving.USC.Common




axiom IsCommission (x : Commission) (c : ComplaintText) : Prop




axiom IsGeneralCounsel (p : Person) (c : ComplaintText) : Prop





axiom IsCharge (x : Charge) (c : ComplaintText) : Prop





axiom IsRespondent (x : Respondent) (c : ComplaintText) : Prop





axiom IsConciliationAgreement (x : ConciliationAgreement) (c : ComplaintText) : Prop





axiom IsPatternOrPractice (x : PatternOrPractice) (c : ComplaintText) : Prop





axiom IsPersonnelAction (x : PersonnelAction) (c : ComplaintText) : Prop





axiom IsAggrievedPerson (p : Person) (c : ComplaintText) : Prop











axiom IsEmployer (p : Person) (c : ComplaintText) : Prop





axiom IsUnlawfulEmploymentPractice (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVIIEnf.Ontology
