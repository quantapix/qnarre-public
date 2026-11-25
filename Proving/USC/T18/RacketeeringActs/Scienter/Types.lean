


















import Proving.USC.Common.Types

namespace Proving.USC.T18.RacketeeringActs.Scienter


abbrev ComplaintText := Proving.USC.Common.ComplaintText


abbrev Person := Proving.USC.Common.Person




abbrev MentalState := Proving.USC.Common.MentalState



instance (a b : MentalState) : Decidable (a.atLeast b) :=
  inferInstanceAs (Decidable (b.rank ≤ a.rank))

end Proving.USC.T18.RacketeeringActs.Scienter
