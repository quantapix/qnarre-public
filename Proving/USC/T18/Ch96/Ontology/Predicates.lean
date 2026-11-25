import Proving.USC.T18.Ch96.Ontology.Types

set_option autoImplicit false












namespace Proving.USC.T18.Ch96.Ontology




axiom IsRacketeeringActivity (a : RacketeeringActivity) (c : ComplaintText) : Prop

axiom IsState (s : State) (c : ComplaintText) : Prop

axiom IsPerson (p : Person) (c : ComplaintText) : Prop

axiom IsEnterprise (e : Enterprise) (c : ComplaintText) : Prop

axiom IsPatternOfRacketeering (pat : Pattern) (c : ComplaintText) : Prop

axiom IsUnlawfulDebt (d : UnlawfulDebt) (c : ComplaintText) : Prop

axiom IsRacketeeringInvestigator (i : RacketeeringInvestigator) (c : ComplaintText) : Prop

axiom IsRacketeeringInvestigation (inv : RacketeeringInvestigation) (c : ComplaintText) : Prop

axiom IsDocumentaryMaterial (m : DocumentaryMaterial) (c : ComplaintText) : Prop

axiom IsAttorneyGeneral (ag : AttorneyGeneral) (c : ComplaintText) : Prop





axiom IsStatePredicateOffense (a : RacketeeringActivity) (c : ComplaintText) : Prop


axiom IsTitle18PredicateOffense (a : RacketeeringActivity) (c : ComplaintText) : Prop


axiom IsLaborPaymentOffense (a : RacketeeringActivity) (c : ComplaintText) : Prop


axiom IsBankruptcySecuritiesOrDrugOffense (a : RacketeeringActivity) (c : ComplaintText) : Prop


axiom IsCurrencyReportingOffense (a : RacketeeringActivity) (c : ComplaintText) : Prop


axiom IsImmigrationForFinancialGainOffense (a : RacketeeringActivity) (c : ComplaintText) : Prop


axiom IsListedTerrorismOffense (a : RacketeeringActivity) (c : ComplaintText) : Prop





axiom CanHoldPropertyInterest (p : Person) (c : ComplaintText) : Prop





axiom IsLegalEntity (e : Enterprise) (c : ComplaintText) : Prop


axiom IsAssociatedInFactGroup (e : Enterprise) (c : ComplaintText) : Prop





opaque racketeeringActCount (pat : Pattern) (c : ComplaintText) : Nat


axiom OneActAfterEffectiveDate (pat : Pattern) (c : ComplaintText) : Prop



opaque priorToLastActSpanYears (pat : Pattern) (c : ComplaintText) : Nat





axiom DebtFromUnlawfulGamblingOrUsury (d : UnlawfulDebt) (c : ComplaintText) : Prop


axiom DebtInGamblingOrUsuriousLendingBusiness (d : UnlawfulDebt) (c : ComplaintText) : Prop


opaque debtRateBps (d : UnlawfulDebt) (c : ComplaintText) : Nat


opaque enforceableRateBps (d : UnlawfulDebt) (c : ComplaintText) : Nat





axiom IsForfeitableProperty (prop : ForfeitableProperty) (c : ComplaintText) : Prop


axiom IsRealProperty (prop : ForfeitableProperty) (c : ComplaintText) : Prop

axiom IsPersonalProperty (prop : ForfeitableProperty) (c : ComplaintText) : Prop





axiom IsRacketeerDocumentCustodian (x : RacketeerDocumentCustodian) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch96.Ontology
