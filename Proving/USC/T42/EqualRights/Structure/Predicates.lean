









import Proving.USC.T42.EqualRights.Structure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.EqualRights.Structure

open Proving.USC.Common





def edge_1981a_incorporates_1981b : Ref :=
  { source := "42 USC § 1981(a)", target := "42 USC § 1981(b)", kind := .Incorporates }




def edge_1981a_incorporates_2000e5 : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 2000e-5", kind := .Incorporates }



def edge_1981a_incorporates_2000e2 : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 2000e-2", kind := .Incorporates }




def edge_1981a_subjectTo_1981 : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 1981", kind := .LexSpecialis }




def edge_1981a_incorporates_29_794a : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "29 USC § 794a", kind := .Incorporates }



def edge_1981a_incorporates_12112 : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "42 USC § 12112", kind := .Incorporates }




def edge_1981a_subjectTo_2000e5g : Ref :=
  { source := "42 USC § 1981a(b)(2)", target := "42 USC § 2000e-5(g)", kind := .SubjectTo }




def edge_1981a_savings_1981 : Ref :=
  { source := "42 USC § 1981a(b)(4)", target := "42 USC § 1981", kind := .Savings }







axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop





axiom SavingsRespected (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T42.EqualRights.Structure
