












import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch21CivilRights.Recert.Structure

open Proving.USC.Common


inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis
  deriving Repr, DecidableEq






structure Ref where
  source : String
  target : String
  kind   : EdgeKind
  deriving Repr, DecidableEq





def edge_2000a4_incorporates_2000g : Ref :=
  { source := "42 USC § 2000a-4", target := "42 USC § 2000g", kind := .Incorporates }



def edge_2000a4_incorporates_2000a3d : Ref :=
  { source := "42 USC § 2000a-4", target := "42 USC § 2000a-3(d)", kind := .Incorporates }





def edge_2000a4_exceptAsProvided_partyAgreement : Ref :=
  { source := "42 USC § 2000a-4",
    target := "42 USC § 2000a-4 (party-agreement and court-permission proviso)",
    kind := .ExceptAsProvided }






def edge_2000a5_incorporates_subchapterII : Ref :=
  { source := "42 USC § 2000a-5(a)", target := "42 USC § 2000a", kind := .Incorporates }






def edge_2000d_incorporates_2000d4a : Ref :=
  { source := "42 USC § 2000d", target := "42 USC § 2000d-4a", kind := .Incorporates }





def edge_2000d1_incorporates_2000d : Ref :=
  { source := "42 USC § 2000d-1", target := "42 USC § 2000d", kind := .Incorporates }



def edge_2000d1_incorporates_2000d4a : Ref :=
  { source := "42 USC § 2000d-1", target := "42 USC § 2000d-4a", kind := .Incorporates }






def edge_2000d1_subjectTo_authorizingStatute : Ref :=
  { source := "42 USC § 2000d-1",
    target := "(open) the Federal statute authorizing the financial assistance in question",
    kind := .SubjectTo }





def edge_2000d1_subjectTo_voluntaryComplianceProviso : Ref :=
  { source := "42 USC § 2000d-1 (cl. (1))",
    target := "42 USC § 2000d-1 (voluntary-compliance proviso)",
    kind := .SubjectTo }




def edge_2000d1_savings_otherMeans : Ref :=
  { source := "42 USC § 2000d-1 (cl. (2))",
    target := "(open) any other means of effecting compliance authorized by law",
    kind := .Savings }






def edge_2000d4a_incorporates_20usc7801 : Ref :=
  { source := "42 USC § 2000d-4a(2)(B)", target := "20 USC § 7801", kind := .Incorporates }





def edge_2000d7_incorporates_29usc794 : Ref :=
  { source := "42 USC § 2000d-7(a)(1)", target := "29 USC § 794", kind := .Incorporates }



def edge_2000d7_incorporates_20usc1681 : Ref :=
  { source := "42 USC § 2000d-7(a)(1)", target := "20 USC § 1681", kind := .Incorporates }



def edge_2000d7_incorporates_42usc6101 : Ref :=
  { source := "42 USC § 2000d-7(a)(1)", target := "42 USC § 6101", kind := .Incorporates }



def edge_2000d7_incorporates_2000d : Ref :=
  { source := "42 USC § 2000d-7(a)(1)", target := "42 USC § 2000d", kind := .Incorporates }




def edge_2000d7_incorporates_openClass : Ref :=
  { source := "42 USC § 2000d-7(a)(1)",
    target := "(open class) any other Federal statute prohibiting discrimination by recipients of Federal financial assistance",
    kind := .Incorporates }




def edge_2000d7_notwithstanding_amend11 : Ref :=
  { source := "42 USC § 2000d-7(a)(1)",
    target := "U.S. Const. amend. XI",
    kind := .Notwithstanding }



def edge_2000d7a2_incorporates_2000d7a1 : Ref :=
  { source := "42 USC § 2000d-7(a)(2)", target := "42 USC § 2000d-7(a)(1)", kind := .Incorporates }




def edge_2000d7a_subjectTo_2000d7b : Ref :=
  { source := "42 USC § 2000d-7(a)", target := "42 USC § 2000d-7(b)", kind := .SubjectTo }

end Proving.USC.T42.Ch21CivilRights.Recert.Structure
