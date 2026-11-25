





















import Proving.USC.Common.Types
import Proving.USC.T18.Ch13.Scienter.Types
import Proving.USC.T18.Ch13.Scienter.Predicates

namespace Proving.USC.T18.Ch13.Scienter

open Proving.USC.Common (Person ComplaintText)




def RequiredMentalState241 : MentalState := .Specific
def Scienter241 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState241 ∧ MentalStateProven p rung c



def RequiredMentalState242 : MentalState := .Specific
def Scienter242 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState242 ∧ MentalStateProven p rung c





def RequiredMentalState243 : Option MentalState := none
def Scienter243 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, MentalStateProven p rung c




def RequiredMentalState244 : Option MentalState := none
def Scienter244 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, MentalStateProven p rung c




def RequiredMentalState245 : MentalState := .Specific
def Scienter245 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState245 ∧ MentalStateProven p rung c





def RequiredMentalState246 : Option MentalState := none
def Scienter246 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, MentalStateProven p rung c



def RequiredMentalState247 : MentalState := .Specific
def Scienter247 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState247 ∧ MentalStateProven p rung c





def RequiredMentalState248 : MentalState := .Specific
def Scienter248 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState248 ∧ MentalStateProven p rung c




def RequiredMentalState249 : MentalState := .Specific
def Scienter249 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState249 ∧ MentalStateProven p rung c





def RequiredMentalState250 : Option MentalState := none
def Scienter250 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, MentalStateProven p rung c

end Proving.USC.T18.Ch13.Scienter
