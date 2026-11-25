













import Proving.USC.Common.Types
import Proving.USC.T42.TitleVI.Structure.Types
import Proving.USC.T42.TitleVI.Structure.Predicates

namespace Proving.USC.T42.TitleVI.Structure

open Proving.USC.Common












def edge_2000d1_incorporates_2000d : Ref :=
  { source := "42 USC § 2000d-1", target := "42 USC § 2000d", kind := .Incorporates }



def edge_2000d1_savings_otherLaw : Ref :=
  { source := "42 USC § 2000d-1", target := "other Federal law", kind := .Savings }


def edge_2000d7_incorporates_titleVI : Ref :=
  { source := "42 USC § 2000d-7", target := "42 USC § 2000d", kind := .Incorporates }


def edge_2000d7_incorporates_rehabAct504 : Ref :=
  { source := "42 USC § 2000d-7", target := "29 USC § 794", kind := .Incorporates }


def edge_2000d7_incorporates_titleIX : Ref :=
  { source := "42 USC § 2000d-7", target := "20 USC § 1681", kind := .Incorporates }


def edge_2000d7_incorporates_ageDiscrimAct : Ref :=
  { source := "42 USC § 2000d-7", target := "42 USC § 6101", kind := .Incorporates }



def edge_2000d7_incorporates_anyOtherStatute : Ref :=
  { source := "42 USC § 2000d-7", target := "any other Federal anti-discrimination funding statute", kind := .Incorporates }






structure Coherent2000d (c : ComplaintText) : Prop where

  selfExists : ReferencedSectionExists edge_2000d1_incorporates_2000d c



structure Coherent2000d1 (c : ComplaintText) : Prop where
  prohibitionExists : ReferencedSectionExists edge_2000d1_incorporates_2000d c
  incorporates2000d : IncorporationHonored edge_2000d1_incorporates_2000d c
  savingsConsistent : SavingsConsistent edge_2000d1_savings_otherLaw c





structure Coherent2000d7 (c : ComplaintText) : Prop where
  titleVIExists      : ReferencedSectionExists edge_2000d7_incorporates_titleVI c
  incorporatesTitleVI : IncorporationHonored edge_2000d7_incorporates_titleVI c
  rehabActExists     : ReferencedSectionExists edge_2000d7_incorporates_rehabAct504 c
  titleIXExists      : ReferencedSectionExists edge_2000d7_incorporates_titleIX c
  ageDiscrimExists   : ReferencedSectionExists edge_2000d7_incorporates_ageDiscrimAct c
  anyOtherExists     : ReferencedSectionExists edge_2000d7_incorporates_anyOtherStatute c

end Proving.USC.T42.TitleVI.Structure
