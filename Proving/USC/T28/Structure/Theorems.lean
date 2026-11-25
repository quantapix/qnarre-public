


import Proving.USC.T28.Structure.Types
import Proving.USC.T28.Structure.Predicates
import Proving.USC.T28.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T28.Structure

open Proving.USC.Common (ComplaintText)



theorem coherent1343_intro {c : ComplaintText}
    (hConspEx  : ReferencedSectionExists edge_1343a1_incorporates_1985 c)
    (hConspInc : IncorporationHonored edge_1343a1_incorporates_1985 c)
    (hPrevEx   : ReferencedSectionExists edge_1343a2_incorporates_1985 c)
    (hPrevInc  : IncorporationHonored edge_1343a2_incorporates_1985 c)
    (hConst    : IncorporationHonored edge_1343a3_incorporates_constitution c)
    (hEqual    : IncorporationHonored edge_1343a3_incorporates_equalRightsActs c)
    (hCivil    : IncorporationHonored edge_1343a4_incorporates_civilRightsActs c)
    (hDC       : IncorporationHonored edge_1343a_incorporates_1343b c)
    : Coherent1343 c :=
  ⟨hConspEx, hConspInc, hPrevEx, hPrevInc, hConst, hEqual, hCivil, hDC⟩



theorem grounded1343_intro {c : ComplaintText}
    (h : Coherent1343 c) : Grounded1343 c :=
  Grounded1343.viaConspiracy h.conspiracyRefExists h.conspiracyHonored



theorem coherent1746_intro {c : ComplaintText}
    (hWithout : IncorporationHonored edge_1746p1_incorporates_perjuryLaw c)
    (hWithin  : IncorporationHonored edge_1746p2_incorporates_perjuryLaw c)
    : Coherent1746 c :=
  ⟨hWithout, hWithin⟩



theorem grounded1746_intro {c : ComplaintText}
    (h : Coherent1746 c) : Grounded1746 c :=
  Grounded1746.viaWithoutUS h.withoutUSHonored

end Proving.USC.T28.Structure
