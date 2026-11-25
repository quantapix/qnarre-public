import Proving.USC.T18.Ch73.Structure.Types
import Proving.USC.Common.Types

set_option autoImplicit false










namespace Proving.USC.T18.Ch73.Structure

open Proving.USC.Common




def edge_1503_incorporates_1111 : Ref :=
  { source := "18 USC § 1503", target := "18 USC § 1111", kind := .Incorporates }



def edge_1503_incorporates_1112 : Ref :=
  { source := "18 USC § 1503", target := "18 USC § 1112", kind := .Incorporates }




def edge_1512_incorporates_1111 : Ref :=
  { source := "18 USC § 1512", target := "18 USC § 1111", kind := .Incorporates }



def edge_1512_incorporates_1112 : Ref :=
  { source := "18 USC § 1512", target := "18 USC § 1112", kind := .Incorporates }






def edge_1512_ref_1503 : Ref :=
  { source := "18 USC § 1512", target := "18 USC § 1503", kind := .Incorporates }




def edge_1513_incorporates_1111 : Ref :=
  { source := "18 USC § 1513", target := "18 USC § 1111", kind := .Incorporates }



def edge_1513_incorporates_1112 : Ref :=
  { source := "18 USC § 1513", target := "18 USC § 1112", kind := .Incorporates }





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch73.Structure
