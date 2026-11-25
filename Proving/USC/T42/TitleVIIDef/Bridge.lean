


























import Proving.USC.T42.TitleVIIDef.Elements.Theorems
import Proving.USC.T42.TitleVIIDef.Deontic.Theorems
import Proving.USC.T42.TitleVIIDef.Ontology.Theorems
import Proving.USC.T42.TitleVIIDef.Procedure.Theorems
import Proving.USC.T42.TitleVIIDef.Structure.Theorems
import Proving.USC.T42.TitleVIIDef.Scienter.Theorems
import Proving.USC.T42.TitleVIIDef.Evidentiary.Theorems
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.TitleVIIDef.Bridge
open Proving.USC.Common












axiom corr_dt_addressee {r : Person} {c : ComplaintText} :
    Elements.IsCoveredRespondent r c → Deontic.AddresseeEmployer r c




axiom corr_dt_condition {r : Person} {p : Person} {c : ComplaintText} :
    OnProtectedGround p c → IntentToDiscriminate r c →
    ∃ g : Deontic.ProtectedGround, Deontic.BecauseOfProtectedGround r g c



axiom corr_dt_act {r : Person} {p : Person} {ep : Elements.EmploymentPractice}
    {c : ComplaintText} :
    Elements.TookAdverseEmploymentAction r p ep c → Deontic.DiscriminatoryActOccurred r c





axiom corr_dt_noException {r : Person} {ep : Elements.EmploymentPractice}
    {c : ComplaintText} :
    Elements.NotBonaFideOccupationalQualification r ep c →
    Elements.NotPursuantToBonaFideSeniorityOrMeritSystem r ep c →
    ¬ Deontic.ExceptionApplies r c




theorem dt_elements_implies_deontic
    {r : Person} {e : Entity} {p : Person} {ep : Elements.EmploymentPractice}
    {c : ComplaintText}
    (h : Elements.DisparateTreatment r e p ep c)
    : Deontic.TitleVIINormViolated r c := by
  obtain ⟨g, hcond⟩ := corr_dt_condition h.ground h.intent
  exact Deontic.TitleVIINormViolated.viaEmployer g
    ⟨⟨corr_dt_addressee h.respondent, hcond⟩,
     corr_dt_act h.adverse,
     corr_dt_noException h.notBFOQ h.notSeniority⟩







axiom corr_ret_addressee {r : Person} {c : ComplaintText} :
    Elements.IsCoveredRespondent r c → Deontic.AddresseeRetaliation r c



axiom corr_ret_activity {p : Person} {c : ComplaintText} :
    Elements.EngagedInProtectedActivity p c → Deontic.ProtectedActivityOccurred p c




axiom corr_ret_act {r : Person} {p : Person} {c : ComplaintText} :
    Elements.AdverseActionBecauseOfProtectedActivity r p c →
    Deontic.RetaliatoryActOccurred r c




axiom corr_ret_activity_on_respondent {r : Person} {p : Person} {c : ComplaintText} :
    Elements.EngagedInProtectedActivity p c →
    Elements.AdverseActionBecauseOfProtectedActivity r p c →
    Deontic.ProtectedActivityOccurred r c




theorem ret_elements_implies_deontic
    {r : Person} {e : Entity} {p : Person} {c : ComplaintText}
    (h : Elements.Retaliation r e p c)
    : Deontic.TitleVIINormViolated r c :=
  Deontic.TitleVIINormViolated.viaRetaliation
    ⟨⟨corr_ret_addressee h.respondent,
      corr_ret_activity_on_respondent h.protectedAct h.causalLink⟩,
     corr_ret_act h.causalLink⟩







axiom corr_di_respondent {r : Person} {c : ComplaintText} :
    Elements.IsCoveredRespondent r c → Deontic.IsRespondent r c




axiom corr_di_impact {r : Person} {ep : Elements.EmploymentPractice}
    {c : ComplaintText} :
    Elements.PracticeCausesDisparateImpact ep c →
    Elements.NotJobRelatedAndConsistentWithBusinessNecessity ep c →
    Deontic.CausesUnjustifiedDisparateImpact r c




theorem di_elements_implies_deontic
    {r : Person} {e : Entity} {p : Person} {ep : Elements.EmploymentPractice}
    {c : ComplaintText}
    (h : Elements.DisparateImpact r e p ep c)
    : Deontic.TitleVIINormViolated r c :=
  Deontic.TitleVIINormViolated.viaDisparateImpact
    ⟨⟨corr_di_respondent h.respondent⟩, corr_di_impact h.impact h.notJustified⟩












axiom corr_def_respondent {r : Person} {c : ComplaintText} :
    Deontic.IsRespondent r c → Ontology.RespondentMembership c



axiom corr_def_employer {r : Person} {c : ComplaintText} :
    Deontic.IsCoveredEmployer r c → ∃ x : Ontology.Employer, Ontology.IsEmployer x c



theorem def_deontic_implies_ontology
    {r : Person} {c : ComplaintText}
    (h : Deontic.DefinitionBlock r c)
    : Ontology.RespondentMembership c :=
  corr_def_respondent h.respondent











axiom corr_sc_intent {r : Person} {c : ComplaintText} :
    IntentToDiscriminate r c → MentalStateProven r .Specific c




theorem dt_elements_implies_scienter
    {r : Person} {e : Entity} {p : Person} {ep : Elements.EmploymentPractice}
    {c : ComplaintText}
    (h : Elements.DisparateTreatment r e p ep c)
    : Scienter.DisparateTreatmentCulpable r c :=
  ⟨{ who      := Scienter.Addressee.Employer
   ,  proven   := .Specific
   ,  reaches  := MentalState.atLeast_refl .Specific
   ,  grounded := corr_sc_intent h.intent }⟩


















theorem di_elements_implies_scienter_modulo_gaps
    {r : Person} {e : Entity} {p : Person} {ep : Elements.EmploymentPractice}
    {c : ComplaintText}
    (gap_impactActor : MentalStateProven r .StrictLiability c)
    (_h : Elements.DisparateImpact r e p ep c)
    : Scienter.DisparateImpactCulpable r c :=
  ⟨{ who      := Scienter.Addressee.Respondent
   ,  proven   := .StrictLiability
   ,  reaches  := MentalState.atLeast_refl .StrictLiability
   ,  grounded := gap_impactActor }⟩











axiom corr_ev_motivating {p : Person} {ep : Elements.EmploymentPractice}
    {c : ComplaintText} :
    Elements.ProtectedGroundWasMotivatingFactor p ep c →
    Evidentiary.BurdenCarried Evidentiary.Bearer.Plaintiff
      Evidentiary.Standard.Preponderance c




theorem mf_elements_implies_evidentiary
    {p : Person} {ep : Elements.EmploymentPractice} {c : ComplaintText}
    (h : Elements.ProtectedGroundWasMotivatingFactor p ep c)
    : Evidentiary.Proof2000e2m c :=
  ⟨corr_ev_motivating h⟩



axiom corr_ev_retaliation {r : Person} {p : Person} {c : ComplaintText} :
    Elements.AdverseActionBecauseOfProtectedActivity r p c →
    Evidentiary.BurdenCarried Evidentiary.Bearer.Plaintiff
      Evidentiary.Standard.Preponderance c




theorem ret_elements_implies_evidentiary
    {r : Person} {e : Entity} {p : Person} {c : ComplaintText}
    (h : Elements.Retaliation r e p c)
    : Evidentiary.Proof2000e3a c :=
  ⟨corr_ev_retaliation h.causalLink⟩









axiom corr_o_respondent {r : Person} {c : ComplaintText} :
    Elements.IsCoveredRespondent r c → Ontology.RespondentMembership c



theorem dt_elements_implies_ontology
    {r : Person} {e : Entity} {p : Person} {ep : Elements.EmploymentPractice}
    {c : ComplaintText}
    (h : Elements.DisparateTreatment r e p ep c)
    : Ontology.RespondentMembership c :=
  corr_o_respondent h.respondent













axiom corr_proc_impact {pr : Procedure.Proceeding} {ep : Elements.EmploymentPractice}
    {c : ComplaintText} :
    Procedure.ImpactClaimRaised pr c → Procedure.ComplainantDemonstratedImpact pr c →
    Elements.PracticeCausesDisparateImpact ep c



axiom corr_proc_notJustified {pr : Procedure.Proceeding}
    {ep : Elements.EmploymentPractice} {c : ComplaintText} :
    ¬ Procedure.RespondentDemonstratedJustification pr c →
    Elements.NotJobRelatedAndConsistentWithBusinessNecessity ep c






theorem impact_procedure_implies_elements_modulo_gaps
    {r : Person} {e : Entity} {p : Person} {ep : Elements.EmploymentPractice}
    {pr : Procedure.Proceeding} {c : ComplaintText}
    (gap_respondent : Elements.IsCoveredRespondent r c)
    (gap_commerce   : EngagedInInterstateCommerce e c)
    (gap_party      : IsPersonInUS p c)
    (gap_ground     : OnProtectedGround p c)
    (h : Procedure.ImpactEstablishedPrimary pr c)
    : Elements.DisparateImpact r e p ep c :=
  { respondent     := gap_respondent
  , commerce       := gap_commerce
  , protectedParty := gap_party
  , ground         := gap_ground
  , impact         := corr_proc_impact h.raised h.impactShown
  , notJustified   := corr_proc_notJustified h.notJustified }











axiom corr_struct_coheres {r : Structure.Ref} {c : ComplaintText} :
    Structure.IncorporationHonored r c → StructuralReferenceCoheres r.toCommon c




theorem struct_2000e2_implies_common
    {c : ComplaintText}
    (h : Structure.Coherent2000e2 c)
    : StructuralReferenceCoheres
        (Structure.edge_2000e2_incorporates_defs.toCommon) c :=
  corr_struct_coheres h.defsHonored

end Proving.USC.T42.TitleVIIDef.Bridge
