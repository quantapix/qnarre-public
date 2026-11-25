
















import Proving.USC.T18.Ch71.Structure.Types
import Proving.USC.T18.Ch71.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch71.Structure

open Proving.USC.Common




def edge_1461_incorporates_t39s3001e : Ref :=
  { source := "18 USC § 1461", target := "39 USC § 3001(e)", kind := .Incorporates }





def edge_1465_incorporates_t47s230 : Ref :=
  { source := "18 USC § 1465", target := "47 USC § 230(e)(2)", kind := .Incorporates }









def edge_1462_incorporates_t47s230 : Ref :=
  { source := "18 USC § 1462", target := "47 USC § 230(e)(2)", kind := .Incorporates }



structure Coherent1461 (c : ComplaintText) : Prop where
  referencedExists     : ReferencedSectionExists edge_1461_incorporates_t39s3001e c
  incorporationHonored : IncorporationHonored     edge_1461_incorporates_t39s3001e c



structure Coherent1465 (c : ComplaintText) : Prop where
  referencedExists     : ReferencedSectionExists edge_1465_incorporates_t47s230 c
  incorporationHonored : IncorporationHonored     edge_1465_incorporates_t47s230 c




structure Coherent1462 (c : ComplaintText) : Prop where
  referencedExists     : ReferencedSectionExists edge_1462_incorporates_t47s230 c
  incorporationHonored : IncorporationHonored     edge_1462_incorporates_t47s230 c

end Proving.USC.T18.Ch71.Structure
