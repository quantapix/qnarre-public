import Proving.USC.Common.Types

set_option autoImplicit false









namespace Proving.USC.T18.Ch77.Part5.Scienter

open Proving.USC.Common










inductive ScienterElement1591


  | traffickingActA1


  | benefitFromVentureA2

  | participationInVenture



  | meansCircumstance


  | ageCircumstance


  | obstructionD
  deriving DecidableEq











inductive ScienterDemand
  | atLeastRung (m : MentalState)
  | unspecified

end Proving.USC.T18.Ch77.Part5.Scienter
