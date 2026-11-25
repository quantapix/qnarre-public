import Proving.USC.T18.Enf.Elements.Predicates






namespace Proving.USC.T18.Enf.Elements

open Proving.USC.Common






structure Section1964c (p : Person) (c : ComplaintText) : Prop where
  violation     : ViolationOfSection1962 p c
  plaintiff     : IsCivilRicoPlaintiff p c
  injury        : InjuredInBusinessOrProperty p c
  byReasonOf    : ProximateCause p c
  notSecBarred  : SecuritiesFraudBar p c
  timely        : WithinLimitations p c




structure Section1964a (p : Person) (r : Remedy) (c : ComplaintText) : Prop where
  violation : ViolationOfSection1962 p c
  relief    : AppropriateEquitableRelief r c



structure Section1963 (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  conviction : ConvictedOfSection1962 p c
  property   : PropertySubjectToForfeiture prop p c





structure Section1963Claimant (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  bfp : BonaFidePurchaserForValue prop p c



structure ValidCivilRicoComplaint (p : Person) (c : ComplaintText) : Prop where
  claim : Section1964c p c
  venue : ProperVenue p c



inductive ValidEnforcementTheory (p : Person) (c : ComplaintText) : Prop where
  | privateDamages : ValidCivilRicoComplaint p c → ValidEnforcementTheory p c
  | equitable      : ∀ r, Section1964a p r c → ValidEnforcementTheory p c
  | forfeiture     : ∀ prop, Section1963 p prop c → ValidEnforcementTheory p c

end Proving.USC.T18.Enf.Elements
