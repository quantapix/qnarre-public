


import Proving.USC.T18.Structure.Predicates

namespace Proving.USC.T18.Structure
open Proving.USC.Common


def edge_1962c_incorporates_1961 : Ref :=
  { source := "18 USC § 1962(c)", target := "18 USC § 1961", kind := .Incorporates }

def edge_1962c_subjectTo_1964 : Ref :=
  { source := "18 USC § 1962(c)", target := "18 USC § 1964", kind := .SubjectTo }



structure Coherent1962c (c : ComplaintText) : Prop where
  incorporates : IncorporationHonored edge_1962c_incorporates_1961 c
  remedyExists : ReferencedSectionExists edge_1962c_subjectTo_1964 c

end Proving.USC.T18.Structure
