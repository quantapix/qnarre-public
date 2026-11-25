














import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77Tail.Structure

open Proving.USC.Common


inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis
  deriving DecidableEq, Repr





structure Ref where
  source : String
  target : String
  kind   : EdgeKind
  deriving Repr






def edge_1582_incorporates_3571 : Ref :=
  { source := "18 USC § 1582", target := "18 USC § 3571", kind := .Incorporates }
def edge_1585_incorporates_3571 : Ref :=
  { source := "18 USC § 1585", target := "18 USC § 3571", kind := .Incorporates }
def edge_1586_incorporates_3571 : Ref :=
  { source := "18 USC § 1586", target := "18 USC § 3571", kind := .Incorporates }
def edge_1587_incorporates_3571 : Ref :=
  { source := "18 USC § 1587", target := "18 USC § 3571", kind := .Incorporates }
def edge_1588_incorporates_3571 : Ref :=
  { source := "18 USC § 1588", target := "18 USC § 3571", kind := .Incorporates }






def edge_1592a1_incorporates_1581 : Ref :=
  { source := "18 USC § 1592(a)(1)", target := "18 USC § 1581", kind := .Incorporates }
def edge_1592a1_incorporates_1583 : Ref :=
  { source := "18 USC § 1592(a)(1)", target := "18 USC § 1583", kind := .Incorporates }
def edge_1592a1_incorporates_1584 : Ref :=
  { source := "18 USC § 1592(a)(1)", target := "18 USC § 1584", kind := .Incorporates }
def edge_1592a1_incorporates_1589 : Ref :=
  { source := "18 USC § 1592(a)(1)", target := "18 USC § 1589", kind := .Incorporates }
def edge_1592a1_incorporates_1590 : Ref :=
  { source := "18 USC § 1592(a)(1)", target := "18 USC § 1590", kind := .Incorporates }
def edge_1592a1_incorporates_1591 : Ref :=
  { source := "18 USC § 1592(a)(1)", target := "18 USC § 1591", kind := .Incorporates }
def edge_1592a1_incorporates_1594a : Ref :=
  { source := "18 USC § 1592(a)(1)", target := "18 USC § 1594(a)", kind := .Incorporates }



def edge_1592a2_incorporates_1581 : Ref :=
  { source := "18 USC § 1592(a)(2)", target := "18 USC § 1581", kind := .Incorporates }
def edge_1592a2_incorporates_1583 : Ref :=
  { source := "18 USC § 1592(a)(2)", target := "18 USC § 1583", kind := .Incorporates }
def edge_1592a2_incorporates_1584 : Ref :=
  { source := "18 USC § 1592(a)(2)", target := "18 USC § 1584", kind := .Incorporates }
def edge_1592a2_incorporates_1589 : Ref :=
  { source := "18 USC § 1592(a)(2)", target := "18 USC § 1589", kind := .Incorporates }
def edge_1592a2_incorporates_1590 : Ref :=
  { source := "18 USC § 1592(a)(2)", target := "18 USC § 1590", kind := .Incorporates }
def edge_1592a2_incorporates_1591 : Ref :=
  { source := "18 USC § 1592(a)(2)", target := "18 USC § 1591", kind := .Incorporates }







def edge_1592a3_incorporates_tvpa103 : Ref :=
  { source := "18 USC § 1592(a)(3)", target := "TVPA 2000 § 103", kind := .Incorporates }
def edge_1592b_incorporates_tvpa103 : Ref :=
  { source := "18 USC § 1592(b)", target := "TVPA 2000 § 103", kind := .Incorporates }



def edge_1592b_exceptAsProvided_1592a : Ref :=
  { source := "18 USC § 1592(b)", target := "18 USC § 1592(a)", kind := .ExceptAsProvided }



def edge_1592c_incorporates_1592a : Ref :=
  { source := "18 USC § 1592(c)", target := "18 USC § 1592(a)", kind := .Incorporates }

end Proving.USC.T18.Ch77Tail.Structure
