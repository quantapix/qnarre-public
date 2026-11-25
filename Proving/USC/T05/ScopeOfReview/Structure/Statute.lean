
















import Proving.USC.T05.ScopeOfReview.Structure.Predicates

namespace Proving.USC.T05.ScopeOfReview.Structure

open Proving.USC.Common


def edge_706E_incorporates_556 : Ref :=
  { source := "5 USC § 706(2)(E)", target := "5 USC § 556", kind := .Incorporates }


def edge_706E_incorporates_557 : Ref :=
  { source := "5 USC § 706(2)(E)", target := "5 USC § 557", kind := .Incorporates }





def edge_705_relatesTo_706 : Ref :=
  { source := "5 USC § 705", target := "5 USC § 706", kind := .LexSpecialis }






structure Coherent706E (c : ComplaintText) : Prop where
  ref556Exists      : ReferencedSectionExists edge_706E_incorporates_556 c
  ref557Exists      : ReferencedSectionExists edge_706E_incorporates_557 c
  incorporation556  : IncorporationHonored edge_706E_incorporates_556 c
  incorporation557  : IncorporationHonored edge_706E_incorporates_557 c



structure Coherent705 (c : ComplaintText) : Prop where
  reviewRegimeExists : ReferencedSectionExists edge_705_relatesTo_706 c
  reliefCoheres      : InterimReliefCoheresWithReview edge_705_relatesTo_706 c



structure CoherentScopeOfReview (c : ComplaintText) : Prop where
  e706 : Coherent706E c
  e705 : Coherent705 c

end Proving.USC.T05.ScopeOfReview.Structure
