









import Proving.USC.T42.Structure.Types

namespace Proving.USC.T42.Structure

open Proving.USC.Common







def edge_1981a_incorporates_2000e5 : Ref :=
  { source := "42 USC § 1981a", target := "42 USC § 2000e-5", kind := .Incorporates }




def edge_1981a_lexSpecialis_1981 : Ref :=
  { source := "42 USC § 1981a", target := "42 USC § 1981", kind := .LexSpecialis }




def edge_1981a_savings_1981 : Ref :=
  { source := "42 USC § 1981a", target := "42 USC § 1981", kind := .Savings }




def edge_1983_incorporates_federalRight : Ref :=
  { source := "42 USC § 1983", target := "U.S. Const. + laws", kind := .Incorporates }





def edge_1983_exceptAsProvided_judicialOfficer : Ref :=
  { source := "42 USC § 1983", target := "42 USC § 1983 (judicial-officer proviso)",
    kind := .ExceptAsProvided }




def edge_1986_incorporates_1985 : Ref :=
  { source := "42 USC § 1986", target := "42 USC § 1985", kind := .Incorporates }




def edge_2000d1_incorporates_2000d : Ref :=
  { source := "42 USC § 2000d-1", target := "42 USC § 2000d", kind := .Incorporates }




def edge_2000d7_incorporates_2000d : Ref :=
  { source := "42 USC § 2000d-7", target := "42 USC § 2000d", kind := .Incorporates }




def edge_2000d7_notwithstanding_eleventhAmd : Ref :=
  { source := "42 USC § 2000d-7", target := "U.S. Const. amend. XI",
    kind := .Notwithstanding }








axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop




axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop




axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop




axiom SavingsPreserved (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T42.Structure
