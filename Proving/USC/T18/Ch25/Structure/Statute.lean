


















import Proving.USC.Common.Types
import Proving.USC.T18.Ch25.Structure.Types
import Proving.USC.T18.Ch25.Structure.Predicates

namespace Proving.USC.T18.Ch25.Structure

open Proving.USC.Common (ComplaintText)



def edge_471_incorporates_8 : Ref :=
  { source := "18 USC § 471", target := "18 USC § 8", kind := .Incorporates }
def edge_471_incorporates_3571 : Ref :=
  { source := "18 USC § 471", target := "18 USC § 3571", kind := .Incorporates }




structure Coherent471 (c : ComplaintText) : Prop where
  defExists  : ReferencedSectionExists edge_471_incorporates_8 c
  defHonored : IncorporationHonored edge_471_incorporates_8 c
  fineExists : ReferencedSectionExists edge_471_incorporates_3571 c



def edge_472_incorporates_8 : Ref :=
  { source := "18 USC § 472", target := "18 USC § 8", kind := .Incorporates }
def edge_472_incorporates_471 : Ref :=
  { source := "18 USC § 472", target := "18 USC § 471", kind := .Incorporates }
def edge_472_incorporates_3571 : Ref :=
  { source := "18 USC § 472", target := "18 USC § 3571", kind := .Incorporates }




structure Coherent472 (c : ComplaintText) : Prop where
  objExists  : ReferencedSectionExists edge_472_incorporates_471 c
  objHonored : IncorporationHonored edge_472_incorporates_471 c
  defHonored : IncorporationHonored edge_472_incorporates_8 c
  fineExists : ReferencedSectionExists edge_472_incorporates_3571 c



def edge_473_incorporates_8 : Ref :=
  { source := "18 USC § 473", target := "18 USC § 8", kind := .Incorporates }
def edge_473_incorporates_471 : Ref :=
  { source := "18 USC § 473", target := "18 USC § 471", kind := .Incorporates }
def edge_473_incorporates_472 : Ref :=
  { source := "18 USC § 473", target := "18 USC § 472", kind := .Incorporates }
def edge_473_incorporates_3571 : Ref :=
  { source := "18 USC § 473", target := "18 USC § 3571", kind := .Incorporates }





structure Coherent473 (c : ComplaintText) : Prop where
  objHonored   : IncorporationHonored edge_473_incorporates_471 c
  defHonored   : IncorporationHonored edge_473_incorporates_8 c
  utterExists  : ReferencedSectionExists edge_473_incorporates_472 c
  fineExists   : ReferencedSectionExists edge_473_incorporates_3571 c

end Proving.USC.T18.Ch25.Structure
