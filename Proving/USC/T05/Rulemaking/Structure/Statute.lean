

















import Proving.USC.Common.Types
import Proving.USC.T05.Rulemaking.Structure.Types
import Proving.USC.T05.Rulemaking.Structure.Predicates

namespace Proving.USC.T05.Rulemaking.Structure

open Proving.USC.Common (ComplaintText)


def edge_553c_incorporates_556_557 : Ref :=
  { source := "5 USC § 553(c)", target := "5 USC §§ 556, 557", kind := .Incorporates }



def edge_553c_exceptAsProvided_556_557 : Ref :=
  { source := "5 USC § 553(c)", target := "5 USC §§ 556, 557", kind := .ExceptAsProvided }


def edge_553b4_incorporates_44_3501note : Ref :=
  { source := "5 USC § 553(b)(4)", target := "44 USC § 3501 note (§ 206(d) E-Gov Act 2002)",
    kind := .Incorporates }




structure Coherent553 (c : ComplaintText) : Prop where
  formalRegimeExists : ReferencedSectionExists edge_553c_incorporates_556_557 c
  formalIncorporated : IncorporationHonored edge_553c_incorporates_556_557 c
  websiteRefExists   : ReferencedSectionExists edge_553b4_incorporates_44_3501note c
  websiteIncorporated : IncorporationHonored edge_553b4_incorporates_44_3501note c
  overrideWellFormed : ExceptionApplies edge_553c_exceptAsProvided_556_557 c →
                         OverrideTriggered edge_553c_exceptAsProvided_556_557 c

end Proving.USC.T05.Rulemaking.Structure
