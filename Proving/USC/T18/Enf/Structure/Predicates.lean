








import Proving.USC.T18.Enf.Structure.Types

namespace Proving.USC.T18.Enf.Structure

open Proving.USC.Common




def edge_1963_incorporates_1962 : Ref :=
  { source := "18 USC § 1963(a)", target := "18 USC § 1962", kind := .Incorporates }



def edge_1963i_exceptAsProvided_1963l : Ref :=
  { source := "18 USC § 1963(i)", target := "18 USC § 1963(l)", kind := .ExceptAsProvided }




def edge_1963f_notwithstanding_31_3302b : Ref :=
  { source := "18 USC § 1963(f)", target := "31 USC § 3302(b)", kind := .Notwithstanding }



def edge_1963g_subjectTo_ch96 : Ref :=
  { source := "18 USC § 1963(g)", target := "18 USC ch. 96", kind := .SubjectTo }



def edge_1964_incorporates_1962 : Ref :=
  { source := "18 USC § 1964", target := "18 USC § 1962", kind := .Incorporates }



def edge_1965b_incorporates_1964 : Ref :=
  { source := "18 USC § 1965(b)", target := "18 USC § 1964", kind := .Incorporates }



def edge_1965_subjectTo_ch96 : Ref :=
  { source := "18 USC § 1965", target := "18 USC ch. 96", kind := .SubjectTo }






axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Enf.Structure
