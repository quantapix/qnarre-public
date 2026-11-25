







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch13.Reslice.Scienter.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reslice.Scienter

open Proving.USC.Common








axiom MentalStateProven (p : Person) (rung : MentalState) (c : ComplaintText) : Prop







axiom ActedBecauseOf (p : Person) (o : IntentObject) (c : ComplaintText) : Prop






axiom ActedInOrderToIntimidateFrom (p : Person) (o : IntentObject) (c : ComplaintText) : Prop





axiom IntendedResult (p : Person) (o : IntentObject) (c : ComplaintText) : Prop





axiom MotivatedByProtectedCharacteristic
    (p : Person) (cls : ProtectedClass) (c : ComplaintText) : Prop









axiom CertifyingOfficialJudgment (official : Person) (c : ComplaintText) : Prop







def RequiredMentalState245b : MentalState := .Specific



def RequiredMentalState245b1 : MentalState := .Specific



def RequiredMentalState245b2 : MentalState := .Specific






def RequiredMentalState245b3 : MentalState := .StrictLiability




def RequiredMentalState245b4 : MentalState := .Specific



def RequiredMentalState245b5 : MentalState := .Specific





def RequiredMentalState245bAggravated : MentalState := .StrictLiability



def RequiredMentalState247a1 : MentalState := .Specific



def RequiredMentalState247a2 : MentalState := .Specific




def RequiredMentalState247b : MentalState := .StrictLiability




def RequiredMentalState247c : MentalState := .Specific




def RequiredMentalState247d : MentalState := .StrictLiability




def RequiredMentalState248a1 : MentalState := .Specific




def RequiredMentalState248a2 : MentalState := .Specific





def RequiredMentalState248a3 : MentalState := .Specific




def RequiredMentalState248b : MentalState := .StrictLiability





def RequiredMentalState248c2 : MentalState := .Negligence



def RequiredMentalState248c3 : MentalState := .Negligence

end Proving.USC.T18.Ch13.Reslice.Scienter
