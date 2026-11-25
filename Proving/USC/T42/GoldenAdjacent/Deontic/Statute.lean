










import Proving.USC.T42.GoldenAdjacent.Deontic.Predicates

namespace Proving.USC.T42.GoldenAdjacent.Deontic

open Proving.USC.Common





structure Prohibition1982 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsCitizenWithPropertyRight p c
  condition : DenialOnRacialBasis p c





def Prohibition1982Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1982 p c ∧ PropertyRightDenied p c






structure Permission1988b (ct : Court) (p : Person) (c : ComplaintText) : Prop where
  enforcesListed   : ActionEnforcesListedProvision c
  prevailing       : IsPrevailingParty p c
  exceptionCleared : JudicialOfficerExceptionClears p c





def Permission1988bExercised (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Permission1988b ct p c ∧ FeeAllowed ct p c

end Proving.USC.T42.GoldenAdjacent.Deontic
