











import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Structure

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





structure DanglingRef where
  source     : String

  descriptor : String
  kind       : EdgeKind
  deriving DecidableEq, Repr








def edge_201b_incorporates_201a1 : Ref :=
  { source := "18 USC § 201(b)", target := "18 USC § 201(a)(1)", kind := .Incorporates }



def edge_201b_incorporates_201a2 : Ref :=
  { source := "18 USC § 201(b)", target := "18 USC § 201(a)(2)", kind := .Incorporates }



def edge_201b_incorporates_201a3 : Ref :=
  { source := "18 USC § 201(b)", target := "18 USC § 201(a)(3)", kind := .Incorporates }



def edge_201c_incorporates_201a1 : Ref :=
  { source := "18 USC § 201(c)(1)", target := "18 USC § 201(a)(1)", kind := .Incorporates }



def edge_201c_incorporates_201a2 : Ref :=
  { source := "18 USC § 201(c)(1)", target := "18 USC § 201(a)(2)", kind := .Incorporates }


def edge_201c_incorporates_201a3 : Ref :=
  { source := "18 USC § 201(c)(1)", target := "18 USC § 201(a)(3)", kind := .Incorporates }








def edge_201b_fine_thisTitle : Ref :=
  { source := "18 USC § 201(b)", target := "18 USC", kind := .Incorporates }



def edge_201c_fine_thisTitle : Ref :=
  { source := "18 USC § 201(c)", target := "18 USC", kind := .Incorporates }








def edge_201b3_exceptAsProvided_201d : Ref :=
  { source := "18 USC § 201(b)(3)", target := "18 USC § 201(d)", kind := .ExceptAsProvided }


def edge_201b4_exceptAsProvided_201d : Ref :=
  { source := "18 USC § 201(b)(4)", target := "18 USC § 201(d)", kind := .ExceptAsProvided }


def edge_201c2_exceptAsProvided_201d : Ref :=
  { source := "18 USC § 201(c)(2)", target := "18 USC § 201(d)", kind := .ExceptAsProvided }


def edge_201c3_exceptAsProvided_201d : Ref :=
  { source := "18 USC § 201(c)(3)", target := "18 USC § 201(d)", kind := .ExceptAsProvided }










def edge_201e_savings_1503 : Ref :=
  { source := "18 USC § 201(e)", target := "18 USC § 1503", kind := .Savings }


def edge_201e_savings_1504 : Ref :=
  { source := "18 USC § 201(e)", target := "18 USC § 1504", kind := .Savings }



def edge_201e_savings_1505 : Ref :=
  { source := "18 USC § 201(e)", target := "18 USC § 1505", kind := .Savings }








def dangling_201c1_properDischargeOfDuty : DanglingRef :=
  { source := "18 USC § 201(c)(1)"
  , descriptor := "law providing for the proper discharge of official duty"
  , kind := .ExceptAsProvided }



def dangling_201d_witnessFeesProvidedByLaw : DanglingRef :=
  { source := "18 USC § 201(d)"
  , descriptor := "law providing witness fees"
  , kind := .Incorporates }




def dangling_201b3_testimonyAuthority : DanglingRef :=
  { source := "18 USC § 201(b)(3)"
  , descriptor := "laws of the United States authorizing an agency, commission, or officer to hear evidence or take testimony"
  , kind := .Incorporates }




def dangling_201b1C_lawfulDuty : DanglingRef :=
  { source := "18 USC § 201(b)(1)(C)"
  , descriptor := "law imposing the lawful/official duty of the public official"
  , kind := .Incorporates }




def dangling_201c1_formerPublicOfficial : DanglingRef :=
  { source := "18 USC § 201(c)(1)"
  , descriptor := "definition of \"former public official\" (undefined in § 201(a))"
  , kind := .Incorporates }

end Proving.USC.T18.Ch11.EchoReslice.Structure
