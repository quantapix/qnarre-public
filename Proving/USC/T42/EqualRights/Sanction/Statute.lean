













import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Sanction.Types
import Proving.USC.T42.EqualRights.Sanction.Predicates

namespace Proving.USC.T42.EqualRights.Sanction

open Proving.USC.Common



def WithinRange (sought stat : Sanction) : Prop :=
  match stat.dir with
  | .Ceiling => sought.bound ≤ stat.bound
  | .Floor   => stat.bound ≤ sought.bound
  | .Exact   => sought.bound = stat.bound






structure Sanction1981a_A (sought : Sanction) (c : ComplaintText) : Prop where
  bracket  : RespondentSizeBracket 14 100 c
  punitive : PunitiveEligible c
  pleaded  : SanctionSought sought c
  honours  : WithinRange sought (StatutoryCap 14 100)


structure Sanction1981a_B (sought : Sanction) (c : ComplaintText) : Prop where
  bracket  : RespondentSizeBracket 100 200 c
  punitive : PunitiveEligible c
  pleaded  : SanctionSought sought c
  honours  : WithinRange sought (StatutoryCap 100 200)


structure Sanction1981a_C (sought : Sanction) (c : ComplaintText) : Prop where
  bracket  : RespondentSizeBracket 200 500 c
  punitive : PunitiveEligible c
  pleaded  : SanctionSought sought c
  honours  : WithinRange sought (StatutoryCap 200 500)


structure Sanction1981a_D (sought : Sanction) (c : ComplaintText) : Prop where
  bracket  : RespondentSizeBracket 500 0 c
  punitive : PunitiveEligible c
  pleaded  : SanctionSought sought c
  honours  : WithinRange sought (StatutoryCap 500 0)



inductive Sanction1981aCapped (sought : Sanction) (c : ComplaintText) : Prop
  | bracketA : Sanction1981a_A sought c → Sanction1981aCapped sought c
  | bracketB : Sanction1981a_B sought c → Sanction1981aCapped sought c
  | bracketC : Sanction1981a_C sought c → Sanction1981aCapped sought c
  | bracketD : Sanction1981a_D sought c → Sanction1981aCapped sought c

end Proving.USC.T42.EqualRights.Sanction
