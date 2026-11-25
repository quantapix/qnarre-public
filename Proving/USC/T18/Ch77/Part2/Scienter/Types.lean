









import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part2.Scienter

open Proving.USC.Common



























inductive ScienterTarget where
  | traffickingAct
  | benefitFromVenture
  | participationInVenture
  | meansOfCompulsion
  | victimMinority
  | coercionScheme
  | abuseOfLegalProcess
  | obstruction
  deriving DecidableEq















structure ChargingPosture where
  underSubsectionA1 : Bool
  actIsAdvertising : Bool
  reasonableOpportunityToObserve : Bool
  deriving DecidableEq

end Proving.USC.T18.Ch77.Part2.Scienter
