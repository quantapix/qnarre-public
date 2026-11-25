






















import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.TitleVIIDef.Evidentiary.Theorems
import Proving.USC.T42.TitleVIIDef.Scienter.Theorems
import Proving.USC.T42.TitleVIIDef.Ontology.Theorems
import Proving.USC.T42.TitleVIIDef.Structure.Theorems

namespace Proving.USC.Common.CollapseT42TitleVIIDef

open Proving.USC.Common
open Proving.USC.T42.TitleVIIDef











theorem collapse_mentalStateProven_iff
    (p : Person) (rung : MentalState) (c : ComplaintText) :
    MentalStateProven p rung c ↔ MentalStateProven p rung c :=
  Iff.rfl











def bearerToCommon : Evidentiary.Bearer → Bearer
  | .Plaintiff  => .Plaintiff
  | .Defendant  => .Defendant
  | .Government => .Government


def bearerOfCommon : Bearer → Evidentiary.Bearer
  | .Plaintiff  => .Plaintiff
  | .Defendant  => .Defendant
  | .Government => .Government



theorem bearer_roundtrip (b : Evidentiary.Bearer) :
    bearerOfCommon (bearerToCommon b) = b := by cases b <;> rfl


theorem bearer_roundtrip' (b : Bearer) :
    bearerToCommon (bearerOfCommon b) = b := by cases b <;> rfl


def standardToCommon : Evidentiary.Standard → Standard
  | .Preponderance         => .Preponderance
  | .ClearAndConvincing    => .ClearAndConvincing
  | .BeyondReasonableDoubt => .BeyondReasonableDoubt






def standardOfCommon : Standard → Evidentiary.Standard
  | .Preponderance         => .Preponderance
  | .ClearAndConvincing    => .ClearAndConvincing
  | .BeyondReasonableDoubt => .BeyondReasonableDoubt
  | .ReasonableCause       => .Preponderance

theorem standard_roundtrip (s : Evidentiary.Standard) :
    standardOfCommon (standardToCommon s) = s := by cases s <;> rfl


def presumptionToCommon : Evidentiary.Presumption → Presumption
  | .None       => .None
  | .Rebuttable => .Rebuttable
  | .Conclusive => .Conclusive

def presumptionOfCommon : Presumption → Evidentiary.Presumption
  | .None       => .None
  | .Rebuttable => .Rebuttable
  | .Conclusive => .Conclusive

theorem presumption_roundtrip (q : Evidentiary.Presumption) :
    presumptionOfCommon (presumptionToCommon q) = q := by cases q <;> rfl

theorem presumption_roundtrip' (q : Presumption) :
    presumptionToCommon (presumptionOfCommon q) = q := by cases q <;> rfl












axiom corr_burdenCarried (b : Evidentiary.Bearer) (s : Evidentiary.Standard)
    (c : ComplaintText) :
    Evidentiary.BurdenCarried b s c ↔
      Common.BurdenCarried (bearerToCommon b) (standardToCommon s) c




theorem collapse_burdenCarried_iff
    (b : Evidentiary.Bearer) (s : Evidentiary.Standard) (c : ComplaintText) :
    Evidentiary.BurdenCarried b s c ↔
      Common.BurdenCarried (bearerToCommon b) (standardToCommon s) c :=
  corr_burdenCarried b s c




theorem collapse_burden_plaintiff_preponderance (c : ComplaintText) :
    Evidentiary.BurdenCarried .Plaintiff .Preponderance c ↔
      Common.BurdenCarried .Plaintiff .Preponderance c :=
  corr_burdenCarried .Plaintiff .Preponderance c














axiom employerToEntity : Ontology.Employer → Entity




axiom corr_commerce (x : Ontology.Employer) (c : ComplaintText) :
    Ontology.EngagedInIndustryAffectingCommerce x c →
      Common.EngagedInInterstateCommerce (employerToEntity x) c





theorem collapse_commerce_implies
    (x : Ontology.Employer) (c : ComplaintText)
    (h : Ontology.EngagedInIndustryAffectingCommerce x c) :
    Common.EngagedInInterstateCommerce (employerToEntity x) c :=
  corr_commerce x c h














axiom corr_incorporationHonored (r : Structure.Ref) (c : ComplaintText) :
    Structure.IncorporationHonored r c → StructuralReferenceCoheres r.toCommon c


axiom corr_referencedExists (r : Structure.Ref) (c : ComplaintText) :
    Structure.ReferencedSectionExists r c → StructuralReferenceCoheres r.toCommon c


axiom corr_exceptionApplies (r : Structure.Ref) (c : ComplaintText) :
    Structure.ExceptionApplies r c → StructuralReferenceCoheres r.toCommon c


axiom corr_overrideTriggered (r : Structure.Ref) (c : ComplaintText) :
    Structure.OverrideTriggered r c → StructuralReferenceCoheres r.toCommon c




theorem collapse_structure_incorporation
    (r : Structure.Ref) (c : ComplaintText)
    (h : Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres r.toCommon c :=
  corr_incorporationHonored r c h

theorem collapse_structure_referenced
    (r : Structure.Ref) (c : ComplaintText)
    (h : Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres r.toCommon c :=
  corr_referencedExists r c h

theorem collapse_structure_exception
    (r : Structure.Ref) (c : ComplaintText)
    (h : Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres r.toCommon c :=
  corr_exceptionApplies r c h

theorem collapse_structure_override
    (r : Structure.Ref) (c : ComplaintText)
    (h : Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres r.toCommon c :=
  corr_overrideTriggered r c h

end Proving.USC.Common.CollapseT42TitleVIIDef
