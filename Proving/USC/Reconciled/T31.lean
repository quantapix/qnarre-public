



































































import Proving.USC.T31.Elements.Theorems
import Proving.USC.T31.Deontic.Theorems
import Proving.USC.T31.Ontology.Theorems
import Proving.USC.T31.Procedure.Theorems
import Proving.USC.T31.Structure.Theorems
import Proving.USC.T31.Bridge

namespace Proving.USC.Reconciled




abbrev T31_s5313a_institution := Proving.USC.T31.Elements.Section5313aInstitutionViolation



abbrev T31_s5313a_participant := Proving.USC.T31.Elements.Section5313aParticipantViolation


abbrev T31_s5313b_power := Proving.USC.T31.Deontic.PowerExercised5313b


abbrev T31_s5313d1_breach := Proving.USC.T31.Deontic.ObligationBreached5313d1



abbrev T31_s5313d2_breach := Proving.USC.T31.Deontic.ObligationBreached5313d2



abbrev T31_s5313e1_power := Proving.USC.T31.Deontic.PowerExercised5313e1



abbrev T31_s5313e5_review := Proving.USC.T31.Procedure.AnnualExemptionReviewCompleted




abbrev T31_s5313f1_violation := Proving.USC.T31.Deontic.ProhibitionViolated5313f1



abbrev T31_s5313g_def := Proving.USC.T31.Ontology.DepositoryInstitutionDef




abbrev T31_s5324_violation := Proving.USC.T31.Elements.Section5324Violation




abbrev T31_s5324d2_aggravated := Proving.USC.T31.Procedure.AggravatedStructuringViolation









def T31_s5324_pairwise_discharge : Prop :=
  (∀ {p c}, Proving.USC.T31.Elements.Section5324Violation p c →
      Proving.USC.T31.Deontic.ProhibitionViolated5324a p c ∨
      Proving.USC.T31.Deontic.ProhibitionViolated5324b p c ∨
      Proving.USC.T31.Deontic.ProhibitionViolated5324c p c)
  ∧ (∀ {p} {fiP : Proving.USC.T31.Procedure.FinancialInstitution} {c},
      Proving.USC.T31.Elements.Section5324Violation p c →
      Proving.USC.T31.Procedure.StructuringViolation p fiP c)
  ∧ (∀ {p} {fiP : Proving.USC.T31.Procedure.FinancialInstitution} {c},
      Proving.USC.T31.Deontic.ProhibitionViolated5324a p c →
      Proving.USC.T31.Procedure.StructuringViolation p fiP c)

theorem T31_s5324_base_agreement : T31_s5324_pairwise_discharge :=
  ⟨fun h => Proving.USC.T31.Bridge.s5324_elements_implies_deontic h,
   fun h => Proving.USC.T31.Bridge.s5324_elements_implies_procedure h,
   fun h => Proving.USC.T31.Bridge.s5324a_deontic_implies_procedure h⟩

end Proving.USC.Reconciled
