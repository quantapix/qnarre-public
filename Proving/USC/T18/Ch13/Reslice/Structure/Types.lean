import Proving.USC.Common.Types

set_option autoImplicit false









namespace Proving.USC.T18.Ch13.Reslice.Structure

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
  deriving Repr






def edge_245b_subjectTo_245a1_certification : Ref :=
  { source := "18 USC § 245(b)", target := "18 USC § 245(a)(1)", kind := .SubjectTo }



def edge_245a1_savings_stateJurisdiction : Ref :=
  { source := "18 USC § 245(a)(1)", target := "State and local law", kind := .Savings }





def edge_245a2_savings_federalInvestigation : Ref :=
  { source := "18 USC § 245(a)(2)", target := "18 USC § 245(a)(1)", kind := .Savings }



def edge_245b4A_incorporates_245b1 : Ref :=
  { source := "18 USC § 245(b)(4)(A)", target := "18 USC § 245(b)(1)", kind := .Incorporates }


def edge_245b4A_incorporates_245b2 : Ref :=
  { source := "18 USC § 245(b)(4)(A)", target := "18 USC § 245(b)(2)", kind := .Incorporates }


def edge_245b5_incorporates_245b1 : Ref :=
  { source := "18 USC § 245(b)(5)", target := "18 USC § 245(b)(1)", kind := .Incorporates }


def edge_245b5_incorporates_245b2 : Ref :=
  { source := "18 USC § 245(b)(5)", target := "18 USC § 245(b)(2)", kind := .Incorporates }




def edge_245b5_incorporates_245b_speechDefinition : Ref :=
  { source := "18 USC § 245(b)(5)", target := "18 USC § 245(b)", kind := .Incorporates }



def edge_245b_incorporates_3571_fine : Ref :=
  { source := "18 USC § 245(b)", target := "18 USC § 3571", kind := .Incorporates }





def edge_245b2F_exceptAsProvided_lodgingProprietor : Ref :=
  { source := "18 USC § 245(b)(2)(F)", target := "18 USC § 245(b)", kind := .ExceptAsProvided }


def edge_245b4A_exceptAsProvided_lodgingProprietor : Ref :=
  { source := "18 USC § 245(b)(4)(A)", target := "18 USC § 245(b)", kind := .ExceptAsProvided }





def edge_245c_exceptAsProvided_lawEnforcementOfficer : Ref :=
  { source := "18 USC § 245", target := "18 USC § 245(c)", kind := .ExceptAsProvided }


def edge_245_incorporates_245d_stateDefinition : Ref :=
  { source := "18 USC § 245", target := "18 USC § 245(d)", kind := .Incorporates }




def edge_247a_incorporates_247b_circumstances : Ref :=
  { source := "18 USC § 247(a)", target := "18 USC § 247(b)", kind := .Incorporates }


def edge_247a_incorporates_247d_punishment : Ref :=
  { source := "18 USC § 247(a)", target := "18 USC § 247(d)", kind := .Incorporates }


def edge_247c_incorporates_247d_punishment : Ref :=
  { source := "18 USC § 247(c)", target := "18 USC § 247(d)", kind := .Incorporates }



def edge_247d_incorporates_3571_fine : Ref :=
  { source := "18 USC § 247(d)", target := "18 USC § 3571", kind := .Incorporates }




def edge_247_subjectTo_247e_certification : Ref :=
  { source := "18 USC § 247", target := "18 USC § 247(e)", kind := .SubjectTo }



def edge_247a_incorporates_247f_definition : Ref :=
  { source := "18 USC § 247(a)", target := "18 USC § 247(f)", kind := .Incorporates }


def edge_247c_incorporates_247f_definition : Ref :=
  { source := "18 USC § 247(c)", target := "18 USC § 247(f)", kind := .Incorporates }




def edge_247_subjectTo_247g_limitations : Ref :=
  { source := "18 USC § 247", target := "18 USC § 247(g)", kind := .SubjectTo }




def edge_247g_lexSpecialis_3282 : Ref :=
  { source := "18 USC § 247(g)", target := "18 USC § 3282", kind := .LexSpecialis }





def edge_248a_subjectTo_248b_penalties : Ref :=
  { source := "18 USC § 248(a)", target := "18 USC § 248(b)", kind := .SubjectTo }


def edge_248a_subjectTo_248c_remedies : Ref :=
  { source := "18 USC § 248(a)", target := "18 USC § 248(c)", kind := .SubjectTo }




def edge_248a_incorporates_248e_definitions : Ref :=
  { source := "18 USC § 248(a)", target := "18 USC § 248(e)", kind := .Incorporates }





def edge_248a_exceptAsProvided_parentalCarve : Ref :=
  { source := "18 USC § 248(a)(1)", target := "18 USC § 248(a)", kind := .ExceptAsProvided }


def edge_248b_incorporates_248a_violation : Ref :=
  { source := "18 USC § 248(b)", target := "18 USC § 248(a)", kind := .Incorporates }



def edge_248b_incorporates_3571_fine : Ref :=
  { source := "18 USC § 248(b)", target := "18 USC § 3571", kind := .Incorporates }





def edge_248b_notwithstanding_3571 : Ref :=
  { source := "18 USC § 248(b)", target := "18 USC § 3571", kind := .Notwithstanding }



def edge_248c1A_incorporates_248a_conduct : Ref :=
  { source := "18 USC § 248(c)(1)(A)", target := "18 USC § 248(a)", kind := .Incorporates }





def edge_248c1A_exceptAsProvided_standingLimit : Ref :=
  { source := "18 USC § 248(c)(1)(A)", target := "18 USC § 248(a)(1)", kind := .ExceptAsProvided }



def edge_248c2B_incorporates_248c1B : Ref :=
  { source := "18 USC § 248(c)(2)(B)", target := "18 USC § 248(c)(1)(B)", kind := .Incorporates }


def edge_248c3B_incorporates_248c2B : Ref :=
  { source := "18 USC § 248(c)(3)(B)", target := "18 USC § 248(c)(2)(B)", kind := .Incorporates }




def edge_248d1_savings_firstAmendment : Ref :=
  { source := "18 USC § 248(d)(1)", target := "U.S. Const. amend. I", kind := .Savings }



def edge_248d2_savings_existingRemedies : Ref :=
  { source := "18 USC § 248(d)(2)", target := "existing legal remedies (other law)", kind := .Savings }



def edge_248d3_savings_stateAndLocalLaw : Ref :=
  { source := "18 USC § 248(d)(3)", target := "State and local law", kind := .Savings }








def edge_248d3_savings_247_nonExclusive : Ref :=
  { source := "18 USC § 248(d)(3)", target := "18 USC § 247", kind := .Savings }




def edge_248d4_savings_stateAbortionLaws : Ref :=
  { source := "18 USC § 248(d)(4)", target := "State and local law", kind := .Savings }

end Proving.USC.T18.Ch13.Reslice.Structure
