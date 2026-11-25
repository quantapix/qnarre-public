








import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Structure


abbrev ComplaintText := _root_.Proving.USC.Common.ComplaintText


inductive EdgeKind where

  | Incorporates

  | SubjectTo

  | Notwithstanding

  | ExceptAsProvided

  | Savings

  | LexSpecialis
  deriving DecidableEq





structure Ref where
  source : String
  target : String
  kind   : EdgeKind
  deriving DecidableEq


structure DefinedTerm where
  term      : String
  definedAt : String
  deriving DecidableEq


structure PreservedLaw where
  body : String
  deriving DecidableEq







def edge245a1_savings_stateJurisdiction : Ref :=
  { source := "18 USC § 245(a)(1)", target := "State and local law (jurisdiction and prosecutorial responsibility)"
  , kind := .Savings }




def edge245b_subjectTo_245a1Certification : Ref :=
  { source := "18 USC § 245(b)", target := "18 USC § 245(a)(1)", kind := .SubjectTo }




def edge245a2_savings_federalInvestigation : Ref :=
  { source := "18 USC § 245(a)(2)", target := "18 USC § 245(a)(1)", kind := .Savings }



def edge245b_incorporates_3571 : Ref :=
  { source := "18 USC § 245(b)", target := "18 USC § 3571", kind := .Incorporates }



def edge245b4A_incorporates_245b1 : Ref :=
  { source := "18 USC § 245(b)(4)(A)", target := "18 USC § 245(b)(1)", kind := .Incorporates }


def edge245b4A_incorporates_245b2 : Ref :=
  { source := "18 USC § 245(b)(4)(A)", target := "18 USC § 245(b)(2)", kind := .Incorporates }



def edge245b5_incorporates_245b1 : Ref :=
  { source := "18 USC § 245(b)(5)", target := "18 USC § 245(b)(1)", kind := .Incorporates }


def edge245b5_incorporates_245b2 : Ref :=
  { source := "18 USC § 245(b)(5)", target := "18 USC § 245(b)(2)", kind := .Incorporates }




def edge245b5_incorporates_speechDefinition : Ref :=
  { source := "18 USC § 245(b)(5)", target := "18 USC § 245(b)", kind := .Incorporates }




def edge245b_incorporates_245d : Ref :=
  { source := "18 USC § 245(b)", target := "18 USC § 245(d)", kind := .Incorporates }





def edge245b2F_exceptAsProvided_proprietorProviso : Ref :=
  { source := "18 USC § 245(b)(2)(F)", target := "18 USC § 245(b)", kind := .ExceptAsProvided }



def edge245b4A_exceptAsProvided_proprietorProviso : Ref :=
  { source := "18 USC § 245(b)(4)(A)", target := "18 USC § 245(b)", kind := .ExceptAsProvided }



def edge245b_exceptAsProvided_245c : Ref :=
  { source := "18 USC § 245(b)", target := "18 USC § 245(c)", kind := .ExceptAsProvided }



def edge245c_incorporates_lawEnforcementOfficerDefinition : Ref :=
  { source := "18 USC § 245(c)", target := "18 USC § 245(c)", kind := .Incorporates }


def term245State : DefinedTerm := { term := "State", definedAt := "18 USC § 245(d)" }



def term245ParticipatingLawfully : DefinedTerm :=
  { term := "participating lawfully in speech or peaceful assembly", definedAt := "18 USC § 245(b)" }


def term245LawEnforcementOfficer : DefinedTerm :=
  { term := "law enforcement officer", definedAt := "18 USC § 245(c)" }


def law245StateJurisdiction : PreservedLaw :=
  { body := "State, possession, Commonwealth and District of Columbia jurisdiction over the same acts, and State and local prosecutorial responsibility" }


def law245FederalInvestigation : PreservedLaw :=
  { body := "authority of Federal officers and of a Federal grand jury to investigate possible violations of 18 USC § 245" }





def edge247a_incorporates_247b : Ref :=
  { source := "18 USC § 247(a)", target := "18 USC § 247(b)", kind := .Incorporates }


def edge247a_incorporates_247d : Ref :=
  { source := "18 USC § 247(a)", target := "18 USC § 247(d)", kind := .Incorporates }


def edge247c_incorporates_247d : Ref :=
  { source := "18 USC § 247(c)", target := "18 USC § 247(d)", kind := .Incorporates }



def edge247d_incorporates_247ac : Ref :=
  { source := "18 USC § 247(d)", target := "18 USC § 247(a)", kind := .Incorporates }



def edge247d_incorporates_3571 : Ref :=
  { source := "18 USC § 247(d)", target := "18 USC § 3571", kind := .Incorporates }




def edge247a_subjectTo_247e : Ref :=
  { source := "18 USC § 247(a)", target := "18 USC § 247(e)", kind := .SubjectTo }


def edge247c_subjectTo_247e : Ref :=
  { source := "18 USC § 247(c)", target := "18 USC § 247(e)", kind := .SubjectTo }



def edge247a1_incorporates_247f : Ref :=
  { source := "18 USC § 247(a)(1)", target := "18 USC § 247(f)", kind := .Incorporates }


def edge247c_incorporates_247f : Ref :=
  { source := "18 USC § 247(c)", target := "18 USC § 247(f)", kind := .Incorporates }





def edge247a_subjectTo_247g : Ref :=
  { source := "18 USC § 247(a)", target := "18 USC § 247(g)", kind := .SubjectTo }


def edge247c_subjectTo_247g : Ref :=
  { source := "18 USC § 247(c)", target := "18 USC § 247(g)", kind := .SubjectTo }



def edge247g_lexSpecialis_3282 : Ref :=
  { source := "18 USC § 247(g)", target := "18 USC § 3282", kind := .LexSpecialis }


def term247ReligiousRealProperty : DefinedTerm :=
  { term := "religious real property", definedAt := "18 USC § 247(f)" }




def edge248a_incorporates_248b : Ref :=
  { source := "18 USC § 248(a)", target := "18 USC § 248(b)", kind := .Incorporates }


def edge248a_incorporates_248c : Ref :=
  { source := "18 USC § 248(a)", target := "18 USC § 248(c)", kind := .Incorporates }




def edge248a_exceptAsProvided_parentGuardian : Ref :=
  { source := "18 USC § 248(a)", target := "18 USC § 248(a)", kind := .ExceptAsProvided }



def edge248b_notwithstanding_3571 : Ref :=
  { source := "18 USC § 248(b)", target := "18 USC § 3571", kind := .Notwithstanding }



def edge248b_incorporates_3571 : Ref :=
  { source := "18 USC § 248(b)", target := "18 USC § 3571", kind := .Incorporates }



def edge248b2_incorporates_248 : Ref :=
  { source := "18 USC § 248(b)(2)", target := "18 USC § 248", kind := .Incorporates }





def edge248c1A_subjectTo_248a1 : Ref :=
  { source := "18 USC § 248(c)(1)(A)", target := "18 USC § 248(a)(1)", kind := .SubjectTo }





def edge248c1A_subjectTo_248a2 : Ref :=
  { source := "18 USC § 248(c)(1)(A)", target := "18 USC § 248(a)(2)", kind := .SubjectTo }



def edge248c1A_incorporates_248c1B : Ref :=
  { source := "18 USC § 248(c)(1)(A)", target := "18 USC § 248(c)(1)(B)", kind := .Incorporates }





def edge248c2B_incorporates_248c1B : Ref :=
  { source := "18 USC § 248(c)(2)(B)", target := "18 USC § 248(c)(1)(B)", kind := .Incorporates }



def edge248c3B_incorporates_248c2B : Ref :=
  { source := "18 USC § 248(c)(3)(B)", target := "18 USC § 248(c)(2)(B)", kind := .Incorporates }



def edge248a2_incorporates_firstAmendment : Ref :=
  { source := "18 USC § 248(a)(2)", target := "U.S. Const. amend. I", kind := .Incorporates }




def edge248d1_savings_firstAmendment : Ref :=
  { source := "18 USC § 248(d)(1)", target := "U.S. Const. amend. I", kind := .Savings }



def edge248d2_savings_existingRemedies : Ref :=
  { source := "18 USC § 248(d)(2)", target := "existing legal remedies for interference with First Amendment activity outside a facility"
  , kind := .Savings }



def edge248d3_savings_stateLocalLaw : Ref :=
  { source := "18 USC § 248(d)(3)", target := "State or local laws providing criminal penalties or civil remedies for the same conduct"
  , kind := .Savings }




def edge248d4_savings_stateReproductiveRegulation : Ref :=
  { source := "18 USC § 248(d)(4)", target := "State or local laws regulating the performance of abortions or other reproductive health services"
  , kind := .Savings }



def edge248a_incorporates_248e : Ref :=
  { source := "18 USC § 248(a)", target := "18 USC § 248(e)", kind := .Incorporates }


def term248Facility : DefinedTerm := { term := "facility", definedAt := "18 USC § 248(e)(1)" }

def term248InterfereWith : DefinedTerm := { term := "interfere with", definedAt := "18 USC § 248(e)(2)" }

def term248Intimidate : DefinedTerm := { term := "intimidate", definedAt := "18 USC § 248(e)(3)" }

def term248PhysicalObstruction : DefinedTerm := { term := "physical obstruction", definedAt := "18 USC § 248(e)(4)" }

def term248ReproductiveHealthServices : DefinedTerm :=
  { term := "reproductive health services", definedAt := "18 USC § 248(e)(5)" }

def term248State : DefinedTerm := { term := "State", definedAt := "18 USC § 248(e)(6)" }


def law248FirstAmendmentConduct : PreservedLaw :=
  { body := "expressive conduct protected from legal prohibition by the First Amendment to the Constitution" }

def law248ExistingRemedies : PreservedLaw :=
  { body := "existing legal remedies for interference with free speech or free exercise activity occurring outside a facility" }

def law248StateLocalConcurrent : PreservedLaw :=
  { body := "State or local laws providing criminal penalties or civil remedies for conduct prohibited by 18 USC § 248" }

def law248StateReproductiveRegulation : PreservedLaw :=
  { body := "State or local laws regulating the performance of abortions or other reproductive health services" }

end Proving.USC.T18.Ch13.Reearn.Structure
