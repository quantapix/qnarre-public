












import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch42.Scienter.Types
import Proving.USC.T18.Ch42.Scienter.Predicates

namespace Proving.USC.T18.Ch42.Scienter

open Proving.USC.Common



structure Scienter892 where
  addressee : Addressee
  required  : MentalState



structure Scienter893 where
  addressee     : Addressee
  requiredAdv   : MentalState
  requiredBelief : MentalState



structure Scienter894 where
  addressee : Addressee
  required  : MentalState


def scienter892 : Scienter892 := ⟨.Creditor, RequiredMentalState892⟩

def scienter893 : Scienter893 := ⟨.Financier, RequiredMentalState893Advance, RequiredMentalState893Belief⟩

def scienter894 : Scienter894 := ⟨.Collector, RequiredMentalState894⟩


def Scienter892Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState892 ∧ MentalStateProven p rung c


def Scienter893Advance (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState893Advance ∧ MentalStateProven p rung c


def Scienter893Belief (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState893Belief ∧ MentalStateProven p rung c



def Scienter893Culpable (p : Person) (c : ComplaintText) : Prop :=
  Scienter893Advance p c ∧ Scienter893Belief p c


def Scienter894Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState894 ∧ MentalStateProven p rung c

end Proving.USC.T18.Ch42.Scienter
