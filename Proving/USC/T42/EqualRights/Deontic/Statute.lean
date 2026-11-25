











import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Deontic.Types
import Proving.USC.T42.EqualRights.Deontic.Predicates

namespace Proving.USC.T42.EqualRights.Deontic

open Proving.USC.Common




structure Prohibition1981 (p : Person) (c : ComplaintText) : Prop where
  addressee : Section1981AddresseeBound p c
  condition : Section1981RaceBaselineDenial p c



def Prohibition1981Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1981 p c ∧ Section1981ImpairedContractRight p c





structure Prohibition1982 (p : Person) (c : ComplaintText) : Prop where
  addressee : Section1982AddresseeBound p c
  condition : Section1982CitizenRaceBaselineDenial p c



def Prohibition1982Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1982 p c ∧ Section1982ImpairedPropertyRight p c





structure Permission1981a (p : Person) (c : ComplaintText) : Prop where
  addressee : Section1981aComplainingParty p c
  condition : Section1981aIntentionalDiscrimination p c





def Permission1981aAvailable (p : Person) (c : ComplaintText) : Prop :=
  Permission1981a p c ∧ ¬ Section1981aGoodFaithAccommodationBar p c




def PunitivePermission1981aAvailable (p : Person) (c : ComplaintText) : Prop :=
  Permission1981aAvailable p c ∧ Section1981aMaliceOrRecklessIndifference p c

end Proving.USC.T42.EqualRights.Deontic
