



















import Proving.USC.Common.Types
import Proving.USC.T42.PublicAccommodations.Prohibition.Structure.Types
import Proving.USC.T42.PublicAccommodations.Prohibition.Structure.Predicates

namespace Proving.USC.T42.PublicAccommodations.Prohibition.Structure

open Proving.USC.Common (ComplaintText)


def edge_2000a2_incorporates_2000a : Ref :=
  { source := "42 USC § 2000a-2", target := "42 USC § 2000a", kind := .Incorporates }



def edge_2000a2_incorporates_2000a1 : Ref :=
  { source := "42 USC § 2000a-2", target := "42 USC § 2000a-1", kind := .Incorporates }



def edge_2000a1_incorporates_2000a2 : Ref :=
  { source := "42 USC § 2000a-1", target := "42 USC § 2000a-2", kind := .Incorporates }



structure Coherent2000a2 (c : ComplaintText) : Prop where
  coreExists  : ReferencedSectionExists edge_2000a2_incorporates_2000a c
  coreHonored : IncorporationHonored edge_2000a2_incorporates_2000a c
  a1Exists    : ReferencedSectionExists edge_2000a2_incorporates_2000a1 c
  a1Honored   : IncorporationHonored edge_2000a2_incorporates_2000a1 c




structure Coherent2000a1 (c : ComplaintText) : Prop where
  protectorExists  : ReferencedSectionExists edge_2000a1_incorporates_2000a2 c
  protectorHonored : IncorporationHonored edge_2000a1_incorporates_2000a2 c

end Proving.USC.T42.PublicAccommodations.Prohibition.Structure
