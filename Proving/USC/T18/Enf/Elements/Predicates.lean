import Proving.USC.T18.Enf.Elements.Types
import Proving.USC.Common.Predicates







namespace Proving.USC.T18.Enf.Elements

open Proving.USC.Common








axiom ViolationOfSection1962 (p : Person) (c : ComplaintText) : Prop





axiom IsCivilRicoPlaintiff (p : Person) (c : ComplaintText) : Prop





axiom InjuredInBusinessOrProperty (p : Person) (c : ComplaintText) : Prop







axiom SecuritiesFraudBar (p : Person) (c : ComplaintText) : Prop








axiom AppropriateEquitableRelief (r : Remedy) (c : ComplaintText) : Prop






axiom ConvictedOfSection1962 (p : Person) (c : ComplaintText) : Prop






axiom PropertySubjectToForfeiture (prop : Property) (p : Person) (c : ComplaintText) : Prop







axiom BonaFidePurchaserForValue (prop : Property) (p : Person) (c : ComplaintText) : Prop






axiom ProperVenue (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Enf.Elements
