






import Proving.USC.T18.Prohibited.Structure.Types
import Proving.USC.T18.Prohibited.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Prohibited.Structure

open Proving.USC.Common












def edge_1962_incorporates_1961 : Ref :=
  { source := "18 USC § 1962", target := "18 USC § 1961", kind := .Incorporates }

def edge_1962d_incorporates_subsections : Ref :=
  { source := "18 USC § 1962(d)", target := "18 USC § 1962", kind := .Incorporates }

def edge_1962_subjectTo_1963 : Ref :=
  { source := "18 USC § 1962", target := "18 USC § 1963", kind := .SubjectTo }

def edge_1962_subjectTo_1964 : Ref :=
  { source := "18 USC § 1962", target := "18 USC § 1964", kind := .SubjectTo }

def edge_1964c_exceptAsProvided_1962 : Ref :=
  { source := "18 USC § 1964(c)", target := "18 USC § 1962", kind := .ExceptAsProvided }





structure Coherent1962 (c : ComplaintText) : Prop where

  defsExist        : ReferencedSectionExists edge_1962_incorporates_1961 c

  incorporates     : IncorporationHonored edge_1962_incorporates_1961 c

  internalRef      : ReferencedSectionExists edge_1962d_incorporates_subsections c

  criminalRemedy   : ReferencedSectionExists edge_1962_subjectTo_1963 c

  civilRemedy      : ReferencedSectionExists edge_1962_subjectTo_1964 c





inductive EnforcementPathLive : ComplaintText → Prop where
  | criminal {c : ComplaintText} (h : OverrideTriggered edge_1962_subjectTo_1963 c) :
      EnforcementPathLive c
  | civil    {c : ComplaintText} (h : OverrideTriggered edge_1962_subjectTo_1964 c) :
      EnforcementPathLive c

end Proving.USC.T18.Prohibited.Structure
