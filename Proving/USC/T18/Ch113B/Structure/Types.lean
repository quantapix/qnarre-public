







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Structure

open Proving.USC.Common



inductive EdgeKind where

  | Incorporates

  | SubjectTo

  | Notwithstanding

  | ExceptAsProvided

  | Savings

  | LexSpecialis




inductive RefScope where

  | SameChapter

  | SameTitle

  | CrossTitle


  | OutsideCode


  | Unnamed




structure Ref where
  source : String
  target : String
  kind   : EdgeKind
  scope  : RefScope




def edge_ch113B_incorporates_2331 : Ref :=
  { source := "18 USC ch. 113B", target := "18 USC § 2331",
    kind := .Incorporates, scope := .SameChapter }


def edge_ch113B_incorporates_2331_2 : Ref :=
  { source := "18 USC ch. 113B", target := "18 USC § 2331(2)",
    kind := .Incorporates, scope := .SameChapter }


def edge_2331_1A_incorporates_criminalLaws : Ref :=
  { source := "18 USC § 2331(1)(A)",
    target := "criminal laws of the United States or of any State",
    kind := .Incorporates, scope := .Unnamed }


def edge_2331_2_incorporates_ina101a22 : Ref :=
  { source := "18 USC § 2331(2)",
    target := "Immigration and Nationality Act § 101(a)(22) (8 USC § 1101(a)(22))",
    kind := .Incorporates, scope := .CrossTitle }


def edge_2331_5A_incorporates_criminalLaws : Ref :=
  { source := "18 USC § 2331(5)(A)",
    target := "criminal laws of the United States or of any State",
    kind := .Incorporates, scope := .Unnamed }


def edge_2331_6Ai_incorporates_ina219 : Ref :=
  { source := "18 USC § 2331(6)(A)(i)",
    target := "Immigration and Nationality Act § 219 (8 USC § 1189)",
    kind := .Incorporates, scope := .CrossTitle }




def edge_2331_6Aii_incorporates_cfr594310 : Ref :=
  { source := "18 USC § 2331(6)(A)(ii)", target := "31 C.F.R. § 594.310",
    kind := .Incorporates, scope := .OutsideCode }




def edge_2332_a_incorporates_2331_2 : Ref :=
  { source := "18 USC § 2332(a)", target := "18 USC § 2331(2)",
    kind := .Incorporates, scope := .SameChapter }


def edge_2332_a1_incorporates_1111a : Ref :=
  { source := "18 USC § 2332(a)(1)", target := "18 USC § 1111(a)",
    kind := .Incorporates, scope := .SameTitle }


def edge_2332_a2_incorporates_1112a : Ref :=
  { source := "18 USC § 2332(a)(2)", target := "18 USC § 1112(a)",
    kind := .Incorporates, scope := .SameTitle }


def edge_2332_a3_incorporates_1112a : Ref :=
  { source := "18 USC § 2332(a)(3)", target := "18 USC § 1112(a)",
    kind := .Incorporates, scope := .SameTitle }





def edge_2332_b1_incorporates_chapterMurder : Ref :=
  { source := "18 USC § 2332(b)(1)", target := "18 USC ch. 113B (\"murder as defined in this chapter\")",
    kind := .Incorporates, scope := .SameChapter }


def edge_2332_b2_incorporates_1111a : Ref :=
  { source := "18 USC § 2332(b)(2)", target := "18 USC § 1111(a)",
    kind := .Incorporates, scope := .SameTitle }




def edge_2332a_c1_incorporates_ina101a22 : Ref :=
  { source := "18 USC § 2332a(c)(1)",
    target := "Immigration and Nationality Act § 101(a)(22) (8 USC § 1101(a)(22))",
    kind := .Incorporates, scope := .CrossTitle }



def edge_2332a_c1_lexSpecialis_2331_2 : Ref :=
  { source := "18 USC § 2332a(c)(1)", target := "18 USC § 2331(2)",
    kind := .LexSpecialis, scope := .SameChapter }


def edge_2332a_c2A_incorporates_921 : Ref :=
  { source := "18 USC § 2332a(c)(2)(A)", target := "18 USC § 921",
    kind := .Incorporates, scope := .SameTitle }



def edge_2332a_c2C_incorporates_178 : Ref :=
  { source := "18 USC § 2332a(c)(2)(C)", target := "18 USC § 178",
    kind := .Incorporates, scope := .SameTitle }





def edge_2332b_a1_incorporates_stateFedLaws : Ref :=
  { source := "18 USC § 2332b(a)(1)", target := "laws of any State, or the United States",
    kind := .Incorporates, scope := .Unnamed }



def edge_2332b_c2_notwithstanding_otherLaw : Ref :=
  { source := "18 USC § 2332b(c)(2)", target := "any other provision of law",
    kind := .Notwithstanding, scope := .Unnamed }




def edge_2332b_d2_incorporates_stateLawElements : Ref :=
  { source := "18 USC § 2332b(d)(2)", target := "State law (elements of the offense only)",
    kind := .Incorporates, scope := .Unnamed }



def edge_2332b_e2_incorporates_s3 : Ref :=
  { source := "18 USC § 2332b(e)(2)", target := "18 USC § 3",
    kind := .Incorporates, scope := .SameTitle }



def edge_2332b_f_incorporates_investigativeCatalog : Ref :=
  { source := "18 USC § 2332b(f)",
    target := "18 USC §§ 351(e), 844(e), 844(f)(1), 956(b), 1361, 1366(b), 1366(c), 1751(e), 2152, 2156",
    kind := .Incorporates, scope := .SameTitle }



def edge_2332b_f_savings_3056 : Ref :=
  { source := "18 USC § 2332b(f)", target := "18 USC § 3056",
    kind := .Savings, scope := .SameTitle }


def edge_2332b_g2_incorporates_1958b2 : Ref :=
  { source := "18 USC § 2332b(g)(2)", target := "18 USC § 1958(b)(2)",
    kind := .Incorporates, scope := .SameTitle }




def edge_2332b_g3_incorporates_1365g3 : Ref :=
  { source := "18 USC § 2332b(g)(3)", target := "18 USC § 1365(g)(3)",
    kind := .Incorporates, scope := .SameTitle }



def edge_2332b_g5Bi_incorporates_title18Catalog : Ref :=
  { source := "18 USC § 2332b(g)(5)(B)(i)",
    target := "18 USC §§ 32, 37, 81, 175, 175b, 175c, 229, 351, 831, 832, 842, 844, 930, 956, 1030, 1114, 1116, 1203, 1361, 1362, 1363, 1366, 1751, 1992, 2155, 2156, 2280, 2280a, 2281–2281a, 2332, 2332a, 2332b, 2332f, 2332g, 2332h, 2332i, 2339, 2339A, 2339B, 2339C, 2339D, 2340A",
    kind := .Incorporates, scope := .SameTitle }


def edge_2332b_g5Bii_incorporates_aea : Ref :=
  { source := "18 USC § 2332b(g)(5)(B)(ii)",
    target := "Atomic Energy Act of 1954 §§ 92, 236 (42 USC §§ 2122, 2284)",
    kind := .Incorporates, scope := .CrossTitle }


def edge_2332b_g5Biii_incorporates_title49Catalog : Ref :=
  { source := "18 USC § 2332b(g)(5)(B)(iii)",
    target := "49 USC §§ 46502, 46504, 46505(b)(3), 46505(c), 46506, 60123(b)",
    kind := .Incorporates, scope := .CrossTitle }


def edge_2332b_g5Biv_incorporates_csiea1010a : Ref :=
  { source := "18 USC § 2332b(g)(5)(B)(iv)",
    target := "Controlled Substances Import and Export Act § 1010A (21 USC § 960a)",
    kind := .Incorporates, scope := .CrossTitle }








def edge_2332d_a_exceptAsProvided_treasuryRegs : Ref :=
  { source := "18 USC § 2332d(a)",
    target := "regulations issued by the Secretary of the Treasury, in consultation with the Secretary of State",
    kind := .ExceptAsProvided, scope := .Unnamed }




def edge_2332d_a_incorporates_eaa6j : Ref :=
  { source := "18 USC § 2332d(a)",
    target := "Export Administration Act of 1979 § 6(j) (50 USC App. 2405)",
    kind := .Incorporates, scope := .OutsideCode }


def edge_2332d_b1_incorporates_1956c4 : Ref :=
  { source := "18 USC § 2332d(b)(1)", target := "18 USC § 1956(c)(4)",
    kind := .Incorporates, scope := .SameTitle }







def edge_2332e_incorporates_t10s382 : Ref :=
  { source := "18 USC § 2332e", target := "10 USC § 382",
    kind := .Incorporates, scope := .CrossTitle }



def edge_2332e_incorporates_t10s382f2 : Ref :=
  { source := "18 USC § 2332e", target := "10 USC § 382(f)(2)",
    kind := .Incorporates, scope := .CrossTitle }


def edge_2332e_incorporates_2332a : Ref :=
  { source := "18 USC § 2332e", target := "18 USC § 2332a",
    kind := .Incorporates, scope := .SameChapter }





def edge_2332f_c_incorporates_2332a_a : Ref :=
  { source := "18 USC § 2332f(c)", target := "18 USC § 2332a(a)",
    kind := .Incorporates, scope := .SameChapter }



def edge_2332f_d1_savings_lawOfWar : Ref :=
  { source := "18 USC § 2332f(d)(1)", target := "the law of war",
    kind := .Savings, scope := .Unnamed }


def edge_2332f_a_exceptAsProvided_d1 : Ref :=
  { source := "18 USC § 2332f(a)", target := "18 USC § 2332f(d)(1)",
    kind := .ExceptAsProvided, scope := .SameChapter }


def edge_2332f_a_exceptAsProvided_d2 : Ref :=
  { source := "18 USC § 2332f(a)", target := "18 USC § 2332f(d)(2)",
    kind := .ExceptAsProvided, scope := .SameChapter }



def edge_2332f_a_exceptAsProvided_d3 : Ref :=
  { source := "18 USC § 2332f(a)", target := "18 USC § 2332f(d)(3)",
    kind := .ExceptAsProvided, scope := .SameChapter }



def edge_2332f_e1_incorporates_1365g3 : Ref :=
  { source := "18 USC § 2332f(e)(1)", target := "18 USC § 1365(g)(3)",
    kind := .Incorporates, scope := .SameTitle }


def edge_2332f_e2_incorporates_ina101a22 : Ref :=
  { source := "18 USC § 2332f(e)(2)",
    target := "Immigration and Nationality Act § 101(a)(22) (8 USC § 1101(a)(22))",
    kind := .Incorporates, scope := .CrossTitle }


def edge_2332f_e2_lexSpecialis_2331_2 : Ref :=
  { source := "18 USC § 2332f(e)(2)", target := "18 USC § 2331(2)",
    kind := .LexSpecialis, scope := .SameChapter }


def edge_2332f_e4_incorporates_1116b5 : Ref :=
  { source := "18 USC § 2332f(e)(4)", target := "18 USC § 1116(b)(5)",
    kind := .Incorporates, scope := .SameTitle }



def edge_2332f_e8_incorporates_844j : Ref :=
  { source := "18 USC § 2332f(e)(8)", target := "18 USC § 844(j)",
    kind := .Incorporates, scope := .SameTitle }



def edge_2332f_e9_incorporates_178 : Ref :=
  { source := "18 USC § 2332f(e)(9)", target := "18 USC § 178",
    kind := .Incorporates, scope := .SameTitle }




def edge_2332g_a1_exceptAsProvided_a3 : Ref :=
  { source := "18 USC § 2332g(a)(1)", target := "18 USC § 2332g(a)(3)",
    kind := .ExceptAsProvided, scope := .SameChapter }



def edge_2332g_a1A_exceptAsProvided_a2 : Ref :=
  { source := "18 USC § 2332g(a)(1)(A)", target := "18 USC § 2332g(a)(2)",
    kind := .ExceptAsProvided, scope := .SameChapter }



def edge_2332g_b_incorporates_2331_2 : Ref :=
  { source := "18 USC § 2332g(b)", target := "18 USC § 2331(2)",
    kind := .Incorporates, scope := .SameChapter }


def edge_2332g_d_incorporates_t49_40102a6 : Ref :=
  { source := "18 USC § 2332g(d)", target := "49 USC § 40102(a)(6)",
    kind := .Incorporates, scope := .CrossTitle }




def edge_2332h_a1_exceptAsProvided_a2 : Ref :=
  { source := "18 USC § 2332h(a)(1)", target := "18 USC § 2332h(a)(2)",
    kind := .ExceptAsProvided, scope := .SameChapter }



def edge_2332h_b_incorporates_2331_2 : Ref :=
  { source := "18 USC § 2332h(b)", target := "18 USC § 2331(2)",
    kind := .Incorporates, scope := .SameChapter }





def edge_2332i_b2B_incorporates_t46_70502 : Ref :=
  { source := "18 USC § 2332i(b)(2)(B)", target := "46 USC § 70502",
    kind := .Incorporates, scope := .CrossTitle }



def edge_2332i_d1_savings_lawOfWar : Ref :=
  { source := "18 USC § 2332i(d)(1)", target := "the law of war",
    kind := .Savings, scope := .Unnamed }


def edge_2332i_a_exceptAsProvided_d1 : Ref :=
  { source := "18 USC § 2332i(a)", target := "18 USC § 2332i(d)(1)",
    kind := .ExceptAsProvided, scope := .SameChapter }


def edge_2332i_a_exceptAsProvided_d2 : Ref :=
  { source := "18 USC § 2332i(a)", target := "18 USC § 2332i(d)(2)",
    kind := .ExceptAsProvided, scope := .SameChapter }


def edge_2332i_e1_incorporates_2332f_e11 : Ref :=
  { source := "18 USC § 2332i(e)(1)", target := "18 USC § 2332f(e)(11)",
    kind := .Incorporates, scope := .SameChapter }




def edge_2332i_e3_incorporates_831f3 : Ref :=
  { source := "18 USC § 2332i(e)(3)", target := "18 USC § 831(f)(3)",
    kind := .Incorporates, scope := .SameTitle }


def edge_2332i_e5_incorporates_ina101a22 : Ref :=
  { source := "18 USC § 2332i(e)(5)",
    target := "Immigration and Nationality Act § 101(a)(22) (8 USC § 1101(a)(22))",
    kind := .Incorporates, scope := .CrossTitle }


def edge_2332i_e5_lexSpecialis_2331_2 : Ref :=
  { source := "18 USC § 2332i(e)(5)", target := "18 USC § 2331(2)",
    kind := .LexSpecialis, scope := .SameChapter }



def edge_2332i_e7_incorporates_831f1 : Ref :=
  { source := "18 USC § 2332i(e)(7)", target := "18 USC § 831(f)(1)",
    kind := .Incorporates, scope := .SameTitle }



def edge_2332i_e9_incorporates_831f4 : Ref :=
  { source := "18 USC § 2332i(e)(9)", target := "18 USC § 831(f)(4)",
    kind := .Incorporates, scope := .SameTitle }


def edge_2332i_e11_incorporates_2332f_e3 : Ref :=
  { source := "18 USC § 2332i(e)(11)", target := "18 USC § 2332f(e)(3)",
    kind := .Incorporates, scope := .SameChapter }



def edge_2332i_e13_incorporates_t33_1502_19 : Ref :=
  { source := "18 USC § 2332i(e)(13)", target := "33 USC § 1502(19)",
    kind := .Incorporates, scope := .CrossTitle }


def edge_2332i_e14_incorporates_t46_70502 : Ref :=
  { source := "18 USC § 2332i(e)(14)", target := "46 USC § 70502",
    kind := .Incorporates, scope := .CrossTitle }





def edge_2333_a_incorporates_2331_1 : Ref :=
  { source := "18 USC § 2333(a)", target := "18 USC § 2331(1)",
    kind := .Incorporates, scope := .SameChapter }


def edge_2333_a_incorporates_2331_2 : Ref :=
  { source := "18 USC § 2333(a)", target := "18 USC § 2331(2)",
    kind := .Incorporates, scope := .SameChapter }


def edge_2333_b_incorporates_title18Catalog : Ref :=
  { source := "18 USC § 2333(b)", target := "18 USC §§ 1116, 1201, 1203, 2332",
    kind := .Incorporates, scope := .SameTitle }


def edge_2333_b_incorporates_title49Catalog : Ref :=
  { source := "18 USC § 2333(b)", target := "49 USC §§ 46314, 46502, 46505, 46506",
    kind := .Incorporates, scope := .CrossTitle }



def edge_2333_d1_incorporates_1usc1 : Ref :=
  { source := "18 USC § 2333(d)(1)", target := "1 USC § 1",
    kind := .Incorporates, scope := .CrossTitle }





def edge_2333_d1_lexSpecialis_2331_3 : Ref :=
  { source := "18 USC § 2333(d)(1)", target := "18 USC § 2331(3)",
    kind := .LexSpecialis, scope := .SameChapter }



def edge_2333_d2_incorporates_ina219 : Ref :=
  { source := "18 USC § 2333(d)(2)",
    target := "Immigration and Nationality Act § 219 (8 USC § 1189)",
    kind := .Incorporates, scope := .CrossTitle }



def edge_2333_e_incorporates_tria201 : Ref :=
  { source := "18 USC § 2333(e)",
    target := "Terrorism Risk Insurance Act of 2002 § 201 (28 USC § 1610 note)",
    kind := .Incorporates, scope := .OutsideCode }



def edge_2333_e_incorporates_kingpin805b : Ref :=
  { source := "18 USC § 2333(e)",
    target := "Foreign Narcotics Kingpin Designation Act § 805(b) (21 USC § 1904(b))",
    kind := .Incorporates, scope := .CrossTitle }

end Proving.USC.T18.Ch113B.Structure
