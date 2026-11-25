

















import Proving.USC.T42.SchoolDesegregationAid.Structure.Types
import Proving.USC.T42.SchoolDesegregationAid.Structure.Predicates

namespace Proving.USC.T42.SchoolDesegregationAid.Structure

open Proving.USC.Common (ComplaintText)




def edge_2000c2_incorporates_2000c : Ref :=
  { source := "42 USC § 2000c-2", target := "42 USC § 2000c", kind := .Incorporates }


def edge_2000c3_incorporates_2000c : Ref :=
  { source := "42 USC § 2000c-3", target := "42 USC § 2000c", kind := .Incorporates }


def edge_2000c4_incorporates_2000c : Ref :=
  { source := "42 USC § 2000c-4", target := "42 USC § 2000c", kind := .Incorporates }


def edge_2000c5_incorporates_subchapter : Ref :=
  { source := "42 USC § 2000c-5", target := "42 USC subch. IV (ch21)", kind := .Incorporates }


def edge_2000c7_incorporates_subchapter : Ref :=
  { source := "42 USC § 2000c-7", target := "42 USC subch. IV (ch21)", kind := .Incorporates }


def edge_2000c9_savings_subchapter : Ref :=
  { source := "42 USC § 2000c-9", target := "42 USC subch. IV (ch21)", kind := .Savings }





structure Coherent2000c2 (c : ComplaintText) : Prop where
  defsExist     : ReferencedSectionExists edge_2000c2_incorporates_2000c c
  incorporates  : IncorporationHonored    edge_2000c2_incorporates_2000c c


structure Coherent2000c3 (c : ComplaintText) : Prop where
  defsExist     : ReferencedSectionExists edge_2000c3_incorporates_2000c c
  incorporates  : IncorporationHonored    edge_2000c3_incorporates_2000c c



structure Coherent2000c4 (c : ComplaintText) : Prop where
  defsExist     : ReferencedSectionExists edge_2000c4_incorporates_2000c c
  incorporates  : IncorporationHonored    edge_2000c4_incorporates_2000c c



structure Coherent2000c5 (c : ComplaintText) : Prop where
  scopeExists   : ReferencedSectionExists edge_2000c5_incorporates_subchapter c
  incorporates  : IncorporationHonored    edge_2000c5_incorporates_subchapter c



structure Coherent2000c7 (c : ComplaintText) : Prop where
  scopeExists   : ReferencedSectionExists edge_2000c7_incorporates_subchapter c
  incorporates  : IncorporationHonored    edge_2000c7_incorporates_subchapter c



structure Coherent2000c9 (c : ComplaintText) : Prop where
  scopeExists   : ReferencedSectionExists edge_2000c9_savings_subchapter c
  savingsHonored : SavingsClauseHonored   edge_2000c9_savings_subchapter c




structure CoherentSubchapterIV (c : ComplaintText) : Prop where
  sec2 : Coherent2000c2 c
  sec3 : Coherent2000c3 c
  sec4 : Coherent2000c4 c
  sec5 : Coherent2000c5 c
  sec7 : Coherent2000c7 c
  sec9 : Coherent2000c9 c

end Proving.USC.T42.SchoolDesegregationAid.Structure
