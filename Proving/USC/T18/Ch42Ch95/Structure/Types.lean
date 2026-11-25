










import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Structure

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






def edge_892a_incorporates_891 : Ref :=
  { source := "18 USC § 892(a)", target := "18 USC § 891", kind := .Incorporates }



def edge_892a_incorporates_fineRegime : Ref :=
  { source := "18 USC § 892(a)", target := "18 USC (fine regime, \"fined under this title\")",
    kind := .Incorporates }




def edge_892b_savings_892a : Ref :=
  { source := "18 USC § 892(b)", target := "18 USC § 892(a)", kind := .Savings }



def edge_892c_incorporates_892b : Ref :=
  { source := "18 USC § 892(c)", target := "18 USC § 892(b)", kind := .Incorporates }




def edge_894a_incorporates_891 : Ref :=
  { source := "18 USC § 894(a)", target := "18 USC § 891", kind := .Incorporates }


def edge_894a_incorporates_fineRegime : Ref :=
  { source := "18 USC § 894(a)", target := "18 USC (fine regime, \"fined under this title\")",
    kind := .Incorporates }




def edge_894c_incorporates_892b1 : Ref :=
  { source := "18 USC § 894(c)", target := "18 USC § 892(b)(1)", kind := .Incorporates }


def edge_894c_incorporates_892b2 : Ref :=
  { source := "18 USC § 894(c)", target := "18 USC § 892(b)(2)", kind := .Incorporates }




def edge_1952a_incorporates_fineRegime : Ref :=
  { source := "18 USC § 1952(a)", target := "18 USC (fine regime, \"fined under this title\")",
    kind := .Incorporates }



def edge_1952b_incorporates_csa102_6 : Ref :=
  { source := "18 USC § 1952(b)(i)(1)", target := "Controlled Substances Act § 102(6)",
    kind := .Incorporates }



def edge_1952b_incorporates_t31ch53subchII : Ref :=
  { source := "18 USC § 1952(b)(i)(3)", target := "31 USC ch. 53, subch. II",
    kind := .Incorporates }




def edge_1952b_incorporates_1956 : Ref :=
  { source := "18 USC § 1952(b)(i)(3)", target := "18 USC § 1956", kind := .Incorporates }


def edge_1952b_incorporates_1957 : Ref :=
  { source := "18 USC § 1952(b)(i)(3)", target := "18 USC § 1957", kind := .Incorporates }



def edge_1952d_incorporates_670 : Ref :=
  { source := "18 USC § 1952(d)", target := "18 USC § 670", kind := .Incorporates }





def edge_1952d_lexSpecialis_670 : Ref :=
  { source := "18 USC § 1952(d)", target := "18 USC § 670", kind := .LexSpecialis }




def edge_1952a_exceptAsProvided_1952e : Ref :=
  { source := "18 USC § 1952(a)", target := "18 USC § 1952(e)", kind := .ExceptAsProvided }



def edge_1952e_incorporates_fcua101 : Ref :=
  { source := "18 USC § 1952(e)(2)(A)",
    target := "Federal Credit Union Act § 101 (12 U.S.C. 1752)", kind := .Incorporates }



def edge_1952e_incorporates_fdia3 : Ref :=
  { source := "18 USC § 1952(e)(2)(B)",
    target := "Federal Deposit Insurance Act § 3 (12 U.S.C. 1813)", kind := .Incorporates }



def edge_1952e_incorporates_cfpa1002 : Ref :=
  { source := "18 USC § 1952(e)(2)(C)",
    target := "Consumer Financial Protection Act of 2010 § 1002 (12 U.S.C. 5481)",
    kind := .Incorporates }





def edge_1956a1_incorporates_irc7201_7206 : Ref :=
  { source := "18 USC § 1956(a)(1)(A)(ii)",
    target := "Internal Revenue Code of 1986 §§ 7201, 7206", kind := .Incorporates }


def edge_1956a3_incorporates_fineRegime : Ref :=
  { source := "18 USC § 1956(a)(3)",
    target := "18 USC (fine regime, \"fined under this title\")", kind := .Incorporates }





def edge_1956b1_incorporates_1956a : Ref :=
  { source := "18 USC § 1956(b)(1)", target := "18 USC § 1956(a)", kind := .Incorporates }


def edge_1956b1_incorporates_1957 : Ref :=
  { source := "18 USC § 1956(b)(1)", target := "18 USC § 1957", kind := .Incorporates }



def edge_1956b2_incorporates_frcp : Ref :=
  { source := "18 USC § 1956(b)(2)", target := "Federal Rules of Civil Procedure",
    kind := .Incorporates }


def edge_1956b4_incorporates_981_982 : Ref :=
  { source := "18 USC § 1956(b)(4)(A)", target := "18 USC §§ 981, 982",
    kind := .Incorporates }



def edge_1956b4_incorporates_t28s754 : Ref :=
  { source := "18 USC § 1956(b)(4)(B)(ii)", target := "28 USC § 754", kind := .Incorporates }




def edge_1956c6_incorporates_t31s5312 : Ref :=
  { source := "18 USC § 1956(c)(6)(A)", target := "31 USC § 5312(a)(2)",
    kind := .Incorporates }



def edge_1956c6_incorporates_iba1 : Ref :=
  { source := "18 USC § 1956(c)(6)(B)",
    target := "International Banking Act of 1978 § 1 (12 U.S.C. 3101)",
    kind := .Incorporates }





def edge_1956c7A_incorporates_1961_1 : Ref :=
  { source := "18 USC § 1956(c)(7)(A)", target := "18 USC § 1961(1)",
    kind := .Incorporates }




def edge_1956c7A_exceptAsProvided_t31ch53subchII : Ref :=
  { source := "18 USC § 1956(c)(7)(A)", target := "31 USC ch. 53, subch. II",
    kind := .ExceptAsProvided }



def edge_1956c7B_incorporates_csa : Ref :=
  { source := "18 USC § 1956(c)(7)(B)(i)", target := "Controlled Substances Act",
    kind := .Incorporates }



def edge_1956c7B_incorporates_s16 : Ref :=
  { source := "18 USC § 1956(c)(7)(B)(ii)", target := "18 USC § 16",
    kind := .Incorporates }





def edge_1956c7B_incorporates_iba1b7 : Ref :=
  { source := "18 USC § 1956(c)(7)(B)(iii)",
    target := "International Banking Act of 1978 § 1(b)(7)", kind := .Incorporates }




def edge_1956c7B_incorporates_aeca38 : Ref :=
  { source := "18 USC § 1956(c)(7)(B)(v)",
    target := "Arms Export Control Act § 38 (22 U.S.C. 2778); 15 C.F.R. Parts 730–774",
    kind := .Incorporates }



def edge_1956c7C_incorporates_csa408 : Ref :=
  { source := "18 USC § 1956(c)(7)(C)",
    target := "Controlled Substances Act § 408 (21 U.S.C. 848)", kind := .Incorporates }










def edge_1956c7D_incorporates_enumerated : Ref :=
  { source := "18 USC § 1956(c)(7)(D)",
    target := "18 USC §§ 32–2339D (express enumeration); 49 USC § 46502; enumerated non-USC Acts",
    kind := .Incorporates }



def edge_1956c7E_incorporates_environmentalActs : Ref :=
  { source := "18 USC § 1956(c)(7)(E)",
    target := "Federal Water Pollution Control Act (33 U.S.C. 1251 et seq.); Ocean Dumping Act (33 U.S.C. 1401 et seq.); Act to Prevent Pollution from Ships (33 U.S.C. 1901 et seq.); Safe Drinking Water Act (42 U.S.C. 300f et seq.); Resources Conservation and Recovery Act (42 U.S.C. 6901 et seq.)",
    kind := .Incorporates }



def edge_1956c7G_incorporates_wildlifeActs : Ref :=
  { source := "18 USC § 1956(c)(7)(G)",
    target := "Endangered Species Act of 1973 § 9(a)(1) (16 U.S.C. 1538(a)(1)); African Elephant Conservation Act § 2203 (16 U.S.C. 4223); Rhinoceros and Tiger Conservation Act of 1994 § 7(a) (16 U.S.C. 5305a(a))",
    kind := .Incorporates }





def edge_1956d_savings_otherLaw : Ref :=
  { source := "18 USC § 1956(d)",
    target := "Federal, State, or other law imposing criminal penalties or affording civil remedies",
    kind := .Savings }




def edge_1956e_incorporates_1956c7E : Ref :=
  { source := "18 USC § 1956(e)", target := "18 USC § 1956(c)(7)(E)",
    kind := .Incorporates }



def edge_1956g_incorporates_1957_1960_t31 : Ref :=
  { source := "18 USC § 1956(g)",
    target := "18 USC §§ 1957, 1960; 31 USC §§ 5322, 5324", kind := .Incorporates }


def edge_1956h_incorporates_1957 : Ref :=
  { source := "18 USC § 1956(h)", target := "18 USC § 1957", kind := .Incorporates }



def edge_1956i1_exceptAsProvided_1956i2 : Ref :=
  { source := "18 USC § 1956(i)(1)", target := "18 USC § 1956(i)(2)",
    kind := .ExceptAsProvided }



def edge_1956i3_incorporates_1956c2 : Ref :=
  { source := "18 USC § 1956(i)(3)", target := "18 USC § 1956(c)(2)",
    kind := .Incorporates }





def edge_1956j_notwithstanding_3282 : Ref :=
  { source := "18 USC § 1956(j)", target := "18 USC § 3282", kind := .Notwithstanding }




def allRefs : List Ref :=
  [ edge_892a_incorporates_891, edge_892a_incorporates_fineRegime,
    edge_892b_savings_892a, edge_892c_incorporates_892b,
    edge_894a_incorporates_891, edge_894a_incorporates_fineRegime,
    edge_894c_incorporates_892b1, edge_894c_incorporates_892b2,
    edge_1952a_incorporates_fineRegime, edge_1952b_incorporates_csa102_6,
    edge_1952b_incorporates_t31ch53subchII, edge_1952b_incorporates_1956,
    edge_1952b_incorporates_1957, edge_1952d_incorporates_670,
    edge_1952d_lexSpecialis_670, edge_1952a_exceptAsProvided_1952e,
    edge_1952e_incorporates_fcua101, edge_1952e_incorporates_fdia3,
    edge_1952e_incorporates_cfpa1002,
    edge_1956a1_incorporates_irc7201_7206, edge_1956a3_incorporates_fineRegime,
    edge_1956b1_incorporates_1956a, edge_1956b1_incorporates_1957,
    edge_1956b2_incorporates_frcp, edge_1956b4_incorporates_981_982,
    edge_1956b4_incorporates_t28s754, edge_1956c6_incorporates_t31s5312,
    edge_1956c6_incorporates_iba1, edge_1956c7A_incorporates_1961_1,
    edge_1956c7A_exceptAsProvided_t31ch53subchII, edge_1956c7B_incorporates_csa,
    edge_1956c7B_incorporates_s16, edge_1956c7B_incorporates_iba1b7,
    edge_1956c7B_incorporates_aeca38, edge_1956c7C_incorporates_csa408,
    edge_1956c7D_incorporates_enumerated,
    edge_1956c7E_incorporates_environmentalActs,
    edge_1956c7G_incorporates_wildlifeActs, edge_1956d_savings_otherLaw,
    edge_1956e_incorporates_1956c7E, edge_1956g_incorporates_1957_1960_t31,
    edge_1956h_incorporates_1957, edge_1956i1_exceptAsProvided_1956i2,
    edge_1956i3_incorporates_1956c2, edge_1956j_notwithstanding_3282 ]



def inSliceRefs : List Ref :=
  [ edge_892b_savings_892a, edge_892c_incorporates_892b,
    edge_894c_incorporates_892b1, edge_894c_incorporates_892b2,
    edge_1952b_incorporates_1956, edge_1952a_exceptAsProvided_1952e,
    edge_1956b1_incorporates_1956a, edge_1956e_incorporates_1956c7E,
    edge_1956i1_exceptAsProvided_1956i2, edge_1956i3_incorporates_1956c2 ]



def danglingRefs : List Ref :=
  [ edge_892a_incorporates_891, edge_892a_incorporates_fineRegime,
    edge_894a_incorporates_891, edge_894a_incorporates_fineRegime,
    edge_1952a_incorporates_fineRegime, edge_1952b_incorporates_csa102_6,
    edge_1952b_incorporates_t31ch53subchII, edge_1952b_incorporates_1957,
    edge_1952d_incorporates_670, edge_1952d_lexSpecialis_670,
    edge_1952e_incorporates_fcua101, edge_1952e_incorporates_fdia3,
    edge_1952e_incorporates_cfpa1002, edge_1956a1_incorporates_irc7201_7206,
    edge_1956a3_incorporates_fineRegime, edge_1956b1_incorporates_1957,
    edge_1956b2_incorporates_frcp, edge_1956b4_incorporates_981_982,
    edge_1956b4_incorporates_t28s754, edge_1956c6_incorporates_t31s5312,
    edge_1956c6_incorporates_iba1, edge_1956c7A_incorporates_1961_1,
    edge_1956c7A_exceptAsProvided_t31ch53subchII, edge_1956c7B_incorporates_csa,
    edge_1956c7B_incorporates_s16, edge_1956c7B_incorporates_iba1b7,
    edge_1956c7B_incorporates_aeca38, edge_1956c7C_incorporates_csa408,
    edge_1956c7D_incorporates_enumerated,
    edge_1956c7E_incorporates_environmentalActs,
    edge_1956c7G_incorporates_wildlifeActs, edge_1956d_savings_otherLaw,
    edge_1956g_incorporates_1957_1960_t31, edge_1956h_incorporates_1957,
    edge_1956j_notwithstanding_3282 ]

end Proving.USC.T18.Ch42Ch95.Structure
