import Proving.USC.Common.Types

set_option autoImplicit false










namespace Proving.USC.T18.Ch77.Part3.Procedure

open Proving.USC.Common




opaque RestitutionOrder : Type




opaque ForfeitableProperty : Type














inductive RestitutionStage where
  | offenseAdjudicated
  | victimIdentified
  | lossAmountDetermined
  | restitutionOrdered
  | orderEnforced
  deriving DecidableEq, Repr



structure RestitutionTransition where
  source : RestitutionStage
  target : RestitutionStage
  guard : Prop

end Proving.USC.T18.Ch77.Part3.Procedure
