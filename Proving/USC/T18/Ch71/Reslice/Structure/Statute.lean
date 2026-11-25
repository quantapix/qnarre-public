import Proving.USC.T18.Ch71.Reslice.Structure.Types
import Proving.USC.T18.Ch71.Reslice.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch71.Reslice.Structure

open Proving.USC.Common





def edge_1462_incorporates_cda230 : Ref :=
  { source := "18 USC § 1462", target := "47 USC § 230", kind := .Incorporates }



def edge_1462_incorporates_3571 : Ref :=
  { source := "18 USC § 1462", target := "18 USC § 3571", kind := .Incorporates }




def edge_1465_incorporates_cda230 : Ref :=
  { source := "18 USC § 1465", target := "47 USC § 230", kind := .Incorporates }


def edge_1465_incorporates_3571 : Ref :=
  { source := "18 USC § 1465", target := "18 USC § 3571", kind := .Incorporates }






structure Coherent1462 (c : ComplaintText) : Prop where
  cdaExists  : ReferencedSectionExists edge_1462_incorporates_cda230 c
  cdaHonored : IncorporationHonored edge_1462_incorporates_cda230 c
  fineExists : ReferencedSectionExists edge_1462_incorporates_3571 c



structure Coherent1465 (c : ComplaintText) : Prop where
  cdaExists  : ReferencedSectionExists edge_1465_incorporates_cda230 c
  cdaHonored : IncorporationHonored edge_1465_incorporates_cda230 c
  fineExists : ReferencedSectionExists edge_1465_incorporates_3571 c

end Proving.USC.T18.Ch71.Reslice.Structure
