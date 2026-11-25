








import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert2.Structure

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









structure Scope where

  source : String

  domain : String


  exceptWhereOtherwiseProvided : Bool
  deriving DecidableEq, Repr



def mkIncorporates (src tgt : String) : Ref :=
  { source := src, target := tgt, kind := .Incorporates }

def mkSubjectTo (src tgt : String) : Ref :=
  { source := src, target := tgt, kind := .SubjectTo }

def mkExceptAsProvided (src tgt : String) : Ref :=
  { source := src, target := tgt, kind := .ExceptAsProvided }

def mkSavings (src tgt : String) : Ref :=
  { source := src, target := tgt, kind := .Savings }

def mkLexSpecialis (specific general : String) : Ref :=
  { source := specific, target := general, kind := .LexSpecialis }





def edge_7_9_incorporates_ina101 : Ref :=
  mkIncorporates "18 USC § 7(9)" "8 USC § 1101"



def edge_7_9_exceptAsProvided_3261a : Ref :=
  mkExceptAsProvided "18 USC § 7(9)" "18 USC § 3261(a)"



def edge_7_9_savings_treaties : Ref :=
  mkSavings "18 USC § 7(9)" "treaty or international agreement in conflict with 18 USC § 7(9)"



def edge_7_6_incorporates_outerSpaceTreaty : Ref :=
  mkIncorporates "18 USC § 7(6)"
    "Treaty on Principles Governing the Activities of States in the Exploration and Use of Outer Space"


def edge_7_6_incorporates_registrationConvention : Ref :=
  mkIncorporates "18 USC § 7(6)"
    "Convention on Registration of Objects Launched into Outer Space"

def refs7 : List Ref :=
  [ edge_7_9_incorporates_ina101
  , edge_7_9_exceptAsProvided_3261a
  , edge_7_9_savings_treaties
  , edge_7_6_incorporates_outerSpaceTreaty
  , edge_7_6_incorporates_registrationConvention ]

def scope_7_title : Scope :=
  { source := "18 USC § 7"
  , domain := "18 USC (entire title) — the term \"special maritime and territorial jurisdiction of the United States\""
  , exceptWhereOtherwiseProvided := false }





def edge_20_1_incorporates_fdia3c2 : Ref :=
  mkIncorporates "18 USC § 20(1)" "12 USC § 1813(c)(2)"


def edge_20_3_incorporates_fhlba2 : Ref :=
  mkIncorporates "18 USC § 20(3)" "12 USC § 1422"



def edge_20_4_incorporates_farmCredit535 : Ref :=
  mkIncorporates "18 USC § 20(4)" "Farm Credit Act of 1971 § 5.35(3)"



def edge_20_5_incorporates_sbia103 : Ref :=
  mkIncorporates "18 USC § 20(5)" "15 USC § 662"




def edge_20_6_incorporates_fdia3w1 : Ref :=
  mkIncorporates "18 USC § 20(6)" "12 USC § 1813(w)(1)"


def edge_20_8_incorporates_fra25 : Ref :=
  mkIncorporates "18 USC § 20(8)" "Federal Reserve Act § 25"



def edge_20_8_incorporates_fra25a : Ref :=
  mkIncorporates "18 USC § 20(8)" "Federal Reserve Act § 25(a)"



def edge_20_9_incorporates_iba1b : Ref :=
  mkIncorporates "18 USC § 20(9)" "12 USC § 3101"



def edge_20_10_incorporates_18usc27 : Ref :=
  mkIncorporates "18 USC § 20(10)" "18 USC § 27"



def edge_20_10_incorporates_respa3 : Ref :=
  mkIncorporates "18 USC § 20(10)" "12 USC § 2602"



def refs20PopularName : List Ref :=
  [ edge_20_1_incorporates_fdia3c2
  , edge_20_3_incorporates_fhlba2
  , edge_20_4_incorporates_farmCredit535
  , edge_20_5_incorporates_sbia103
  , edge_20_6_incorporates_fdia3w1
  , edge_20_8_incorporates_fra25
  , edge_20_8_incorporates_fra25a
  , edge_20_9_incorporates_iba1b
  , edge_20_10_incorporates_respa3 ]

def refs20 : List Ref :=
  edge_20_10_incorporates_18usc27 :: refs20PopularName

def scope_20_title : Scope :=
  { source := "18 USC § 20"
  , domain := "18 USC (entire title) — the term \"financial institution\""
  , exceptWhereOtherwiseProvided := false }




def edge_21_b_incorporates_115 : Ref :=
  mkIncorporates "18 USC § 21(b)" "18 USC § 115"

def refs21 : List Ref := [edge_21_b_incorporates_115]




def scope_21_a_title : Scope :=
  { source := "18 USC § 21(a)"
  , domain := "18 USC (entire title) — any offense whose elements include stolen/counterfeit character of property plus the defendant's knowledge of that character"
  , exceptWhereOtherwiseProvided := false }



def scope_21_b_section : Scope :=
  { source := "18 USC § 21(b)"
  , domain := "18 USC § 21 — the term \"official representation\""
  , exceptWhereOtherwiseProvided := false }









def edge_23_exceptAsProvided_openEnded : Ref :=
  mkExceptAsProvided "18 USC § 23" "18 USC — any section expressly providing otherwise"

def refs23 : List Ref := [edge_23_exceptAsProvided_openEnded]

def scope_23_title : Scope :=
  { source := "18 USC § 23"
  , domain := "18 USC (entire title) — the term \"court of the United States\""
  , exceptWhereOtherwiseProvided := true }




def refs24IntraTitle : List Ref :=
  [ mkIncorporates "18 USC § 24(a)(1)" "18 USC § 669"
  , mkIncorporates "18 USC § 24(a)(1)" "18 USC § 1035"
  , mkIncorporates "18 USC § 24(a)(1)" "18 USC § 1347"
  , mkIncorporates "18 USC § 24(a)(1)" "18 USC § 1518"
  , mkIncorporates "18 USC § 24(a)(2)" "18 USC § 287"
  , mkIncorporates "18 USC § 24(a)(2)" "18 USC § 371"
  , mkIncorporates "18 USC § 24(a)(2)" "18 USC § 664"
  , mkIncorporates "18 USC § 24(a)(2)" "18 USC § 666"
  , mkIncorporates "18 USC § 24(a)(2)" "18 USC § 1001"
  , mkIncorporates "18 USC § 24(a)(2)" "18 USC § 1027"
  , mkIncorporates "18 USC § 24(a)(2)" "18 USC § 1341"
  , mkIncorporates "18 USC § 24(a)(2)" "18 USC § 1343"
  , mkIncorporates "18 USC § 24(a)(2)" "18 USC § 1349"
  , mkIncorporates "18 USC § 24(a)(2)" "18 USC § 1954" ]



def edge_24_a1_incorporates_ssa1128B : Ref :=
  mkIncorporates "18 USC § 24(a)(1)" "42 USC § 1320a-7b"





def edge_24_a2_incorporates_ffdca301 : Ref :=
  mkIncorporates "18 USC § 24(a)(2)" "21 USC § 331"



def edge_24_a2_incorporates_erisa501 : Ref :=
  mkIncorporates "18 USC § 24(a)(2)" "29 USC § 1131"



def edge_24_a2_incorporates_erisa411 : Ref :=
  mkIncorporates "18 USC § 24(a)(2)" "Employee Retirement Income Security Act of 1974 § 411"



def edge_24_a2_incorporates_erisa518 : Ref :=
  mkIncorporates "18 USC § 24(a)(2)" "Employee Retirement Income Security Act of 1974 § 518"



def edge_24_a2_incorporates_erisa511 : Ref :=
  mkIncorporates "18 USC § 24(a)(2)" "Employee Retirement Income Security Act of 1974 § 511"

def refs24PopularName : List Ref :=
  [ edge_24_a1_incorporates_ssa1128B
  , edge_24_a2_incorporates_ffdca301
  , edge_24_a2_incorporates_erisa501
  , edge_24_a2_incorporates_erisa411
  , edge_24_a2_incorporates_erisa518
  , edge_24_a2_incorporates_erisa511 ]





def edge_24_a2_incorporates_24b : Ref :=
  mkIncorporates "18 USC § 24(a)(2)" "18 USC § 24(b)"

def refs24 : List Ref :=
  refs24IntraTitle ++ refs24PopularName ++ [edge_24_a2_incorporates_24b]

def scope_24_title : Scope :=
  { source := "18 USC § 24"
  , domain := "18 USC (entire title) — the terms \"Federal health care offense\" and \"health care benefit program\""
  , exceptWhereOtherwiseProvided := false }




def edge_1028a_incorporates_1028c : Ref :=
  mkIncorporates "18 USC § 1028(a)" "18 USC § 1028(c)"


def edge_1028a_subjectTo_1028b : Ref :=
  mkSubjectTo "18 USC § 1028(a)" "18 USC § 1028(b)"


def edge_1028b1_exceptAsProvided_1028b3 : Ref :=
  mkExceptAsProvided "18 USC § 1028(b)(1)" "18 USC § 1028(b)(3)"

def edge_1028b1_exceptAsProvided_1028b4 : Ref :=
  mkExceptAsProvided "18 USC § 1028(b)(1)" "18 USC § 1028(b)(4)"


def edge_1028b2_exceptAsProvided_1028b3 : Ref :=
  mkExceptAsProvided "18 USC § 1028(b)(2)" "18 USC § 1028(b)(3)"

def edge_1028b2_exceptAsProvided_1028b4 : Ref :=
  mkExceptAsProvided "18 USC § 1028(b)(2)" "18 USC § 1028(b)(4)"


def edge_1028b1C_incorporates_1028a5 : Ref :=
  mkIncorporates "18 USC § 1028(b)(1)(C)" "18 USC § 1028(a)(5)"



def edge_1028b1D_incorporates_1028a7 : Ref :=
  mkIncorporates "18 USC § 1028(b)(1)(D)" "18 USC § 1028(a)(7)"


def edge_1028b2B_incorporates_1028a3 : Ref :=
  mkIncorporates "18 USC § 1028(b)(2)(B)" "18 USC § 1028(a)(3)"


def edge_1028b2B_incorporates_1028a7 : Ref :=
  mkIncorporates "18 USC § 1028(b)(2)(B)" "18 USC § 1028(a)(7)"





def edge_1028b1D_lexSpecialis_1028b2B : Ref :=
  mkLexSpecialis "18 USC § 1028(b)(1)(D)" "18 USC § 1028(b)(2)(B)"



def edge_1028b1_lexSpecialis_1028b6 : Ref :=
  mkLexSpecialis "18 USC § 1028(b)(1)" "18 USC § 1028(b)(6)"



def edge_1028b3A_incorporates_929a2 : Ref :=
  mkIncorporates "18 USC § 1028(b)(3)(A)" "18 USC § 929(a)(2)"


def edge_1028b3B_incorporates_924c3 : Ref :=
  mkIncorporates "18 USC § 1028(b)(3)(B)" "18 USC § 924(c)(3)"



def edge_1028b4_incorporates_2331_5 : Ref :=
  mkIncorporates "18 USC § 1028(b)(4)" "18 USC § 2331(5)"



def edge_1028b4_incorporates_2331_1 : Ref :=
  mkIncorporates "18 USC § 1028(b)(4)" "18 USC § 2331(1)"


def edge_1028c_incorporates_1028a4 : Ref :=
  mkIncorporates "18 USC § 1028(c)(2)" "18 USC § 1028(a)(4)"



def edge_1028d7D_incorporates_1029e : Ref :=
  mkIncorporates "18 USC § 1028(d)(7)(D)" "18 USC § 1029(e)"




def edge_1028e_savings_ch224 : Ref :=
  mkSavings "18 USC § 1028(e)" "18 USC ch. 224"



def edge_1028f_incorporates_1028a : Ref :=
  mkIncorporates "18 USC § 1028(f)" "18 USC § 1028(a)"




def edge_1028g_subjectTo_21usc853 : Ref :=
  mkSubjectTo "18 USC § 1028(g)" "21 USC § 853"



def edge_1028g_exceptAsProvided_21usc853d : Ref :=
  mkExceptAsProvided "18 USC § 1028(g)" "21 USC § 853(d)"



def edge_1028h_incorporates_1028a : Ref :=
  mkIncorporates "18 USC § 1028(h)" "18 USC § 1028(a)"



def edge_1028i_incorporates_1028a7 : Ref :=
  mkIncorporates "18 USC § 1028(i)" "18 USC § 1028(a)(7)"





def edge_1028b2A_incorporates_1028a : Ref :=
  mkIncorporates "18 USC § 1028(b)(2)(A)" "18 USC § 1028(a)"




def edge_1028a2_incorporates_21a : Ref :=
  mkIncorporates "18 USC § 1028(a)(2)" "18 USC § 21(a)"



def edge_1028a6_incorporates_21a : Ref :=
  mkIncorporates "18 USC § 1028(a)(6)" "18 USC § 21(a)"

def refs1028 : List Ref :=
  [ edge_1028a_incorporates_1028c
  , edge_1028a_subjectTo_1028b
  , edge_1028b1_exceptAsProvided_1028b3
  , edge_1028b1_exceptAsProvided_1028b4
  , edge_1028b2_exceptAsProvided_1028b3
  , edge_1028b2_exceptAsProvided_1028b4
  , edge_1028b1C_incorporates_1028a5
  , edge_1028b1D_incorporates_1028a7
  , edge_1028b2B_incorporates_1028a3
  , edge_1028b2B_incorporates_1028a7
  , edge_1028b1D_lexSpecialis_1028b2B
  , edge_1028b1_lexSpecialis_1028b6
  , edge_1028b3A_incorporates_929a2
  , edge_1028b3B_incorporates_924c3
  , edge_1028b4_incorporates_2331_5
  , edge_1028b4_incorporates_2331_1
  , edge_1028c_incorporates_1028a4
  , edge_1028d7D_incorporates_1029e
  , edge_1028e_savings_ch224
  , edge_1028f_incorporates_1028a
  , edge_1028g_subjectTo_21usc853
  , edge_1028g_exceptAsProvided_21usc853d
  , edge_1028h_incorporates_1028a
  , edge_1028i_incorporates_1028a7
  , edge_1028b2A_incorporates_1028a
  , edge_1028a2_incorporates_21a
  , edge_1028a6_incorporates_21a ]



def scope_1028_d : Scope :=
  { source := "18 USC § 1028(d)"
  , domain := "18 USC § 1028 and 18 USC § 1028A"
  , exceptWhereOtherwiseProvided := false }





def edge_1029a_subjectTo_1029c : Ref :=
  mkSubjectTo "18 USC § 1029(a)" "18 USC § 1029(c)"



def edge_1029b1_incorporates_1029a : Ref :=
  mkIncorporates "18 USC § 1029(b)(1)" "18 USC § 1029(a)"



def edge_1029b2_subjectTo_1029c : Ref :=
  mkSubjectTo "18 USC § 1029(b)(2)" "18 USC § 1029(c)"




def edge_1029c1Ai_incorporates_1029aGroup1 : Ref :=
  mkIncorporates "18 USC § 1029(c)(1)(A)(i)" "18 USC § 1029(a)(1), (2), (3), (6), (7), (10)"



def edge_1029c1Aii_incorporates_1029aGroup2 : Ref :=
  mkIncorporates "18 USC § 1029(c)(1)(A)(ii)" "18 USC § 1029(a)(4), (5), (8), (9)"






def edge_1029c2_subjectTo_21usc853 : Ref :=
  mkSubjectTo "18 USC § 1029(c)(2)" "21 USC § 853"


def edge_1029c2_exceptAsProvided_21usc853d : Ref :=
  mkExceptAsProvided "18 USC § 1029(c)(2)" "21 USC § 853(d)"





def edge_1029e7_incorporates_18usc20 : Ref :=
  mkIncorporates "18 USC § 1029(e)(7)" "18 USC § 20"



def edge_1029e8_incorporates_ch119 : Ref :=
  mkIncorporates "18 USC § 1029(e)(8)" "18 USC ch. 119"



def edge_1029e9_incorporates_47usc153 : Ref :=
  mkIncorporates "18 USC § 1029(e)(9)" "47 USC § 153"




def edge_1029e10_incorporates_commsActTitleIII : Ref :=
  mkIncorporates "18 USC § 1029(e)(10)" "Communications Act of 1934, title III"



def edge_1029f_savings_ch224 : Ref :=
  mkSavings "18 USC § 1029(f)" "18 USC ch. 224"



def edge_1029g1_exceptAsProvided_1029a9 : Ref :=
  mkExceptAsProvided "18 USC § 1029(g)(1)" "18 USC § 1029(a)(9)"



def edge_1029g1_incorporates_1029e10 : Ref :=
  mkIncorporates "18 USC § 1029(g)(1)" "18 USC § 1029(e)(10)"



def edge_1029g2_exceptAsProvided_1029a9 : Ref :=
  mkExceptAsProvided "18 USC § 1029(g)(2)" "18 USC § 1029(a)(9)"




def edge_1029h_incorporates_18usc20 : Ref :=
  mkIncorporates "18 USC § 1029(h)" "18 USC § 20"


def edge_1029h_incorporates_1029a : Ref :=
  mkIncorporates "18 USC § 1029(h)" "18 USC § 1029(a)"


def edge_1029h_incorporates_1029b : Ref :=
  mkIncorporates "18 USC § 1029(h)" "18 USC § 1029(b)"


def refs1029PopularName : List Ref :=
  [ edge_1029c2_subjectTo_21usc853
  , edge_1029e9_incorporates_47usc153
  , edge_1029e10_incorporates_commsActTitleIII ]

def refs1029 : List Ref :=
  [ edge_1029a_subjectTo_1029c
  , edge_1029b1_incorporates_1029a
  , edge_1029b2_subjectTo_1029c
  , edge_1029c1Ai_incorporates_1029aGroup1
  , edge_1029c1Aii_incorporates_1029aGroup2
  , edge_1029c2_subjectTo_21usc853
  , edge_1029c2_exceptAsProvided_21usc853d
  , edge_1029e7_incorporates_18usc20
  , edge_1029e8_incorporates_ch119
  , edge_1029e9_incorporates_47usc153
  , edge_1029e10_incorporates_commsActTitleIII
  , edge_1029f_savings_ch224
  , edge_1029g1_exceptAsProvided_1029a9
  , edge_1029g1_incorporates_1029e10
  , edge_1029g2_exceptAsProvided_1029a9
  , edge_1029h_incorporates_18usc20
  , edge_1029h_incorporates_1029a
  , edge_1029h_incorporates_1029b ]



def scope_1029_e : Scope :=
  { source := "18 USC § 1029(e)"
  , domain := "18 USC § 1029"
  , exceptWhereOtherwiseProvided := false }



def scope_1029_f : Scope :=
  { source := "18 USC § 1029(f)"
  , domain := "18 USC § 1029(f) — the term \"State\""
  , exceptWhereOtherwiseProvided := false }

end Proving.USC.T18.Ch1Ch47.Recert2.Structure
