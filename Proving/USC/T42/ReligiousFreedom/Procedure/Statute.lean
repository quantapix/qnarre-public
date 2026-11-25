








import Proving.USC.T42.ReligiousFreedom.Procedure.Predicates

namespace Proving.USC.T42.ReligiousFreedom.Procedure

open Proving.USC.Common










structure ValidlyAdoptedRegulation (r : Regulation) (c : ComplaintText) : Prop where
  proposed     : RegulationProposed r c
  consulted    : ConsultationHeld r c
  rfraSurvived : RfraBalanceSurvived r c











def policyEffectiveEpochDay : Nat := 3144




def ActOnOrAfterPolicyEffective (d : Nat) : Prop :=
  policyEffectiveEpochDay ≤ d

instance (d : Nat) : Decidable (ActOnOrAfterPolicyEffective d) := by
  unfold ActOnOrAfterPolicyEffective; infer_instance




structure PolicyGovernedAct (d : Nat) (c : ComplaintText) : Prop where
  dayExtracted : PolicyActEpochDay d c
  inWindow     : ActOnOrAfterPolicyEffective d










structure PlacementViolationRouted (p : Person) (c : ComplaintText) : Prop where
  inProcess     : InPlacementProcess p c
  noncompliance : PlacementNoncomplianceOccurred p c

end Proving.USC.T42.ReligiousFreedom.Procedure
