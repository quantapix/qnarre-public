







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Structure


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



inductive DefinedTerm where

  | officialProceeding

  | physicalForce

  | misleadingConduct

  | lawEnforcementOfficer


  | bodilyInjury

  | corruptlyPersuades

  | corruptlyFor1505
  deriving DecidableEq, Repr




def edge_1512a1_incorporates_1512a3 : Ref :=
  { source := "18 USC § 1512(a)(1)", target := "18 USC § 1512(a)(3)", kind := .Incorporates }


def edge_1512a2_incorporates_1512a3 : Ref :=
  { source := "18 USC § 1512(a)(2)", target := "18 USC § 1512(a)(3)", kind := .Incorporates }



def edge_1512a3A_incorporates_1111 : Ref :=
  { source := "18 USC § 1512(a)(3)(A)", target := "18 USC § 1111", kind := .Incorporates }


def edge_1512a3A_incorporates_1112 : Ref :=
  { source := "18 USC § 1512(a)(3)(A)", target := "18 USC § 1112", kind := .Incorporates }



def edge_1512b_incorporates_title18Fine : Ref :=
  { source := "18 USC § 1512(b)", target := "18 USC", kind := .Incorporates }


def edge_1512c_incorporates_title18Fine : Ref :=
  { source := "18 USC § 1512(c)", target := "18 USC", kind := .Incorporates }


def edge_1512d_incorporates_title18Fine : Ref :=
  { source := "18 USC § 1512(d)", target := "18 USC", kind := .Incorporates }



def edge_1512_exceptAsProvided_1512e : Ref :=
  { source := "18 USC § 1512", target := "18 USC § 1512(e)", kind := .ExceptAsProvided }



def edge_1512_incorporates_1512f : Ref :=
  { source := "18 USC § 1512", target := "18 USC § 1512(f)", kind := .Incorporates }



def edge_1512_incorporates_1512g : Ref :=
  { source := "18 USC § 1512", target := "18 USC § 1512(g)", kind := .Incorporates }




def edge_1512i_incorporates_1503 : Ref :=
  { source := "18 USC § 1503", target := "18 USC § 1512(i)", kind := .Incorporates }



def edge_1512j_notwithstanding_1512 : Ref :=
  { source := "18 USC § 1512(j)", target := "18 USC § 1512", kind := .Notwithstanding }



def edge_1512k_incorporates_1512 : Ref :=
  { source := "18 USC § 1512(k)", target := "18 USC § 1512", kind := .Incorporates }





def edge_1512_incorporates_1515a : Ref :=
  { source := "18 USC § 1512", target := "18 USC § 1515(a)", kind := .Incorporates }




def edge_1512_exceptAsProvided_1515c : Ref :=
  { source := "18 USC § 1512", target := "18 USC § 1515(c)", kind := .ExceptAsProvided }



def edge_1512c_lexSpecialis_1515b : Ref :=
  { source := "18 USC § 1512(c)", target := "18 USC § 1515(b)", kind := .LexSpecialis }




def edge_1512b3_incorporates_1512a2C : Ref :=
  { source := "18 USC § 1512(b)(3)", target := "18 USC § 1512(a)(2)(C)", kind := .Incorporates }



def edge_1512d2_incorporates_1512a2C : Ref :=
  { source := "18 USC § 1512(d)(2)", target := "18 USC § 1512(a)(2)(C)", kind := .Incorporates }





def edge_1513_incorporates_1515a : Ref :=
  { source := "18 USC § 1513", target := "18 USC § 1515(a)", kind := .Incorporates }


def edge_1515_incorporates_1515a : Ref :=
  { source := "18 USC § 1515", target := "18 USC § 1515(a)", kind := .Incorporates }



def edge_1505_incorporates_1515b : Ref :=
  { source := "18 USC § 1505", target := "18 USC § 1515(b)", kind := .Incorporates }



def edge_ch73_exceptAsProvided_1515c : Ref :=
  { source := "18 USC ch. 73", target := "18 USC § 1515(c)", kind := .ExceptAsProvided }

end Proving.USC.T18.Ch73.Reslice.Structure
