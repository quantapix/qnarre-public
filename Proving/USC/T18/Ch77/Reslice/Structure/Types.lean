import Proving.USC.Common.Types

set_option autoImplicit false















namespace Proving.USC.T18.Ch77.Reslice.Structure

open Proving.USC.Common


inductive EdgeKind where


  | Incorporates

  | SubjectTo

  | Notwithstanding

  | ExceptAsProvided

  | Savings

  | LexSpecialis





inductive TargetKind where

  | Section

  | Chapter

  | TitleWide

  | ActSection




structure Ref where
  source     : String
  target     : String
  kind       : EdgeKind
  targetKind : TargetKind






def edge_1590a_incorporates_ch77 : Ref :=
  { source := "18 USC § 1590(a)", target := "18 USC ch. 77",
    kind := .Incorporates, targetKind := .Chapter }



def edge_1590a_incorporates_3571 : Ref :=
  { source := "18 USC § 1590(a)", target := "18 USC § 3571",
    kind := .Incorporates, targetKind := .TitleWide }




def edge_1590a_incorporates_1201 : Ref :=
  { source := "18 USC § 1590(a)", target := "18 USC § 1201",
    kind := .Incorporates, targetKind := .Section }




def edge_1590a_incorporates_2241 : Ref :=
  { source := "18 USC § 1590(a)", target := "18 USC § 2241",
    kind := .Incorporates, targetKind := .Section }



def edge_1590b_incorporates_1590a : Ref :=
  { source := "18 USC § 1590(b)", target := "18 USC § 1590(a)",
    kind := .Incorporates, targetKind := .Section }





def edge_1591a1_incorporates_t18s7 : Ref :=
  { source := "18 USC § 1591(a)(1)", target := "18 USC § 7",
    kind := .Incorporates, targetKind := .Section }



def edge_1591a_incorporates_1591e2 : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(e)(2)",
    kind := .Incorporates, targetKind := .Section }


def edge_1591a_incorporates_1591b : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(b)",
    kind := .Incorporates, targetKind := .Section }




def edge_1591a2_incorporates_1591a1 : Ref :=
  { source := "18 USC § 1591(a)(2)", target := "18 USC § 1591(a)(1)",
    kind := .Incorporates, targetKind := .Section }




def edge_1591a_exceptAsProvided_1591a1 : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(a)(1)",
    kind := .ExceptAsProvided, targetKind := .Section }




def edge_1591a1_subjectTo_1591c : Ref :=
  { source := "18 USC § 1591(a)(1)", target := "18 USC § 1591(c)",
    kind := .SubjectTo, targetKind := .Section }




def edge_1591b1_incorporates_1591e2 : Ref :=
  { source := "18 USC § 1591(b)(1)", target := "18 USC § 1591(e)(2)",
    kind := .Incorporates, targetKind := .Section }


def edge_1591b_incorporates_3571 : Ref :=
  { source := "18 USC § 1591(b)", target := "18 USC § 3571",
    kind := .Incorporates, targetKind := .TitleWide }




def edge_1591d_incorporates_1591 : Ref :=
  { source := "18 USC § 1591(d)", target := "18 USC § 1591",
    kind := .Incorporates, targetKind := .Section }



def edge_1591e2C_incorporates_1591e1 : Ref :=
  { source := "18 USC § 1591(e)(2)(C)", target := "18 USC § 1591(e)(1)",
    kind := .Incorporates, targetKind := .Section }




def edge_1591e4_incorporates_1591a1 : Ref :=
  { source := "18 USC § 1591(e)(4)", target := "18 USC § 1591(a)(1)",
    kind := .Incorporates, targetKind := .Section }






def edges_1592a1_predicateOffenses : List Ref :=
  [ { source := "18 USC § 1592(a)(1)", target := "18 USC § 1581",
      kind := .Incorporates, targetKind := .Section },
    { source := "18 USC § 1592(a)(1)", target := "18 USC § 1583",
      kind := .Incorporates, targetKind := .Section },
    { source := "18 USC § 1592(a)(1)", target := "18 USC § 1584",
      kind := .Incorporates, targetKind := .Section },
    { source := "18 USC § 1592(a)(1)", target := "18 USC § 1589",
      kind := .Incorporates, targetKind := .Section },
    { source := "18 USC § 1592(a)(1)", target := "18 USC § 1590",
      kind := .Incorporates, targetKind := .Section },
    { source := "18 USC § 1592(a)(1)", target := "18 USC § 1591",
      kind := .Incorporates, targetKind := .Section },
    { source := "18 USC § 1592(a)(1)", target := "18 USC § 1594(a)",
      kind := .Incorporates, targetKind := .Section } ]





def edges_1592a2_predicateOffenses : List Ref :=
  [ { source := "18 USC § 1592(a)(2)", target := "18 USC § 1581",
      kind := .Incorporates, targetKind := .Section },
    { source := "18 USC § 1592(a)(2)", target := "18 USC § 1583",
      kind := .Incorporates, targetKind := .Section },
    { source := "18 USC § 1592(a)(2)", target := "18 USC § 1584",
      kind := .Incorporates, targetKind := .Section },
    { source := "18 USC § 1592(a)(2)", target := "18 USC § 1589",
      kind := .Incorporates, targetKind := .Section },
    { source := "18 USC § 1592(a)(2)", target := "18 USC § 1590",
      kind := .Incorporates, targetKind := .Section },
    { source := "18 USC § 1592(a)(2)", target := "18 USC § 1591",
      kind := .Incorporates, targetKind := .Section } ]





def edge_1592a3_incorporates_tvpa103 : Ref :=
  { source := "18 USC § 1592(a)(3)", target := "TVPA of 2000 § 103 (22 USC § 7102)",
    kind := .Incorporates, targetKind := .ActSection }


def edge_1592a_incorporates_3571 : Ref :=
  { source := "18 USC § 1592(a)", target := "18 USC § 3571",
    kind := .Incorporates, targetKind := .TitleWide }





def edge_1592a_exceptAsProvided_1592b : Ref :=
  { source := "18 USC § 1592(a)", target := "18 USC § 1592(b)",
    kind := .ExceptAsProvided, targetKind := .Section }



def edge_1592b_incorporates_tvpa103 : Ref :=
  { source := "18 USC § 1592(b)", target := "TVPA of 2000 § 103 (22 USC § 7102)",
    kind := .Incorporates, targetKind := .ActSection }



def edge_1592c_incorporates_1592a : Ref :=
  { source := "18 USC § 1592(c)", target := "18 USC § 1592(a)",
    kind := .Incorporates, targetKind := .Section }




def sliceEdges : List Ref :=
  [ edge_1590a_incorporates_ch77, edge_1590a_incorporates_3571,
    edge_1590a_incorporates_1201, edge_1590a_incorporates_2241,
    edge_1590b_incorporates_1590a,
    edge_1591a1_incorporates_t18s7, edge_1591a_incorporates_1591e2,
    edge_1591a_incorporates_1591b, edge_1591a2_incorporates_1591a1,
    edge_1591a_exceptAsProvided_1591a1, edge_1591a1_subjectTo_1591c,
    edge_1591b1_incorporates_1591e2, edge_1591b_incorporates_3571,
    edge_1591d_incorporates_1591, edge_1591e2C_incorporates_1591e1,
    edge_1591e4_incorporates_1591a1,
    edge_1592a3_incorporates_tvpa103, edge_1592a_incorporates_3571,
    edge_1592a_exceptAsProvided_1592b, edge_1592b_incorporates_tvpa103,
    edge_1592c_incorporates_1592a ]

end Proving.USC.T18.Ch77.Reslice.Structure
