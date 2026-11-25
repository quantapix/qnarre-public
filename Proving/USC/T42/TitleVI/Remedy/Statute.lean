








import Proving.USC.Common.Types
import Proving.USC.T42.TitleVI.Remedy.Types
import Proving.USC.T42.TitleVI.Remedy.Predicates

namespace Proving.USC.T42.TitleVI.Remedy

open Proving.USC.Common




structure Standing2000d (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  privateRight    : HasPrivateRightOfAction p c
  intentional     : IsIntentionalDiscriminationTheory p c
  injury          : InjuryCognizable p c
  causation       : CausedByViolation p c
  fundingRecipient : IsFederalFundingRecipient e c




structure Standing2000d7State (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  baseStanding   : Standing2000d p e c
  immunityWaived : StateImmunityAbrogated p c




structure AgencyEnforcement2000d1 (e : Entity) (c : ComplaintText) : Prop where
  fundingRecipient : IsFederalFundingRecipient e c
  compliancePredicate : AgencyCompliancePredicateMet e c



inductive TitleVIRemedyAvenue (p : Person) (e : Entity) (c : ComplaintText) : Prop

  | privateSuit (h : Standing2000d p e c)

  | stateSuit (h : Standing2000d7State p e c)

  | agency (h : AgencyEnforcement2000d1 e c)




def s2000dEnforcer : Enforcer := .privateRight

def s2000d1Enforcer : Enforcer := .agencyOnly

def s2000d7Enforcer : Enforcer := .privateRight



def s2000dRelief : List Relief :=
  [.compensatoryDamages, .injunction, .declaratory, .attorneysFees]

def s2000d1Relief : List Relief := [.fundTermination]


def s2000d7Relief : List Relief :=
  [.compensatoryDamages, .injunction, .declaratory, .attorneysFees]

end Proving.USC.T42.TitleVI.Remedy
