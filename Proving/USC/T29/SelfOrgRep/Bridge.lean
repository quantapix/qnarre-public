


































import Proving.USC.T29.SelfOrgRep.Elements.Theorems
import Proving.USC.T29.SelfOrgRep.Deontic.Theorems
import Proving.USC.T29.SelfOrgRep.Ontology.Theorems
import Proving.USC.T29.SelfOrgRep.Procedure.Theorems
import Proving.USC.T29.SelfOrgRep.Structure.Theorems

namespace Proving.USC.T29.SelfOrgRep.Bridge

open Proving.USC.Common
open Proving.USC.T29.SelfOrgRep

















axiom corr_157_d_addr {p : Person} {c : ComplaintText} :
    Elements.IsProtectedEmployee p c → Deontic.IsEmployeeAddressee p c


axiom corr_157_d_act {p : Person} {a : Elements.ProtectedActivity} {c : ComplaintText} :
    Elements.EngagedInProtectedActivity p a c → Deontic.ProtectedConcertedAct p c




theorem s157_elements_implies_deontic
    {resp p : Person} {a : Elements.ProtectedActivity} {c : ComplaintText}
    (h : Elements.Section157 resp p a c) :
    Deontic.Permission157Granted p c :=
  ⟨⟨corr_157_d_addr h.employee⟩, corr_157_d_act h.protectedAct⟩




axiom corr_157_o_emp {p : Person} {c : ComplaintText} :
    Elements.IsProtectedEmployee p c → Ontology.IsEmployee p c


axiom corr_157_o_concerted {p : Person} {a : Elements.ProtectedActivity} {c : ComplaintText} :
    Elements.EngagedInProtectedActivity p a c → Ontology.IsConcertedActivity p c



theorem s157_elements_implies_ontology
    {resp p : Person} {a : Elements.ProtectedActivity} {c : ComplaintText}
    (h : Elements.Section157 resp p a c) :
    Ontology.Section157RightExercise p c :=
  ⟨corr_157_o_emp h.employee, corr_157_o_concerted h.protectedAct⟩








axiom corr_157_s_exists {resp p : Person} {a : Elements.ProtectedActivity} {c : ComplaintText} :
    Elements.InterferedWithExercise resp p a c →
    Structure.ReferencedSectionExists Structure.edge_157_exceptAsProvided_158a3 c
axiom corr_157_s_honored {resp p : Person} {a : Elements.ProtectedActivity} {c : ComplaintText} :
    Elements.InterferedWithExercise resp p a c →
    Structure.ExceptionApplies Structure.edge_157_exceptAsProvided_158a3 c



theorem s157_elements_implies_structure
    {resp p : Person} {a : Elements.ProtectedActivity} {c : ComplaintText}
    (h : Elements.Section157 resp p a c) :
    Structure.Coherent157 c :=
  ⟨corr_157_s_exists h.interference, corr_157_s_honored h.interference⟩

























axiom corr_159a_d_maj {rep : Person} {u : Elements.BargainingUnit}
    {lo : Deontic.LaborOrganization} {du : Deontic.BargainingUnit} {c : ComplaintText} :
    Elements.DesignatedByMajority rep u c → Deontic.MajorityDesignated lo du c
axiom corr_159a_d_excl
    {lo : Deontic.LaborOrganization} {du : Deontic.BargainingUnit} {c : ComplaintText} :
    Elements.WithinBargainingScope c → Deontic.TreatedAsExclusiveRep lo du c



theorem s159a_elements_implies_deontic
    {rep : Person} {u : Elements.BargainingUnit}
    {lo : Deontic.LaborOrganization} {du : Deontic.BargainingUnit} {c : ComplaintText}
    (h : Elements.Section159a rep u c) :
    Deontic.Obligation159aSatisfied lo du c :=
  ⟨⟨corr_159a_d_maj h.majority⟩, corr_159a_d_excl h.scope⟩








axiom corr_159a_o_rep {rep : Person} {u : Elements.BargainingUnit}
    {r : Ontology.Representative} {c : ComplaintText} :
    Elements.DesignatedByMajority rep u c → Ontology.IsRepresentative r c
axiom corr_159a_o_unit {u : Elements.BargainingUnit}
    {ou : Ontology.BargainingUnit} {c : ComplaintText} :
    Elements.IsAppropriateUnit u c → Ontology.IsAppropriateBargainingUnit ou c
axiom corr_159a_o_excl {rep : Person} {u : Elements.BargainingUnit}
    {r : Ontology.Representative} {ou : Ontology.BargainingUnit} {c : ComplaintText} :
    Elements.DesignatedByMajority rep u c → Ontology.IsExclusiveRepresentative r ou c


theorem s159a_elements_implies_ontology
    {rep : Person} {u : Elements.BargainingUnit}
    {r : Ontology.Representative} {ou : Ontology.BargainingUnit} {c : ComplaintText}
    (h : Elements.Section159a rep u c) :
    Ontology.ExclusiveRepresentativeMembership r ou c :=
  ⟨corr_159a_o_rep h.majority, corr_159a_o_unit h.appropriate, corr_159a_o_excl h.majority⟩









axiom corr_159c_o_question {u : Elements.BargainingUnit}
    {q : Ontology.RepresentationQuestion} {c : ComplaintText} :
    Elements.QuestionOfRepresentationAffectingCommerce u c → Ontology.IsRepresentationQuestion q c
axiom corr_159c_o_commerce {u : Elements.BargainingUnit}
    {e : Entity} {c : ComplaintText} :
    Elements.QuestionOfRepresentationAffectingCommerce u c → Ontology.AffectsCommerce e c


theorem s159c_elements_implies_ontology
    {u : Elements.BargainingUnit} {q : Ontology.RepresentationQuestion}
    {e : Entity} {c : ComplaintText}
    (h : Elements.Section159cCore u c) :
    Ontology.RepresentationQuestionMembership q e c :=
  ⟨corr_159c_o_question h.affectsCommerce, corr_159c_o_commerce h.affectsCommerce⟩












axiom corr_159c_p_filed {pet : Elements.RepresentationPetition}
    {ppet : Procedure.RepresentationPetition} {c : ComplaintText} :
    Elements.EmployeeSidePetitionFiled pet c ∨ Elements.EmployerSidePetitionFiled pet c →
    Procedure.PetitionFiled ppet c
axiom corr_159c_p_commerce {u : Elements.BargainingUnit}
    {ppet : Procedure.RepresentationPetition} {c : ComplaintText} :
    Elements.QuestionOfRepresentationAffectingCommerce u c →
    Procedure.QuestionAffectingCommerce ppet c
axiom corr_159c_p_bar {u : Elements.BargainingUnit}
    {pu : Procedure.BargainingUnit} {c : ComplaintText} :
    ¬ Elements.ValidElectionWithinTwelveMonths u c → Procedure.WithinTwelveMonthBar pu c
axiom corr_159c_p_directed {u : Elements.BargainingUnit}
    {pu : Procedure.BargainingUnit} {c : ComplaintText} :
    Elements.IsAppropriateUnit u c → Procedure.ElectionDirected pu c



axiom corr_159c_p_majority {rep : Person} {u : Elements.BargainingUnit}
    {pu : Procedure.BargainingUnit} {c : ComplaintText} :
    Elements.DesignatedByMajority rep u c → Procedure.MajoritySelected pu rep c





theorem s159c_elements_implies_procedure
    {rep : Person} {u : Elements.BargainingUnit}
    {ppet : Procedure.RepresentationPetition} {pu : Procedure.BargainingUnit}
    {c : ComplaintText}
    (hCase : Elements.ValidRepresentationCase u c)
    (hMaj : Elements.DesignatedByMajority rep u c) :
    Procedure.ValidCertification ppet pu rep c :=
  match hCase with
  | .employeeSide _ filed core =>
      ⟨⟨⟨corr_159c_p_filed (Or.inl filed), corr_159c_p_commerce core.affectsCommerce⟩,
        corr_159c_p_bar core.noRecentElection, corr_159c_p_directed core.appropriate⟩,
       corr_159c_p_majority hMaj⟩
  | .employerSide _ filed core =>
      ⟨⟨⟨corr_159c_p_filed (Or.inr filed), corr_159c_p_commerce core.affectsCommerce⟩,
        corr_159c_p_bar core.noRecentElection, corr_159c_p_directed core.appropriate⟩,
       corr_159c_p_majority hMaj⟩










axiom corr_159_s_repExists {u : Elements.BargainingUnit} {c : ComplaintText} :
    Elements.IsAppropriateUnit u c →
    Structure.ReferencedSectionExists Structure.edge_159c_incorporates_159a c
axiom corr_159_s_repHonored {u : Elements.BargainingUnit} {c : ComplaintText} :
    Elements.IsAppropriateUnit u c →
    Structure.IncorporationHonored Structure.edge_159c_incorporates_159a c
axiom corr_159_s_order {u : Elements.BargainingUnit} {c : ComplaintText} :
    Elements.QuestionOfRepresentationAffectingCommerce u c →
    Structure.IncorporationHonored Structure.edge_159c2_incorporates_160c c
axiom corr_159_s_unit {u : Elements.BargainingUnit} {c : ComplaintText} :
    Elements.IsAppropriateUnit u c →
    Structure.IncorporationHonored Structure.edge_159c5_incorporates_159b c
axiom corr_159_s_pursuant {u : Elements.BargainingUnit} {c : ComplaintText} :
    Elements.QuestionOfRepresentationAffectingCommerce u c →
    Structure.IncorporationHonored Structure.edge_159d_incorporates_160c c
axiom corr_159_s_transcript {u : Elements.BargainingUnit} {c : ComplaintText} :
    Elements.QuestionOfRepresentationAffectingCommerce u c →
    Structure.IncorporationHonored Structure.edge_159d_incorporates_160ef c
axiom corr_159_s_rescission {u : Elements.BargainingUnit} {c : ComplaintText} :
    Elements.IsAppropriateUnit u c →
    Structure.IncorporationHonored Structure.edge_159e1_incorporates_158a3 c



theorem s159_elements_implies_structure
    {u : Elements.BargainingUnit} {c : ComplaintText}
    (h : Elements.Section159cCore u c) :
    Structure.Coherent159 c :=
  ⟨corr_159_s_repExists h.appropriate,
   corr_159_s_repHonored h.appropriate,
   corr_159_s_order h.affectsCommerce,
   corr_159_s_unit h.appropriate,
   corr_159_s_pursuant h.affectsCommerce,
   corr_159_s_transcript h.affectsCommerce,
   corr_159_s_rescission h.appropriate⟩












theorem s157_tierA
    {resp p : Person} {a : Elements.ProtectedActivity} {c : ComplaintText}
    (h : Elements.Section157 resp p a c) :
    Deontic.Permission157Granted p c
    ∧ Ontology.Section157RightExercise p c
    ∧ Structure.Coherent157 c :=
  ⟨s157_elements_implies_deontic h,
   s157_elements_implies_ontology h,
   s157_elements_implies_structure h⟩






theorem s159_tierA
    {rep : Person} {u : Elements.BargainingUnit} {c : ComplaintText}
    {lo : Deontic.LaborOrganization} {du : Deontic.BargainingUnit}
    {r : Ontology.Representative} {ou : Ontology.BargainingUnit}
    {q : Ontology.RepresentationQuestion} {e : Entity}
    {ppet : Procedure.RepresentationPetition} {pu : Procedure.BargainingUnit}
    (hA : Elements.Section159a rep u c)
    (hCore : Elements.Section159cCore u c)
    (hCase : Elements.ValidRepresentationCase u c) :
    Deontic.Obligation159aSatisfied lo du c
    ∧ Ontology.ExclusiveRepresentativeMembership r ou c
    ∧ Ontology.RepresentationQuestionMembership q e c
    ∧ Procedure.ValidCertification ppet pu rep c
    ∧ Structure.Coherent159 c :=
  ⟨s159a_elements_implies_deontic hA,
   s159a_elements_implies_ontology hA,
   s159c_elements_implies_ontology hCore,
   s159c_elements_implies_procedure hCase hA.majority,
   s159_elements_implies_structure hCore⟩

end Proving.USC.T29.SelfOrgRep.Bridge
