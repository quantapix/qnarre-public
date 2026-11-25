











import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Scienter

open Proving.USC.Common








inductive ScienterElement


  | traffickingAct


  | benefitFromVenture



  | meansCircumstance


  | ageCircumstance


  | ventureAssistance



  | coercionScheme


  | obstruction
deriving DecidableEq










inductive ScienterDemand
  | atLeast (m : MentalState)
  | unspecified
deriving DecidableEq




instance instDecidableAtLeast (a b : MentalState) : Decidable (MentalState.atLeast a b) :=
  Nat.decLe b.rank a.rank

end Proving.USC.T18.Ch77.Part4.Scienter
