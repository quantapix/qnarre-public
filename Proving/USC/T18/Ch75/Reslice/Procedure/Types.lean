import Proving.USC.Common.Types

set_option autoImplicit false


























namespace Proving.USC.T18.Ch75.Reslice.Procedure

open Proving.USC.Common





opaque TravelDocument : Type




opaque ImmigrationFiling : Type



opaque Prosecution : Type


inductive DocumentStage where

  | applied


  | issued


  | void
  deriving DecidableEq, Repr


inductive ProsecutionStage where

  | conduct

  | charged

  | convicted

  | sentenced
  deriving DecidableEq, Repr



structure ProsecutionStep where
  source : ProsecutionStage
  target : ProsecutionStage
  deriving DecidableEq, Repr




structure DocumentTimeline where


  voidanceDay : Nat


  useDay : Nat
  deriving DecidableEq, Repr




structure SentencingFacts where


  facilitatesInternationalTerrorism : Bool


  facilitatesDrugTraffickingCrime : Bool


  suchOffenseOrdinal : Nat

  imposedImprisonmentYears : Nat
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch75.Reslice.Procedure
