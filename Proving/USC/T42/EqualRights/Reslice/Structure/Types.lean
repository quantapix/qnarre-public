









import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Structure

open Proving.USC.Common


inductive EdgeKind where

  | Incorporates

  | SubjectTo

  | Notwithstanding

  | ExceptAsProvided

  | Savings

  | LexSpecialis
  deriving DecidableEq, Repr




inductive Locus where

  | InSlice

  | InTitleOutOfSlice

  | CrossTitle


  | ExtraUSC
  deriving DecidableEq, Repr



structure Ref where
  source : String
  target : String
  kind   : EdgeKind
  locus  : Locus
  deriving DecidableEq, Repr



opaque EnforcementProceeding : Type



opaque IncorporatedTerm : Type







def edge_1981a_incorporates_1981b : Ref :=
  { source := "42 USC § 1981(a)", target := "42 USC § 1981(b)",
    kind := .Incorporates, locus := .InSlice }




def edge_1981a_incorporates_1981c : Ref :=
  { source := "42 USC § 1981(a)", target := "42 USC § 1981(c)",
    kind := .Incorporates, locus := .InSlice }





def edge_1981a_incorporates_2000e5 : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 2000e-5",
    kind := .Incorporates, locus := .InTitleOutOfSlice }




def edge_1981a_incorporates_2000e2 : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 2000e-2",
    kind := .Incorporates, locus := .InTitleOutOfSlice }




def edge_1981a_subjectTo_1981 : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 1981",
    kind := .SubjectTo, locus := .InSlice }



def edge_1981a_incorporates_2000e5g : Ref :=
  { source := "42 USC § 1981a(a)", target := "42 USC § 2000e-5(g)",
    kind := .Incorporates, locus := .InTitleOutOfSlice }



def edge_1981a_incorporates_12117a : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "42 USC § 12117(a)",
    kind := .Incorporates, locus := .InTitleOutOfSlice }



def edge_1981a_incorporates_29_794a : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "29 USC § 794a(a)(1)",
    kind := .Incorporates, locus := .CrossTitle }




def edge_1981a_incorporates_29_791 : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "29 USC § 791",
    kind := .Incorporates, locus := .CrossTitle }



def edge_1981a_incorporates_12112 : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "42 USC § 12112",
    kind := .Incorporates, locus := .InTitleOutOfSlice }




def edge_1981a_a2_exceptAsProvided_a3 : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "42 USC § 1981a(a)(3)",
    kind := .ExceptAsProvided, locus := .InSlice }



def edge_1981a_a3_incorporates_12112b5 : Ref :=
  { source := "42 USC § 1981a(a)(3)", target := "42 USC § 12112(b)(5)",
    kind := .Incorporates, locus := .InTitleOutOfSlice }



def edge_1981a_a_incorporates_b : Ref :=
  { source := "42 USC § 1981a(a)", target := "42 USC § 1981a(b)",
    kind := .Incorporates, locus := .InSlice }





def edge_1981a_b2_incorporates_2000e5g : Ref :=
  { source := "42 USC § 1981a(b)(2)", target := "42 USC § 2000e-5(g)",
    kind := .Incorporates, locus := .InTitleOutOfSlice }



def edge_1981a_b4_savings_1981 : Ref :=
  { source := "42 USC § 1981a(b)(4)", target := "42 USC § 1981",
    kind := .Savings, locus := .InSlice }



def edge_1981a_c2_incorporates_b3 : Ref :=
  { source := "42 USC § 1981a(c)(2)", target := "42 USC § 1981a(b)(3)",
    kind := .Incorporates, locus := .InSlice }




def edge_1981a_a_incorporates_d1 : Ref :=
  { source := "42 USC § 1981a(a)", target := "42 USC § 1981a(d)(1)",
    kind := .Incorporates, locus := .InSlice }



def edge_1981a_d1_incorporates_2000e : Ref :=
  { source := "42 USC § 1981a(d)(1)(A)", target := "42 USC § 2000e et seq.",
    kind := .Incorporates, locus := .InTitleOutOfSlice }




def edge_1981a_d1_incorporates_12111 : Ref :=
  { source := "42 USC § 1981a(d)(1)(B)", target := "42 USC § 12111 et seq.",
    kind := .Incorporates, locus := .InTitleOutOfSlice }




def edge_1981a_d2_incorporates_a : Ref :=
  { source := "42 USC § 1981a(d)(2)", target := "42 USC § 1981a(a)",
    kind := .Incorporates, locus := .InSlice }







def edge_1983_incorporates_securedRights : Ref :=
  { source := "42 USC § 1983",
    target := "U.S. Const. and laws of the United States (rights secured)",
    kind := .Incorporates, locus := .ExtraUSC }





def edge_1983_exceptAsProvided_judicialOfficer : Ref :=
  { source := "42 USC § 1983",
    target := "42 USC § 1983 (judicial-officer injunctive proviso)",
    kind := .ExceptAsProvided, locus := .InSlice }





def edge_1983_incorporates_dcDeeming : Ref :=
  { source := "42 USC § 1983",
    target := "42 USC § 1983 (District of Columbia deeming clause)",
    kind := .Incorporates, locus := .InSlice }









def edge_1985_1_incorporates_remedy : Ref :=
  { source := "42 USC § 1985(1)",
    target := "42 USC § 1985(3) (section-wide remedial clause)",
    kind := .Incorporates, locus := .InSlice }


def edge_1985_2_incorporates_remedy : Ref :=
  { source := "42 USC § 1985(2)",
    target := "42 USC § 1985(3) (section-wide remedial clause)",
    kind := .Incorporates, locus := .InSlice }



def edge_1985_3_incorporates_remedy : Ref :=
  { source := "42 USC § 1985(3)",
    target := "42 USC § 1985(3) (section-wide remedial clause)",
    kind := .Incorporates, locus := .InSlice }






def edge_1986_incorporates_1985 : Ref :=
  { source := "42 USC § 1986", target := "42 USC § 1985",
    kind := .Incorporates, locus := .InSlice }




def edge_1986_subjectTo_oneYearBar : Ref :=
  { source := "42 USC § 1986",
    target := "42 USC § 1986 (one-year limitations proviso)",
    kind := .SubjectTo, locus := .InSlice }






def edge_1988a_incorporates_revisedStatutes : Ref :=
  { source := "42 USC § 1988(a)",
    target := "R.S. titles 13, 24, 70 (jurisdiction conferred)",
    kind := .Incorporates, locus := .ExtraUSC }




def edge_1988a_incorporates_usLaws : Ref :=
  { source := "42 USC § 1988(a)",
    target := "laws of the United States (rules of decision)",
    kind := .Incorporates, locus := .ExtraUSC }






def edge_1988a_exceptAsProvided_stateCommonLaw : Ref :=
  { source := "42 USC § 1988(a)",
    target := "State common law and constitution (deficiency fallback)",
    kind := .ExceptAsProvided, locus := .ExtraUSC }



def edge_1988a_stateLaw_subjectTo_federal : Ref :=
  { source := "42 USC § 1988(a) (borrowed State law)",
    target := "U.S. Const. and laws of the United States",
    kind := .SubjectTo, locus := .ExtraUSC }


def edge_1988b_incorporates_1981 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1981",
    kind := .Incorporates, locus := .InSlice }


def edge_1988b_incorporates_1981a : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1981a",
    kind := .Incorporates, locus := .InSlice }




def edge_1988b_incorporates_1982 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1982",
    kind := .Incorporates, locus := .InSlice }


def edge_1988b_incorporates_1983 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1983",
    kind := .Incorporates, locus := .InSlice }


def edge_1988b_incorporates_1985 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1985",
    kind := .Incorporates, locus := .InSlice }


def edge_1988b_incorporates_1986 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1986",
    kind := .Incorporates, locus := .InSlice }


def edge_1988b_incorporates_20_1681 : Ref :=
  { source := "42 USC § 1988(b)", target := "20 USC § 1681 et seq.",
    kind := .Incorporates, locus := .CrossTitle }



def edge_1988b_incorporates_2000bb : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 2000bb et seq.",
    kind := .Incorporates, locus := .InTitleOutOfSlice }



def edge_1988b_incorporates_2000cc : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 2000cc et seq.",
    kind := .Incorporates, locus := .InTitleOutOfSlice }



def edge_1988b_incorporates_2000d : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 2000d et seq.",
    kind := .Incorporates, locus := .InTitleOutOfSlice }


def edge_1988b_incorporates_34_12361 : Ref :=
  { source := "42 USC § 1988(b)", target := "34 USC § 12361",
    kind := .Incorporates, locus := .CrossTitle }



def edge_1988b_enforcementGate : Ref :=
  { source := "42 USC § 1988(b)",
    target := "42 USC § 1988(b) (enumerated enforcement laws)",
    kind := .Incorporates, locus := .InSlice }





def edge_1988b_exceptAsProvided_judicialOfficer : Ref :=
  { source := "42 USC § 1988(b)",
    target := "42 USC § 1988(b) (judicial-officer cost proviso)",
    kind := .ExceptAsProvided, locus := .InSlice }




def edge_1988c_lexSpecialis_1988b : Ref :=
  { source := "42 USC § 1988(c)", target := "42 USC § 1988(b)",
    kind := .LexSpecialis, locus := .InSlice }




def edge_1988c_incorporates_1981_1981a : Ref :=
  { source := "42 USC § 1988(c)",
    target := "42 USC §§ 1981, 1981a (expert-fee scope)",
    kind := .Incorporates, locus := .InSlice }



def edges : List Ref :=
  [ edge_1981a_incorporates_1981b, edge_1981a_incorporates_1981c
  , edge_1981a_incorporates_2000e5, edge_1981a_incorporates_2000e2
  , edge_1981a_subjectTo_1981, edge_1981a_incorporates_2000e5g
  , edge_1981a_incorporates_12117a, edge_1981a_incorporates_29_794a
  , edge_1981a_incorporates_29_791, edge_1981a_incorporates_12112
  , edge_1981a_a2_exceptAsProvided_a3, edge_1981a_a3_incorporates_12112b5
  , edge_1981a_a_incorporates_b, edge_1981a_b2_incorporates_2000e5g
  , edge_1981a_b4_savings_1981, edge_1981a_c2_incorporates_b3
  , edge_1981a_a_incorporates_d1, edge_1981a_d1_incorporates_2000e
  , edge_1981a_d1_incorporates_12111, edge_1981a_d2_incorporates_a
  , edge_1983_incorporates_securedRights
  , edge_1983_exceptAsProvided_judicialOfficer
  , edge_1983_incorporates_dcDeeming
  , edge_1985_1_incorporates_remedy, edge_1985_2_incorporates_remedy
  , edge_1985_3_incorporates_remedy
  , edge_1986_incorporates_1985, edge_1986_subjectTo_oneYearBar
  , edge_1988a_incorporates_revisedStatutes, edge_1988a_incorporates_usLaws
  , edge_1988a_exceptAsProvided_stateCommonLaw
  , edge_1988a_stateLaw_subjectTo_federal
  , edge_1988b_incorporates_1981, edge_1988b_incorporates_1981a
  , edge_1988b_incorporates_1982, edge_1988b_incorporates_1983
  , edge_1988b_incorporates_1985, edge_1988b_incorporates_1986
  , edge_1988b_incorporates_20_1681, edge_1988b_incorporates_2000bb
  , edge_1988b_incorporates_2000cc, edge_1988b_incorporates_2000d
  , edge_1988b_incorporates_34_12361, edge_1988b_enforcementGate
  , edge_1988b_exceptAsProvided_judicialOfficer
  , edge_1988c_lexSpecialis_1988b, edge_1988c_incorporates_1981_1981a ]

end Proving.USC.T42.EqualRights.Reslice.Structure
