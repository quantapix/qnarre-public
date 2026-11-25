









import Proving.USC.T42.PublicAccommodations.Entitlement.Structure.Predicates

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Structure

open Proving.USC.Common








def edge_2000a_incorporates_def : Ref :=
  { source := "42 USC § 2000a(a)", target := "42 USC § 2000a(b)", kind := .Incorporates }


def edge_2000a_incorporates_commerce : Ref :=
  { source := "42 USC § 2000a(b)", target := "42 USC § 2000a(c)", kind := .Incorporates }


def edge_2000a_exceptAsProvided_b : Ref :=
  { source := "42 USC § 2000a(e)", target := "42 USC § 2000a(b)", kind := .ExceptAsProvided }


def edge_2000a3_incorporates_2000a2 : Ref :=
  { source := "42 USC § 2000a-3(a)", target := "42 USC § 2000a-2", kind := .Incorporates }



def edge_2000a3_incorporates_subchVIII : Ref :=
  { source := "42 USC § 2000a-3(d)", target := "42 USC subchapter VIII (ch. 21)", kind := .Incorporates }



def edge_2000a6_incorporates_subch : Ref :=
  { source := "42 USC § 2000a-6(a)", target := "42 USC subchapter II (ch. 21)", kind := .Incorporates }



def edge_2000a6_lexSpecialis : Ref :=
  { source := "42 USC § 2000a-6(b)", target := "42 USC subchapter II (ch. 21)", kind := .LexSpecialis }



def edge_2000a6_savings_otherLaw : Ref :=
  { source := "42 USC § 2000a-6(b)", target := "any other Federal or State law (not inconsistent)", kind := .Savings }





structure Coherent2000a (c : ComplaintText) : Prop where
  defExists      : ReferencedSectionExists edge_2000a_incorporates_def c
  defHonored     : IncorporationHonored edge_2000a_incorporates_def c
  commerceExists : ReferencedSectionExists edge_2000a_incorporates_commerce c
  commerceHonored : IncorporationHonored edge_2000a_incorporates_commerce c
  exceptionScopeExists : ReferencedSectionExists edge_2000a_exceptAsProvided_b c




structure Coherent2000a3 (c : ComplaintText) : Prop where
  prohibActExists  : ReferencedSectionExists edge_2000a3_incorporates_2000a2 c
  prohibActHonored : IncorporationHonored edge_2000a3_incorporates_2000a2 c
  crsExists        : ReferencedSectionExists edge_2000a3_incorporates_subchVIII c



structure Coherent2000a6 (c : ComplaintText) : Prop where
  jurisdictionExists : ReferencedSectionExists edge_2000a6_incorporates_subch c
  exclusiveness      : OverrideTriggered edge_2000a6_lexSpecialis c
  savings            : SavingsHonored edge_2000a6_savings_otherLaw c






inductive RemedyDisposition (c : ComplaintText) : Prop
  | exclusiveSubchapter (h : OverrideTriggered edge_2000a6_lexSpecialis c) : RemedyDisposition c
  | savedOtherLaw       (h : SavingsHonored edge_2000a6_savings_otherLaw c) : RemedyDisposition c

end Proving.USC.T42.PublicAccommodations.Entitlement.Structure
