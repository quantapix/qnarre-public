








import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Structure

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


def mkIncorporates (s t : String) : Ref := { source := s, target := t, kind := .Incorporates }


def mkSavings (s t : String) : Ref := { source := s, target := t, kind := .Savings }






def edge2332aC1IncorporatesIna101a22 : Ref :=
  mkIncorporates "18 USC § 2332a(c)(1)" "8 USC § 1101(a)(22)"


def edge2332aC2AIncorporates921 : Ref :=
  mkIncorporates "18 USC § 2332a(c)(2)(A)" "18 USC § 921"



def edge2332aC2CIncorporates178 : Ref :=
  mkIncorporates "18 USC § 2332a(c)(2)(C)" "18 USC § 178"




def edge2332aAIncorporatesC : Ref :=
  mkIncorporates "18 USC § 2332a(a)" "18 USC § 2332a(c)"



def edge2332aBIncorporatesC : Ref :=
  mkIncorporates "18 USC § 2332a(b)" "18 USC § 2332a(c)"



def edge2332aCScopedToSection : Ref :=
  { source := "18 USC § 2332a(c)", target := "18 USC § 2332a", kind := .LexSpecialis }


def edges2332a : List Ref :=
  [ edge2332aC1IncorporatesIna101a22,
    edge2332aC2AIncorporates921,
    edge2332aC2CIncorporates178,
    edge2332aAIncorporatesC,
    edge2332aBIncorporatesC,
    edge2332aCScopedToSection ]




def edge2332bA1IncorporatesB : Ref :=
  mkIncorporates "18 USC § 2332b(a)(1)" "18 USC § 2332b(b)"


def edge2332bA1IncorporatesC : Ref :=
  mkIncorporates "18 USC § 2332b(a)(1)" "18 USC § 2332b(c)"





def edge2332bA1IncorporatesStateLaw : Ref :=
  mkIncorporates "18 USC § 2332b(a)(1)"
    "laws of any State, or of the United States (unenumerated)"




def edge2332bA1ExceptAsProvidedD2 : Ref :=
  { source := "18 USC § 2332b(a)(1)", target := "18 USC § 2332b(d)(2)",
    kind := .ExceptAsProvided }


def edge2332bA2IncorporatesA1 : Ref :=
  mkIncorporates "18 USC § 2332b(a)(2)" "18 USC § 2332b(a)(1)"


def edge2332bA2IncorporatesC : Ref :=
  mkIncorporates "18 USC § 2332b(a)(2)" "18 USC § 2332b(c)"



def edge2332bB2IncorporatesB1 : Ref :=
  mkIncorporates "18 USC § 2332b(b)(2)" "18 USC § 2332b(b)(1)"



def edge2332bASubjectToD : Ref :=
  { source := "18 USC § 2332b(a)", target := "18 USC § 2332b(d)", kind := .SubjectTo }





def edge2332bC2NotwithstandingOtherLaw : Ref :=
  { source := "18 USC § 2332b(c)(2)", target := "any other provision of law (general)",
    kind := .Notwithstanding }



def edge2332bE1IncorporatesA : Ref :=
  mkIncorporates "18 USC § 2332b(e)(1)" "18 USC § 2332b(a)"



def edge2332bE2IncorporatesS3 : Ref :=
  mkIncorporates "18 USC § 2332b(e)(2)" "18 USC § 3"



def edge2332bFSavings3056 : Ref :=
  mkSavings "18 USC § 2332b(f)" "18 USC § 3056"





def edge2332bFSavingsOtherAuthority : Ref :=
  mkSavings "18 USC § 2332b(f)" "18 USC (other investigative authority, general)"



def edges2332bFInvestigativeRoster : List Ref :=
  [ mkIncorporates "18 USC § 2332b(f)" "18 USC § 351(e)",
    mkIncorporates "18 USC § 2332b(f)" "18 USC § 844(e)",
    mkIncorporates "18 USC § 2332b(f)" "18 USC § 844(f)(1)",
    mkIncorporates "18 USC § 2332b(f)" "18 USC § 956(b)",
    mkIncorporates "18 USC § 2332b(f)" "18 USC § 1361",
    mkIncorporates "18 USC § 2332b(f)" "18 USC § 1366(b)",
    mkIncorporates "18 USC § 2332b(f)" "18 USC § 1366(c)",
    mkIncorporates "18 USC § 2332b(f)" "18 USC § 1751(e)",
    mkIncorporates "18 USC § 2332b(f)" "18 USC § 2152",
    mkIncorporates "18 USC § 2332b(f)" "18 USC § 2156" ]



def edge2332bG2Incorporates1958b2 : Ref :=
  mkIncorporates "18 USC § 2332b(g)(2)" "18 USC § 1958(b)(2)"







def edge2332bG3Incorporates1365g3 : Ref :=
  mkIncorporates "18 USC § 2332b(g)(3)" "18 USC § 1365(g)(3)"




def edge2332bGScopedToSection : Ref :=
  { source := "18 USC § 2332b(g)", target := "18 USC § 2332b", kind := .LexSpecialis }





def edges2332bG5BiTitle18 : List Ref :=
  [ mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 32",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 37",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 81",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 175",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 175b",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 175c",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 229",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 351(a)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 351(b)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 351(c)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 351(d)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 831",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 832",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 842(m)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 842(n)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 844(f)(2)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 844(f)(3)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 844(i)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 930(c)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 956(a)(1)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1030(a)(1)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1030(a)(5)(A)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1030(c)(4)(A)(i)(II)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1030(c)(4)(A)(i)(III)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1030(c)(4)(A)(i)(IV)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1030(c)(4)(A)(i)(V)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1030(c)(4)(A)(i)(VI)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1114",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1116",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1203",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1361",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1362",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1363",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1366(a)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1751(a)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1751(b)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1751(c)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1751(d)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 1992",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2155",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2156",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2280",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2280a",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2281",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2281a",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2332",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2332a",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2332b",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2332f",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2332g",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2332h",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2332i",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2339",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2339A",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2339B",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2339C",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2339D",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2340A" ]




def edges2332bG5BiiTitle42 : List Ref :=
  [ mkIncorporates "18 USC § 2332b(g)(5)(B)(ii)" "42 USC § 2122",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(ii)" "42 USC § 2284" ]




def edges2332bG5BiiiTitle49 : List Ref :=
  [ mkIncorporates "18 USC § 2332b(g)(5)(B)(iii)" "49 USC § 46502",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(iii)" "49 USC § 46504",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(iii)" "49 USC § 46505(b)(3)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(iii)" "49 USC § 46505(c)",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(iii)" "49 USC § 46506",
    mkIncorporates "18 USC § 2332b(g)(5)(B)(iii)" "49 USC § 60123(b)" ]





def edges2332bG5BivActCite : List Ref :=
  [ mkIncorporates "18 USC § 2332b(g)(5)(B)(iv)"
      "Controlled Substances Import and Export Act § 1010A (act cite; no USC cite in text)" ]


def edges2332bG5B : List Ref :=
  edges2332bG5BiTitle18 ++ edges2332bG5BiiTitle42
    ++ edges2332bG5BiiiTitle49 ++ edges2332bG5BivActCite


def edges2332bCore : List Ref :=
  [ edge2332bA1IncorporatesB,
    edge2332bA1IncorporatesC,
    edge2332bA1IncorporatesStateLaw,
    edge2332bA1ExceptAsProvidedD2,
    edge2332bA2IncorporatesA1,
    edge2332bA2IncorporatesC,
    edge2332bB2IncorporatesB1,
    edge2332bASubjectToD,
    edge2332bC2NotwithstandingOtherLaw,
    edge2332bE1IncorporatesA,
    edge2332bE2IncorporatesS3,
    edge2332bFSavings3056,
    edge2332bFSavingsOtherAuthority,
    edge2332bG2Incorporates1958b2,
    edge2332bG3Incorporates1365g3,
    edge2332bGScopedToSection ]


def edgesCell : List Ref :=
  edges2332a ++ edges2332bCore ++ edges2332bFInvestigativeRoster ++ edges2332bG5B

end Proving.USC.T18.Ch113B.Wmd.Structure
