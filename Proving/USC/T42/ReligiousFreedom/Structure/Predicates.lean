















import Proving.USC.T42.ReligiousFreedom.Structure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.ReligiousFreedom.Structure

open Proving.USC.Common (ComplaintText)










def edge_1996a_incorporates_1996 : Ref :=
  { source := "42 USC § 1996a(b)(2)", target := "42 USC § 1996", kind := .Incorporates }




def edge_1996a_notwithstanding_anyLaw : Ref :=
  { source := "42 USC § 1996a(b)(1)", target := "any other provision of law", kind := .Notwithstanding }





def edge_1996a_subjectTo_2000bb1_b4 : Ref :=
  { source := "42 USC § 1996a(b)(4)", target := "42 USC § 2000bb-1", kind := .SubjectTo }




def edge_1996a_subjectTo_2000bb_b6 : Ref :=
  { source := "42 USC § 1996a(b)(6)", target := "42 USC § 2000bb", kind := .SubjectTo }




def edge_1996a_subjectTo_2000bb1_b7 : Ref :=
  { source := "42 USC § 1996a(b)(7)", target := "42 USC § 2000bb-1", kind := .SubjectTo }






def edge_1996a_incorporates_43usc1601 : Ref :=
  { source := "42 USC § 1996a(c)(2)", target := "43 USC § 1601", kind := .Incorporates }





def edge_1996a_savings_indianRights : Ref :=
  { source := "42 USC § 1996a(d)", target := "inherent and treaty rights of Indian tribes", kind := .Savings }





def edge_1996b_incorporates_2000d : Ref :=
  { source := "42 USC § 1996b(2)", target := "42 USC § 2000d", kind := .Incorporates }




def edge_1996b_savings_25usc1901 : Ref :=
  { source := "42 USC § 1996b(3)", target := "25 USC § 1901", kind := .Savings }










axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop






axiom ConstraintSatisfied (r : Ref) (c : ComplaintText) : Prop






axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop






axiom SavingsHonored (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T42.ReligiousFreedom.Structure
