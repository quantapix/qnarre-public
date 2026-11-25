














import Proving.USC.T18.Ch1.Structure.Types
import Proving.USC.T18.Ch1.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch1.Structure

open Proving.USC.Common (ComplaintText)






def edge_3_notwithstanding_3571 : Ref :=
  { source := "18 USC § 3", target := "18 USC § 3571", kind := .Notwithstanding }



def edge_3_exceptAsProvided_actOfCongress : Ref :=
  { source := "18 USC § 3", target := "any Act of Congress", kind := .ExceptAsProvided }



def edge_4_incorporates_titleFine : Ref :=
  { source := "18 USC § 4", target := "18 USC § 3571", kind := .Incorporates }



def edge_6_incorporates_t5s1 : Ref :=
  { source := "18 USC § 6", target := "5 USC § 1", kind := .Incorporates }




def edge_7_incorporates_ina101 : Ref :=
  { source := "18 USC § 7", target := "8 USC § 1101", kind := .Incorporates }



def edge_11_exceptAsProvided_sections : Ref :=
  { source := "18 USC § 11",
    target := "18 USC §§ 112, 878, 970, 1116, 1201", kind := .ExceptAsProvided }



def edge_12_incorporates_t39 : Ref :=
  { source := "18 USC § 12", target := "39 USC (title 39)", kind := .Incorporates }



def edge_13_incorporates_7 : Ref :=
  { source := "18 USC § 13(a)", target := "18 USC § 7", kind := .Incorporates }



def edge_13_incorporates_stateLaw : Ref :=
  { source := "18 USC § 13(a)", target := "State law (assimilated)", kind := .Incorporates }


def edge_13b1_subjectTo_13b2 : Ref :=
  { source := "18 USC § 13(b)(1)", target := "18 USC § 13(b)(2)", kind := .SubjectTo }






structure Coherent3 (c : ComplaintText) : Prop where
  overrideFires : OverrideTriggered edge_3_notwithstanding_3571 c
  exceptHonored : ExceptionApplies edge_3_exceptAsProvided_actOfCongress c
  targetExists  : ReferencedSectionExists edge_3_notwithstanding_3571 c



structure Coherent4 (c : ComplaintText) : Prop where
  incHonored   : IncorporationHonored edge_4_incorporates_titleFine c
  targetExists : ReferencedSectionExists edge_4_incorporates_titleFine c



structure Coherent6 (c : ComplaintText) : Prop where
  incHonored   : IncorporationHonored edge_6_incorporates_t5s1 c
  targetExists : ReferencedSectionExists edge_6_incorporates_t5s1 c



structure Coherent7 (c : ComplaintText) : Prop where
  incHonored   : IncorporationHonored edge_7_incorporates_ina101 c
  targetExists : ReferencedSectionExists edge_7_incorporates_ina101 c



structure Coherent11 (c : ComplaintText) : Prop where
  exceptApplies : ExceptionApplies edge_11_exceptAsProvided_sections c
  targetsExist  : ReferencedSectionExists edge_11_exceptAsProvided_sections c



structure Coherent12 (c : ComplaintText) : Prop where
  incHonored   : IncorporationHonored edge_12_incorporates_t39 c
  targetExists : ReferencedSectionExists edge_12_incorporates_t39 c




structure Coherent13 (c : ComplaintText) : Prop where
  incPlace      : IncorporationHonored edge_13_incorporates_7 c
  incStateLaw   : IncorporationHonored edge_13_incorporates_stateLaw c
  subjectTarget : ReferencedSectionExists edge_13b1_subjectTo_13b2 c
  place7Exists  : ReferencedSectionExists edge_13_incorporates_7 c

end Proving.USC.T18.Ch1.Structure
