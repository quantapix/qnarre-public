











import Proving.USC.T18.Trafficking.Structure.Types
import Proving.USC.T18.Trafficking.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Trafficking.Structure

open Proving.USC.Common (ComplaintText)


















def edge_1590a_incorporates_ch77 : Ref :=
  { source := "18 USC § 1590(a)", target := "18 USC ch. 77", kind := .Incorporates }


def edge_1591_lexSpecialis_1590 : Ref :=
  { source := "18 USC § 1591", target := "18 USC § 1590", kind := .LexSpecialis }


def edge_1581b_incorporates_1581a : Ref :=
  { source := "18 USC § 1581(b)", target := "18 USC § 1581(a)", kind := .Incorporates }


def edge_1589b_incorporates_1589d : Ref :=
  { source := "18 USC § 1589(b)", target := "18 USC § 1589(d)", kind := .Incorporates }


def edge_1589a_incorporates_1589c : Ref :=
  { source := "18 USC § 1589(a)", target := "18 USC § 1589(c)", kind := .Incorporates }


def edge_1591a2_incorporates_1591a1 : Ref :=
  { source := "18 USC § 1591(a)(2)", target := "18 USC § 1591(a)(1)", kind := .Incorporates }


def edge_1591a_incorporates_1591e : Ref :=
  { source := "18 USC § 1591(a)", target := "18 USC § 1591(e)", kind := .Incorporates }








structure Coherent1581 (c : ComplaintText) : Prop where
  penaltyExists  : ReferencedSectionExists edge_1581b_incorporates_1581a c
  penaltyHonored : IncorporationHonored edge_1581b_incorporates_1581a c




structure Coherent1589 (c : ComplaintText) : Prop where
  defsExist     : ReferencedSectionExists edge_1589a_incorporates_1589c c
  defsHonored   : IncorporationHonored edge_1589a_incorporates_1589c c
  penaltyExists : ReferencedSectionExists edge_1589b_incorporates_1589d c
  penaltyHonored: IncorporationHonored edge_1589b_incorporates_1589d c





structure Coherent1590 (c : ComplaintText) : Prop where
  chapterExists  : ReferencedSectionExists edge_1590a_incorporates_ch77 c
  chapterHonored : IncorporationHonored edge_1590a_incorporates_ch77 c



structure Coherent1591 (c : ComplaintText) : Prop where
  predExists     : ReferencedSectionExists edge_1591a2_incorporates_1591a1 c
  predHonored    : IncorporationHonored edge_1591a2_incorporates_1591a1 c
  defsExist      : ReferencedSectionExists edge_1591a_incorporates_1591e c
  defsHonored    : IncorporationHonored edge_1591a_incorporates_1591e c




inductive TraffickingGoverningSection (c : ComplaintText) : Prop where
  | general (h : Coherent1590 c) : TraffickingGoverningSection c
  | specific (hOverride : OverrideTriggered edge_1591_lexSpecialis_1590 c)
             (h : Coherent1591 c) : TraffickingGoverningSection c




structure CoherentTraffickingCore (c : ComplaintText) : Prop where
  peonage      : Coherent1581 c
  forcedLabor  : Coherent1589 c
  trafficking  : Coherent1590 c
  sexTraffick  : Coherent1591 c

end Proving.USC.T18.Trafficking.Structure
