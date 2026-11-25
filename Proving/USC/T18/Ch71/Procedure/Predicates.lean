
















import Proving.USC.T18.Ch71.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch71.Procedure

open Proving.USC.Common






axiom MatterDeposited (p : Person) (c : ComplaintText) : Prop






axiom NonmailableDeterminationMade (c : ComplaintText) : Prop





axiom WithdrawnFromMails (c : ComplaintText) : Prop






axiom OffenseCommitted (p : Person) (c : ComplaintText) : Prop






axiom ObsceneLanguageUttered (p : Person) (c : ComplaintText) : Prop







axiom PriorSuchOffenseOccurred (p : Person) (c : ComplaintText) : Prop





axiom PriorOffenseDay (c : ComplaintText) : Nat





axiom CurrentOffenseDay (c : ComplaintText) : Nat






axiom NumCopiesTransported (c : ComplaintText) : Nat





axiom PresumptionRebutted (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch71.Procedure
