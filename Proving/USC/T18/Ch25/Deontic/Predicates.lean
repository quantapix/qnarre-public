







import Proving.USC.T18.Ch25.Deontic.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch25.Deontic

open Proving.USC.Common




axiom AddresseeIsPerson (p : Person) (c : ComplaintText) : Prop




axiom IntentToDefraud (p : Person) (c : ComplaintText) : Prop





axiom IntentToPassAsGenuine (p : Person) (c : ComplaintText) : Prop





axiom IsCounterfeitObligationOfUS (o : Obligation) (c : ComplaintText) : Prop





axiom ForgesObligation (p : Person) (o : Obligation) (c : ComplaintText) : Prop






axiom UttersCounterfeit (p : Person) (o : Obligation) (c : ComplaintText) : Prop





axiom DealsInCounterfeit (p : Person) (o : Obligation) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch25.Deontic
