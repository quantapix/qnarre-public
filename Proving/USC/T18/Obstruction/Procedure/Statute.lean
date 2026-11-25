









import Proving.USC.T18.Obstruction.Procedure.Types
import Proving.USC.T18.Obstruction.Procedure.Predicates

namespace Proving.USC.T18.Obstruction.Procedure

open Proving.USC.Common (Person ComplaintText)




structure Transition where
  src   : State
  dst   : State
  guard : Prop





def ProperVenue (p : Person) (c : ComplaintText) : Prop :=
  VenueInProceedingAffectedDistrict p c ∨ VenueInConductDistrict p c




def commence (p : Person) (c : ComplaintText) : Transition where
  src   := State.ConductOccurred
  dst   := State.ProsecutionCommenced
  guard := ProsecutionCommenced p c
           ∧ ProceedingIntendedToBeAffected p c
           ∧ FederalJurisdictionReaches p c



def establishVenue (p : Person) (c : ComplaintText) : Transition where
  src   := State.ProsecutionCommenced
  dst   := State.VenueEstablished
  guard := ProperVenue p c



def adjudicate (p : Person) (c : ComplaintText) : Transition where
  src   := State.VenueEstablished
  dst   := State.Adjudicated
  guard := AffirmativeDefenseNotEstablished p c





structure WellFormedProsecution (p : Person) (c : ComplaintText) : Prop where
  conductOccurred : ObstructiveConductOccurred p c
  commenced       : ProsecutionCommenced p c
  proceeding      : ProceedingIntendedToBeAffected p c
  jurisdiction    : FederalJurisdictionReaches p c
  venue           : ProperVenue p c
  defenseFails    : AffirmativeDefenseNotEstablished p c




inductive Reaches (p : Person) (c : ComplaintText) : State → Prop
  | start : Reaches p c State.ConductOccurred
  | commence
      (h : Reaches p c State.ConductOccurred)
      (hC : ProsecutionCommenced p c)
      (hP : ProceedingIntendedToBeAffected p c)
      (hJ : FederalJurisdictionReaches p c) :
      Reaches p c State.ProsecutionCommenced
  | establishVenue
      (h : Reaches p c State.ProsecutionCommenced)
      (hV : ProperVenue p c) :
      Reaches p c State.VenueEstablished
  | adjudicate
      (h : Reaches p c State.VenueEstablished)
      (hD : AffirmativeDefenseNotEstablished p c) :
      Reaches p c State.Adjudicated

end Proving.USC.T18.Obstruction.Procedure
