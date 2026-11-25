





import Proving.USC.T18.Elements.Statute

namespace Proving.USC.T18.Elements
open Proving.USC.Common

theorem section1962c_intro {p : Person} {e : Entity} {acts : List Act} {c : ComplaintText}
    (hCulp  : CulpablePersonCapableOfIntent p c)
    (hEnt   : IsEnterprise e c)
    (hICC   : EngagedInInterstateCommerce e c)
    (hDist  : PersonEnterpriseDistinct p e c)
    (hAssoc : EmployedOrAssociated p e c)
    (hCond  : ConductsOrParticipates p e c)
    (hPat   : PatternOfRacketeering acts c)
    : Section1962c p e acts c :=
  ⟨hCulp, hEnt, hICC, hDist, hAssoc, hCond, hPat⟩

end Proving.USC.T18.Elements
