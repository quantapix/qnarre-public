









import Proving.USC.T18.Ch77.Structure.Predicates

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch77.Structure







def edge_1581b_incorporates_1581a : Ref :=
  { source := "18 USC § 1581(b)", target := "18 USC § 1581(a)", kind := .Incorporates }


def edge_1589a_incorporates_1589d : Ref :=
  { source := "18 USC § 1589(a)", target := "18 USC § 1589(d)", kind := .Incorporates }
def edge_1589b_incorporates_1589d : Ref :=
  { source := "18 USC § 1589(b)", target := "18 USC § 1589(d)", kind := .Incorporates }


def edge_1590_incorporates_ch77 : Ref :=
  { source := "18 USC § 1590(a)", target := "18 USC ch. 77", kind := .Incorporates }
def edge_1590b_incorporates_1590a : Ref :=
  { source := "18 USC § 1590(b)", target := "18 USC § 1590(a)", kind := .Incorporates }


def edge_1591a_incorporates_1591b : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(b)", kind := .Incorporates }
def edge_1591a_incorporates_1591e2 : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(e)(2)", kind := .Incorporates }


def edge_1592_incorporates_1581 : Ref :=
  { source := "18 USC § 1592(a)", target := "18 USC § 1581", kind := .Incorporates }
def edge_1592_incorporates_1583 : Ref :=
  { source := "18 USC § 1592(a)", target := "18 USC § 1583", kind := .Incorporates }
def edge_1592_incorporates_1584 : Ref :=
  { source := "18 USC § 1592(a)", target := "18 USC § 1584", kind := .Incorporates }
def edge_1592_incorporates_1589 : Ref :=
  { source := "18 USC § 1592(a)", target := "18 USC § 1589", kind := .Incorporates }
def edge_1592_incorporates_1590 : Ref :=
  { source := "18 USC § 1592(a)", target := "18 USC § 1590", kind := .Incorporates }
def edge_1592_incorporates_1591 : Ref :=
  { source := "18 USC § 1592(a)", target := "18 USC § 1591", kind := .Incorporates }
def edge_1592_incorporates_1594a : Ref :=
  { source := "18 USC § 1592(a)(1)", target := "18 USC § 1594(a)", kind := .Incorporates }
def edge_1592_incorporates_tvpa103 : Ref :=
  { source := "18 USC § 1592(a)(3)", target := "TVPA 2000 § 103 (22 USC § 7102)", kind := .Incorporates }
def edge_1592_exceptAsProvided_victim : Ref :=
  { source := "18 USC § 1592(a)", target := "18 USC § 1592(b)", kind := .ExceptAsProvided }





structure Coherent1581 (c : ComplaintText) : Prop where
  penaltyIncorporated : IncorporationHonored edge_1581b_incorporates_1581a c



structure Coherent1589 (c : ComplaintText) : Prop where
  penaltyA : IncorporationHonored edge_1589a_incorporates_1589d c
  penaltyB : IncorporationHonored edge_1589b_incorporates_1589d c




structure Coherent1590 (c : ComplaintText) : Prop where
  chapterResolved     : ReferencedSectionExists edge_1590_incorporates_ch77 c
  chapterHonored      : IncorporationHonored edge_1590_incorporates_ch77 c
  penaltyIncorporated : IncorporationHonored edge_1590b_incorporates_1590a c



structure Coherent1591 (c : ComplaintText) : Prop where
  penaltyIncorporated : IncorporationHonored edge_1591a_incorporates_1591b c
  coercionDefined     : IncorporationHonored edge_1591a_incorporates_1591e2 c





structure Coherent1592 (c : ComplaintText) : Prop where
  ref1581     : ReferencedSectionExists edge_1592_incorporates_1581 c
  ref1583     : ReferencedSectionExists edge_1592_incorporates_1583 c
  ref1584     : ReferencedSectionExists edge_1592_incorporates_1584 c
  ref1589     : ReferencedSectionExists edge_1592_incorporates_1589 c
  ref1590     : ReferencedSectionExists edge_1592_incorporates_1590 c
  ref1591     : ReferencedSectionExists edge_1592_incorporates_1591 c
  ref1594a    : ReferencedSectionExists edge_1592_incorporates_1594a c
  tvpaDefined : IncorporationHonored edge_1592_incorporates_tvpa103 c





inductive Section1592Disposition (c : ComplaintText) : Prop where
  | liable (coherent  : Coherent1592 c)
           (notExempt : ¬ ExceptionApplies edge_1592_exceptAsProvided_victim c)
  | exempt (exception : ExceptionApplies edge_1592_exceptAsProvided_victim c)

end Proving.USC.T18.Ch77.Structure
