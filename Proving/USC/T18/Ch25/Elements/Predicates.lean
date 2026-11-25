









import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch25.Elements.Types

namespace Proving.USC.T18.Ch25.Elements

open Proving.USC.Common





axiom IsObligationOrSecurityOfUS (i : Instrument) (c : ComplaintText) : Prop




axiom IsCounterfeited (i : Instrument) (c : ComplaintText) : Prop





axiom ActsWithIntentToDefraud (p : Person) (c : ComplaintText) : Prop



axiom IntentPassedAsGenuine (p : Person) (c : ComplaintText) : Prop



axiom FalselyMakes (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Forges (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Counterfeits (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Alters (p : Person) (i : Instrument) (c : ComplaintText) : Prop



axiom PassesCounterfeit (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom AttemptsToPass (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom BringsIntoUS (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom KeepsInPossession (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Conceals (p : Person) (i : Instrument) (c : ComplaintText) : Prop



axiom Buys (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Sells (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Exchanges (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Transfers (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Receives (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Delivers (p : Person) (i : Instrument) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch25.Elements
