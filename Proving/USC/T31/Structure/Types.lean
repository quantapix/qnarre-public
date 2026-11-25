import Proving.USC.Common.Types







namespace Proving.USC.T31.Structure


inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis


structure Ref where
  source : String
  target : String
  kind   : EdgeKind





def edge_5313e2C_incorporates_5311 : Ref :=
  { source := "31 USC § 5313(e)(2)(C)", target := "31 USC § 5311", kind := .Incorporates }





def edge_5313b_exceptAsProvided_5315 : Ref :=
  { source := "31 USC § 5313(b)", target := "31 USC § 5315", kind := .ExceptAsProvided }



def edge_5313b_incorporates_nha411 : Ref :=
  { source := "31 USC § 5313(b)", target := "12 USC § 1730d (NHA § 411)", kind := .Incorporates }



def edge_5313b_incorporates_fdia21 : Ref :=
  { source := "31 USC § 5313(b)", target := "12 USC § 1829b (FDIA § 21)", kind := .Incorporates }


def edge_5313d1_incorporates_5318a6 : Ref :=
  { source := "31 USC § 5313(d)(1)", target := "31 USC § 5318(a)(6)", kind := .Incorporates }


def edge_5313e1_incorporates_5318a6 : Ref :=
  { source := "31 USC § 5313(e)(1)", target := "31 USC § 5318(a)(6)", kind := .Incorporates }



def edge_5313e2A_incorporates_fra19b1C : Ref :=
  { source := "31 USC § 5313(e)(2)(A)", target := "Federal Reserve Act § 19(b)(1)(C)", kind := .Incorporates }


def edge_5313a_exceptAsProvided_5313d : Ref :=
  { source := "31 USC § 5313(a)", target := "31 USC § 5313(d)", kind := .ExceptAsProvided }



def edge_5313a_exceptAsProvided_5313e : Ref :=
  { source := "31 USC § 5313(a)", target := "31 USC § 5313(e)", kind := .ExceptAsProvided }





def edge_5313f2_savings_otherLaw : Ref :=
  { source := "31 USC § 5313(f)(2)", target := "other applicable law", kind := .Savings }



def edge_5313g1_incorporates_fra19b1A : Ref :=
  { source := "31 USC § 5313(g)(1)", target := "Federal Reserve Act § 19(b)(1)(A)", kind := .Incorporates }



def edge_5313g2A_incorporates_iba1b : Ref :=
  { source := "31 USC § 5313(g)(2)(A)", target := "International Banking Act of 1978 § 1(b)", kind := .Incorporates }



def edge_5313g2B_incorporates_fra25A : Ref :=
  { source := "31 USC § 5313(g)(2)(B)", target := "Federal Reserve Act § 25A", kind := .Incorporates }



def edge_5313g2C_incorporates_fra25 : Ref :=
  { source := "31 USC § 5313(g)(2)(C)", target := "Federal Reserve Act § 25", kind := .Incorporates }




def edge_5324a_incorporates_5313a : Ref :=
  { source := "31 USC § 5324(a)", target := "31 USC § 5313(a)", kind := .Incorporates }


def edge_5324a_incorporates_5325 : Ref :=
  { source := "31 USC § 5324(a)", target := "31 USC § 5325", kind := .Incorporates }



def edge_5324a_incorporates_5326 : Ref :=
  { source := "31 USC § 5324(a)", target := "31 USC § 5326", kind := .Incorporates }



def edge_5324a_incorporates_fdia21 : Ref :=
  { source := "31 USC § 5324(a)", target := "12 USC § 1829b (FDIA § 21)", kind := .Incorporates }



def edge_5324a_incorporates_pl91508s123 : Ref :=
  { source := "31 USC § 5324(a)", target := "Pub. L. 91-508 § 123 (12 USC § 1953)", kind := .Incorporates }



def edge_5324b_incorporates_5331 : Ref :=
  { source := "31 USC § 5324(b)", target := "31 USC § 5331", kind := .Incorporates }



def edge_5324c_incorporates_5316 : Ref :=
  { source := "31 USC § 5324(c)", target := "31 USC § 5316", kind := .Incorporates }



def edge_5324d1_incorporates_t18fines : Ref :=
  { source := "31 USC § 5324(d)(1)", target := "18 USC (fine provisions)", kind := .Incorporates }



def edge_5324d2_incorporates_t18s3571 : Ref :=
  { source := "31 USC § 5324(d)(2)", target := "18 USC § 3571(b)(3), (c)(3)", kind := .Incorporates }

end Proving.USC.T31.Structure
