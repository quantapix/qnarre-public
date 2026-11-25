import Proving.USC.T18.Ch117.Structure.Types
import Proving.USC.T18.Ch117.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch117.Structure

set_option autoImplicit false
open Proving.USC.Common











def edge_2421_incorporates_2427 : Ref :=
  { source := "18 USC § 2421", target := "18 USC § 2427", kind := .Incorporates }
def edge_2422_incorporates_2427 : Ref :=
  { source := "18 USC § 2422", target := "18 USC § 2427", kind := .Incorporates }
def edge_2423_incorporates_2427 : Ref :=
  { source := "18 USC § 2423", target := "18 USC § 2427", kind := .Incorporates }
def edge_2425_incorporates_2427 : Ref :=
  { source := "18 USC § 2425", target := "18 USC § 2427", kind := .Incorporates }


def edge_2427_incorporates_2256 : Ref :=
  { source := "18 USC § 2427", target := "18 USC § 2256", kind := .Incorporates }


def edge_2421A_incorporates_230 : Ref :=
  { source := "18 USC § 2421A", target := "47 USC § 230", kind := .Incorporates }
def edge_2421A_incorporates_1591 : Ref :=
  { source := "18 USC § 2421A", target := "18 USC § 1591", kind := .Incorporates }
def edge_2421A_incorporates_2327 : Ref :=
  { source := "18 USC § 2421A", target := "18 USC § 2327", kind := .Incorporates }
def edge_2421A_notwithstanding_3663 : Ref :=
  { source := "18 USC § 2421A", target := "18 USC § 3663", kind := .Notwithstanding }
def edge_2421A_notwithstanding_3663A : Ref :=
  { source := "18 USC § 2421A", target := "18 USC § 3663A", kind := .Notwithstanding }


def edge_2423_incorporates_2246 : Ref :=
  { source := "18 USC § 2423", target := "18 USC § 2246", kind := .Incorporates }
def edge_2423_incorporates_ch109A : Ref :=
  { source := "18 USC § 2423", target := "18 USC ch109A", kind := .Incorporates }
def edge_2423_incorporates_1591 : Ref :=
  { source := "18 USC § 2423", target := "18 USC § 1591", kind := .Incorporates }
def edge_2423_incorporates_2256 : Ref :=
  { source := "18 USC § 2423", target := "18 USC § 2256", kind := .Incorporates }


def edge_2426_incorporates_ch109A : Ref :=
  { source := "18 USC § 2426", target := "18 USC ch109A", kind := .Incorporates }
def edge_2426_incorporates_ch110 : Ref :=
  { source := "18 USC § 2426", target := "18 USC ch110", kind := .Incorporates }
def edge_2426_incorporates_1591 : Ref :=
  { source := "18 USC § 2426", target := "18 USC § 1591", kind := .Incorporates }
def edge_2426_exceptAsProvided_3559 : Ref :=
  { source := "18 USC § 2426", target := "18 USC § 3559", kind := .ExceptAsProvided }
def edge_2426_lexSpecialis_ch117 : Ref :=
  { source := "18 USC § 2426", target := "18 USC ch117", kind := .LexSpecialis }


def edge_2428_incorporates_ch46 : Ref :=
  { source := "18 USC § 2428", target := "18 USC ch46", kind := .Incorporates }


def edge_2429_notwithstanding_3663 : Ref :=
  { source := "18 USC § 2429", target := "18 USC § 3663", kind := .Notwithstanding }
def edge_2429_notwithstanding_3663A : Ref :=
  { source := "18 USC § 2429", target := "18 USC § 3663A", kind := .Notwithstanding }
def edge_2429_incorporates_1591 : Ref :=
  { source := "18 USC § 2429", target := "18 USC § 1591", kind := .Incorporates }
def edge_2429_incorporates_3664 : Ref :=
  { source := "18 USC § 2429", target := "18 USC § 3664", kind := .Incorporates }
def edge_2429_incorporates_3663A : Ref :=
  { source := "18 USC § 2429", target := "18 USC § 3663A", kind := .Incorporates }
def edge_2429_incorporates_2259 : Ref :=
  { source := "18 USC § 2429", target := "18 USC § 2259", kind := .Incorporates }
def edge_2429_incorporates_853 : Ref :=
  { source := "18 USC § 2429", target := "21 USC § 853", kind := .Incorporates }










structure Coherent2427 (c : ComplaintText) : Prop where
  childPorn : IncorporationHonored edge_2427_incorporates_2256 c




structure Coherent2421A (c : ComplaintText) : Prop where
  ics           : IncorporationHonored edge_2421A_incorporates_230 c
  sexTraffic    : ReferencedSectionExists edge_2421A_incorporates_1591 c
  restScope     : IncorporationHonored edge_2421A_incorporates_2327 c
  override3663  : OverrideTriggered edge_2421A_notwithstanding_3663 c
  override3663A : OverrideTriggered edge_2421A_notwithstanding_3663A c



structure Coherent2423 (c : ComplaintText) : Prop where
  term      : IncorporationHonored edge_2423_incorporates_2427 c
  sexAct    : IncorporationHonored edge_2423_incorporates_2246 c
  ch109A    : ReferencedSectionExists edge_2423_incorporates_ch109A c
  commSex   : IncorporationHonored edge_2423_incorporates_1591 c
  childPorn : IncorporationHonored edge_2423_incorporates_2256 c



structure Coherent2426 (c : ComplaintText) : Prop where
  ch109A               : ReferencedSectionExists edge_2426_incorporates_ch109A c
  ch110                : ReferencedSectionExists edge_2426_incorporates_ch110 c
  s1591                : ReferencedSectionExists edge_2426_incorporates_1591 c
  enhancementException : ExceptionApplies edge_2426_exceptAsProvided_3559 c


structure Coherent2428 (c : ComplaintText) : Prop where
  civilForfeit : ReferencedSectionExists edge_2428_incorporates_ch46 c




structure Coherent2429 (c : ComplaintText) : Prop where
  override3663    : OverrideTriggered edge_2429_notwithstanding_3663 c
  override3663A   : OverrideTriggered edge_2429_notwithstanding_3663A c
  commSex         : IncorporationHonored edge_2429_incorporates_1591 c
  enforce         : IncorporationHonored edge_2429_incorporates_3664 c
  sameManner3663A : IncorporationHonored edge_2429_incorporates_3663A c
  losses          : IncorporationHonored edge_2429_incorporates_2259 c
  csaForfeit      : IncorporationHonored edge_2429_incorporates_853 c





inductive Enhancement2426 (c : ComplaintText) : Prop

  | chapterTriple (h : OverrideTriggered edge_2426_lexSpecialis_ch117 c) : Enhancement2426 c

  | mandatoryLife (h : ExceptionApplies edge_2426_exceptAsProvided_3559 c) : Enhancement2426 c

end Proving.USC.T18.Ch117.Structure
