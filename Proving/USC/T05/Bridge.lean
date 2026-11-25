




























import Proving.USC.T05.Elements.Theorems
import Proving.USC.T05.Deontic.Theorems
import Proving.USC.T05.Ontology.Theorems
import Proving.USC.T05.Procedure.Theorems
import Proving.USC.T05.Structure.Theorems
import Proving.USC.Common.Predicates

namespace Proving.USC.T05.Bridge
open Proving.USC.Common











axiom corr_551_agency_obj : Elements.Agency → Entity
axiom corr_551_action_obj : Elements.AgencyAction → Ontology.AgencyAction



axiom corr_551_isAgency {a : Elements.Agency} {c : ComplaintText} :
    Elements.IsAgency a c → Ontology.IsAgency (corr_551_agency_obj a) c


axiom corr_551_isAction {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.IsAgencyAction act c → Ontology.IsAgencyAction (corr_551_action_obj act) c




theorem s551_elements_implies_ontology
    {p : Person} {a : Elements.Agency} {act : Elements.AgencyAction} {c : ComplaintText}
    (h : Elements.APAReviewGate p a act c)
    : Ontology.IsAgency (corr_551_agency_obj a) c
      ∧ Ontology.IsAgencyAction (corr_551_action_obj act) c :=
  ⟨corr_551_isAgency h.agency, corr_551_isAction h.agencyAction⟩










axiom corr_proc_obj : Elements.Proceeding → Procedure.AgencyProceeding



axiom corr_554a {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.IsFormalOnTheRecordAdjudication pr c →
    Procedure.AdjudicationRequiredOnRecord (corr_proc_obj pr) c

axiom corr_554b {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.NoticeOfHearingGiven pr c →
    Procedure.NoticeTimelyGiven (corr_proc_obj pr) c

axiom corr_556_heard {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.OpportunityToBeHeard pr c →
    Procedure.HearingHeldBeforePresider (corr_proc_obj pr) c



axiom corr_556_burden {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.BurdenAndRecordSupport pr c → Procedure.BurdenOfProofMet (corr_proc_obj pr) c
axiom corr_556_record {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.BurdenAndRecordSupport pr c → Procedure.DecisionOnExclusiveRecord (corr_proc_obj pr) c

axiom corr_557_exParte {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.FreeOfProhibitedExParte pr c →
    Procedure.ExParteProhibitionHonored (corr_proc_obj pr) c


axiom corr_557_findings {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.ReasonedFindingsOnTheRecord pr c →
    Procedure.InitialDecisionRendered (corr_proc_obj pr) c






axiom gap_finalization (pr : Elements.Proceeding) (c : ComplaintText) : Prop







theorem s554_556_557_elements_implies_procedure_modulo_gaps
    {pr : Elements.Proceeding} {c : ComplaintText}
    (h : Elements.FormalAdjudicationRegularity pr c)
    (hFinal : Procedure.BecameFinalAgencyAction (corr_proc_obj pr) c)
    : Procedure.LawfulFormalAdjudication (corr_proc_obj pr) c :=
  ⟨⟨corr_554a h.formalAdjudication, corr_554b h.notice⟩,
   ⟨corr_556_heard h.heard, corr_556_burden h.recordSupport, corr_556_record h.recordSupport⟩,
   ⟨corr_557_exParte h.noExParte, corr_557_findings h.findings, hFinal⟩⟩








axiom corr_rev_action_obj : Elements.AgencyAction → Procedure.AgencyAction


axiom corr_701_notPrecluded {act : Elements.AgencyAction} {c : ComplaintText} :
    (¬ Elements.ReviewPrecludedByStatute act c) →
    (¬ Elements.CommittedToAgencyDiscretion act c) →
    Procedure.ReviewNotPrecluded (corr_rev_action_obj act) c

axiom corr_704_finalNoRemedy {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.IsReviewableFinalAction act c → Elements.NoOtherAdequateRemedy act c →
    Procedure.FinalAndNoAdequateRemedy (corr_rev_action_obj act) c

axiom corr_702_aggrieved {p : Person} {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.AdverselyAffectedWithinZoneOfInterests p act c →
    Procedure.PersonAggrieved p (corr_rev_action_obj act) c





axiom gap_reviewObtained (p : Person) (act : Elements.AgencyAction) (c : ComplaintText) : Prop





theorem s701_702_704_elements_implies_procedure_modulo_gaps
    {p : Person} {a : Elements.Agency} {act : Elements.AgencyAction} {c : ComplaintText}
    (h : Elements.APAReviewGate p a act c)
    (hObtained : Procedure.JudicialReviewObtained p (corr_rev_action_obj act) c)
    : Procedure.ReviewableAgencyAction p (corr_rev_action_obj act) c :=
  ⟨corr_701_notPrecluded h.notPrecluded h.notDiscretionary,
   corr_704_finalNoRemedy h.reviewable h.noAdequateRemedy,
   corr_702_aggrieved h.aggrieved,
   hObtained⟩







axiom corr_702_deontic_obj : Elements.AgencyAction → Deontic.AgencyAct


axiom corr_702_addressee {p : Person} {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.AdverselyAffectedWithinZoneOfInterests p act c → Deontic.AddresseeInClass702 p c

axiom corr_702_permitted {p : Person} {act : Elements.AgencyAction} {c : ComplaintText} :
    (¬ Elements.ReviewPrecludedByStatute act c) → (¬ Elements.ReliefForbiddenByOtherStatute p c) →
    Deontic.PermittedActAvailable702 p (corr_702_deontic_obj act) c

axiom corr_702_cond704 {act : Elements.AgencyAction} {c : ComplaintText} :
    Elements.IsReviewableFinalAction act c → Deontic.ConditionMet704 (corr_702_deontic_obj act) c





theorem s702_elements_implies_deontic
    {p : Person} {a : Elements.Agency} {act : Elements.AgencyAction} {c : ComplaintText}
    (h : Elements.APAReviewGate p a act c)
    : Deontic.Permission702Available p (corr_702_deontic_obj act) c :=
  ⟨⟨corr_702_addressee h.aggrieved⟩,
   corr_702_permitted h.notPrecluded h.notForbidden,
   corr_702_cond704 h.reviewable⟩









axiom corr_706_ground {p : Person} {act : Elements.AgencyAction} {pr : Elements.Proceeding}
    {c : ComplaintText} :
    Elements.Section706Ground act pr c → Deontic.RegulatedActOccurred706 p (corr_702_deontic_obj act) c

axiom corr_706_addressee {p : Person} {c : ComplaintText} :
    Deontic.AddresseeInClass706 p c




theorem s706_elements_implies_deontic
    {p : Person} {act : Elements.AgencyAction} {pr : Elements.Proceeding} {c : ComplaintText}
    (h : Elements.Section706Ground act pr c)
    : Deontic.Power706Exercisable p (corr_702_deontic_obj act) c :=
  ⟨⟨corr_706_addressee⟩, corr_706_ground h⟩















axiom StructuralReferenceCoheres (r : Structure.Ref) (c : ComplaintText) : Prop


axiom corr_struct_exists {r : Structure.Ref} {c : ComplaintText} :
    Structure.ReferencedSectionExists r c → StructuralReferenceCoheres r c
axiom corr_struct_inc {r : Structure.Ref} {c : ComplaintText} :
    Structure.IncorporationHonored r c → StructuralReferenceCoheres r c




theorem s554_structure_collapses_to_common
    {c : ComplaintText} (h : Structure.Coherent554 c)
    : StructuralReferenceCoheres Structure.edge_554_incorporates_556 c :=
  corr_struct_inc h.inc556









def t05_sorry_free_agreements : Prop :=
  (∀ {p a act c}, Elements.APAReviewGate p a act c →
      Ontology.IsAgency (corr_551_agency_obj a) c ∧ Ontology.IsAgencyAction (corr_551_action_obj act) c)
  ∧ (∀ {p a act c}, Elements.APAReviewGate p a act c →
      Deontic.Permission702Available p (corr_702_deontic_obj act) c)
  ∧ (∀ {p act pr c}, Elements.Section706Ground act pr c →
      Deontic.Power706Exercisable p (corr_702_deontic_obj act) c)

theorem t05_sorry_free : t05_sorry_free_agreements :=
  ⟨fun h => s551_elements_implies_ontology h,
   fun h => s702_elements_implies_deontic h,
   fun h => s706_elements_implies_deontic h⟩

end Proving.USC.T05.Bridge
