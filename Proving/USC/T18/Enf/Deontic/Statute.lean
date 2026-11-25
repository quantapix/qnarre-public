









import Proving.USC.T18.Enf.Deontic.Predicates

namespace Proving.USC.T18.Enf.Deontic

open Proving.USC.Common





structure Obligation1963a (p : Person) (pr : Property) (c : ComplaintText) : Prop where
  addressee : ViolatedSection1962 p c
  condition : PropertyForfeitable pr c



def Obligation1963aBreached (p : Person) (pr : Property) (c : ComplaintText) : Prop :=
  Obligation1963a p pr c ∧ ForfeitureNotTendered p pr c





structure Prohibition1963i (p : Person) (pr : Property) (c : ComplaintText) : Prop where
  addressee : InterestClaimant p pr c




def Prohibition1963iViolated (p : Person) (pr : Property) (c : ComplaintText) : Prop :=
  Prohibition1963i p pr c ∧ IntervenedOutsideAncillary p pr c






def RemedialPower1964Invoked (c : ComplaintText) : Prop :=
  RemedialPowerInvoked c





structure Permission1964c (p : Person) (c : ComplaintText) : Prop where
  injury    : InjuredByViolation p c
  notBarred : SecuritiesFraudBarInapplicable p c



def Permission1964cAvailable (p : Person) (c : ComplaintText) : Prop :=
  Permission1964c p c





def Permission1965aAvailable (p : Person) (c : ComplaintText) : Prop :=
  VenueProper p c

end Proving.USC.T18.Enf.Deontic
