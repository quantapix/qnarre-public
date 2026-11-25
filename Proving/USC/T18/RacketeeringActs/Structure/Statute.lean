import Proving.USC.Common.Types
import Proving.USC.T18.RacketeeringActs.Structure.Types
import Proving.USC.T18.RacketeeringActs.Structure.Predicates





















namespace Proving.USC.T18.RacketeeringActs.Structure

open Proving.USC.Common




def edge_1961_incorporates_1951 : Ref :=
  { source := "18 USC § 1961(1)(B)", target := "18 USC § 1951", kind := .Incorporates }


def edge_1961_incorporates_1952 : Ref :=
  { source := "18 USC § 1961(1)(B)", target := "18 USC § 1952", kind := .Incorporates }


def edge_1961_incorporates_1956 : Ref :=
  { source := "18 USC § 1961(1)(B)", target := "18 USC § 1956", kind := .Incorporates }


def edge_1961_incorporates_1957 : Ref :=
  { source := "18 USC § 1961(1)(B)", target := "18 USC § 1957", kind := .Incorporates }


def edge_1956_incorporates_1961 : Ref :=
  { source := "18 USC § 1956(c)(7)(A)", target := "18 USC § 1961(1)", kind := .Incorporates }


def edge_1952_incorporates_1956 : Ref :=
  { source := "18 USC § 1952(b)", target := "18 USC § 1956", kind := .Incorporates }


def edge_1952_incorporates_1957 : Ref :=
  { source := "18 USC § 1952(b)", target := "18 USC § 1957", kind := .Incorporates }



def edge_1957_incorporates_1956 : Ref :=
  { source := "18 USC § 1957(f)", target := "18 USC § 1956", kind := .Incorporates }



def edge_1956_incorporates_1957 : Ref :=
  { source := "18 USC § 1956(i)(1)", target := "18 USC § 1957", kind := .Incorporates }




def edge_1956_notwithstanding_3282 : Ref :=
  { source := "18 USC § 1956(j)", target := "18 USC § 3282", kind := .Notwithstanding }


def edge_1956_exceptAsProvided_1956i2 : Ref :=
  { source := "18 USC § 1956(i)(1)", target := "18 USC § 1956(i)(2)", kind := .ExceptAsProvided }


def edge_1957_exceptAsProvided_1957b2 : Ref :=
  { source := "18 USC § 1957(b)(1)", target := "18 USC § 1957(b)(2)", kind := .ExceptAsProvided }


def edge_1956_savings : Ref :=
  { source := "18 USC § 1956(d)", target := "other Federal, State, or other law", kind := .Savings }


def edge_1952_savings : Ref :=
  { source := "18 USC § 1952(e)", target := "savings promotion raffle (12 USC 1752/1813)", kind := .Savings }





structure Coherent1961 (c : ComplaintText) : Prop where
  ex1951    : ReferencedSectionExists edge_1961_incorporates_1951 c
  ex1952    : ReferencedSectionExists edge_1961_incorporates_1952 c
  ex1956    : ReferencedSectionExists edge_1961_incorporates_1956 c
  ex1957    : ReferencedSectionExists edge_1961_incorporates_1957 c
  inc1951   : IncorporationHonored edge_1961_incorporates_1951 c
  inc1952   : IncorporationHonored edge_1961_incorporates_1952 c
  inc1956   : IncorporationHonored edge_1961_incorporates_1956 c
  inc1957   : IncorporationHonored edge_1961_incorporates_1957 c





structure Coherent1951 (c : ComplaintText) : Prop where
  resolvesAsTarget : ReferencedSectionExists edge_1961_incorporates_1951 c




structure Coherent1952 (c : ComplaintText) : Prop where
  ex1956    : ReferencedSectionExists edge_1952_incorporates_1956 c
  ex1957    : ReferencedSectionExists edge_1952_incorporates_1957 c
  inc1956   : IncorporationHonored edge_1952_incorporates_1956 c
  inc1957   : IncorporationHonored edge_1952_incorporates_1957 c





structure Coherent1956 (c : ComplaintText) : Prop where
  ex1961       : ReferencedSectionExists edge_1956_incorporates_1961 c
  inc1961      : IncorporationHonored edge_1956_incorporates_1961 c
  ex1957       : ReferencedSectionExists edge_1956_incorporates_1957 c



structure Coherent1957 (c : ComplaintText) : Prop where
  ex1956    : ReferencedSectionExists edge_1957_incorporates_1956 c
  inc1956   : IncorporationHonored edge_1957_incorporates_1956 c




inductive LimitationsResolution (c : ComplaintText) : Prop

  | default      (h : ReferencedSectionExists edge_1956_notwithstanding_3282 c)

  | jOverride    (h : OverrideTriggered edge_1956_notwithstanding_3282 c)

end Proving.USC.T18.RacketeeringActs.Structure
