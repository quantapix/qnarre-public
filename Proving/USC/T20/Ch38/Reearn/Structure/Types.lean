






import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Structure

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





def edge_1681a_incorporates_1687 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1687", kind := .Incorporates }


def edge_1681a_incorporates_1681c : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(c)", kind := .Incorporates }


def edge_1681c_incorporates_ch38 : Ref :=
  { source := "20 USC § 1681(c)", target := "20 USC ch. 38", kind := .Incorporates }


def edge_1681a_exceptAsProvided_1681a1 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(1)", kind := .ExceptAsProvided }


def edge_1681a_exceptAsProvided_1681a2 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(2)", kind := .ExceptAsProvided }


def edge_1681a_exceptAsProvided_1681a3 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(3)", kind := .ExceptAsProvided }


def edge_1681a_exceptAsProvided_1681a4 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(4)", kind := .ExceptAsProvided }


def edge_1681a_exceptAsProvided_1681a5 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(5)", kind := .ExceptAsProvided }


def edge_1681a_exceptAsProvided_1681a6 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(6)", kind := .ExceptAsProvided }


def edge_1681a_exceptAsProvided_1681a7 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(7)", kind := .ExceptAsProvided }



def edge_1681a_exceptAsProvided_1681a8 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(8)", kind := .ExceptAsProvided }


def edge_1681a_exceptAsProvided_1681a9 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(9)", kind := .ExceptAsProvided }


def edge_1681a6A_incorporates_26usc501a : Ref :=
  { source := "20 USC § 1681(a)(6)(A)", target := "26 USC § 501(a)", kind := .Incorporates }




def edge_1681a9_subjectTo_federalNondiscriminationLaw : Ref :=
  { source := "20 USC § 1681(a)(9)",
    target := "Federal nondiscrimination law (open class)", kind := .SubjectTo }



def edge_1681b_savings_1681a : Ref :=
  { source := "20 USC § 1681(b)", target := "20 USC § 1681(a)", kind := .Savings }



def edge_1681b_incorporates_ch38 : Ref :=
  { source := "20 USC § 1681(b)", target := "20 USC ch. 38", kind := .Incorporates }





def edge_1682_incorporates_1681 : Ref :=
  { source := "20 USC § 1682", target := "20 USC § 1681", kind := .Incorporates }


def edge_1682_subjectTo_1683 : Ref :=
  { source := "20 USC § 1682", target := "20 USC § 1683", kind := .SubjectTo }




def edge_1682_exceptAsProvided_1682Proviso : Ref :=
  { source := "20 USC § 1682", target := "20 USC § 1682 (proviso)", kind := .ExceptAsProvided }



def edge_1685_savings_1682 : Ref :=
  { source := "20 USC § 1685", target := "20 USC § 1682", kind := .Savings }




def edge_1683_incorporates_1682 : Ref :=
  { source := "20 USC § 1683", target := "20 USC § 1682", kind := .Incorporates }


def edge_1683_incorporates_5uscCh7 : Ref :=
  { source := "20 USC § 1683", target := "5 USC ch. 7", kind := .Incorporates }




def edge_1683_notwithstanding_5usc701 : Ref :=
  { source := "20 USC § 1683", target := "5 USC § 701", kind := .Notwithstanding }



def edge_1683_subjectTo_otherJudicialReviewLaw : Ref :=
  { source := "20 USC § 1683",
    target := "judicial review otherwise provided by law (open class)", kind := .SubjectTo }





def edge_1684_incorporates_1687 : Ref :=
  { source := "20 USC § 1684", target := "20 USC § 1687", kind := .Incorporates }



def edge_1684_savings_1684 : Ref :=
  { source := "20 USC § 1684", target := "20 USC § 1684 (special-services proviso)",
    kind := .Savings }





def edge_1685_savings_ch38 : Ref :=
  { source := "20 USC § 1685", target := "20 USC ch. 38", kind := .Savings }




def edge_1686_notwithstanding_ch38 : Ref :=
  { source := "20 USC § 1686", target := "20 USC ch. 38", kind := .Notwithstanding }



def edge_1686_lexSpecialis_1681 : Ref :=
  { source := "20 USC § 1686", target := "20 USC § 1681", kind := .LexSpecialis }



def edge_1686_incorporates_pl92318 : Ref :=
  { source := "20 USC § 1686",
    target := "Education Amendments of 1972, Pub. L. 92-318 (non-Code target)",
    kind := .Incorporates }




def edge_1687_incorporates_ch38 : Ref :=
  { source := "20 USC § 1687", target := "20 USC ch. 38", kind := .Incorporates }





def edge_1687_incorporates_20usc7801 : Ref :=
  { source := "20 USC § 1687(2)(B)", target := "20 USC § 7801", kind := .Incorporates }





def edge_1687_exceptAsProvided_1681 : Ref :=
  { source := "20 USC § 1687", target := "20 USC § 1681", kind := .ExceptAsProvided }






def edge_1688_savings_ch38 : Ref :=
  { source := "20 USC § 1688", target := "20 USC ch. 38", kind := .Savings }





def edge_1689a1_incorporates_1681 : Ref :=
  { source := "20 USC § 1689(a)(1)", target := "20 USC § 1681", kind := .Incorporates }


def edge_1689a1_incorporates_1092f : Ref :=
  { source := "20 USC § 1689(a)(1)", target := "20 USC § 1092(f)", kind := .Incorporates }



def edge_1689a8_incorporates_1682 : Ref :=
  { source := "20 USC § 1689(a)(8)", target := "20 USC § 1682", kind := .Incorporates }



def edge_1689b1_notwithstanding_otherLaw : Ref :=
  { source := "20 USC § 1689(b)(1)",
    target := "any other provision of law (open class)", kind := .Notwithstanding }





def edge_1689b1_incorporates_34usc13925 : Ref :=
  { source := "20 USC § 1689(b)(1)", target := "34 USC § 13925", kind := .Incorporates }



def edge_1689c_incorporates_1681 : Ref :=
  { source := "20 USC § 1689(c)", target := "20 USC § 1681", kind := .Incorporates }


def edge_1689c_incorporates_1092f : Ref :=
  { source := "20 USC § 1689(c)", target := "20 USC § 1092(f)", kind := .Incorporates }



def edge_1689e2_incorporates_20usc7801 : Ref :=
  { source := "20 USC § 1689(e)(2)", target := "20 USC § 7801", kind := .Incorporates }



def edge_1689e3_incorporates_20usc1002 : Ref :=
  { source := "20 USC § 1689(e)(3)", target := "20 USC § 1002", kind := .Incorporates }

end Proving.USC.T20.Ch38.Reearn.Structure
