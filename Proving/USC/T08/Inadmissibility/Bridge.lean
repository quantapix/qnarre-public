


































import Proving.USC.T08.Inadmissibility.Elements.Statute
import Proving.USC.T08.Inadmissibility.Deontic.Statute
import Proving.USC.T08.Inadmissibility.Ontology.Statute
import Proving.USC.T08.Inadmissibility.Procedure.Statute
import Proving.USC.T08.Inadmissibility.Structure.Statute
import Proving.USC.T08.Inadmissibility.Scienter.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T08.Inadmissibility.Bridge

open Proving.USC.Common











axiom corr_employer {p : Person} {c : ComplaintText} :
    Elements.IsPersonOrEntity p c → Deontic.AddresseeIsEmployer p c




axiom corr_knewHire {p : Person} {al : Elements.Alien} {c : ComplaintText} :
    Proving.USC.Common.ActedWithScienter p c → Elements.IsUnauthorizedAlien al c →
    Deontic.KnewAlienUnauthorized p c



axiom corr_knewCont {p : Person} {al : Elements.Alien} {c : ComplaintText} :
    Proving.USC.Common.ActedWithScienter p c → Elements.BecameUnauthorizedAlien al c →
    Deontic.KnewAlienUnauthorized p c


axiom corr_hireAct {p : Person} {al : Elements.Alien} {c : ComplaintText} :
    Elements.HiredRecruitedOrReferred p al c → Deontic.HiredOrReferredAlien p c


axiom corr_contAct {p : Person} {al : Elements.Alien} {c : ComplaintText} :
    Elements.ContinuedToEmploy p al c → Deontic.ContinuedToEmployAlien p c



axiom corr_bond {p : Person} {al : Elements.Alien} {c : ComplaintText} :
    Elements.RequiredIndemnityBond p al c → Deontic.RequiredEmployeeIndemnityBond p c





axiom corr_defense {p : Person} {c : ComplaintText} :
    Deontic.GoodFaithVerificationDefense p c → Elements.GoodFaithVerificationDefense p c




theorem s1324a_a1A_elements_implies_deontic
    {p : Person} {al : Elements.Alien} {c : ComplaintText}
    (h : Elements.KnowingHire1324a p al c)
    : Deontic.Prohibition1324a_a1A_Violated p c :=
  ⟨⟨corr_employer h.coverage, corr_knewHire h.knowing h.unauthorized⟩,
   corr_hireAct h.act,
   fun hd => h.noDefense (corr_defense hd)⟩



theorem s1324a_a2_elements_implies_deontic
    {p : Person} {al : Elements.Alien} {c : ComplaintText}
    (h : Elements.ContinuingEmployment1324a p al c)
    : Deontic.Prohibition1324a_a2_Violated p c :=
  ⟨⟨corr_employer h.coverage, corr_knewCont h.knowing h.unauthorized⟩,
   corr_contAct h.continued⟩



theorem s1324a_g1_elements_implies_deontic
    {p : Person} {al : Elements.Alien} {c : ComplaintText}
    (h : Elements.IndemnityViolation1324a p al c)
    : Deontic.Prohibition1324a_g1_Violated p c :=
  ⟨⟨corr_employer h.coverage⟩, corr_bond h.bond⟩





axiom corr_scienter_knowing {p : Person} {c : ComplaintText} :
    Proving.USC.Common.ActedWithScienter p c →
    Scienter.MentalStateProven p MentalState.Knowledge c






theorem s1324a_a1A_elements_implies_scienter
    {p : Person} {al : Elements.Alien} {c : ComplaintText}
    (h : Elements.KnowingHire1324a p al c)
    : Scienter.Scienter1324aA1A.culpable { addressee := p } c :=
  ⟨MentalState.Knowledge, MentalState.atLeast_refl MentalState.Knowledge,
   corr_scienter_knowing h.knowing⟩








axiom corr_o_unauthorized {ae : Elements.Alien} {ao : Ontology.Alien} {c : ComplaintText} :
    Elements.IsUnauthorizedAlien ae c → Ontology.IsUnauthorizedAlien ao c




theorem s1324a_unauthorized_elements_implies_ontology
    {ae : Elements.Alien} {ao : Ontology.Alien} {c : ComplaintText}
    (h : Elements.IsUnauthorizedAlien ae c)
    : Ontology.IsUnauthorizedAlien ao c :=
  corr_o_unauthorized h














axiom corr_g_health {ae : Elements.Alien} {ao : Ontology.Alien} {c : ComplaintText} :
    Elements.HealthRelatedGround ae c → Ontology.IsHealthRelatedGround ao c
axiom corr_g_criminal {ae : Elements.Alien} {ao : Ontology.Alien} {c : ComplaintText} :
    Elements.CriminalGround ae c → Ontology.IsCriminalGround ao c
axiom corr_g_security {ae : Elements.Alien} {ao : Ontology.Alien} {c : ComplaintText} :
    Elements.SecurityOrTerrorismGround ae c → Ontology.IsSecurityGround ao c
axiom corr_g_publicCharge {ae : Elements.Alien} {ao : Ontology.Alien} {c : ComplaintText} :
    Elements.PublicChargeGround ae c → Ontology.IsPublicChargeGround ao c
axiom corr_g_labor {ae : Elements.Alien} {ao : Ontology.Alien} {c : ComplaintText} :
    Elements.LaborCertificationGround ae c → Ontology.IsLaborCertGround ao c
axiom corr_g_illegalEntry {ae : Elements.Alien} {ao : Ontology.Alien} {c : ComplaintText} :
    Elements.IllegalEntrantOrViolatorGround ae c → Ontology.IsIllegalEntrantGround ao c
axiom corr_g_documentation {ae : Elements.Alien} {ao : Ontology.Alien} {c : ComplaintText} :
    Elements.DocumentationGround ae c → Ontology.IsDocumentationGround ao c
axiom corr_g_citizenship {ae : Elements.Alien} {ao : Ontology.Alien} {c : ComplaintText} :
    Elements.IneligibleForCitizenshipGround ae c → Ontology.IsIneligibleCitizenshipGround ao c
axiom corr_g_priorRemoval {ae : Elements.Alien} {ao : Ontology.Alien} {c : ComplaintText} :
    Elements.PreviouslyRemovedGround ae c → Ontology.IsPreviouslyRemovedGround ao c
axiom corr_g_misc {ae : Elements.Alien} {ao : Ontology.Alien} {c : ComplaintText} :
    Elements.MiscellaneousInadmissibilityGround ae c → Ontology.IsMiscellaneousGround ao c





theorem s1182_elements_implies_ontology
    {ae : Elements.Alien} {ao : Ontology.Alien} {c : ComplaintText}
    (h : Elements.InadmissibilityGround ae c)
    : Ontology.IsInadmissibleAlien ao c :=
  match h with
  | .health hh        => .health (corr_g_health hh)
  | .criminal hh      => .criminal (corr_g_criminal hh)
  | .security hh      => .security (corr_g_security hh)
  | .publicCharge hh  => .publicCharge (corr_g_publicCharge hh)
  | .labor hh         => .laborCert (corr_g_labor hh)
  | .illegalEntry hh  => .illegalEntrant (corr_g_illegalEntry hh)
  | .documentation hh => .documentation (corr_g_documentation hh)
  | .citizenship hh   => .ineligibleCitizen (corr_g_citizenship hh)
  | .priorRemoval hh  => .previouslyRemoved (corr_g_priorRemoval hh)
  | .misc hh          => .miscellaneous (corr_g_misc hh)






axiom corr_inadmissible_condition {ae : Elements.Alien} {p : Person} {c : ComplaintText} :
    Elements.Section1182a ae c → Deontic.AlienIsInadmissible p c



axiom corr_o_inadmissible_condition {ao : Ontology.Alien} {p : Person} {c : ComplaintText} :
    Ontology.IsInadmissibleAlien ao c → Deontic.AlienIsInadmissible p c





theorem s1182_elements_implies_deontic_condition
    {ae : Elements.Alien} {p : Person} {c : ComplaintText}
    (h : Elements.Section1182a ae c)
    : Deontic.AlienIsInadmissible p c :=
  corr_inadmissible_condition h




theorem s1182_ontology_implies_deontic_condition
    {ao : Ontology.Alien} {p : Person} {c : ComplaintText}
    (h : Ontology.IsInadmissibleAlien ao c)
    : Deontic.AlienIsInadmissible p c :=
  corr_o_inadmissible_condition h

end Proving.USC.T08.Inadmissibility.Bridge
