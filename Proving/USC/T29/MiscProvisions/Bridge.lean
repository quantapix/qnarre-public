


























import Proving.USC.Common.Types
import Proving.USC.T29.MiscProvisions.Elements.Theorems
import Proving.USC.T29.MiscProvisions.Deontic.Theorems
import Proving.USC.T29.MiscProvisions.Ontology.Theorems
import Proving.USC.T29.MiscProvisions.Procedure.Theorems
import Proving.USC.T29.MiscProvisions.Structure.Theorems

namespace Proving.USC.T29.MiscProvisions.Bridge

open Proving.USC.Common











axiom corr_163_exercise_act {p : Person} {a : Elements.ConcertedAction} {c : ComplaintText} :
    Elements.ExercisesRightToStrike p a c → Deontic.RegulatedActOccurred163 p c



axiom corr_163_preserved_addressee {p : Person} {a : Elements.ConcertedAction} {c : ComplaintText} :
    Elements.RightToStrikePreserved a c → Deontic.AddresseeInClass163 p c




axiom corr_163_preserved_condition {p : Person} {a : Elements.ConcertedAction} {c : ComplaintText} :
    Elements.RightToStrikePreserved a c → Deontic.ConditionMet163 p c

theorem s163_elements_implies_deontic {p : Person} {a : Elements.ConcertedAction} {c : ComplaintText}
    (h : Elements.Section163 p a c) : Deontic.Permission163Held p c :=
  ⟨⟨corr_163_preserved_addressee h.preserved, corr_163_preserved_condition h.preserved⟩,
   corr_163_exercise_act h.exercises⟩











axiom corr_164a_addressee_isSupervisor {p : Person} {s : Ontology.Supervisor} {c : ComplaintText} :
    Deontic.AddresseeInClass164a p c → Ontology.IsSupervisor s c

theorem s164a_deontic_implies_ontology {p : Person} {lo : Deontic.LaborOrganization}
    {s : Ontology.Supervisor} {c : ComplaintText}
    (h : Deontic.Permission164aHeld p lo c) : Ontology.SupervisorMembership s c :=
  ⟨corr_164a_addressee_isSupervisor h.1.addressee⟩

















axiom corr_164c_declined_act {p : Person} {d : Procedure.LaborDispute} {c : ComplaintText} :
    Procedure.BoardDeclinedJurisdiction d c → Deontic.RegulatedActOccurred164c p c



axiom corr_164c_guards_condition {p : Person} {d : Procedure.LaborDispute} {c : ComplaintText} :
    Procedure.BoardEffectNotSubstantial d c → Procedure.Above1959JurisdictionFloor d c →
    Deontic.ConditionMet164c p c



axiom corr_164c_board_addressee {p : Person} {d : Procedure.LaborDispute} {c : ComplaintText} :
    Procedure.BoardDeclinedJurisdiction d c → Deontic.AddresseeInClass164c p c

theorem s164c_procedure_implies_deontic {p : Person} {d : Procedure.LaborDispute} {c : ComplaintText}
    (h : Procedure.Jurisdiction164cReachable d c) : Deontic.Power164cExercised p c :=

  let decl := h.priorDeclination
  ⟨⟨corr_164c_board_addressee decl.declined,
    corr_164c_guards_condition decl.notSubstantial decl.aboveFloor⟩,
   corr_164c_declined_act decl.declined⟩













axiom corr_168_notInvalidated_isValidated
    {b : Elements.BoardAction} {a : Ontology.BoardAction} {c : ComplaintText} :
    Elements.BoardActionNotInvalidated b c → Ontology.IsValidatedBoardAction a c

theorem s168_elements_implies_ontology
    {b : Elements.BoardAction} {a : Ontology.BoardAction} {c : ComplaintText}
    (h : Elements.Section168 b c) : Ontology.IsValidatedBoardAction a c :=
  corr_168_notInvalidated_isValidated h.notInvalidated




axiom corr_168_validated_notInvalidated
    {a : Procedure.BoardAction} {b : Elements.BoardAction} {c : ComplaintText} :
    Procedure.Validation168Step a c → Elements.BoardActionNotInvalidated b c

theorem s168_procedure_implies_elements
    {a : Procedure.BoardAction} {b : Elements.BoardAction} {c : ComplaintText}
    (h : Procedure.Validation168Reachable a c) : Elements.Section168 b c :=
  ⟨corr_168_validated_notInvalidated h⟩


theorem s168_procedure_implies_ontology
    {a : Procedure.BoardAction} {a' : Ontology.BoardAction} {b : Elements.BoardAction}
    {c : ComplaintText}
    (h : Procedure.Validation168Reachable a c) : Ontology.IsValidatedBoardAction a' c :=
  s168_elements_implies_ontology (s168_procedure_implies_elements (b := b) h)










axiom corr_169_objection_addressee {p : Person} {c : ComplaintText} :
    Elements.HoldsBonaFideReligiousObjection p c → Deontic.AddresseeInClass169 p c



axiom corr_169_substitution_condition
    {p : Person} {u : Elements.UnionSecurityArrangement} {c : ComplaintText} :
    Elements.CharitableSubstitutionSatisfied p u c → Deontic.ConditionMet169 p c




axiom corr_169_demand_refrain
    {p : Person} {u : Elements.UnionSecurityArrangement} {lo : Deontic.LaborOrganization}
    {c : ComplaintText} :
    Elements.DemandsUnionSupportAsCondition p u c → Deontic.RegulatedActOccurred169 p lo c

theorem s169_elements_implies_deontic
    {p : Person} {u : Elements.UnionSecurityArrangement} {lo : Deontic.LaborOrganization}
    {c : ComplaintText}
    (h : Elements.Section169 p u c) : Deontic.Permission169Held p lo c :=
  ⟨⟨corr_169_objection_addressee h.objection, corr_169_substitution_condition h.substitution⟩,
   corr_169_demand_refrain h.demand⟩



axiom corr_169_objection_isObjector {p : Person} {c : ComplaintText} :
    Elements.HoldsBonaFideReligiousObjection p c → Ontology.IsReligiousObjectorEmployee p c




axiom corr_169_objection_isBody {p : Person} {b : Ontology.ReligiousBody} {c : ComplaintText} :
    Elements.HoldsBonaFideReligiousObjection p c → Ontology.IsBonaFideReligiousBody b c

theorem s169_elements_implies_ontology
    {p : Person} {u : Elements.UnionSecurityArrangement} {b : Ontology.ReligiousBody}
    {c : ComplaintText}
    (h : Elements.Section169 p u c) : Ontology.ReligiousObjectorMembership p b c :=
  ⟨corr_169_objection_isObjector h.objection, corr_169_objection_isBody h.objection⟩



axiom corr_169_addressee_isObjector {p : Person} {c : ComplaintText} :
    Deontic.AddresseeInClass169 p c → Ontology.IsReligiousObjectorEmployee p c

axiom corr_169_addressee_isBody {p : Person} {b : Ontology.ReligiousBody} {c : ComplaintText} :
    Deontic.AddresseeInClass169 p c → Ontology.IsBonaFideReligiousBody b c

theorem s169_deontic_implies_ontology
    {p : Person} {lo : Deontic.LaborOrganization} {b : Ontology.ReligiousBody} {c : ComplaintText}
    (h : Deontic.Permission169Held p lo c) : Ontology.ReligiousObjectorMembership p b c :=
  ⟨corr_169_addressee_isObjector h.1.addressee, corr_169_addressee_isBody h.1.addressee⟩

end Proving.USC.T29.MiscProvisions.Bridge
