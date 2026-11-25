





import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reslice.Structure

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



inductive TargetStatus

  | Resolvable



  | EditoriallyFlagged


  | RepealedButPreserved
  deriving DecidableEq, Repr


structure StatusedRef where
  ref    : Ref
  status : TargetStatus
  deriving DecidableEq, Repr




def edge_218a_incorporates_254b : Ref :=
  { source := "42 USC § 218(a)", target := "42 USC § 254b", kind := .Incorporates }

def edge_218b_incorporates_254b : Ref :=
  { source := "42 USC § 218(b)", target := "42 USC § 254b", kind := .Incorporates }

def edge_218d_notwithstanding_5usc1013a : Ref :=
  { source := "42 USC § 218(d)", target := "5 USC § 1013(a)", kind := .Notwithstanding }



def edge_233a_incorporates_28usc1346b : Ref :=
  { source := "42 USC § 233(a)", target := "28 USC § 1346(b)", kind := .Incorporates }
def edge_233a_incorporates_28usc2672 : Ref :=
  { source := "42 USC § 233(a)", target := "28 USC § 2672", kind := .Incorporates }


def edge_233a_lexSpecialis_otherCivilActions : Ref :=
  { source := "42 USC § 233(a)",
    target := "any other civil action or proceeding by reason of the same subject-matter",
    kind := .LexSpecialis }


def edge_233c_incorporates_28usc_ch171 : Ref :=
  { source := "42 USC § 233(c)", target := "28 USC ch. 171", kind := .Incorporates }
def edge_233d_incorporates_28usc2677 : Ref :=
  { source := "42 USC § 233(d)", target := "28 USC § 2677", kind := .Incorporates }


def edge_233e_notwithstanding_28usc2680h : Ref :=
  { source := "42 USC § 233(e)", target := "28 USC § 2680(h)", kind := .Notwithstanding }
def edge_233f_incorporates_28usc2679b : Ref :=
  { source := "42 USC § 233(f)", target := "28 USC § 2679(b)", kind := .Incorporates }


def edge_233g1A_subjectTo_233k3 : Ref :=
  { source := "42 USC § 233(g)(1)(A)", target := "42 USC § 233(k)(3)", kind := .SubjectTo }


def edge_233g1A_incorporates_233a : Ref :=
  { source := "42 USC § 233(g)(1)(A)", target := "42 USC § 233(a)", kind := .Incorporates }


def edge_233g1D_incorporates_233h : Ref :=
  { source := "42 USC § 233(g)(1)(D)", target := "42 USC § 233(h)", kind := .Incorporates }


def edge_233g1F_exceptAsProvided_233i : Ref :=
  { source := "42 USC § 233(g)(1)(F)", target := "42 USC § 233(i)", kind := .ExceptAsProvided }


def edge_233g1Gii_incorporates_254b_256a : Ref :=
  { source := "42 USC § 233(g)(1)(G)(ii)", target := "42 USC §§ 254b, 256a", kind := .Incorporates }


def edge_233g4_incorporates_254b : Ref :=
  { source := "42 USC § 233(g)(4)", target := "42 USC § 254b", kind := .Incorporates }


def edge_233i1_notwithstanding_233g1 : Ref :=
  { source := "42 USC § 233(i)(1)", target := "42 USC § 233(g)(1)", kind := .Notwithstanding }
def edge_233i1_incorporates_233h1 : Ref :=
  { source := "42 USC § 233(i)(1)(A)", target := "42 USC § 233(h)(1)", kind := .Incorporates }


def edge_233j_incorporates_254he : Ref :=
  { source := "42 USC § 233(j)", target := "42 USC § 254h(e)", kind := .Incorporates }
def edge_233k1A_incorporates_28usc1346_ch171 : Ref :=
  { source := "42 USC § 233(k)(1)(A)", target := "28 USC § 1346; 28 USC ch. 171", kind := .Incorporates }


def edge_233k2_incorporates_254b_256a : Ref :=
  { source := "42 USC § 233(k)(2)", target := "42 USC §§ 254b, 256a", kind := .Incorporates }


def edge_233l1_incorporates_233c : Ref :=
  { source := "42 USC § 233(l)(1)", target := "42 USC § 233(c)", kind := .Incorporates }


def edge_233m2_incorporates_ssa : Ref :=
  { source := "42 USC § 233(m)(2)", target := "42 USC § 1395 et seq.; 42 USC § 1396 et seq.",
    kind := .Incorporates }


def edge_233n1C_incorporates_254b_256a : Ref :=
  { source := "42 USC § 233(n)(1)(C)", target := "42 USC §§ 254b, 256a", kind := .Incorporates }


def edge_233o4_incorporates_ssaXIX : Ref :=
  { source := "42 USC § 233(o)(4)", target := "42 USC § 1396 et seq.", kind := .Incorporates }


def edge_233o5_incorporates_233ghil : Ref :=
  { source := "42 USC § 233(o)(5)", target := "42 USC § 233(g), (h), (i), (l)", kind := .Incorporates }
def edge_233o5_subjectTo_233o6 : Ref :=
  { source := "42 USC § 233(o)(5)", target := "42 USC § 233(o)(6)", kind := .SubjectTo }


def edge_233o7A_exceptAsProvided_233o7Bi : Ref :=
  { source := "42 USC § 233(o)(7)(A)", target := "42 USC § 233(o)(7)(B)(i)", kind := .ExceptAsProvided }


def edge_233p2B_exceptAsProvided_233p5Bii : Ref :=
  { source := "42 USC § 233(p)(2)(B)", target := "42 USC § 233(p)(5)(B)(ii)", kind := .ExceptAsProvided }


def edge_233p3A_subjectTo_partC : Ref :=
  { source := "42 USC § 233(p)(3)(A)(i)", target := "42 USC §§ 239–239h", kind := .SubjectTo }


def edge_233p3Aiii_savings_28usc_ch171 : Ref :=
  { source := "42 USC § 233(p)(3)(A)(iii)", target := "28 USC ch. 171", kind := .Savings }
def edge_233p3B_incorporates_233a : Ref :=
  { source := "42 USC § 233(p)(3)(B)", target := "42 USC § 233(a)", kind := .Incorporates }
def edge_233p4_incorporates_233c : Ref :=
  { source := "42 USC § 233(p)(4)", target := "42 USC § 233(c)", kind := .Incorporates }


def edge_233p7Bv_incorporates_233p7BvI : Ref :=
  { source := "42 USC § 233(p)(7)(B)(v)(II)", target := "42 USC § 233(p)(7)(B)(v)(I)",
    kind := .Incorporates }


def edge_233q1_incorporates_254b : Ref :=
  { source := "42 USC § 233(q)(1)", target := "42 USC § 254b", kind := .Incorporates }


def edge_233q3_incorporates_233ghil : Ref :=
  { source := "42 USC § 233(q)(3)", target := "42 USC § 233(g), (h), (i), (l)", kind := .Incorporates }
def edge_233q4A_incorporates_233k2 : Ref :=
  { source := "42 USC § 233(q)(4)(A)", target := "42 USC § 233(k)(2)", kind := .Incorporates }




def edge_234a_notwithstanding_anyOtherLaw : Ref :=
  { source := "42 USC § 234(a)", target := "any other provision of law", kind := .Notwithstanding }
def edge_234a_incorporates_300hh15 : Ref :=
  { source := "42 USC § 234(a)", target := "42 USC § 300hh–15", kind := .Incorporates }
def edge_234a_incorporates_247d7b : Ref :=
  { source := "42 USC § 234(a)", target := "42 USC § 247d–7b", kind := .Incorporates }
def edge_234a1A_incorporates_247da : Ref :=
  { source := "42 USC § 234(a)(1)(A)", target := "42 USC § 247d(a)", kind := .Incorporates }
def edge_234a1B_incorporates_5170 : Ref :=
  { source := "42 USC § 234(a)(1)(B)", target := "42 USC § 5170", kind := .Incorporates }
def edge_234a1B_incorporates_50usc1621 : Ref :=
  { source := "42 USC § 234(a)(1)(B)", target := "50 USC § 1621", kind := .Incorporates }


def edge_234a_lexSpecialis_situsStateLaw : Ref :=
  { source := "42 USC § 234(a)",
    target := "State liability laws of the State in which the act or omission occurred",
    kind := .LexSpecialis }


def edge_234a_exceptAsProvided_licensure : Ref :=
  { source := "42 USC § 234(a)",
    target := "State licensure, registration and certification law",
    kind := .ExceptAsProvided }


def edge_234b_savings_volunteerProtectionAct : Ref :=
  { source := "42 USC § 234(b)", target := "42 USC § 14501 et seq.", kind := .Savings }



def edge_234c_notwithstanding_otherStateLaw : Ref :=
  { source := "42 USC § 234(c)",
    target := "liability laws of any State other than the situs State",
    kind := .Notwithstanding }



def edge_235_incorporates_subchV : Ref :=
  { source := "42 USC § 235", target := "42 USC ch. 6A, subch. V", kind := .Incorporates }
def edge_235_incorporates_subchVI : Ref :=
  { source := "42 USC § 235", target := "42 USC ch. 6A, subch. VI", kind := .Incorporates }

def edge_235_incorporates_subchVII : Ref :=
  { source := "42 USC § 235", target := "42 USC ch. 6A, subch. VII", kind := .Incorporates }
def edge_235_incorporates_242b : Ref :=
  { source := "42 USC § 235", target := "42 USC § 242b", kind := .Incorporates }


def edge_235_incorporates_246 : Ref :=
  { source := "42 USC § 235", target := "42 USC § 246(a)–(e)", kind := .Incorporates }


def edge_235_savings_statutoryRequirements : Ref :=
  { source := "42 USC § 235",
    target := "requirements imposed by law or by regulation required by law",
    kind := .Savings }



def edge_236c1A_incorporates_ffdcaSubchB : Ref :=
  { source := "42 USC § 236(c)(1)(A)", target := "21 USC § 360aa et seq.", kind := .Incorporates }
def edge_236c5_incorporates_21usc355i : Ref :=
  { source := "42 USC § 236(c)(5)", target := "21 USC § 355(i)", kind := .Incorporates }
def edge_236c5_incorporates_21usc355c : Ref :=
  { source := "42 USC § 236(c)(5)", target := "21 USC § 355(c)", kind := .Incorporates }
def edge_236c5_incorporates_42usc262 : Ref :=
  { source := "42 USC § 236(c)(5)", target := "42 USC § 262", kind := .Incorporates }
def edge_236e1_incorporates_21usc360bb : Ref :=
  { source := "42 USC § 236(e)(1)", target := "21 USC § 360bb", kind := .Incorporates }


def edge_236e_incorporates_26usc44H : Ref :=
  { source := "42 USC § 236(e)", target := "26 USC § 44H", kind := .Incorporates }
def edge_236e_incorporates_21usc360ee : Ref :=
  { source := "42 USC § 236(e)", target := "21 USC § 360ee", kind := .Incorporates }





def edge_237b_notwithstanding_title5Appointment : Ref :=
  { source := "42 USC § 237(b)", target := "5 USC (provisions regarding appointment)",
    kind := .Notwithstanding }


def edge_237b_notwithstanding_title5Systems : Ref :=
  { source := "42 USC § 237(b)",
    target := "5 USC ch. 35, subch. I; 5 USC ch. 43; 5 USC ch. 51; 5 USC ch. 53, subch. III; 5 USC ch. 75",
    kind := .Notwithstanding }


def edge_237b_incorporates_generalSchedule : Ref :=
  { source := "42 USC § 237(b)", target := "5 USC § 5332", kind := .Incorporates }


def edge_237d2_incorporates_3usc102 : Ref :=
  { source := "42 USC § 237(d)(2)", target := "3 USC § 102", kind := .Incorporates }


def edge_237e_notwithstanding_title5Appointment : Ref :=
  { source := "42 USC § 237(e)", target := "5 USC (provisions regarding appointment)",
    kind := .Notwithstanding }





def edge_237ab7_incorporates_237ac : Ref :=
  { source := "42 USC § 237a(b)(7)", target := "42 USC § 237a(c)", kind := .Incorporates }


def edge_237ac2_incorporates_237ac1 : Ref :=
  { source := "42 USC § 237a(c)(2)", target := "42 USC § 237a(c)(1)", kind := .Incorporates }


def edge_237ab_incorporates_237aa : Ref :=
  { source := "42 USC § 237a(b)", target := "42 USC § 237a(a)", kind := .Incorporates }






def edge_238a_exceptAsProvided_249a : Ref :=
  { source := "42 USC § 238a", target := "42 USC § 249(a)", kind := .ExceptAsProvided }





def edge_238la_incorporates_cmhca : Ref :=
  { source := "42 USC § 238l(a)", target := "42 USC § 2689 et seq.", kind := .Incorporates }


def edge_238la1A_incorporates_cmhca222 : Ref :=
  { source := "42 USC § 238l(a)(1)(A)", target := "42 USC § 2689j", kind := .Incorporates }
def edge_238la_incorporates_238lc : Ref :=
  { source := "42 USC § 238l(a)", target := "42 USC § 238l(c)", kind := .Incorporates }
def edge_238lb_incorporates_238la : Ref :=
  { source := "42 USC § 238l(b)", target := "42 USC § 238l(a)", kind := .Incorporates }


def edge_238lc2Bi_incorporates_238lb : Ref :=
  { source := "42 USC § 238l(c)(2)(B)(i)", target := "42 USC § 238l(b)", kind := .Incorporates }


def edge_238lc2Bii_incorporates_238lb : Ref :=
  { source := "42 USC § 238l(c)(2)(B)(ii)", target := "42 USC § 238l(b)", kind := .Incorporates }


def edge_238ld_exceptAsProvided_238la : Ref :=
  { source := "42 USC § 238l(d)", target := "42 USC § 238l(a)", kind := .ExceptAsProvided }


def edge_238le_savings_lienLaw : Ref :=
  { source := "42 USC § 238l(e)", target := "law governing liens on the facility (pre-judgment)",
    kind := .Savings }



def edge_238ma1B_incorporates_247d : Ref :=
  { source := "42 USC § 238m(a)(1)(B)", target := "42 USC § 247d", kind := .Incorporates }
def edge_238ma1B_incorporates_249 : Ref :=
  { source := "42 USC § 238m(a)(1)(B)", target := "42 USC § 249", kind := .Incorporates }


def edge_238mb1_notwithstanding_41usc6101 : Ref :=
  { source := "42 USC § 238m(b)(1)", target := "41 USC § 6101", kind := .Notwithstanding }


def edge_238md_incorporates_1395u_de : Ref :=
  { source := "42 USC § 238m(d)", target := "42 USC § 1395u(d), (e)", kind := .Incorporates }


def edge_238me_incorporates_1395uf1 : Ref :=
  { source := "42 USC § 238m(e)", target := "42 USC § 1395u(f)(1)", kind := .Incorporates }


def edge_238me_incorporates_isda : Ref :=
  { source := "42 USC § 238m(e)", target := "25 USC § 5321 et seq.", kind := .Incorporates }








def sref_218a_254b : StatusedRef :=
  { ref := edge_218a_incorporates_254b, status := .EditoriallyFlagged }
def sref_218b_254b : StatusedRef :=
  { ref := edge_218b_incorporates_254b, status := .EditoriallyFlagged }
def sref_233g1Gii_254b_256a : StatusedRef :=
  { ref := edge_233g1Gii_incorporates_254b_256a, status := .EditoriallyFlagged }
def sref_233k2_254b_256a : StatusedRef :=
  { ref := edge_233k2_incorporates_254b_256a, status := .EditoriallyFlagged }
def sref_233n1C_254b_256a : StatusedRef :=
  { ref := edge_233n1C_incorporates_254b_256a, status := .EditoriallyFlagged }
def sref_233p7Bv_subclause : StatusedRef :=
  { ref := edge_233p7Bv_incorporates_233p7BvI, status := .EditoriallyFlagged }
def sref_235_subchVII : StatusedRef :=
  { ref := edge_235_incorporates_subchVII, status := .EditoriallyFlagged }
def sref_235_246 : StatusedRef :=
  { ref := edge_235_incorporates_246, status := .EditoriallyFlagged }
def sref_236e_44H : StatusedRef :=
  { ref := edge_236e_incorporates_26usc44H, status := .EditoriallyFlagged }
def sref_238a_249a : StatusedRef :=
  { ref := edge_238a_exceptAsProvided_249a, status := .EditoriallyFlagged }
def sref_238md_1395u_de : StatusedRef :=
  { ref := edge_238md_incorporates_1395u_de, status := .EditoriallyFlagged }
def sref_238me_1395uf1 : StatusedRef :=
  { ref := edge_238me_incorporates_1395uf1, status := .EditoriallyFlagged }
def sref_238la_cmhca : StatusedRef :=
  { ref := edge_238la_incorporates_cmhca, status := .RepealedButPreserved }
def sref_238la1A_cmhca222 : StatusedRef :=
  { ref := edge_238la1A_incorporates_cmhca222, status := .RepealedButPreserved }

end Proving.USC.T42.Ch6ASchI.Reslice.Structure
