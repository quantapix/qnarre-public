














import Proving.USC.T42.Ch2Ch6.Structure.Predicates

namespace Proving.USC.T42.Ch2Ch6.Structure
open Proving.USC.Common


def edge_90_incorporates_88 : Ref :=
  { source := "42 USC § 90", target := "42 USC § 88", kind := .Incorporates }
def edge_90_incorporates_89 : Ref :=
  { source := "42 USC § 90", target := "42 USC § 89", kind := .Incorporates }



def edge_91_incorporates_88 : Ref :=
  { source := "42 USC § 91", target := "42 USC § 88", kind := .Incorporates }
def edge_91_incorporates_90 : Ref :=
  { source := "42 USC § 91", target := "42 USC § 90", kind := .Incorporates }



def edge_97_savings_rs58 : Ref :=
  { source := "42 USC § 97", target := "title 58 of the Revised Statutes",
    kind := .Savings, crossTitle := true }


def edge_192_incorporates_191 : Ref :=
  { source := "42 USC § 192", target := "42 USC § 191", kind := .Incorporates }
def edge_193_incorporates_191 : Ref :=
  { source := "42 USC § 193", target := "42 USC § 191", kind := .Incorporates }
def edge_194_incorporates_191 : Ref :=
  { source := "42 USC § 194", target := "42 USC § 191", kind := .Incorporates }



structure Coherent90 (c : ComplaintText) : Prop where
  incorp88 : IncorporationHonored edge_90_incorporates_88 c
  incorp89 : IncorporationHonored edge_90_incorporates_89 c



structure Coherent91 (c : ComplaintText) : Prop where
  incorp88 : IncorporationHonored edge_91_incorporates_88 c
  incorp90 : IncorporationHonored edge_91_incorporates_90 c



structure Coherent97 (c : ComplaintText) : Prop where
  savings : SavingsClausePreserved edge_97_savings_rs58 c



structure Coherent192 (c : ComplaintText) : Prop where
  bureauExists : ReferencedSectionExists edge_192_incorporates_191 c
  incorp       : IncorporationHonored edge_192_incorporates_191 c



structure Coherent193 (c : ComplaintText) : Prop where
  incorp : IncorporationHonored edge_193_incorporates_191 c



structure Coherent194 (c : ComplaintText) : Prop where
  incorp : IncorporationHonored edge_194_incorporates_191 c

end Proving.USC.T42.Ch2Ch6.Structure
