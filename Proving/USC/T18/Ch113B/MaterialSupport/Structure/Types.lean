






import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Structure

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



structure Chain where
  hops : List Ref
  deriving DecidableEq, Repr



def incorporates (src tgt : String) : Ref := { source := src, target := tgt, kind := .Incorporates }
def subjectTo (src tgt : String) : Ref := { source := src, target := tgt, kind := .SubjectTo }
def notwithstandingOf (src tgt : String) : Ref := { source := src, target := tgt, kind := .Notwithstanding }
def exceptAsProvided (src tgt : String) : Ref := { source := src, target := tgt, kind := .ExceptAsProvided }
def savings (src tgt : String) : Ref := { source := src, target := tgt, kind := .Savings }
def lexSpecialis (src tgt : String) : Ref := { source := src, target := tgt, kind := .LexSpecialis }





def catalog2339 : List Ref :=
  [ incorporates "18 USC § 2339(a)" "18 USC § 32"
  , incorporates "18 USC § 2339(a)" "18 USC § 175"
  , incorporates "18 USC § 2339(a)" "18 USC § 229"
  , incorporates "18 USC § 2339(a)" "18 USC § 831"
  , incorporates "18 USC § 2339(a)" "18 USC § 844(f)(2)"
  , incorporates "18 USC § 2339(a)" "18 USC § 844(f)(3)"
  , incorporates "18 USC § 2339(a)" "18 USC § 1366(a)"
  , incorporates "18 USC § 2339(a)" "18 USC § 2280"
  , incorporates "18 USC § 2339(a)" "18 USC § 2332a"
  , incorporates "18 USC § 2339(a)" "18 USC § 2332b"
  , incorporates "18 USC § 2339(a)" "42 USC § 2284(a)"
  , incorporates "18 USC § 2339(a)" "49 USC § 46502" ]


def edge2339aIncorporatesAtomicEnergyAct : Ref :=
  incorporates "18 USC § 2339(a)" "42 USC § 2284(a)"


def edge2339aIncorporatesAircraftPiracy : Ref :=
  incorporates "18 USC § 2339(a)" "49 USC § 46502"



def edge2339bSavingsVenue : Ref :=
  savings "18 USC § 2339(b)" "other Federal venue law (as provided by law)"





def catalog2339A : List Ref :=
  [ incorporates "18 USC § 2339A(a)" "18 USC § 32"
  , incorporates "18 USC § 2339A(a)" "18 USC § 37"
  , incorporates "18 USC § 2339A(a)" "18 USC § 81"
  , incorporates "18 USC § 2339A(a)" "18 USC § 175"
  , incorporates "18 USC § 2339A(a)" "18 USC § 229"
  , incorporates "18 USC § 2339A(a)" "18 USC § 351"
  , incorporates "18 USC § 2339A(a)" "18 USC § 831"
  , incorporates "18 USC § 2339A(a)" "18 USC § 842(m)"
  , incorporates "18 USC § 2339A(a)" "18 USC § 842(n)"
  , incorporates "18 USC § 2339A(a)" "18 USC § 844(f)"
  , incorporates "18 USC § 2339A(a)" "18 USC § 844(i)"
  , incorporates "18 USC § 2339A(a)" "18 USC § 930(c)"
  , incorporates "18 USC § 2339A(a)" "18 USC § 956"
  , incorporates "18 USC § 2339A(a)" "18 USC § 1091"
  , incorporates "18 USC § 2339A(a)" "18 USC § 1114"
  , incorporates "18 USC § 2339A(a)" "18 USC § 1116"
  , incorporates "18 USC § 2339A(a)" "18 USC § 1203"
  , incorporates "18 USC § 2339A(a)" "18 USC § 1361"
  , incorporates "18 USC § 2339A(a)" "18 USC § 1362"
  , incorporates "18 USC § 2339A(a)" "18 USC § 1363"
  , incorporates "18 USC § 2339A(a)" "18 USC § 1366"
  , incorporates "18 USC § 2339A(a)" "18 USC § 1751"
  , incorporates "18 USC § 2339A(a)" "18 USC § 1992"
  , incorporates "18 USC § 2339A(a)" "18 USC § 2155"
  , incorporates "18 USC § 2339A(a)" "18 USC § 2156"
  , incorporates "18 USC § 2339A(a)" "18 USC § 2280"
  , incorporates "18 USC § 2339A(a)" "18 USC § 2281"
  , incorporates "18 USC § 2339A(a)" "18 USC § 2332"
  , incorporates "18 USC § 2339A(a)" "18 USC § 2332a"
  , incorporates "18 USC § 2339A(a)" "18 USC § 2332b"
  , incorporates "18 USC § 2339A(a)" "18 USC § 2332f"
  , incorporates "18 USC § 2339A(a)" "18 USC § 2340A"
  , incorporates "18 USC § 2339A(a)" "18 USC § 2442"
  , incorporates "18 USC § 2339A(a)" "42 USC § 2284"
  , incorporates "18 USC § 2339A(a)" "49 USC § 46502"
  , incorporates "18 USC § 2339A(a)" "49 USC § 60123(b)" ]



def edge2339AaIncorporates2332bg5B : Ref :=
  incorporates "18 USC § 2339A(a)" "18 USC § 2332b(g)(5)(B)"



def edge2339AaCarveOut2339A : Ref :=
  exceptAsProvided "18 USC § 2339A(a)" "18 USC § 2339A"



def edge2339AaCarveOut2339B : Ref :=
  exceptAsProvided "18 USC § 2339A(a)" "18 USC § 2339B"


def edge2339AaSavingsVenue : Ref :=
  savings "18 USC § 2339A(a)" "other Federal venue law (as provided by law)"





def edge2339Ba1IncorporatesG6 : Ref :=
  incorporates "18 USC § 2339B(a)(1)" "18 USC § 2339B(g)(6)"


def edge2339Ba1IncorporatesTerroristActivity : Ref :=
  incorporates "18 USC § 2339B(a)(1)" "8 USC § 1182(a)(3)(B)"



def edge2339Ba1IncorporatesTerrorism : Ref :=
  incorporates "18 USC § 2339B(a)(1)" "22 USC § 2656f(d)(2)"



def edge2339Ba2ExceptSecretaryAuthorization : Ref :=
  exceptAsProvided "18 USC § 2339B(a)(2)" "Secretary of the Treasury authorization (18 USC § 2339B(g)(5))"


def edge2339BbIncorporatesA2 : Ref :=
  incorporates "18 USC § 2339B(b)" "18 USC § 2339B(a)(2)"


def edge2339Bd1AIncorporatesNational : Ref :=
  incorporates "18 USC § 2339B(d)(1)(A)" "8 USC § 1101(a)(22)"


def edge2339Bd1AIncorporatesLpr : Ref :=
  incorporates "18 USC § 2339B(d)(1)(A)" "8 USC § 1101(a)(20)"


def edge2339Bf1AiIncorporatesFrcp : Ref :=
  incorporates "18 USC § 2339B(f)(1)(A)(i)" "Federal Rules of Civil Procedure"


def edge2339Bf1CIncorporatesF5 : Ref :=
  incorporates "18 USC § 2339B(f)(1)(C)" "18 USC § 2339B(f)(5)"


def edge2339Bf4IncorporatesF5 : Ref :=
  incorporates "18 USC § 2339B(f)(4)" "18 USC § 2339B(f)(5)"



def edge2339Bf6SavingsPrivileges : Ref :=
  savings "18 USC § 2339B(f)(6)" "protective orders and United States evidentiary privileges (incl. state secrets)"


def edge2339Bg1IncorporatesCipa : Ref :=
  incorporates "18 USC § 2339B(g)(1)" "Classified Information Procedures Act § 1(a) (18 USC App.)"


def edge2339Bg2IncorporatesFinancialInstitution : Ref :=
  incorporates "18 USC § 2339B(g)(2)" "31 USC § 5312(a)(2)"


def edge2339Bg4Incorporates2339Ab1 : Ref :=
  incorporates "18 USC § 2339B(g)(4)" "18 USC § 2339A(b)(1)"


def edge2339Bg4Incorporates2339Ab2 : Ref :=
  incorporates "18 USC § 2339B(g)(4)" "18 USC § 2339A(b)(2)"


def edge2339Bg4Incorporates2339Ab3 : Ref :=
  incorporates "18 USC § 2339B(g)(4)" "18 USC § 2339A(b)(3)"



def edge2339Bg6IncorporatesDesignation : Ref :=
  incorporates "18 USC § 2339B(g)(6)" "8 USC § 1189"



def edge2339BhNarrowsA1 : Ref :=
  exceptAsProvided "18 USC § 2339B(h)" "18 USC § 2339B(a)(1)"


def edge2339BiSavingsFirstAmendment : Ref :=
  savings "18 USC § 2339B(i)" "U.S. Const. amend. I"



def edge2339BjApprovalBarsA1 : Ref :=
  exceptAsProvided "18 USC § 2339B(j)" "18 USC § 2339B(a)(1)"


def edge2339BjIncorporatesTerroristActivity : Ref :=
  incorporates "18 USC § 2339B(j)" "8 USC § 1182(a)(3)(B)(iii)"






def edge2339BLexSpecialisOver2339A : Ref :=
  lexSpecialis "18 USC § 2339B(a)(1)" "18 USC § 2339A(a)"





def edge2339Ca1SubjectToB : Ref :=
  subjectTo "18 USC § 2339C(a)(1)" "18 USC § 2339C(b)"


def edge2339Ca1AIncorporatesTreatyList : Ref :=
  incorporates "18 USC § 2339C(a)(1)(A)" "18 USC § 2339C(e)(7)"


def edge2339Ca1IncorporatesPenalty : Ref :=
  incorporates "18 USC § 2339C(a)(1)" "18 USC § 2339C(d)(1)"


def edge2339Ca2IncorporatesPenalty : Ref :=
  incorporates "18 USC § 2339C(a)(2)" "18 USC § 2339C(d)(1)"



def edge2339Cc2AIncorporates2339B : Ref :=
  incorporates "18 USC § 2339C(c)(2)(A)" "18 USC § 2339B"



def edge2339Cc2BIncorporatesA : Ref :=
  incorporates "18 USC § 2339C(c)(2)(B)" "18 USC § 2339C(a)"


def edge2339CcIncorporatesPenalty : Ref :=
  incorporates "18 USC § 2339C(c)" "18 USC § 2339C(d)(2)"



def edge2339Ce6IncorporatesA1 : Ref :=
  incorporates "18 USC § 2339C(e)(6)" "18 USC § 2339C(a)(1)"


def edge2339Ce9IncorporatesInternationalOrg : Ref :=
  incorporates "18 USC § 2339C(e)(9)" "18 USC § 1116(b)(5)"





def edge2339Ce11IncorporatesSeriousBodilyInjuryAsEnacted : Ref :=
  incorporates "18 USC § 2339C(e)(11)" "18 USC § 1365(g)(3)"


def edge2339Ce12IncorporatesNational : Ref :=
  incorporates "18 USC § 2339C(e)(12)" "8 USC § 1101(a)(22)"



def edge2339Ce13Incorporates2339Bg4 : Ref :=
  incorporates "18 USC § 2339C(e)(13)" "18 USC § 2339B(g)(4)"



def edge2339CfSavingsOtherLiability : Ref :=
  savings "18 USC § 2339C(f)" "any other criminal, civil, or administrative liability or penalty"





def edge2339DaIncorporatesDesignation : Ref :=
  incorporates "18 USC § 2339D(a)" "8 USC § 1189(a)(1)"



def edge2339DaIncorporatesC4 : Ref :=
  incorporates "18 USC § 2339D(a)" "18 USC § 2339D(c)(4)"



def edge2339DaIncorporatesTerroristActivity : Ref :=
  incorporates "18 USC § 2339D(a)" "8 USC § 1182"



def edge2339DaIncorporatesTerrorism : Ref :=
  incorporates "18 USC § 2339D(a)" "22 USC § 2656f(d)(2)"




def edge2339Db1IncorporatesNational : Ref :=
  incorporates "18 USC § 2339D(b)(1)" "8 USC § 1101(a)(22)"


def edge2339Db1IncorporatesLpr : Ref :=
  incorporates "18 USC § 2339D(b)(1)" "8 USC § 1101(a)(20)"




def edge2339Dc1IncorporatesWmdAsEnacted : Ref :=
  incorporates "18 USC § 2339D(c)(1)" "18 USC § 2232a(c)(2)"



def edge2339Dc1IncorporatesWmdCorrected : Ref :=
  incorporates "18 USC § 2339D(c)(1)" "18 USC § 2332a(c)(2)"



def edge2339Dc2IncorporatesSeriousBodilyInjury : Ref :=
  incorporates "18 USC § 2339D(c)(2)" "18 USC § 1365(h)(3)"






def materialSupportChain : Chain :=
  { hops := [edge2339Ce13Incorporates2339Bg4, edge2339Bg4Incorporates2339Ab1] }



def chapterEdges : List Ref :=
  catalog2339 ++ catalog2339A ++
  [ edge2339bSavingsVenue
  , edge2339AaIncorporates2332bg5B
  , edge2339AaCarveOut2339A
  , edge2339AaCarveOut2339B
  , edge2339AaSavingsVenue
  , edge2339Ba1IncorporatesG6
  , edge2339Ba1IncorporatesTerroristActivity
  , edge2339Ba1IncorporatesTerrorism
  , edge2339Ba2ExceptSecretaryAuthorization
  , edge2339BbIncorporatesA2
  , edge2339Bd1AIncorporatesNational
  , edge2339Bd1AIncorporatesLpr
  , edge2339Bf1AiIncorporatesFrcp
  , edge2339Bf1CIncorporatesF5
  , edge2339Bf4IncorporatesF5
  , edge2339Bf6SavingsPrivileges
  , edge2339Bg1IncorporatesCipa
  , edge2339Bg2IncorporatesFinancialInstitution
  , edge2339Bg4Incorporates2339Ab1
  , edge2339Bg4Incorporates2339Ab2
  , edge2339Bg4Incorporates2339Ab3
  , edge2339Bg6IncorporatesDesignation
  , edge2339BhNarrowsA1
  , edge2339BiSavingsFirstAmendment
  , edge2339BjApprovalBarsA1
  , edge2339BjIncorporatesTerroristActivity
  , edge2339BLexSpecialisOver2339A
  , edge2339Ca1SubjectToB
  , edge2339Ca1AIncorporatesTreatyList
  , edge2339Ca1IncorporatesPenalty
  , edge2339Ca2IncorporatesPenalty
  , edge2339Cc2AIncorporates2339B
  , edge2339Cc2BIncorporatesA
  , edge2339CcIncorporatesPenalty
  , edge2339Ce6IncorporatesA1
  , edge2339Ce9IncorporatesInternationalOrg
  , edge2339Ce11IncorporatesSeriousBodilyInjuryAsEnacted
  , edge2339Ce12IncorporatesNational
  , edge2339Ce13Incorporates2339Bg4
  , edge2339CfSavingsOtherLiability
  , edge2339DaIncorporatesDesignation
  , edge2339DaIncorporatesC4
  , edge2339DaIncorporatesTerroristActivity
  , edge2339DaIncorporatesTerrorism
  , edge2339Db1IncorporatesNational
  , edge2339Db1IncorporatesLpr
  , edge2339Dc1IncorporatesWmdAsEnacted
  , edge2339Dc2IncorporatesSeriousBodilyInjury ]



def knownDanglingEdgeCount : Nat := 2

end Proving.USC.T18.Ch113B.MaterialSupport.Structure
