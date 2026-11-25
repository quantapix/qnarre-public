














import Proving.USC.T08.Inadmissibility.Deontic.Predicates

namespace Proving.USC.T08.Inadmissibility.Deontic

open Proving.USC.Common




structure Prohibition1324a_a1A (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsEmployer p c
  condition : KnewAlienUnauthorized p c




def Prohibition1324a_a1A_Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1324a_a1A p c ∧ HiredOrReferredAlien p c ∧ ¬ GoodFaithVerificationDefense p c




structure Prohibition1324a_a2 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsEmployer p c
  condition : KnewAlienUnauthorized p c

def Prohibition1324a_a2_Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1324a_a2 p c ∧ ContinuedToEmployAlien p c




structure Prohibition1324a_g1 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsEmployer p c

def Prohibition1324a_g1_Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1324a_g1 p c ∧ RequiredEmployeeIndemnityBond p c




structure Obligation1324a_b (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsEmployer p c
  condition : HiringForUSEmployment p c



def Obligation1324a_b_Breached (p : Person) (c : ComplaintText) : Prop :=
  Obligation1324a_b p c ∧ ¬ CompletedEmploymentVerification p c




structure Prohibition1182_a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAdmittingAuthority p c
  condition : AlienIsInadmissible p c

def Prohibition1182_a_Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1182_a p c ∧ IssuedVisaOrAdmitted p c

end Proving.USC.T08.Inadmissibility.Deontic
