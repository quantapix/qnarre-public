










import Proving.USC.T42.TitleVI.Scienter.Types
import Proving.USC.T42.TitleVI.Scienter.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Scienter

open Proving.USC.Common (Person ComplaintText)




structure Scienter2000d (p : Person) (c : ComplaintText) : Prop where

  reaches : ∃ rung : MentalState,
    rung.atLeast RequiredMentalState2000d ∧ MentalStateProven p rung c


def Section2000dCulpable (p : Person) (c : ComplaintText) : Prop :=
  Scienter2000d p c



structure Scienter2000d1 (p : Person) (c : ComplaintText) : Prop where

  reaches : ∃ rung : MentalState,
    rung.atLeast RequiredMentalState2000d1 ∧ MentalStateProven p rung c

end Proving.USC.T42.TitleVI.Scienter
