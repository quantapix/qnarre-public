import Proving.USC.Common.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Structure.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Structure.Predicates






namespace Proving.USC.T42.PublicAccommodations.Enforcement.Structure

open Proving.USC.Common (ComplaintText)



def edge_2000a4_incorporates_2000a3d : Ref :=
  { source := "42 USC § 2000a-4", target := "42 USC § 2000a-3(d)", kind := .Incorporates }




def edge_2000a5_incorporates_subchapter : Ref :=
  { source := "42 USC § 2000a-5", target := "42 USC § 2000a", kind := .Incorporates }



structure Coherent2000a4 (c : ComplaintText) : Prop where
  referralExists : ReferencedSectionExists edge_2000a4_incorporates_2000a3d c
  incorporates   : IncorporationHonored edge_2000a4_incorporates_2000a3d c



structure Coherent2000a5 (c : ComplaintText) : Prop where
  rightsExist  : ReferencedSectionExists edge_2000a5_incorporates_subchapter c
  incorporates : IncorporationHonored edge_2000a5_incorporates_subchapter c

end Proving.USC.T42.PublicAccommodations.Enforcement.Structure
