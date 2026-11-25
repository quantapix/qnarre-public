









import Proving.USC.T05.Remedy.Types
import Proving.USC.T05.Remedy.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T05.Remedy

open Proving.USC.Common




structure StandingApa (p : Person) (c : ComplaintText) : Prop where
  privateRight : HasPrivateRightOfAction p c
  injury       : InjuryCognizable p c
  causation    : CausedByViolation p c
  redressable  : ReliefRedressable p c



structure InterimRelief705 (p : Person) (c : ComplaintText) : Prop where
  standing    : StandingApa p c
  irreparable : IrreparableInjuryPendingReview p c
  available   : DispositionAvailable .stayEffectiveDate p c




structure CompelRelief706_1 (p : Person) (c : ComplaintText) : Prop where
  standing  : StandingApa p c
  withheld  : AgencyActionUnlawfullyWithheld p c
  available : DispositionAvailable .compelAgencyAction p c





structure SetAsideRelief706_2 (g : SetAsideGround) (p : Person) (c : ComplaintText) : Prop where
  standing    : StandingApa p c
  ground      : AgencyActionSetAsideGround g p c
  prejudicial : PrejudicialError p c
  available   : DispositionAvailable .setAside p c



inductive ApaReliefAvailable (p : Person) (c : ComplaintText) : Prop
  | interim   (h : InterimRelief705 p c)        : ApaReliefAvailable p c
  | compel    (h : CompelRelief706_1 p c)        : ApaReliefAvailable p c
  | setAside  {g} (h : SetAsideRelief706_2 g p c) : ApaReliefAvailable p c



def apaEnforcer : Enforcer := .privateReview


def s705Relief : List Disposition := [.stayEffectiveDate, .preserveStatusQuo]


def s706_1Relief : List Disposition := [.compelAgencyAction]


def s706_2Relief : List Disposition := [.holdUnlawful, .setAside, .remand]

end Proving.USC.T05.Remedy
