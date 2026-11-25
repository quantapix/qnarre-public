



































































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

import Proving.USC.T18.Spec.Scienter.Predicates
import Proving.USC.T18.Spec.Sanction.Predicates
import Proving.USC.T18.Spec.Evidentiary.Predicates
import Proving.USC.T18.Spec.Intertemporal.Predicates
import Proving.USC.T18.Spec.Remedy.Predicates

import Proving.USC.T42.EqualRights.Scienter.Predicates
import Proving.USC.T42.EqualRights.Sanction.Predicates
import Proving.USC.T42.EqualRights.Evidentiary.Predicates
import Proving.USC.T42.EqualRights.Intertemporal.Predicates
import Proving.USC.T42.EqualRights.Remedy.Predicates
import Proving.USC.T42.EqualRights.Ontology.Predicates

import Proving.USC.T42.TitleVI.Scienter.Predicates
import Proving.USC.T42.TitleVI.Sanction.Predicates
import Proving.USC.T42.TitleVI.Evidentiary.Predicates
import Proving.USC.T42.TitleVI.Intertemporal.Predicates
import Proving.USC.T42.TitleVI.Remedy.Predicates
import Proving.USC.T42.TitleVI.Ontology.Predicates
import Proving.USC.T42.TitleVI.Deontic.Predicates
import Proving.USC.T42.TitleVI.Procedure.Predicates
import Proving.USC.T42.TitleVI.Elements.Predicates
import Proving.USC.T42.TitleVI.Structure.Predicates

namespace Proving.USC.Common.CrossWaveSpecAlgebra

open Proving.USC.Common












def mapRungT18 : Proving.USC.T18.Spec.Scienter.MentalState → MentalState
  | .StrictLiability => .StrictLiability
  | .Negligence      => .Negligence
  | .Recklessness    => .Recklessness
  | .Knowledge       => .Knowledge
  | .Specific        => .Specific


def mapRungT42eq : Proving.USC.T42.EqualRights.Scienter.MentalState → MentalState
  | .StrictLiability => .StrictLiability
  | .Negligence      => .Negligence
  | .Recklessness    => .Recklessness
  | .Knowledge       => .Knowledge
  | .Specific        => .Specific


def mapRungT42vi : Proving.USC.T42.TitleVI.Scienter.MentalState → MentalState
  | .StrictLiability => .StrictLiability
  | .Negligence      => .Negligence
  | .Recklessness    => .Recklessness
  | .Knowledge       => .Knowledge
  | .Specific        => .Specific



theorem mapRungT18_rank (r : Proving.USC.T18.Spec.Scienter.MentalState) :
    (mapRungT18 r).rank = r.rank := by cases r <;> rfl
theorem mapRungT42eq_rank (r : Proving.USC.T42.EqualRights.Scienter.MentalState) :
    (mapRungT42eq r).rank = r.rank := by cases r <;> rfl
theorem mapRungT42vi_rank (r : Proving.USC.T42.TitleVI.Scienter.MentalState) :
    (mapRungT42vi r).rank = r.rank := by cases r <;> rfl



axiom bridge_mentalStateProven_T18_iff
    {p : Person} {r : Proving.USC.T18.Spec.Scienter.MentalState} {c : ComplaintText} :
    Proving.USC.T18.Spec.Scienter.MentalStateProven p r c ↔ MentalStateProven p (mapRungT18 r) c

axiom bridge_mentalStateProven_T42eq_iff
    {p : Person} {r : Proving.USC.T42.EqualRights.Scienter.MentalState} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Scienter.MentalStateProven p r c ↔ MentalStateProven p (mapRungT42eq r) c

axiom bridge_mentalStateProven_T42vi_iff
    {p : Person} {r : Proving.USC.T42.TitleVI.Scienter.MentalState} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Scienter.MentalStateProven p r c ↔ MentalStateProven p (mapRungT42vi r) c

theorem collapse_scienter_T18_iff
    {p : Person} {r : Proving.USC.T18.Spec.Scienter.MentalState} {c : ComplaintText} :
    Proving.USC.T18.Spec.Scienter.MentalStateProven p r c ↔ MentalStateProven p (mapRungT18 r) c :=
  bridge_mentalStateProven_T18_iff
theorem collapse_scienter_T42eq_iff
    {p : Person} {r : Proving.USC.T42.EqualRights.Scienter.MentalState} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Scienter.MentalStateProven p r c ↔ MentalStateProven p (mapRungT42eq r) c :=
  bridge_mentalStateProven_T42eq_iff
theorem collapse_scienter_T42vi_iff
    {p : Person} {r : Proving.USC.T42.TitleVI.Scienter.MentalState} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Scienter.MentalStateProven p r c ↔ MentalStateProven p (mapRungT42vi r) c :=
  bridge_mentalStateProven_T42vi_iff











def mapKindT18 : Proving.USC.T18.Spec.Sanction.SanctionKind → SanctionKind
  | .Imprisonment => .Imprisonment | .Fine => .Fine | .Multiplier => .Multiplier
  | .Forfeiture => .Forfeiture | .Penalty => .Penalty
def mapDirT18 : Proving.USC.T18.Spec.Sanction.Direction → Direction
  | .Ceiling => .Ceiling | .Floor => .Floor | .Exact => .Exact
def mapSanctionT18 (s : Proving.USC.T18.Spec.Sanction.Sanction) : Sanction :=
  ⟨mapKindT18 s.kind, s.bound, mapDirT18 s.dir⟩

def mapKindT42eq : Proving.USC.T42.EqualRights.Sanction.SanctionKind → SanctionKind
  | .Imprisonment => .Imprisonment | .Fine => .Fine | .Multiplier => .Multiplier
  | .Forfeiture => .Forfeiture | .Penalty => .Penalty
def mapDirT42eq : Proving.USC.T42.EqualRights.Sanction.Direction → Direction
  | .Ceiling => .Ceiling | .Floor => .Floor | .Exact => .Exact
def mapSanctionT42eq (s : Proving.USC.T42.EqualRights.Sanction.Sanction) : Sanction :=
  ⟨mapKindT42eq s.kind, s.bound, mapDirT42eq s.dir⟩



axiom bridge_sanctionSought_T18_iff
    {s : Proving.USC.T18.Spec.Sanction.Sanction} {c : ComplaintText} :
    Proving.USC.T18.Spec.Sanction.SanctionSought s c ↔ SanctionSought (mapSanctionT18 s) c

axiom bridge_sanctionSought_T42eq_iff
    {s : Proving.USC.T42.EqualRights.Sanction.Sanction} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Sanction.SanctionSought s c ↔ SanctionSought (mapSanctionT42eq s) c

theorem collapse_sanction_T18_iff
    {s : Proving.USC.T18.Spec.Sanction.Sanction} {c : ComplaintText} :
    Proving.USC.T18.Spec.Sanction.SanctionSought s c ↔ SanctionSought (mapSanctionT18 s) c :=
  bridge_sanctionSought_T18_iff
theorem collapse_sanction_T42eq_iff
    {s : Proving.USC.T42.EqualRights.Sanction.Sanction} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Sanction.SanctionSought s c ↔ SanctionSought (mapSanctionT42eq s) c :=
  bridge_sanctionSought_T42eq_iff











def mapBearerT18 : Proving.USC.T18.Spec.Evidentiary.Bearer → Bearer
  | .Plaintiff => .Plaintiff | .Defendant => .Defendant | .Government => .Government
def mapStdT18 : Proving.USC.T18.Spec.Evidentiary.Standard → Standard
  | .Preponderance => .Preponderance | .ClearAndConvincing => .ClearAndConvincing
  | .BeyondReasonableDoubt => .BeyondReasonableDoubt

def mapBearerT42eq : Proving.USC.T42.EqualRights.Evidentiary.Bearer → Bearer
  | .Plaintiff => .Plaintiff | .Defendant => .Defendant | .Government => .Government
def mapStdT42eq : Proving.USC.T42.EqualRights.Evidentiary.Standard → Standard
  | .Preponderance => .Preponderance | .ClearAndConvincing => .ClearAndConvincing
  | .BeyondReasonableDoubt => .BeyondReasonableDoubt

def mapBearerT42vi : Proving.USC.T42.TitleVI.Evidentiary.Bearer → Bearer
  | .Plaintiff => .Plaintiff | .Defendant => .Defendant | .Government => .Government
def mapStdT42vi : Proving.USC.T42.TitleVI.Evidentiary.Standard → Standard
  | .Preponderance => .Preponderance | .ClearAndConvincing => .ClearAndConvincing
  | .BeyondReasonableDoubt => .BeyondReasonableDoubt




  | .RecordFinding => .ClearAndConvincing


axiom bridge_burdenCarried_T18_iff
    {b : Proving.USC.T18.Spec.Evidentiary.Bearer} {s : Proving.USC.T18.Spec.Evidentiary.Standard}
    {c : ComplaintText} :
    Proving.USC.T18.Spec.Evidentiary.BurdenCarried b s c ↔ BurdenCarried (mapBearerT18 b) (mapStdT18 s) c

axiom bridge_burdenCarried_T42eq_iff
    {b : Proving.USC.T42.EqualRights.Evidentiary.Bearer} {s : Proving.USC.T42.EqualRights.Evidentiary.Standard}
    {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Evidentiary.BurdenCarried b s c ↔ BurdenCarried (mapBearerT42eq b) (mapStdT42eq s) c

axiom bridge_burdenCarried_T42vi_to_common
    {b : Proving.USC.T42.TitleVI.Evidentiary.Bearer} {s : Proving.USC.T42.TitleVI.Evidentiary.Standard}
    {loc : Proving.USC.T42.TitleVI.Evidentiary.Locus} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Evidentiary.BurdenCarried b s loc c → BurdenCarried (mapBearerT42vi b) (mapStdT42vi s) c

theorem collapse_evidentiary_T18_iff
    {b : Proving.USC.T18.Spec.Evidentiary.Bearer} {s : Proving.USC.T18.Spec.Evidentiary.Standard}
    {c : ComplaintText} :
    Proving.USC.T18.Spec.Evidentiary.BurdenCarried b s c ↔ BurdenCarried (mapBearerT18 b) (mapStdT18 s) c :=
  bridge_burdenCarried_T18_iff
theorem collapse_evidentiary_T42eq_iff
    {b : Proving.USC.T42.EqualRights.Evidentiary.Bearer} {s : Proving.USC.T42.EqualRights.Evidentiary.Standard}
    {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Evidentiary.BurdenCarried b s c ↔ BurdenCarried (mapBearerT42eq b) (mapStdT42eq s) c :=
  bridge_burdenCarried_T42eq_iff
theorem collapse_evidentiary_T42vi_clean
    {b : Proving.USC.T42.TitleVI.Evidentiary.Bearer} {s : Proving.USC.T42.TitleVI.Evidentiary.Standard}
    {loc : Proving.USC.T42.TitleVI.Evidentiary.Locus} {c : ComplaintText}
    (h : Proving.USC.T42.TitleVI.Evidentiary.BurdenCarried b s loc c) :
    BurdenCarried (mapBearerT42vi b) (mapStdT42vi s) c :=
  bridge_burdenCarried_T42vi_to_common h










axiom bridge_actOnOrAfter_T18_iff {d : Nat} {c : ComplaintText} :
    Proving.USC.T18.Spec.Intertemporal.ActOccurredOnOrAfter d c ↔ ActOccurredOnOrAfter d c
axiom bridge_actOnOrAfter_T42eq_iff {d : Nat} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Intertemporal.ActOccurredOnOrAfter d c ↔ ActOccurredOnOrAfter d c
axiom bridge_actOnOrAfter_T42vi_iff {d : Nat} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Intertemporal.ActOccurredOnOrAfter d c ↔ ActOccurredOnOrAfter d c

axiom bridge_postEnactment_T18_iff {c : ComplaintText} :
    Proving.USC.T18.Spec.Intertemporal.ActIsPostEnactment c ↔ ActIsPostEnactment c
axiom bridge_postEnactment_T42eq_iff {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Intertemporal.ActIsPostEnactment c ↔ ActIsPostEnactment c
axiom bridge_postEnactment_T42vi_iff {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Intertemporal.ActIsPostEnactment c ↔ ActIsPostEnactment c

axiom bridge_withinSunset_T42eq_iff {d : Option Nat} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Intertemporal.ActWithinSunset d c ↔ ActWithinSunset d c

theorem collapse_intertemporal_onOrAfter_T18_iff {d : Nat} {c : ComplaintText} :
    Proving.USC.T18.Spec.Intertemporal.ActOccurredOnOrAfter d c ↔ ActOccurredOnOrAfter d c :=
  bridge_actOnOrAfter_T18_iff
theorem collapse_intertemporal_onOrAfter_T42eq_iff {d : Nat} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Intertemporal.ActOccurredOnOrAfter d c ↔ ActOccurredOnOrAfter d c :=
  bridge_actOnOrAfter_T42eq_iff
theorem collapse_intertemporal_onOrAfter_T42vi_iff {d : Nat} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Intertemporal.ActOccurredOnOrAfter d c ↔ ActOccurredOnOrAfter d c :=
  bridge_actOnOrAfter_T42vi_iff
theorem collapse_intertemporal_postEnactment_T18_iff {c : ComplaintText} :
    Proving.USC.T18.Spec.Intertemporal.ActIsPostEnactment c ↔ ActIsPostEnactment c :=
  bridge_postEnactment_T18_iff
theorem collapse_intertemporal_postEnactment_T42eq_iff {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Intertemporal.ActIsPostEnactment c ↔ ActIsPostEnactment c :=
  bridge_postEnactment_T42eq_iff
theorem collapse_intertemporal_postEnactment_T42vi_iff {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Intertemporal.ActIsPostEnactment c ↔ ActIsPostEnactment c :=
  bridge_postEnactment_T42vi_iff
theorem collapse_intertemporal_sunset_T42eq_iff {d : Option Nat} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Intertemporal.ActWithinSunset d c ↔ ActWithinSunset d c :=
  bridge_withinSunset_T42eq_iff















axiom bridge_privateRight_T18_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Spec.Remedy.HasPrivateRightOfAction p c ↔ HasPrivateRightOfAction p c
axiom bridge_privateRight_T42eq_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Remedy.HasPrivateRightOfAction p c ↔ HasPrivateRightOfAction p c
axiom bridge_privateRight_T42vi_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Remedy.HasPrivateRightOfAction p c ↔ HasPrivateRightOfAction p c

axiom bridge_redressable_T42eq_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Remedy.ReliefRedressable p c ↔ ReliefRedressable p c





axiom bridge_causation_T18_to_proximate {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Spec.Remedy.CausedByViolation p c → ProximateCause p c

axiom bridge_causation_T42eq_to_proximate {p : Person} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Remedy.CausedByViolation p c → ProximateCause p c


axiom bridge_causation_T42vi_to_proximate {p : Person} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Remedy.CausedByViolation p c → ProximateCause p c

theorem collapse_privateRight_T18_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Spec.Remedy.HasPrivateRightOfAction p c ↔ HasPrivateRightOfAction p c :=
  bridge_privateRight_T18_iff
theorem collapse_privateRight_T42eq_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Remedy.HasPrivateRightOfAction p c ↔ HasPrivateRightOfAction p c :=
  bridge_privateRight_T42eq_iff
theorem collapse_privateRight_T42vi_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Remedy.HasPrivateRightOfAction p c ↔ HasPrivateRightOfAction p c :=
  bridge_privateRight_T42vi_iff
theorem collapse_redressable_T42eq_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Remedy.ReliefRedressable p c ↔ ReliefRedressable p c :=
  bridge_redressable_T42eq_iff
theorem reidentify_causation_T18_clean {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Spec.Remedy.CausedByViolation p c) : ProximateCause p c :=
  bridge_causation_T18_to_proximate h
theorem reidentify_causation_T42eq_clean {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.EqualRights.Remedy.CausedByViolation p c) : ProximateCause p c :=
  bridge_causation_T42eq_to_proximate h
theorem reidentify_causation_T42vi_clean {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.TitleVI.Remedy.CausedByViolation p c) : ProximateCause p c :=
  bridge_causation_T42vi_to_proximate h









axiom bridge_isProtectedPerson_T42eq_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Ontology.IsProtectedPerson p c ↔ IsPersonInUS p c

axiom bridge_isPersonInUS_T42vi_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Ontology.IsPersonInUS p c ↔ IsPersonInUS p c


axiom bridge_conditionFFA_T42vi_to_common {e : Entity} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Deontic.ConditionFederalAssistance2000d e c → IsFederalFundingRecipient e c

axiom bridge_isCoveredRecipient_T42vi_to_common {e : Entity} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Procedure.IsCoveredRecipient e c → IsFederalFundingRecipient e c

axiom bridge_isFFR_T42vi_iff {e : Entity} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Remedy.IsFederalFundingRecipient e c ↔ IsFederalFundingRecipient e c

theorem reidentify_protectedPerson_T42eq_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T42.EqualRights.Ontology.IsProtectedPerson p c ↔ IsPersonInUS p c :=
  bridge_isProtectedPerson_T42eq_iff
theorem reidentify_personInUS_T42vi_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Ontology.IsPersonInUS p c ↔ IsPersonInUS p c :=
  bridge_isPersonInUS_T42vi_iff
theorem reidentify_conditionFFA_T42vi_clean {e : Entity} {c : ComplaintText}
    (h : Proving.USC.T42.TitleVI.Deontic.ConditionFederalAssistance2000d e c) :
    IsFederalFundingRecipient e c := bridge_conditionFFA_T42vi_to_common h
theorem reidentify_coveredRecipient_T42vi_clean {e : Entity} {c : ComplaintText}
    (h : Proving.USC.T42.TitleVI.Procedure.IsCoveredRecipient e c) :
    IsFederalFundingRecipient e c := bridge_isCoveredRecipient_T42vi_to_common h
theorem reidentify_isFFR_T42vi_iff {e : Entity} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Remedy.IsFederalFundingRecipient e c ↔ IsFederalFundingRecipient e c :=
  bridge_isFFR_T42vi_iff




def mapRefT42vi (r : Proving.USC.T42.TitleVI.Structure.Ref) : StructRef :=
  ⟨r.source, r.target, toString (repr r.kind)⟩
axiom bridge_referencedSectionExists_T42vi_to_common
    {r : Proving.USC.T42.TitleVI.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRefT42vi r) c


axiom guard_targetResolves_T42vi (r : Proving.USC.T42.TitleVI.Structure.Ref) (c : ComplaintText) : Prop
axiom bridge_incorporationHonored_T42vi_to_common
    {r : Proving.USC.T42.TitleVI.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_T42vi r c →
    Proving.USC.T42.TitleVI.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRefT42vi r) c

theorem reidentify_referencedSectionExists_T42vi_clean
    {r : Proving.USC.T42.TitleVI.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T42.TitleVI.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRefT42vi r) c :=
  bridge_referencedSectionExists_T42vi_to_common h
theorem reidentify_incorporationHonored_T42vi_modulo_guard
    {r : Proving.USC.T42.TitleVI.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves_T42vi r c)
    (h : Proving.USC.T42.TitleVI.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRefT42vi r) c :=
  bridge_incorporationHonored_T42vi_to_common guard h








axiom bridge_defendantIsState_T42vi_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Sanction.DefendantIsState p c ↔ DefendantIsSovereign p c
theorem collapse_sovereign_T42vi_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Sanction.DefendantIsState p c ↔ DefendantIsSovereign p c :=
  bridge_defendantIsState_T42vi_iff










axiom bridge_onProtectedGround_T42vi_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T42.TitleVI.Elements.OnProtectedGround p c → OnProtectedGround p c
theorem collapse_protectedGround_T42vi_clean {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.TitleVI.Elements.OnProtectedGround p c) : OnProtectedGround p c :=
  bridge_onProtectedGround_T42vi_to_common h

end Proving.USC.Common.CrossWaveSpecAlgebra
