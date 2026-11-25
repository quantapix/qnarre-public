













import Proving.USC.T18.RacketeeringActs.Deontic.Predicates
import Proving.USC.Common.Tactic

namespace Proving.USC.T18.RacketeeringActs.Deontic

open Proving.USC.Common









inductive HobbsMeansSatisfied (p : Person) (c : ComplaintText) : Prop
  | robbery   : ByRobbery p c   → HobbsMeansSatisfied p c
  | extortion : ByExtortion p c → HobbsMeansSatisfied p c

attribute [grind →] HobbsMeansSatisfied.robbery HobbsMeansSatisfied.extortion



structure HobbsActDone (p : Person) (c : ComplaintText) : Prop where
  affectedCommerce : ObstructedOrAffectedCommerce p c
  means            : HobbsMeansSatisfied p c

attribute [grind →] HobbsActDone.mk









inductive LaunderingPurposeSatisfied (p : Person) (t : Transaction) (c : ComplaintText) : Prop
  | promote      : IntentToPromoteSUA p t c       → LaunderingPurposeSatisfied p t c
  | conceal      : DesignedToConceal p t c        → LaunderingPurposeSatisfied p t c
  | avoidReport  : DesignedToAvoidReporting p t c → LaunderingPurposeSatisfied p t c

attribute [grind →] LaunderingPurposeSatisfied.promote
  LaunderingPurposeSatisfied.conceal LaunderingPurposeSatisfied.avoidReport




structure LaunderingActDone (p : Person) (t : Transaction) (c : ComplaintText) : Prop where
  transaction : ConductedFinancialTransaction p t c
  knew        : KnewProceedsUnlawful p t c
  involvedSUA : InvolvedSpecifiedUnlawfulActivity t c
  purpose     : LaunderingPurposeSatisfied p t c

attribute [grind →] LaunderingActDone.mk

end Proving.USC.T18.RacketeeringActs.Deontic
