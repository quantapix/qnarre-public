






























import Proving.USC.T42.TitleVIIEnf.Ontology.Statute
import Proving.USC.T42.TitleVIIDef.Ontology.Predicates

namespace Proving.USC.T42.TitleVIIEnf.JoinBridge

open Proving.USC.Common





axiom mapEmployer : Person → Proving.USC.T42.TitleVIIDef.Ontology.Employer


axiom mapUEP : Person → Proving.USC.T42.TitleVIIDef.Ontology.UnlawfulEmploymentPractice






axiom corr_isEmployer {p c} :
    Proving.USC.T42.TitleVIIEnf.Ontology.IsEmployer p c →
    Proving.USC.T42.TitleVIIDef.Ontology.IsEmployer (mapEmployer p) c




axiom corr_isUEP {p c} :
    Proving.USC.T42.TitleVIIEnf.Ontology.IsUnlawfulEmploymentPractice p c →
    Proving.USC.T42.TitleVIIDef.Ontology.IsUnlawfulEmploymentPractice (mapUEP p) c





theorem join_isEmployer {p c}
    (h : Proving.USC.T42.TitleVIIEnf.Ontology.IsEmployer p c) :
    Proving.USC.T42.TitleVIIDef.Ontology.IsEmployer (mapEmployer p) c :=
  corr_isEmployer h




theorem join_isUnlawfulEmploymentPractice {p c}
    (h : Proving.USC.T42.TitleVIIEnf.Ontology.IsUnlawfulEmploymentPractice p c) :
    Proving.USC.T42.TitleVIIDef.Ontology.IsUnlawfulEmploymentPractice (mapUEP p) c :=
  corr_isUEP h

end Proving.USC.T42.TitleVIIEnf.JoinBridge
