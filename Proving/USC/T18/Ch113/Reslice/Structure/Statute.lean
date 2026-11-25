import Proving.USC.T18.Ch113.Reslice.Structure.Types
import Proving.USC.T18.Ch113.Reslice.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false













namespace Proving.USC.T18.Ch113.Reslice.Structure

open Proving.USC.Common




def edge_2315_incorporates_670 : Ref :=
  { source := "18 USC § 2315", target := "18 USC § 670", kind := .Incorporates }


def edge_2315_override_670 : Ref :=
  { source := "18 USC § 2315", target := "18 USC § 670", kind := .LexSpecialis }


inductive Punishment2315Path (c : ComplaintText) : Prop


  | governedBy670 (hExists : ReferencedSectionExists edge_2315_incorporates_670 c)

  | overriddenBy2315 (hOver : OverrideTriggered edge_2315_override_670 c)



structure Coherent2315 (c : ComplaintText) : Prop where
  medProductDefHonored : IncorporationHonored edge_2315_incorporates_670 c
  punishmentPath       : Punishment2315Path c




def edge_2318_incorporates_2320f : Ref :=
  { source := "18 USC § 2318", target := "18 USC § 2320(f)", kind := .Incorporates }

def edge_2318_incorporates_t17s101 : Ref :=
  { source := "18 USC § 2318", target := "17 USC § 101", kind := .Incorporates }

def edge_2318_incorporates_t49s46501 : Ref :=
  { source := "18 USC § 2318", target := "49 USC § 46501", kind := .Incorporates }

def edge_2318_subjectTo_2323 : Ref :=
  { source := "18 USC § 2318", target := "18 USC § 2323", kind := .SubjectTo }

def edge_2318_savings_otherLaw : Ref :=
  { source := "18 USC § 2318", target := "other law", kind := .Savings }




structure Coherent2318 (c : ComplaintText) : Prop where
  trafficDefHonored     : IncorporationHonored edge_2318_incorporates_2320f c
  copyrightDefsHonored  : IncorporationHonored edge_2318_incorporates_t17s101 c
  aircraftJurisHonored  : IncorporationHonored edge_2318_incorporates_t49s46501 c
  forfeitureRegimeExists : ReferencedSectionExists edge_2318_subjectTo_2323 c
  savingsHonored        : ExceptionApplies edge_2318_savings_otherLaw c




def edge_2320_subjectTo_2323 : Ref :=
  { source := "18 USC § 2320", target := "18 USC § 2323", kind := .SubjectTo }

def edge_2320_savings_otherLaw : Ref :=
  { source := "18 USC § 2320", target := "other law", kind := .Savings }

def edge_2320_incorporates_t15s1051 : Ref :=
  { source := "18 USC § 2320", target := "15 USC § 1051", kind := .Incorporates }

def edge_2320_incorporates_t15s1124 : Ref :=
  { source := "18 USC § 2320", target := "15 USC § 1124", kind := .Incorporates }


def edge_2320_incorporates_t36s220506 : Ref :=
  { source := "18 USC § 2320", target := "36 USC § 220506", kind := .Incorporates }

def edge_2320_incorporates_t21s321 : Ref :=
  { source := "18 USC § 2320", target := "21 USC § 321", kind := .Incorporates }

def edge_2320_incorporates_t28s522 : Ref :=
  { source := "18 USC § 2320", target := "28 USC § 522", kind := .Incorporates }

def edge_2320_incorporates_2318 : Ref :=
  { source := "18 USC § 2320", target := "18 USC § 2318", kind := .Incorporates }

def edge_2320_incorporates_2319 : Ref :=
  { source := "18 USC § 2320", target := "18 USC § 2319", kind := .Incorporates }

def edge_2320_incorporates_2319A : Ref :=
  { source := "18 USC § 2320", target := "18 USC § 2319A", kind := .Incorporates }





structure Coherent2320 (c : ComplaintText) : Prop where
  forfeitureRegimeExists : ReferencedSectionExists edge_2320_subjectTo_2323 c
  savingsHonored         : ExceptionApplies edge_2320_savings_otherLaw c
  lanhamActHonored       : IncorporationHonored edge_2320_incorporates_t15s1051 c
  lanham42Honored        : IncorporationHonored edge_2320_incorporates_t15s1124 c
  t36DesignationHonored  : IncorporationHonored edge_2320_incorporates_t36s220506 c
  fdcaDrugHonored        : IncorporationHonored edge_2320_incorporates_t21s321 c
  agReportExists         : ReferencedSectionExists edge_2320_incorporates_t28s522 c
  sibling2318Honored     : IncorporationHonored edge_2320_incorporates_2318 c

end Proving.USC.T18.Ch113.Reslice.Structure
