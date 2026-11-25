







import Proving.USC.Common.Types
import Proving.USC.T18.Ch25.Elements.Types
import Proving.USC.T18.Ch25.Elements.Predicates

namespace Proving.USC.T18.Ch25.Elements

open Proving.USC.Common



inductive MakesCounterfeit471 (p : Person) (i : Instrument) (c : ComplaintText) : Prop where
  | falselyMakes (h : FalselyMakes p i c)
  | forges       (h : Forges p i c)
  | counterfeits (h : Counterfeits p i c)
  | alters       (h : Alters p i c)



inductive Utters472 (p : Person) (i : Instrument) (c : ComplaintText) : Prop where
  | passes    (h : PassesCounterfeit p i c)
  | attempts  (h : AttemptsToPass p i c)
  | brings    (h : BringsIntoUS p i c)
  | keeps     (h : KeepsInPossession p i c)
  | conceals  (h : Conceals p i c)


inductive DealsIn473 (p : Person) (i : Instrument) (c : ComplaintText) : Prop where
  | buys      (h : Buys p i c)
  | sells     (h : Sells p i c)
  | exchanges (h : Exchanges p i c)
  | transfers (h : Transfers p i c)
  | receives  (h : Receives p i c)
  | delivers  (h : Delivers p i c)



structure Section0471 (p : Person) (i : Instrument) (c : ComplaintText) : Prop where
  intent : ActsWithIntentToDefraud p c
  object : IsObligationOrSecurityOfUS i c
  act    : MakesCounterfeit471 p i c



structure Section0472 (p : Person) (i : Instrument) (c : ComplaintText) : Prop where
  intent      : ActsWithIntentToDefraud p c
  object      : IsObligationOrSecurityOfUS i c
  counterfeit : IsCounterfeited i c
  act         : Utters472 p i c



structure Section0473 (p : Person) (i : Instrument) (c : ComplaintText) : Prop where
  object      : IsObligationOrSecurityOfUS i c
  counterfeit : IsCounterfeited i c
  act         : DealsIn473 p i c
  intent      : IntentPassedAsGenuine p c



inductive ValidCounterfeitingCharge (p : Person) (i : Instrument) (c : ComplaintText) : Prop where
  | viaMaking   (h : Section0471 p i c)
  | viaUttering (h : Section0472 p i c)
  | viaDealing  (h : Section0473 p i c)

end Proving.USC.T18.Ch25.Elements
