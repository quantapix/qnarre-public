import Proving.USC.Common.Types

set_option autoImplicit false











namespace Proving.USC.T18.Ch77.Part4.Structure

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




structure TermIncorporation where
  term : String
  ref  : Ref
  deriving DecidableEq, Repr




def edge_1591a_incorporates_1591b : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(b)", kind := .Incorporates }


def edge_1591a_incorporates_1591e2 : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(e)(2)", kind := .Incorporates }


def edge_1591a_incorporates_1591e3 : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(e)(3)", kind := .Incorporates }


def edge_1591a2_incorporates_1591a1 : Ref :=
  { source := "18 USC § 1591(a)(2)", target := "18 USC § 1591(a)(1)", kind := .Incorporates }


def edge_1591a2_incorporates_1591e4 : Ref :=
  { source := "18 USC § 1591(a)(2)", target := "18 USC § 1591(e)(4)", kind := .Incorporates }


def edge_1591a2_incorporates_1591e6 : Ref :=
  { source := "18 USC § 1591(a)(2)", target := "18 USC § 1591(e)(6)", kind := .Incorporates }




def edge_1591a_exceptAsProvided_1591c : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(c)", kind := .ExceptAsProvided }


def edge_1591b_incorporates_1591a : Ref :=
  { source := "18 USC § 1591(b)", target := "18 USC § 1591(a)", kind := .Incorporates }


def edge_1591b1_incorporates_1591e2 : Ref :=
  { source := "18 USC § 1591(b)(1)", target := "18 USC § 1591(e)(2)", kind := .Incorporates }



def edge_1591b_incorporates_3571 : Ref :=
  { source := "18 USC § 1591(b)", target := "18 USC § 3571", kind := .Incorporates }


def edge_1591c_incorporates_1591a1 : Ref :=
  { source := "18 USC § 1591(c)", target := "18 USC § 1591(a)(1)", kind := .Incorporates }



def edge_1591d_incorporates_1591 : Ref :=
  { source := "18 USC § 1591(d)", target := "18 USC § 1591", kind := .Incorporates }



def edge_1591d_incorporates_3571 : Ref :=
  { source := "18 USC § 1591(d)", target := "18 USC § 3571", kind := .Incorporates }


def edge_1591e2_incorporates_1591e5 : Ref :=
  { source := "18 USC § 1591(e)(2)", target := "18 USC § 1591(e)(5)", kind := .Incorporates }



def edge_1591e2C_incorporates_1591e1 : Ref :=
  { source := "18 USC § 1591(e)(2)(C)", target := "18 USC § 1591(e)(1)", kind := .Incorporates }



def edge_1591e4_incorporates_1591a1 : Ref :=
  { source := "18 USC § 1591(e)(4)", target := "18 USC § 1591(a)(1)", kind := .Incorporates }


def edges : List Ref :=
  [ edge_1591a_incorporates_1591b
  , edge_1591a_incorporates_1591e2
  , edge_1591a_incorporates_1591e3
  , edge_1591a2_incorporates_1591a1
  , edge_1591a2_incorporates_1591e4
  , edge_1591a2_incorporates_1591e6
  , edge_1591a_exceptAsProvided_1591c
  , edge_1591b_incorporates_1591a
  , edge_1591b1_incorporates_1591e2
  , edge_1591b_incorporates_3571
  , edge_1591c_incorporates_1591a1
  , edge_1591d_incorporates_1591
  , edge_1591d_incorporates_3571
  , edge_1591e2_incorporates_1591e5
  , edge_1591e2C_incorporates_1591e1
  , edge_1591e4_incorporates_1591a1 ]




def term_coercion : TermIncorporation :=
  { term := "coercion", ref := edge_1591a_incorporates_1591e2 }


def term_commercialSexAct : TermIncorporation :=
  { term := "commercial sex act", ref := edge_1591a_incorporates_1591e3 }


def term_participationInAVenture : TermIncorporation :=
  { term := "participation in a venture", ref := edge_1591a2_incorporates_1591e4 }


def term_venture : TermIncorporation :=
  { term := "venture", ref := edge_1591a2_incorporates_1591e6 }


def term_seriousHarm : TermIncorporation :=
  { term := "serious harm", ref := edge_1591e2_incorporates_1591e5 }



def term_abuseOfLegalProcess : TermIncorporation :=
  { term := "abuse or threatened abuse of law or legal process",
    ref := edge_1591e2C_incorporates_1591e1 }


def termIncorporations : List TermIncorporation :=
  [ term_coercion
  , term_commercialSexAct
  , term_participationInAVenture
  , term_venture
  , term_seriousHarm
  , term_abuseOfLegalProcess ]

end Proving.USC.T18.Ch77.Part4.Structure
