














import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Structure


inductive EdgeKind where

  | Incorporates

  | SubjectTo

  | Notwithstanding

  | ExceptAsProvided

  | Savings

  | LexSpecialis




structure Ref where

  source  : String

  target  : String

  kind    : EdgeKind


  express : Bool := true




structure EditorialNote where

  cite            : String

  marker          : Nat

  licensedReading : String


def incorp (src tgt : String) : Ref :=
  { source := src, target := tgt, kind := .Incorporates }


def incorpImplied (src tgt : String) : Ref :=
  { source := src, target := tgt, kind := .Incorporates, express := false }





def edge_title18_incorporates_7 : Ref :=
  { source := "18 USC (this title)", target := "18 USC § 7", kind := .Incorporates }



def edge_7_4_incorporates_guanoAct : Ref :=
  incorpImplied "18 USC § 7(4)" "48 USC § 1411 (Guano Islands Act)"




def edge_7_6_incorporates_outerSpaceTreaty : Ref :=
  incorp "18 USC § 7(6)"
    "Treaty on Principles Governing the Activities of States in the Exploration and Use of Outer Space, Including the Moon and Other Celestial Bodies"


def edge_7_6_incorporates_registrationConvention : Ref :=
  incorp "18 USC § 7(6)" "Convention on Registration of Objects Launched into Outer Space"



def edge_7_8_subjectTo_internationalLaw : Ref :=
  { source := "18 USC § 7(8)", target := "international law", kind := .SubjectTo }



def edge_7_9_incorporates_ina101 : Ref :=
  incorp "18 USC § 7(9)" "8 USC § 1101 (Immigration and Nationality Act § 101)"



def edge_7_9_savings_treaties : Ref :=
  { source := "18 USC § 7(9)"
  , target := "any treaty or international agreement with which § 7(9) conflicts"
  , kind   := .Savings }



def edge_7_9_exceptAsProvided_3261a : Ref :=
  { source := "18 USC § 7(9)", target := "18 USC § 3261(a)", kind := .ExceptAsProvided }


def refs_7_6_spaceTreaties : List Ref :=
  [edge_7_6_incorporates_outerSpaceTreaty, edge_7_6_incorporates_registrationConvention]





def edge_title18_incorporates_20 : Ref :=
  { source := "18 USC (this title)", target := "18 USC § 20", kind := .Incorporates }



def edge_20_1_incorporates_fdia3c2 : Ref :=
  incorp "18 USC § 20(1)" "Federal Deposit Insurance Act § 3(c)(2)"



def edge_20_2_incorporates_ncusif : Ref :=
  incorpImplied "18 USC § 20(2)" "12 USC § 1783 (National Credit Union Share Insurance Fund)"



def edge_20_3_incorporates_fhlba2 : Ref :=
  incorp "18 USC § 20(3)" "12 USC § 1422 (Federal Home Loan Bank Act § 2)"



def edge_20_4_incorporates_fca535 : Ref :=
  incorp "18 USC § 20(4)" "Farm Credit Act of 1971 § 5.35(3)"



def edge_20_5_incorporates_sbia103 : Ref :=
  incorp "18 USC § 20(5)" "15 USC § 662 (Small Business Investment Act of 1958 § 103)"




def edge_20_6_incorporates_fdia3w1 : Ref :=
  incorp "18 USC § 20(6)" "Federal Deposit Insurance Act § 3(w)(1)"



def edge_20_7_incorporates_federalReserveAct : Ref :=
  incorpImplied "18 USC § 20(7)" "Federal Reserve Act (12 USC ch. 3)"



def edge_20_8_incorporates_fra25 : Ref :=
  incorp "18 USC § 20(8)" "Federal Reserve Act § 25 (12 USC § 601 et seq.)"





def edge_20_8_incorporates_fra25a : Ref :=
  incorp "18 USC § 20(8)" "Federal Reserve Act § 25(a)"


def edge_20_8_incorporates_fra25A_renumbered : Ref :=
  incorpImplied "18 USC § 20(8)"
    "Federal Reserve Act § 25A (12 USC § 611a; formerly § 25(a), renumbered Pub. L. 102-242 § 142(e)(2))"




def edge_20_9_incorporates_iba1b : Ref :=
  incorp "18 USC § 20(9)" "International Banking Act of 1978 § 1(b)(1), (3)"



def edge_20_10_incorporates_18_27 : Ref :=
  incorp "18 USC § 20(10)" "18 USC § 27"



def edge_20_10_incorporates_respa3 : Ref :=
  incorp "18 USC § 20(10)" "Real Estate Settlement Procedures Act of 1974 § 3"


def note_20_8 : EditorialNote :=
  { cite   := "18 USC § 20(8)"
  , marker := 1
  , licensedReading :=
      "See References in Text note: the Federal Reserve Act provision formerly designated § 25(a) was renumbered § 25A; read the reference as reaching organizations operating under that provision as renumbered." }




def refs_20_resolvable : List Ref :=
  [ edge_20_1_incorporates_fdia3c2
  , edge_20_2_incorporates_ncusif
  , edge_20_3_incorporates_fhlba2
  , edge_20_4_incorporates_fca535
  , edge_20_5_incorporates_sbia103
  , edge_20_6_incorporates_fdia3w1
  , edge_20_7_incorporates_federalReserveAct
  , edge_20_8_incorporates_fra25
  , edge_20_9_incorporates_iba1b
  , edge_20_10_incorporates_18_27
  , edge_20_10_incorporates_respa3 ]






def edge_title18_incorporates_21 : Ref :=
  { source := "18 USC (offense sections of this title)"
  , target := "18 USC § 21(a)"
  , kind   := .Incorporates }




def edge_21_a_lexSpecialis_elementProof : Ref :=
  { source := "18 USC § 21(a)"
  , target := "the stolen-or-counterfeit-nature element of any offense section of this title"
  , kind   := .LexSpecialis }



def edge_21_b_incorporates_115 : Ref :=
  incorp "18 USC § 21(b)" "18 USC § 115"



def edge_21_b_subjectTo_sectionScope : Ref :=
  { source := "18 USC § 21(b)"
  , target := "18 USC § 21 (this section only)"
  , kind   := .SubjectTo }




def edge_title18_incorporates_23 : Ref :=
  { source := "18 USC (this title)", target := "18 USC § 23", kind := .Incorporates }




def edge_23_exceptAsProvided_open : Ref :=
  { source := "18 USC § 23"
  , target := "any provision of this title expressly providing otherwise (target unnamed in the enacted text)"
  , kind   := .ExceptAsProvided }





def edge_23_lexSpecialis_28_451 : Ref :=
  { source := "18 USC § 23", target := "28 USC § 451", kind := .LexSpecialis, express := false }


def edge_23_incorporates_guamDC : Ref :=
  incorpImplied "18 USC § 23" "48 USC § 1424 (District Court of Guam)"


def edge_23_incorporates_nmiDC : Ref :=
  incorpImplied "18 USC § 23" "48 USC § 1821 (District Court for the Northern Mariana Islands)"


def edge_23_incorporates_viDC : Ref :=
  incorpImplied "18 USC § 23" "48 USC § 1611 (District Court of the Virgin Islands)"


def refs_23_courts : List Ref :=
  [edge_23_incorporates_guamDC, edge_23_incorporates_nmiDC, edge_23_incorporates_viDC]


def note_23 : EditorialNote :=
  { cite   := "18 USC § 23"
  , marker := 2
  , licensedReading :=
      "So in original — probably should be followed by a comma. Read as \"As used in this title, except where otherwise expressly provided, the term 'court of the United States' includes …\", so the exception qualifies the whole definition rather than the phrase that follows it." }




def edge_title18_incorporates_24 : Ref :=
  { source := "18 USC (this title)", target := "18 USC § 24", kind := .Incorporates }


def edge_24_a1_incorporates_669 : Ref := incorp "18 USC § 24(a)(1)" "18 USC § 669"

def edge_24_a1_incorporates_1035 : Ref := incorp "18 USC § 24(a)(1)" "18 USC § 1035"

def edge_24_a1_incorporates_1347 : Ref := incorp "18 USC § 24(a)(1)" "18 USC § 1347"

def edge_24_a1_incorporates_1518 : Ref := incorp "18 USC § 24(a)(1)" "18 USC § 1518"

def edge_24_a1_incorporates_ssa1128B : Ref :=
  incorp "18 USC § 24(a)(1)" "42 USC § 1320a-7b (Social Security Act § 1128B)"


def edge_24_a2_incorporates_287 : Ref := incorp "18 USC § 24(a)(2)" "18 USC § 287"

def edge_24_a2_incorporates_371 : Ref := incorp "18 USC § 24(a)(2)" "18 USC § 371"

def edge_24_a2_incorporates_664 : Ref := incorp "18 USC § 24(a)(2)" "18 USC § 664"

def edge_24_a2_incorporates_666 : Ref := incorp "18 USC § 24(a)(2)" "18 USC § 666"

def edge_24_a2_incorporates_1001 : Ref := incorp "18 USC § 24(a)(2)" "18 USC § 1001"

def edge_24_a2_incorporates_1027 : Ref := incorp "18 USC § 24(a)(2)" "18 USC § 1027"

def edge_24_a2_incorporates_1341 : Ref := incorp "18 USC § 24(a)(2)" "18 USC § 1341"

def edge_24_a2_incorporates_1343 : Ref := incorp "18 USC § 24(a)(2)" "18 USC § 1343"

def edge_24_a2_incorporates_1349 : Ref := incorp "18 USC § 24(a)(2)" "18 USC § 1349"

def edge_24_a2_incorporates_1954 : Ref := incorp "18 USC § 24(a)(2)" "18 USC § 1954"


def edge_24_a2_incorporates_fdca301 : Ref :=
  incorp "18 USC § 24(a)(2)" "21 USC § 331 (Federal Food, Drug, and Cosmetic Act § 301)"


def edge_24_a2_incorporates_erisa501 : Ref :=
  incorp "18 USC § 24(a)(2)" "29 USC § 1131 (ERISA § 501)"



def edge_24_a2_incorporates_erisa411_518_511 : Ref :=
  incorp "18 USC § 24(a)(2)"
    "Employee Retirement Income Security Act of 1974 §§ 411, 518, 511"




def edge_24_a2_subjectTo_24b : Ref :=
  { source := "18 USC § 24(a)(2)", target := "18 USC § 24(b)", kind := .SubjectTo }


def note_24_a2 : EditorialNote :=
  { cite   := "18 USC § 24(a)(2)"
  , marker := 1
  , licensedReading :=
      "So in original — the second comma probably should follow \"1954 of this title\". Read the list as \"… 1349, or 1954 of this title, section 301 of the Federal Food, Drug, and Cosmetic Act (21 U.S.C. 331), or section 501 of the Employee Retirement Income Security Act of 1974 (29 U.S.C. 1131), or section 411, 518, or 511 of the Employee Retirement Income Security Act of 1974,\" so each named provision is a separate predicate offense." }


def refs_24_a1 : List Ref :=
  [ edge_24_a1_incorporates_669
  , edge_24_a1_incorporates_1035
  , edge_24_a1_incorporates_1347
  , edge_24_a1_incorporates_1518
  , edge_24_a1_incorporates_ssa1128B ]


def refs_24_a2 : List Ref :=
  [ edge_24_a2_incorporates_287
  , edge_24_a2_incorporates_371
  , edge_24_a2_incorporates_664
  , edge_24_a2_incorporates_666
  , edge_24_a2_incorporates_1001
  , edge_24_a2_incorporates_1027
  , edge_24_a2_incorporates_1341
  , edge_24_a2_incorporates_1343
  , edge_24_a2_incorporates_1349
  , edge_24_a2_incorporates_1954
  , edge_24_a2_incorporates_fdca301
  , edge_24_a2_incorporates_erisa501
  , edge_24_a2_incorporates_erisa411_518_511 ]

end Proving.USC.T18.Ch1.Reslice.Structure
