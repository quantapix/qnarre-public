











import Proving.USC.T18.Ch77Tail.Procedure.Predicates

namespace Proving.USC.T18.Ch77Tail.Procedure

open Proving.USC.Common




def ceiling1582 : Years := 7

def ceiling1585 : Years := 7

def ceiling1586 : Years := 2

def ceiling1587 : Years := 10

def ceiling1588 : Years := 10





structure Penalty1582 (n : Years) (p : Person) (c : ComplaintText) : Prop where
  conduct    : VesselPreparedForSlaveTrade p c
  termFact   : ImprisonmentTermImposed n p c
  withinCeil : n ≤ ceiling1582


structure Penalty1585 (n : Years) (p : Person) (c : ComplaintText) : Prop where
  conduct    : ForeignShoreSlaveConduct p c
  termFact   : ImprisonmentTermImposed n p c
  withinCeil : n ≤ ceiling1585


structure Penalty1586 (n : Years) (p : Person) (c : ComplaintText) : Prop where
  conduct    : VoluntarilyServedOnSlaveVessel p c
  termFact   : ImprisonmentTermImposed n p c
  withinCeil : n ≤ ceiling1586


structure Penalty1587 (n : Years) (p : Person) (c : ComplaintText) : Prop where
  conduct    : PossessedSlaveAboardVessel p c
  termFact   : ImprisonmentTermImposed n p c
  withinCeil : n ≤ ceiling1587


structure Penalty1588 (n : Years) (p : Person) (c : ComplaintText) : Prop where
  conduct    : ReceivedOrCarriedPersonAsSlave p c
  termFact   : ImprisonmentTermImposed n p c
  withinCeil : n ≤ ceiling1588





structure DocumentOffense1592 (p : Person) (c : ComplaintText) : Prop where
  conduct   : DocumentOffenseInFurtherance p c
  notVictim : ¬ IsTraffickingVictimSafeHarbor p c



structure EnforcementObstruction1592 (p : Person) (c : ComplaintText) : Prop where
  obstructed : ObstructedEnforcement p c






inductive Ch77PenaltyEstablished (p : Person) (c : ComplaintText) : Prop
  | s1582 {n : Years} (h : Penalty1582 n p c)
  | s1585 {n : Years} (h : Penalty1585 n p c)
  | s1586 {n : Years} (h : Penalty1586 n p c)
  | s1587 {n : Years} (h : Penalty1587 n p c)
  | s1588 {n : Years} (h : Penalty1588 n p c)

end Proving.USC.T18.Ch77Tail.Procedure
