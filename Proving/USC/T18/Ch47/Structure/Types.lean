import Proving.USC.Common.Types

set_option autoImplicit false



























namespace Proving.USC.T18.Ch47.Structure





abbrev Cite := String


inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis
  deriving DecidableEq, Repr


structure Ref where
  source : Cite
  target : Cite
  kind   : EdgeKind
  deriving DecidableEq, Repr




def edge_1028a_incorporates_1028c : Ref :=
  { source := "18 USC § 1028(a)", target := "18 USC § 1028(c)", kind := .Incorporates }


def edge_1028a_incorporates_1028b : Ref :=
  { source := "18 USC § 1028(a)", target := "18 USC § 1028(b)", kind := .Incorporates }


def edge_1028b1_exceptAsProvided_1028b3 : Ref :=
  { source := "18 USC § 1028(b)(1)", target := "18 USC § 1028(b)(3)", kind := .ExceptAsProvided }


def edge_1028b1_exceptAsProvided_1028b4 : Ref :=
  { source := "18 USC § 1028(b)(1)", target := "18 USC § 1028(b)(4)", kind := .ExceptAsProvided }


def edge_1028b2_exceptAsProvided_1028b3 : Ref :=
  { source := "18 USC § 1028(b)(2)", target := "18 USC § 1028(b)(3)", kind := .ExceptAsProvided }


def edge_1028b2_exceptAsProvided_1028b4 : Ref :=
  { source := "18 USC § 1028(b)(2)", target := "18 USC § 1028(b)(4)", kind := .ExceptAsProvided }


def edge_1028b1C_incorporates_1028a5 : Ref :=
  { source := "18 USC § 1028(b)(1)(C)", target := "18 USC § 1028(a)(5)", kind := .Incorporates }


def edge_1028b1D_incorporates_1028a7 : Ref :=
  { source := "18 USC § 1028(b)(1)(D)", target := "18 USC § 1028(a)(7)", kind := .Incorporates }


def edge_1028b2B_incorporates_1028a3 : Ref :=
  { source := "18 USC § 1028(b)(2)(B)", target := "18 USC § 1028(a)(3)", kind := .Incorporates }


def edge_1028b2B_incorporates_1028a7 : Ref :=
  { source := "18 USC § 1028(b)(2)(B)", target := "18 USC § 1028(a)(7)", kind := .Incorporates }


def edge_1028b3A_incorporates_929a2 : Ref :=
  { source := "18 USC § 1028(b)(3)(A)", target := "18 USC § 929(a)(2)", kind := .Incorporates }


def edge_1028b3B_incorporates_924c3 : Ref :=
  { source := "18 USC § 1028(b)(3)(B)", target := "18 USC § 924(c)(3)", kind := .Incorporates }



def edge_1028b3C_incorporates_1028 : Ref :=
  { source := "18 USC § 1028(b)(3)(C)", target := "18 USC § 1028", kind := .Incorporates }


def edge_1028b4_incorporates_2331_5 : Ref :=
  { source := "18 USC § 1028(b)(4)", target := "18 USC § 2331(5)", kind := .Incorporates }


def edge_1028b4_incorporates_2331_1 : Ref :=
  { source := "18 USC § 1028(b)(4)", target := "18 USC § 2331(1)", kind := .Incorporates }



def edge_1028b6_lexSpecialis_1028b1 : Ref :=
  { source := "18 USC § 1028(b)(6)", target := "18 USC § 1028(b)(1)", kind := .LexSpecialis }


def edge_1028b6_lexSpecialis_1028b2 : Ref :=
  { source := "18 USC § 1028(b)(6)", target := "18 USC § 1028(b)(2)", kind := .LexSpecialis }


def edge_1028b6_lexSpecialis_1028b3 : Ref :=
  { source := "18 USC § 1028(b)(6)", target := "18 USC § 1028(b)(3)", kind := .LexSpecialis }


def edge_1028b6_lexSpecialis_1028b4 : Ref :=
  { source := "18 USC § 1028(b)(6)", target := "18 USC § 1028(b)(4)", kind := .LexSpecialis }


def edge_1028c2_incorporates_1028a4 : Ref :=
  { source := "18 USC § 1028(c)(2)", target := "18 USC § 1028(a)(4)", kind := .Incorporates }



def edge_1028_incorporates_1028d : Ref :=
  { source := "18 USC § 1028", target := "18 USC § 1028(d)", kind := .Incorporates }




def edge_1028A_incorporates_1028d : Ref :=
  { source := "18 USC § 1028A", target := "18 USC § 1028(d)", kind := .Incorporates }



def edge_1028d7D_incorporates_1029e : Ref :=
  { source := "18 USC § 1028(d)(7)(D)", target := "18 USC § 1029(e)", kind := .Incorporates }


def edge_1028e_savings_ch224 : Ref :=
  { source := "18 USC § 1028(e)", target := "18 USC ch. 224", kind := .Savings }




def edge_1028e_savings_lawEnforcement : Ref :=
  { source := "18 USC § 1028(e)",
    target := "lawfully authorized investigative, protective, or intelligence activity (uncited)",
    kind := .Savings }



def edge_1028f_incorporates_1028b : Ref :=
  { source := "18 USC § 1028(f)", target := "18 USC § 1028(b)", kind := .Incorporates }



def edge_1028a7_incorporates_1028i : Ref :=
  { source := "18 USC § 1028(a)(7)", target := "18 USC § 1028(i)", kind := .Incorporates }



def edge_1028h_incorporates_1028a : Ref :=
  { source := "18 USC § 1028(h)", target := "18 USC § 1028(a)", kind := .Incorporates }





def edge_1028g_subjectTo_853 : Ref :=
  { source := "18 USC § 1028(g)", target := "21 USC § 853", kind := .SubjectTo }




def edge_1029a_incorporates_1029c : Ref :=
  { source := "18 USC § 1029(a)", target := "18 USC § 1029(c)", kind := .Incorporates }



def edge_1029a9_exceptAsProvided_1029g1 : Ref :=
  { source := "18 USC § 1029(a)(9)", target := "18 USC § 1029(g)(1)", kind := .ExceptAsProvided }



def edge_1029a9_exceptAsProvided_1029g2 : Ref :=
  { source := "18 USC § 1029(a)(9)", target := "18 USC § 1029(g)(2)", kind := .ExceptAsProvided }



def edge_1029b1_incorporates_1029a : Ref :=
  { source := "18 USC § 1029(b)(1)", target := "18 USC § 1029(a)", kind := .Incorporates }



def edge_1029b2_incorporates_1029c : Ref :=
  { source := "18 USC § 1029(b)(2)", target := "18 USC § 1029(c)", kind := .Incorporates }



def edge_1029c1Ai_incorporates_1029a : Ref :=
  { source := "18 USC § 1029(c)(1)(A)(i)", target := "18 USC § 1029(a)", kind := .Incorporates }



def edge_1029c1Aii_incorporates_1029a : Ref :=
  { source := "18 USC § 1029(c)(1)(A)(ii)", target := "18 USC § 1029(a)", kind := .Incorporates }



def edge_1029c1B_incorporates_1029 : Ref :=
  { source := "18 USC § 1029(c)(1)(B)", target := "18 USC § 1029", kind := .Incorporates }





def edge_1029c2_subjectTo_853 : Ref :=
  { source := "18 USC § 1029(c)(2)", target := "21 USC § 853", kind := .SubjectTo }



def edge_1029d_savings_otherAgencies : Ref :=
  { source := "18 USC § 1029(d)",
    target := "investigative authority of any other agency (uncited)",
    kind := .Savings }



def edge_1029e8_incorporates_ch119 : Ref :=
  { source := "18 USC § 1029(e)(8)", target := "18 USC ch. 119", kind := .Incorporates }



def edge_1029e9_incorporates_47usc153 : Ref :=
  { source := "18 USC § 1029(e)(9)", target := "47 USC § 153", kind := .Incorporates }





def edge_1029e10_incorporates_commActTitleIII : Ref :=
  { source := "18 USC § 1029(e)(10)",
    target := "Communications Act of 1934, title III (47 USC §§ 301 et seq.)",
    kind := .Incorporates }



def edge_1029f_savings_ch224 : Ref :=
  { source := "18 USC § 1029(f)", target := "18 USC ch. 224", kind := .Savings }




def edge_1029f_savings_lawEnforcement : Ref :=
  { source := "18 USC § 1029(f)",
    target := "lawfully authorized investigative, protective, or intelligence activity (uncited)",
    kind := .Savings }



def edge_1029_incorporates_1029e : Ref :=
  { source := "18 USC § 1029", target := "18 USC § 1029(e)", kind := .Incorporates }



def edge_1029h_incorporates_1029a : Ref :=
  { source := "18 USC § 1029(h)", target := "18 USC § 1029(a)", kind := .Incorporates }



def edge_1029h_incorporates_1029b : Ref :=
  { source := "18 USC § 1029(h)", target := "18 USC § 1029(b)", kind := .Incorporates }

end Proving.USC.T18.Ch47.Structure
