


















import Proving.USC.Common.Types
import Proving.USC.T18.Spec.Sanction.Types
import Proving.USC.T18.Spec.Sanction.Predicates

namespace Proving.USC.T18.Spec.Sanction

open Proving.USC.Common (ComplaintText)



def Imprisonment1963a : Sanction := ⟨.Imprisonment, 20, .Ceiling⟩




def ImprisonmentLife1963a : Sanction := ⟨.Imprisonment, 9999, .Ceiling⟩



def Fine1963a : Sanction := ⟨.Fine, 0, .Ceiling⟩




def Forfeiture1963a : Sanction := ⟨.Forfeiture, 0, .Exact⟩



def Treble1964c : Sanction := ⟨.Multiplier, 3, .Exact⟩




def WithinRange (sought stat : Sanction) : Prop :=
  match stat.dir with
  | .Ceiling => sought.bound ≤ stat.bound
  | .Floor   => stat.bound ≤ sought.bound
  | .Exact   => sought.bound = stat.bound





structure Sanction1963aImprisonment (s : Sanction) (c : ComplaintText) : Prop where
  honours   : WithinRange s Imprisonment1963a
  triggered : TriggersSection1962 c
  pleaded   : SanctionSought s c



structure Sanction1963aImprisonmentLife (s : Sanction) (c : ComplaintText) : Prop where
  honours   : WithinRange s ImprisonmentLife1963a
  triggered : TriggersSection1962 c
  lifeMax   : PredicateCarriesLife c
  pleaded   : SanctionSought s c



structure Sanction1963aForfeiture (c : ComplaintText) : Prop where
  triggered : TriggersSection1962 c
  inReach   : WithinForfeitureReach c



structure Sanction1964cTreble (s : Sanction) (c : ComplaintText) : Prop where
  honours   : WithinRange s Treble1964c
  triggered : TriggersSection1962 c
  pleaded   : SanctionSought s c




inductive ChapterCriminalSanction (c : ComplaintText) : Prop
  | standard (s : Sanction) (impr : Sanction1963aImprisonment s c)
             (forf : Sanction1963aForfeiture c)
  | lifeMax  (s : Sanction) (impr : Sanction1963aImprisonmentLife s c)
             (forf : Sanction1963aForfeiture c)

end Proving.USC.T18.Spec.Sanction
