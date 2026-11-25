





import Proving.USC.Common.Types
import Proving.USC.T05.Rulemaking.Structure.Types
import Proving.USC.T05.Rulemaking.Structure.Predicates
import Proving.USC.T05.Rulemaking.Structure.Statute

namespace Proving.USC.T05.Rulemaking.Structure

open Proving.USC.Common (ComplaintText)


theorem coherent553_intro {c : ComplaintText}
    (hFormalExists : ReferencedSectionExists edge_553c_incorporates_556_557 c)
    (hFormalInc    : IncorporationHonored edge_553c_incorporates_556_557 c)
    (hSiteExists   : ReferencedSectionExists edge_553b4_incorporates_44_3501note c)
    (hSiteInc      : IncorporationHonored edge_553b4_incorporates_44_3501note c)
    (hOverride     : ExceptionApplies edge_553c_exceptAsProvided_556_557 c →
                       OverrideTriggered edge_553c_exceptAsProvided_556_557 c)
    : Coherent553 c :=
  { formalRegimeExists := hFormalExists
    formalIncorporated := hFormalInc
    websiteRefExists   := hSiteExists
    websiteIncorporated := hSiteInc
    overrideWellFormed := hOverride }

end Proving.USC.T05.Rulemaking.Structure
