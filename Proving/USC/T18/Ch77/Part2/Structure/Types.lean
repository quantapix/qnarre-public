import Proving.USC.Common.Types

set_option autoImplicit false

























namespace Proving.USC.T18.Ch77.Part2.Structure

open Proving.USC.Common


inductive EdgeKind where

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
  deriving DecidableEq, Repr


structure DefinedTerm where

  term      : String

  definedAt : String
  deriving DecidableEq, Repr


abbrev EdgeGraph := List Ref




def edge_1591a_incorporates_1591e2 : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(e)(2)", kind := .Incorporates }


def edge_1591a_incorporates_1591e3 : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(e)(3)", kind := .Incorporates }


def edge_1591a_incorporates_1591b : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(b)", kind := .Incorporates }




def edge_1591a_exceptAsProvided_1591a1 : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(a)(1)", kind := .ExceptAsProvided }


def edge_1591a_exceptAsProvided_1591c : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(c)", kind := .ExceptAsProvided }



def edge_1591a1_incorporates_s7 : Ref :=
  { source := "18 USC § 1591(a)(1)", target := "18 USC § 7", kind := .Incorporates }


def edge_1591a2_incorporates_1591a1 : Ref :=
  { source := "18 USC § 1591(a)(2)", target := "18 USC § 1591(a)(1)", kind := .Incorporates }


def edge_1591a2_incorporates_1591e4 : Ref :=
  { source := "18 USC § 1591(a)(2)", target := "18 USC § 1591(e)(4)", kind := .Incorporates }


def edge_1591a2_incorporates_1591e6 : Ref :=
  { source := "18 USC § 1591(a)(2)", target := "18 USC § 1591(e)(6)", kind := .Incorporates }


def edge_1591b_incorporates_1591a : Ref :=
  { source := "18 USC § 1591(b)", target := "18 USC § 1591(a)", kind := .Incorporates }


def edge_1591b1_incorporates_1591e2 : Ref :=
  { source := "18 USC § 1591(b)(1)", target := "18 USC § 1591(e)(2)", kind := .Incorporates }



def edge_1591b1_incorporates_s3571 : Ref :=
  { source := "18 USC § 1591(b)(1)", target := "18 USC § 3571", kind := .Incorporates }



def edge_1591b2_incorporates_1591b1 : Ref :=
  { source := "18 USC § 1591(b)(2)", target := "18 USC § 1591(b)(1)", kind := .Incorporates }


def edge_1591b2_incorporates_s3571 : Ref :=
  { source := "18 USC § 1591(b)(2)", target := "18 USC § 3571", kind := .Incorporates }



def edge_1591c_lexSpecialis_1591a1 : Ref :=
  { source := "18 USC § 1591(c)", target := "18 USC § 1591(a)(1)", kind := .LexSpecialis }



def edge_1591d_incorporates_1591 : Ref :=
  { source := "18 USC § 1591(d)", target := "18 USC § 1591", kind := .Incorporates }


def edge_1591d_incorporates_s3571 : Ref :=
  { source := "18 USC § 1591(d)", target := "18 USC § 3571", kind := .Incorporates }



def edge_1591e_lexSpecialis_1591 : Ref :=
  { source := "18 USC § 1591(e)", target := "18 USC § 1591", kind := .LexSpecialis }


def edge_1591e2A_incorporates_1591e5 : Ref :=
  { source := "18 USC § 1591(e)(2)(A)", target := "18 USC § 1591(e)(5)", kind := .Incorporates }


def edge_1591e2B_incorporates_1591e5 : Ref :=
  { source := "18 USC § 1591(e)(2)(B)", target := "18 USC § 1591(e)(5)", kind := .Incorporates }



def edge_1591e2C_incorporates_1591e1 : Ref :=
  { source := "18 USC § 1591(e)(2)(C)", target := "18 USC § 1591(e)(1)", kind := .Incorporates }


def edge_1591e4_incorporates_1591a1 : Ref :=
  { source := "18 USC § 1591(e)(4)", target := "18 USC § 1591(a)(1)", kind := .Incorporates }


def edge_1591e4_incorporates_1591e6 : Ref :=
  { source := "18 USC § 1591(e)(4)", target := "18 USC § 1591(e)(6)", kind := .Incorporates }




def edges1591 : EdgeGraph :=
  [ edge_1591a_incorporates_1591e2
  , edge_1591a_incorporates_1591e3
  , edge_1591a_incorporates_1591b
  , edge_1591a_exceptAsProvided_1591a1
  , edge_1591a_exceptAsProvided_1591c
  , edge_1591a1_incorporates_s7
  , edge_1591a2_incorporates_1591a1
  , edge_1591a2_incorporates_1591e4
  , edge_1591a2_incorporates_1591e6
  , edge_1591b_incorporates_1591a
  , edge_1591b1_incorporates_1591e2
  , edge_1591b1_incorporates_s3571
  , edge_1591b2_incorporates_1591b1
  , edge_1591b2_incorporates_s3571
  , edge_1591c_lexSpecialis_1591a1
  , edge_1591d_incorporates_1591
  , edge_1591d_incorporates_s3571
  , edge_1591e_lexSpecialis_1591
  , edge_1591e2A_incorporates_1591e5
  , edge_1591e2B_incorporates_1591e5
  , edge_1591e2C_incorporates_1591e1
  , edge_1591e4_incorporates_1591a1
  , edge_1591e4_incorporates_1591e6 ]


def externalEdges1591 : EdgeGraph :=
  [ edge_1591a1_incorporates_s7
  , edge_1591b1_incorporates_s3571
  , edge_1591b2_incorporates_s3571
  , edge_1591d_incorporates_s3571 ]


def internalEdges1591 : EdgeGraph :=
  [ edge_1591a_incorporates_1591e2
  , edge_1591a_incorporates_1591e3
  , edge_1591a_incorporates_1591b
  , edge_1591a_exceptAsProvided_1591a1
  , edge_1591a_exceptAsProvided_1591c
  , edge_1591a2_incorporates_1591a1
  , edge_1591a2_incorporates_1591e4
  , edge_1591a2_incorporates_1591e6
  , edge_1591b_incorporates_1591a
  , edge_1591b1_incorporates_1591e2
  , edge_1591b2_incorporates_1591b1
  , edge_1591c_lexSpecialis_1591a1
  , edge_1591d_incorporates_1591
  , edge_1591e_lexSpecialis_1591
  , edge_1591e2A_incorporates_1591e5
  , edge_1591e2B_incorporates_1591e5
  , edge_1591e2C_incorporates_1591e1
  , edge_1591e4_incorporates_1591a1
  , edge_1591e4_incorporates_1591e6 ]


def incorporationEdges1591 : EdgeGraph :=
  [ edge_1591a_incorporates_1591e2
  , edge_1591a_incorporates_1591e3
  , edge_1591a_incorporates_1591b
  , edge_1591a1_incorporates_s7
  , edge_1591a2_incorporates_1591a1
  , edge_1591a2_incorporates_1591e4
  , edge_1591a2_incorporates_1591e6
  , edge_1591b_incorporates_1591a
  , edge_1591b1_incorporates_1591e2
  , edge_1591b1_incorporates_s3571
  , edge_1591b2_incorporates_1591b1
  , edge_1591b2_incorporates_s3571
  , edge_1591d_incorporates_1591
  , edge_1591d_incorporates_s3571
  , edge_1591e2A_incorporates_1591e5
  , edge_1591e2B_incorporates_1591e5
  , edge_1591e2C_incorporates_1591e1
  , edge_1591e4_incorporates_1591a1
  , edge_1591e4_incorporates_1591e6 ]


def exceptionEdges1591 : EdgeGraph :=
  [ edge_1591a_exceptAsProvided_1591a1
  , edge_1591a_exceptAsProvided_1591c ]


def overrideEdges1591 : EdgeGraph :=
  [ edge_1591c_lexSpecialis_1591a1
  , edge_1591e_lexSpecialis_1591 ]


def definedTerms1591 : List DefinedTerm :=
  [ { term := "abuse or threatened abuse of law or legal process"
    , definedAt := "18 USC § 1591(e)(1)" }
  , { term := "coercion",                 definedAt := "18 USC § 1591(e)(2)" }
  , { term := "commercial sex act",       definedAt := "18 USC § 1591(e)(3)" }
  , { term := "participation in a venture", definedAt := "18 USC § 1591(e)(4)" }
  , { term := "serious harm",             definedAt := "18 USC § 1591(e)(5)" }
  , { term := "venture",                  definedAt := "18 USC § 1591(e)(6)" } ]

end Proving.USC.T18.Ch77.Part2.Structure
