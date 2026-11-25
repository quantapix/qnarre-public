








import Proving.USC.T22.Deontic.Sub.Predicates

namespace Proving.USC.T22.Deontic.Sub
open Proving.USC.Common





structure Obligation7103a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsPresident p c
  condition : ChapterInEffect c



def Obligation7103aBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation7103a p c ∧ ¬ EstablishedTaskForce p c





structure Obligation7103d (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsTaskForce p c
  condition : ChapterInEffect c



def Obligation7103dBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation7103d p c ∧ ¬ CarriedOutTaskForceActivities p c





structure Obligation7103d7 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral p c
  condition : ChapterInEffect c



def Obligation7103d7Breached (p : Person) (c : ComplaintText) : Prop :=
  Obligation7103d7 p c ∧ ¬ SubmittedAnnualReport p c





structure Obligation7103g5 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsPresident p c
  condition : ChapterInEffect c



def Obligation7103g5Breached (p : Person) (c : ComplaintText) : Prop :=
  Obligation7103g5 p c ∧ ¬ PromulgatedImplementingRegulations p c





structure Obligation7106a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsForeignGovernment p c
  condition : IsCountryOfTraffickingConcern p c




def MinimumStandardsMet (p : Person) (c : ComplaintText) : Prop :=
  ProhibitsAndPunishesTrafficking p c
    ∧ PrescribesCommensuratePunishment p c
    ∧ MakesSeriousAndSustainedEfforts p c



def Obligation7106aBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation7106a p c ∧ ¬ MinimumStandardsMet p c

end Proving.USC.T22.Deontic.Sub
