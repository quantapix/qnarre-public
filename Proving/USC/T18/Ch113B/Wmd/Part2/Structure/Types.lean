import Proving.USC.Common.Types















set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Structure

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
  deriving DecidableEq, Repr














def edge_2332b_a1_incorporates_b : Ref :=
  { source := "18 USC § 2332b(a)(1)", target := "18 USC § 2332b(b)", kind := .Incorporates }



def edge_2332b_b1_incorporates_a : Ref :=
  { source := "18 USC § 2332b(b)(1)", target := "18 USC § 2332b(a)", kind := .Incorporates }


def edge_2332b_a1_subjectTo_c : Ref :=
  { source := "18 USC § 2332b(a)(1)", target := "18 USC § 2332b(c)", kind := .SubjectTo }


def edge_2332b_a2_incorporates_a1 : Ref :=
  { source := "18 USC § 2332b(a)(2)", target := "18 USC § 2332b(a)(1)", kind := .Incorporates }


def edge_2332b_a2_subjectTo_c : Ref :=
  { source := "18 USC § 2332b(a)(2)", target := "18 USC § 2332b(c)", kind := .SubjectTo }



def edge_2332b_b2_incorporates_b1AF : Ref :=
  { source := "18 USC § 2332b(b)(2)", target := "18 USC § 2332b(b)(1)", kind := .Incorporates }



def edge_2332b_c1_incorporates_a : Ref :=
  { source := "18 USC § 2332b(c)(1)", target := "18 USC § 2332b(a)", kind := .Incorporates }


def edge_2332b_d_incorporates_a : Ref :=
  { source := "18 USC § 2332b(d)", target := "18 USC § 2332b(a)", kind := .Incorporates }




def edge_2332b_d1_lexSpecialis_b : Ref :=
  { source := "18 USC § 2332b(d)(1)", target := "18 USC § 2332b(b)", kind := .LexSpecialis }




def edge_2332b_d2_lexSpecialis_a1StateLaw : Ref :=
  { source := "18 USC § 2332b(d)(2)", target := "18 USC § 2332b(a)(1)", kind := .LexSpecialis }


def edge_2332b_e1_incorporates_a : Ref :=
  { source := "18 USC § 2332b(e)(1)", target := "18 USC § 2332b(a)", kind := .Incorporates }





def edge_2332b_c2_notwithstanding_probation : Ref :=
  { source := "18 USC § 2332b(c)(2)", target := "any other provision of law (probation authority)", kind := .Notwithstanding }




def edge_2332b_c2_notwithstanding_concurrentTerm : Ref :=
  { source := "18 USC § 2332b(c)(2)", target := "any other provision of law (concurrent-sentence authority)", kind := .Notwithstanding }




def edge_2332b_a1_incorporates_b1A : Ref :=
  { source := "18 USC § 2332b(a)(1)", target := "18 USC § 2332b(b)(1)(A)", kind := .Incorporates }


def edge_2332b_a1_incorporates_b1B : Ref :=
  { source := "18 USC § 2332b(a)(1)", target := "18 USC § 2332b(b)(1)(B)", kind := .Incorporates }


def edge_2332b_a1_incorporates_b1C : Ref :=
  { source := "18 USC § 2332b(a)(1)", target := "18 USC § 2332b(b)(1)(C)", kind := .Incorporates }


def edge_2332b_a1_incorporates_b1D : Ref :=
  { source := "18 USC § 2332b(a)(1)", target := "18 USC § 2332b(b)(1)(D)", kind := .Incorporates }


def edge_2332b_a1_incorporates_b1E : Ref :=
  { source := "18 USC § 2332b(a)(1)", target := "18 USC § 2332b(b)(1)(E)", kind := .Incorporates }



def edge_2332b_a1_incorporates_b1F : Ref :=
  { source := "18 USC § 2332b(a)(1)", target := "18 USC § 2332b(b)(1)(F)", kind := .Incorporates }




def edge_2332b_a1_incorporates_g1 : Ref :=
  { source := "18 USC § 2332b(a)(1)", target := "18 USC § 2332b(g)(1)", kind := .Incorporates }


def edge_2332b_b1A_incorporates_g2 : Ref :=
  { source := "18 USC § 2332b(b)(1)(A)", target := "18 USC § 2332b(g)(2)", kind := .Incorporates }




def edge_2332b_a1_incorporates_g3 : Ref :=
  { source := "18 USC § 2332b(a)(1)", target := "18 USC § 2332b(g)(3)", kind := .Incorporates }


def edge_2332b_b1E_incorporates_g4 : Ref :=
  { source := "18 USC § 2332b(b)(1)(E)", target := "18 USC § 2332b(g)(4)", kind := .Incorporates }




def edge_2332b_f_incorporates_g5 : Ref :=
  { source := "18 USC § 2332b(f)", target := "18 USC § 2332b(g)(5)", kind := .Incorporates }






def edge_2332b_a1_incorporates_stateLaw : Ref :=
  { source := "18 USC § 2332b(a)(1)", target := "the laws of any State", kind := .Incorporates }



def edge_2332b_b1F_incorporates_s7 : Ref :=
  { source := "18 USC § 2332b(b)(1)(F)", target := "18 USC § 7", kind := .Incorporates }



def edge_2332b_e2_incorporates_s3 : Ref :=
  { source := "18 USC § 2332b(e)(2)", target := "18 USC § 3", kind := .Incorporates }



def edge_2332b_f_savings_s3056 : Ref :=
  { source := "18 USC § 2332b(f)", target := "18 USC § 3056", kind := .Savings }






def edge_2332b_f_incorporates_t18Complement : Ref :=
  { source := "18 USC § 2332b(f)", target := "18 USC § 351(e), 844(e), 844(f)(1), 956(b), 1361, 1366(b), 1366(c), 1751(e), 2152, 2156", kind := .Incorporates }


def edge_2332b_g2_incorporates_1958b2 : Ref :=
  { source := "18 USC § 2332b(g)(2)", target := "18 USC § 1958(b)(2)", kind := .Incorporates }









def edge_2332b_g3_incorporates_1365g3 : Ref :=
  { source := "18 USC § 2332b(g)(3)", target := "18 USC § 1365(g)(3)", kind := .Incorporates }



def edge_2332b_g3_incorporates_1365h3_evidentSense : Ref :=
  { source := "18 USC § 2332b(g)(3)", target := "18 USC § 1365(h)(3)", kind := .Incorporates }



def edge_2332b_g5Bi_incorporates_t18Roster : Ref :=
  { source := "18 USC § 2332b(g)(5)(B)(i)", target := "18 USC ch. 1–113B roster (44 cite items)", kind := .Incorporates }





def edge_2332b_g5Bi_incorporates_self : Ref :=
  { source := "18 USC § 2332b(g)(5)(B)(i)", target := "18 USC § 2332b", kind := .Incorporates }



def edge_2332b_g5Bii_incorporates_aea : Ref :=
  { source := "18 USC § 2332b(g)(5)(B)(ii)", target := "42 USC § 2122; 42 USC § 2284", kind := .Incorporates }





def edge_2332b_g5Biii_incorporates_t49 : Ref :=
  { source := "18 USC § 2332b(g)(5)(B)(iii)", target := "49 USC § 46502; 49 USC § 46504 (second sentence); 49 USC § 46505(b)(3), (c); 49 USC § 46506; 49 USC § 60123(b)", kind := .Incorporates }




def edge_2332b_g5Biv_incorporates_csiea1010a : Ref :=
  { source := "18 USC § 2332b(g)(5)(B)(iv)", target := "21 USC § 960a", kind := .Incorporates }

end Proving.USC.T18.Ch113B.Wmd.Part2.Structure
