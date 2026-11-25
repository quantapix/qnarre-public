












import Proving.USC.T18.CommercePredicates.Structure.Types
import Proving.USC.T18.CommercePredicates.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.CommercePredicates.Structure

open Proving.USC.Common






def edge_1958_incorporates_1959 : Ref :=
  { source := "18 USC § 1958", target := "18 USC § 1959", kind := .Incorporates }



def edge_1958_incorporates_stateOrUSLaw : Ref :=
  { source := "18 USC § 1958", target := "laws of any State or the United States", kind := .Incorporates }



def edge_1958_incorporates_3571 : Ref :=
  { source := "18 USC § 1958", target := "18 USC § 3571", kind := .Incorporates }






def edge_1960_incorporates_t31_5330 : Ref :=
  { source := "18 USC § 1960", target := "31 USC § 5330", kind := .Incorporates }




def edge_1960_incorporates_stateLaw : Ref :=
  { source := "18 USC § 1960", target := "State licensing law", kind := .Incorporates }



def edge_1960_incorporates_3571 : Ref :=
  { source := "18 USC § 1960", target := "18 USC § 3571", kind := .Incorporates }





structure Coherent1958 (c : ComplaintText) : Prop where
  defsShared1959      : IncorporationHonored edge_1958_incorporates_1959 c
  externalLawExists   : ReferencedSectionExists edge_1958_incorporates_stateOrUSLaw c
  fineScheduleExists  : ReferencedSectionExists edge_1958_incorporates_3571 c




structure Coherent1960 (c : ComplaintText) : Prop where
  t31RegHonored       : IncorporationHonored edge_1960_incorporates_t31_5330 c
  stateLawExists      : ReferencedSectionExists edge_1960_incorporates_stateLaw c
  fineScheduleExists  : ReferencedSectionExists edge_1960_incorporates_3571 c

end Proving.USC.T18.CommercePredicates.Structure
