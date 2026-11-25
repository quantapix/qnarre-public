











import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Structure

open Proving.USC.Common


inductive EdgeKind
  |
    Incorporates
  |
    SubjectTo
  |
    Notwithstanding
  |
    ExceptAsProvided
  |
    Savings
  |
    LexSpecialis
  deriving DecidableEq, Repr




structure Ref where
  source : String
  target : String
  kind   : EdgeKind




















def edge_2421Aa_incorporates_47usc230f : Ref :=
  { source := "18 USC § 2421A(a)", target := "47 USC § 230(f)", kind := .Incorporates }


def edge_2421Ab_incorporates_47usc230f : Ref :=
  { source := "18 USC § 2421A(b)", target := "47 USC § 230(f)", kind := .Incorporates }



def edge_2421Ab2_incorporates_1591a : Ref :=
  { source := "18 USC § 2421A(b)(2)", target := "18 USC § 1591(a)", kind := .Incorporates }



def edge_2421Ac_incorporates_2421Ab : Ref :=
  { source := "18 USC § 2421A(c)", target := "18 USC § 2421A(b)", kind := .Incorporates }



def edge_2421Ad_notwithstanding_3663 : Ref :=
  { source := "18 USC § 2421A(d)", target := "18 USC § 3663", kind := .Notwithstanding }



def edge_2421Ad_notwithstanding_3663A : Ref :=
  { source := "18 USC § 2421A(d)", target := "18 USC § 3663A", kind := .Notwithstanding }



def edge_2421Ad_incorporates_2327b : Ref :=
  { source := "18 USC § 2421A(d)", target := "18 USC § 2327(b)", kind := .Incorporates }


def edge_2421Ad_incorporates_2421Ab2 : Ref :=
  { source := "18 USC § 2421A(d)", target := "18 USC § 2421A(b)(2)", kind := .Incorporates }



def edge_2421Ad_savings_otherPenalties : Ref :=
  { source := "18 USC § 2421A(d)",
    target := "any other civil or criminal penalties authorized by law",
    kind   := .Savings }


def edge_2421Ae_exceptAsProvided_2421Aa : Ref :=
  { source := "18 USC § 2421A(e)", target := "18 USC § 2421A(a)", kind := .ExceptAsProvided }



def edge_2421Ae_exceptAsProvided_2421Ab1 : Ref :=
  { source := "18 USC § 2421A(e)", target := "18 USC § 2421A(b)(1)", kind := .ExceptAsProvided }




def edge_2423g1_incorporates_2246 : Ref :=
  { source := "18 USC § 2423(g)(1)", target := "18 USC § 2246", kind := .Incorporates }




def edge_2423g1_incorporates_ch109A : Ref :=
  { source := "18 USC § 2423(g)(1)", target := "18 USC ch. 109A", kind := .Incorporates }


def edge_2423g2_incorporates_1591 : Ref :=
  { source := "18 USC § 2423(g)(2)", target := "18 USC § 1591", kind := .Incorporates }


def edge_2423g3_incorporates_2256_8 : Ref :=
  { source := "18 USC § 2423(g)(3)", target := "18 USC § 2256(8)", kind := .Incorporates }


def edge_2423b_incorporates_2423g : Ref :=
  { source := "18 USC § 2423(b)", target := "18 USC § 2423(g)", kind := .Incorporates }


def edge_2423c_incorporates_2423g : Ref :=
  { source := "18 USC § 2423(c)", target := "18 USC § 2423(g)", kind := .Incorporates }



def edge_2423d3_incorporates_2423g : Ref :=
  { source := "18 USC § 2423(d)(3)", target := "18 USC § 2423(g)", kind := .Incorporates }


def edge_2423e_incorporates_2423g : Ref :=
  { source := "18 USC § 2423(e)", target := "18 USC § 2423(g)", kind := .Incorporates }



def edge_2423a_incorporates_2423h : Ref :=
  { source := "18 USC § 2423(a)", target := "18 USC § 2423(h)", kind := .Incorporates }



def edge_2423f_incorporates_2423ae : Ref :=
  { source := "18 USC § 2423(f)", target := "18 USC § 2423(a)-(e)", kind := .Incorporates }



def edge_2423g_lexSpecialis_2423 : Ref :=
  { source := "18 USC § 2423(g)", target := "18 USC § 2423", kind := .LexSpecialis }



def edge_2423h_lexSpecialis_2423 : Ref :=
  { source := "18 USC § 2423(h)", target := "18 USC § 2423", kind := .LexSpecialis }



def edge_2423i_exceptAsProvided_2423g2 : Ref :=
  { source := "18 USC § 2423(i)", target := "18 USC § 2423(g)(2)", kind := .ExceptAsProvided }



def edges : List Ref :=
  [ edge_2421Aa_incorporates_47usc230f
  , edge_2421Ab_incorporates_47usc230f
  , edge_2421Ab2_incorporates_1591a
  , edge_2421Ac_incorporates_2421Ab
  , edge_2421Ad_notwithstanding_3663
  , edge_2421Ad_notwithstanding_3663A
  , edge_2421Ad_incorporates_2327b
  , edge_2421Ad_incorporates_2421Ab2
  , edge_2421Ad_savings_otherPenalties
  , edge_2421Ae_exceptAsProvided_2421Aa
  , edge_2421Ae_exceptAsProvided_2421Ab1
  , edge_2423g1_incorporates_2246
  , edge_2423g1_incorporates_ch109A
  , edge_2423g2_incorporates_1591
  , edge_2423g3_incorporates_2256_8
  , edge_2423b_incorporates_2423g
  , edge_2423c_incorporates_2423g
  , edge_2423d3_incorporates_2423g
  , edge_2423e_incorporates_2423g
  , edge_2423a_incorporates_2423h
  , edge_2423f_incorporates_2423ae
  , edge_2423g_lexSpecialis_2423
  , edge_2423h_lexSpecialis_2423
  , edge_2423i_exceptAsProvided_2423g2 ]

end Proving.USC.T18.Ch117.Reslice.Structure
