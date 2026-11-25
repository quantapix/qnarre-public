import Proving.USC.Common.Types

set_option autoImplicit false









namespace Proving.USC.T18.Ch77.Part3.Structure

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

  kind : EdgeKind
  deriving Repr


structure TermIncorporation where

  term : String

  ref : Ref
  deriving Repr





def edge_1593a_notwithstanding_3663 : Ref :=
  { source := "18 USC § 1593(a)", target := "18 USC § 3663", kind := .Notwithstanding }



def edge_1593a_notwithstanding_3663A : Ref :=
  { source := "18 USC § 1593(a)", target := "18 USC § 3663A", kind := .Notwithstanding }



def edge_1593a_savings_otherPenalties : Ref :=
  { source := "18 USC § 1593(a)"
  , target := "any other civil or criminal penalties authorized by law"
  , kind := .Savings }



def edge_1593a_incorporates_ch77 : Ref :=
  { source := "18 USC § 1593(a)", target := "18 USC ch. 77", kind := .Incorporates }





def edge_1593b1_incorporates_1593b3 : Ref :=
  { source := "18 USC § 1593(b)(1)", target := "18 USC § 1593(b)(3)", kind := .Incorporates }


def edge_1593b2_incorporates_3664 : Ref :=
  { source := "18 USC § 1593(b)(2)", target := "18 USC § 3664", kind := .Incorporates }




def edge_1593b2_incorporates_3663A : Ref :=
  { source := "18 USC § 1593(b)(2)", target := "18 USC § 3663A", kind := .Incorporates }


def edge_1593b3_incorporates_2259c2 : Ref :=
  { source := "18 USC § 1593(b)(3)", target := "18 USC § 2259(c)(2)", kind := .Incorporates }



def edge_1593b3_incorporates_flsa : Ref :=
  { source := "18 USC § 1593(b)(3)", target := "29 USC § 201", kind := .Incorporates }



def edge_1593b4_incorporates_853 : Ref :=
  { source := "18 USC § 1593(b)(4)", target := "21 USC § 853", kind := .Incorporates }



def edge_1593b4_except_853d : Ref :=
  { source := "18 USC § 1593(b)(4)", target := "21 USC § 853(d)", kind := .ExceptAsProvided }





def edge_1593b4_internal_forfeitureAntecedent : Ref :=
  { source := "18 USC § 1593(b)(4)", target := "18 USC § 1593(b)", kind := .Incorporates }





def edge_1593c_incorporates_ch77 : Ref :=
  { source := "18 USC § 1593(c)", target := "18 USC ch. 77", kind := .Incorporates }




def edge_1593c_lexSpecialis_3663A : Ref :=
  { source := "18 USC § 1593(c)", target := "18 USC § 3663A", kind := .LexSpecialis }





def term_fullAmountOfVictimsLosses : TermIncorporation :=
  { term := "full amount of the victim's losses", ref := edge_1593b3_incorporates_2259c2 }


def term_victim : TermIncorporation :=
  { term := "victim", ref := edge_1593c_incorporates_ch77 }

end Proving.USC.T18.Ch77.Part3.Structure
