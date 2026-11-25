














import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Sanction.Types

namespace Proving.USC.T42.EqualRights.Sanction

open Proving.USC.Common





axiom SanctionSought (s : Sanction) (c : ComplaintText) : Prop





axiom RespondentSizeBracket (lo hi : Nat) (c : ComplaintText) : Prop





axiom PunitiveEligible (c : ComplaintText) : Prop






def StatutoryCap (lo hi : Nat) : Sanction :=
  if lo = 14  ∧ hi = 100 then ⟨.Fine, 50000,  .Ceiling⟩
  else if lo = 100 ∧ hi = 200 then ⟨.Fine, 100000, .Ceiling⟩
  else if lo = 200 ∧ hi = 500 then ⟨.Fine, 200000, .Ceiling⟩
  else if lo = 500 then ⟨.Fine, 300000, .Ceiling⟩
  else ⟨.Fine, 0, .Ceiling⟩

end Proving.USC.T42.EqualRights.Sanction
