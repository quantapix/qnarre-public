







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Structure

open Proving.USC.Common


inductive EdgeKind


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






def e1542_incorporates_passportLaws : Ref :=
  { source := "18 USC § 1542"
  , target := "laws regulating the issuance of passports and rules prescribed pursuant to such laws (no section cited)"
  , kind := .Incorporates }



def e1542_incorporates_2331 : Ref :=
  { source := "18 USC § 1542", target := "18 USC § 2331", kind := .Incorporates }



def e1542_incorporates_929a : Ref :=
  { source := "18 USC § 1542", target := "18 USC § 929(a)", kind := .Incorporates }



def e1542_incorporates_3571 : Ref :=
  { source := "18 USC § 1542", target := "18 USC § 3571", kind := .Incorporates }



def e1542_subjectTo_1547 : Ref :=
  { source := "18 USC § 1542", target := "18 USC § 1547", kind := .SubjectTo }



def e1543_incorporates_2331 : Ref :=
  { source := "18 USC § 1543", target := "18 USC § 2331", kind := .Incorporates }

def e1543_incorporates_929a : Ref :=
  { source := "18 USC § 1543", target := "18 USC § 929(a)", kind := .Incorporates }

def e1543_incorporates_3571 : Ref :=
  { source := "18 USC § 1543", target := "18 USC § 3571", kind := .Incorporates }

def e1543_subjectTo_1547 : Ref :=
  { source := "18 USC § 1543", target := "18 USC § 1547", kind := .SubjectTo }





def e1544_incorporates_passportRules : Ref :=
  { source := "18 USC § 1544"
  , target := "rules prescribed pursuant to the laws regulating the issuance of passports (no section cited)"
  , kind := .Incorporates }



def e1544_incorporates_passportConditions : Ref :=
  { source := "18 USC § 1544"
  , target := "conditions and restrictions contained in the passport instrument (no section cited)"
  , kind := .Incorporates }

def e1544_incorporates_2331 : Ref :=
  { source := "18 USC § 1544", target := "18 USC § 2331", kind := .Incorporates }

def e1544_incorporates_929a : Ref :=
  { source := "18 USC § 1544", target := "18 USC § 929(a)", kind := .Incorporates }

def e1544_incorporates_3571 : Ref :=
  { source := "18 USC § 1544", target := "18 USC § 3571", kind := .Incorporates }

def e1544_subjectTo_1547 : Ref :=
  { source := "18 USC § 1544", target := "18 USC § 1547", kind := .SubjectTo }







def e1546a_incorporates_immigrationLaws : Ref :=
  { source := "18 USC § 1546(a)"
  , target := "immigration laws and regulations prescribing entry, stay, and employment documents (no section cited)"
  , kind := .Incorporates }



def e1546a_incorporates_28usc1746 : Ref :=
  { source := "18 USC § 1546(a)", target := "28 USC § 1746", kind := .Incorporates }

def e1546a_incorporates_2331 : Ref :=
  { source := "18 USC § 1546(a)", target := "18 USC § 2331", kind := .Incorporates }

def e1546a_incorporates_929a : Ref :=
  { source := "18 USC § 1546(a)", target := "18 USC § 929(a)", kind := .Incorporates }

def e1546a_incorporates_3571 : Ref :=
  { source := "18 USC § 1546(a)", target := "18 USC § 3571", kind := .Incorporates }





def e1546a_exceptAsProvided_officerDirection : Ref :=
  { source := "18 USC § 1546(a)"
  , target := "direction of the Attorney General, the Commissioner of the Immigration and Naturalization Service, or other proper officer (no section cited)"
  , kind := .ExceptAsProvided }




def e1546b_incorporates_ina274Ab : Ref :=
  { source := "18 USC § 1546(b)"
  , target := "Immigration and Nationality Act § 274A(b) (codified at 8 USC § 1324a(b))"
  , kind := .Incorporates }




def e1546c_exceptAsProvided_lawEnforcementActivity : Ref :=
  { source := "18 USC § 1546(a)"
  , target := "18 USC § 1546(c)"
  , kind := .ExceptAsProvided }




def e1546c_savings_occaTitleV : Ref :=
  { source := "18 USC § 1546(c)"
  , target := "title V of the Organized Crime Control Act of 1970 (18 USC note prec. 3481)"
  , kind := .Savings }



def e1546_incorporates_1546c_stateDefinition : Ref :=
  { source := "18 USC § 1546", target := "18 USC § 1546(c)", kind := .Incorporates }

def e1546_subjectTo_1547 : Ref :=
  { source := "18 USC § 1546", target := "18 USC § 1547", kind := .SubjectTo }






def e1547_notwithstanding_ch75 : Ref :=
  { source := "18 USC § 1547"
  , target := "18 USC ch. 75 (every offense other than 18 USC § 1545)"
  , kind := .Notwithstanding }






def e_ch75_lexSpecialis_penaltyConflict : Ref :=
  { source := "18 USC §§ 1542, 1543, 1544, 1546(a)"
  , target := "18 USC § 1547"
  , kind := .LexSpecialis }

end Proving.USC.T18.Ch75.Reslice.Structure
