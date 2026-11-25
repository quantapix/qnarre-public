
































import Proving.USC.T42.TitleVII.Structure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVII.Structure

open Proving.USC.Common






def edge_2000e2_incorporates_2000e : Ref :=
  { source := "42 USC § 2000e-2", target := "42 USC § 2000e", kind := .Incorporates }


def edge_2000e3_incorporates_2000e : Ref :=
  { source := "42 USC § 2000e-3", target := "42 USC § 2000e", kind := .Incorporates }


def edge_2000e5_incorporates_2000e : Ref :=
  { source := "42 USC § 2000e-5", target := "42 USC § 2000e", kind := .Incorporates }



def edge_2000e2_exceptAsProvided_bfoq : Ref :=
  { source := "42 USC § 2000e-2(a)", target := "42 USC § 2000e-2(e)", kind := .ExceptAsProvided }




def edge_2000e2h_notwithstanding_2000e2a : Ref :=
  { source := "42 USC § 2000e-2(h)", target := "42 USC § 2000e-2(a)", kind := .Notwithstanding }




def edge_2000e2m_subjectTo_2000e5g : Ref :=
  { source := "42 USC § 2000e-2(m)", target := "42 USC § 2000e-5(g)(2)(B)", kind := .SubjectTo }



def edge_2000e3_incorporates_2000e2 : Ref :=
  { source := "42 USC § 2000e-3", target := "42 USC § 2000e-2", kind := .Incorporates }



def edge_2000e5_incorporates_2000e4 : Ref :=
  { source := "42 USC § 2000e-5", target := "42 USC § 2000e-4", kind := .Incorporates }




def edge_2000e2_subjectTo_2000e5 : Ref :=
  { source := "42 USC § 2000e-2", target := "42 USC § 2000e-5", kind := .SubjectTo }




def edge_2000e16_incorporates_2000e5 : Ref :=
  { source := "42 USC § 2000e-16(d)", target := "42 USC § 2000e-5", kind := .Incorporates }




def edge_2000e16_incorporates_2000e2 : Ref :=
  { source := "42 USC § 2000e-16", target := "42 USC § 2000e-2", kind := .Incorporates }





def edge_2000e1_exceptAsProvided_2000e2 : Ref :=
  { source := "42 USC § 2000e-1(a)", target := "42 USC § 2000e-2", kind := .ExceptAsProvided }






def edge_2000e1_savings : Ref :=
  { source := "42 USC § 2000e-1(b)", target := "42 USC § 2000e-2", kind := .Savings }




def edge_2000e17_subjectTo_2000e5 : Ref :=
  { source := "42 USC § 2000e-17", target := "42 USC § 2000e-5", kind := .SubjectTo }






axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop





axiom SavingsClauseHonored (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVII.Structure
