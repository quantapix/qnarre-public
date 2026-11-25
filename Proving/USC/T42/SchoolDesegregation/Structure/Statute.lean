



import Proving.USC.T42.SchoolDesegregation.Structure.Predicates

namespace Proving.USC.T42.SchoolDesegregation.Structure
open Proving.USC.Common



def edge_2000c6_incorporates_18s1001 : Ref :=
  { source := "42 USC § 2000c-6(c)", target := "18 USC § 1001", kind := .Incorporates }





def edge_2000c8_savings_subchapter : Ref :=
  { source := "42 USC § 2000c-8", target := "42 USC § 2000c et seq. (subchapter IV)", kind := .Savings }



structure Coherent2000c6 (c : ComplaintText) : Prop where
  complaintDefExists : ReferencedSectionExists edge_2000c6_incorporates_18s1001 c
  incorporates       : IncorporationHonored edge_2000c6_incorporates_18s1001 c




structure Coherent2000c8 (c : ComplaintText) : Prop where
  subchapterExists : ReferencedSectionExists edge_2000c8_savings_subchapter c
  savingsPreserved : SavingsClausePreserved edge_2000c8_savings_subchapter c

end Proving.USC.T42.SchoolDesegregation.Structure
