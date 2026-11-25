



















import Proving.USC.T29.SelfOrgRep.Structure.Predicates

namespace Proving.USC.T29.SelfOrgRep.Structure

open Proving.USC.Common




def edge_157_exceptAsProvided_158a3 : Ref :=
  { source := "29 USC § 157", target := "29 USC § 158(a)(3)", kind := .ExceptAsProvided }


def edge_159c_incorporates_159a : Ref :=
  { source := "29 USC § 159(c)", target := "29 USC § 159(a)", kind := .Incorporates }


def edge_159c2_incorporates_160c : Ref :=
  { source := "29 USC § 159(c)(2)", target := "29 USC § 160(c)", kind := .Incorporates }


def edge_159c5_incorporates_159b : Ref :=
  { source := "29 USC § 159(c)(5)", target := "29 USC § 159(b)", kind := .Incorporates }


def edge_159d_incorporates_160c : Ref :=
  { source := "29 USC § 159(d)", target := "29 USC § 160(c)", kind := .Incorporates }


def edge_159d_incorporates_160ef : Ref :=
  { source := "29 USC § 159(d)", target := "29 USC § 160(e)", kind := .Incorporates }


def edge_159e1_incorporates_158a3 : Ref :=
  { source := "29 USC § 159(e)(1)", target := "29 USC § 158(a)(3)", kind := .Incorporates }




def edge_158a1_incorporates_157 : Ref :=
  { source := "29 USC § 158(a)(1)", target := "29 USC § 157", kind := .Incorporates }


def edge_158a5d_incorporates_159a : Ref :=
  { source := "29 USC § 158(a)(5)", target := "29 USC § 159(a)", kind := .Incorporates }





structure Coherent157 (c : ComplaintText) : Prop where
  carveOutExists  : ReferencedSectionExists edge_157_exceptAsProvided_158a3 c
  carveOutHonored : ExceptionApplies edge_157_exceptAsProvided_158a3 c





structure Coherent159 (c : ComplaintText) : Prop where
  repExists       : ReferencedSectionExists edge_159c_incorporates_159a c
  repHonored      : IncorporationHonored edge_159c_incorporates_159a c
  orderConformity : IncorporationHonored edge_159c2_incorporates_160c c
  unitPurposes    : IncorporationHonored edge_159c5_incorporates_159b c
  orderPursuant   : IncorporationHonored edge_159d_incorporates_160c c
  transcript      : IncorporationHonored edge_159d_incorporates_160ef c
  rescissionTgt   : IncorporationHonored edge_159e1_incorporates_158a3 c

end Proving.USC.T29.SelfOrgRep.Structure
