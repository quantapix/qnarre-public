import Proving.USC.T18.Ch96.Ontology.Predicates

set_option autoImplicit false











namespace Proving.USC.T18.Ch96.Ontology



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String




def edge_racketeeringActivity_dependsOn_state : DefEdge :=
  { defined := "racketeering activity", dependsOn := "State",
    citeDefine := "18 USC § 1961(1)" }

def edge_pattern_dependsOn_activity : DefEdge :=
  { defined := "pattern of racketeering activity", dependsOn := "racketeering activity",
    citeDefine := "18 USC § 1961(5)" }

def edge_unlawfulDebt_dependsOn_state : DefEdge :=
  { defined := "unlawful debt", dependsOn := "State", citeDefine := "18 USC § 1961(6)" }

def edge_investigator_dependsOn_attorneyGeneral : DefEdge :=
  { defined := "racketeering investigator", dependsOn := "Attorney General",
    citeDefine := "18 USC § 1961(7)" }

def edge_investigation_dependsOn_investigator : DefEdge :=
  { defined := "racketeering investigation", dependsOn := "racketeering investigator",
    citeDefine := "18 USC § 1961(8)" }

def edge_investigation_dependsOn_person : DefEdge :=
  { defined := "racketeering investigation", dependsOn := "person",
    citeDefine := "18 USC § 1961(8)" }

def edge_custodian_dependsOn_investigator : DefEdge :=
  { defined := "racketeer document custodian", dependsOn := "racketeering investigator",
    citeDefine := "18 USC § 1968(f)(1)" }


def definitionalDAG : List DefEdge :=
  [edge_racketeeringActivity_dependsOn_state,
   edge_pattern_dependsOn_activity,
   edge_unlawfulDebt_dependsOn_state,
   edge_investigator_dependsOn_attorneyGeneral,
   edge_investigation_dependsOn_investigator,
   edge_investigation_dependsOn_person,
   edge_custodian_dependsOn_investigator]





structure PersonMembership (p : Person) (c : ComplaintText) : Prop where
  qualifies       : IsPerson p c
  canHoldProperty : CanHoldPropertyInterest p c



inductive EnterpriseMembership (e : Enterprise) (c : ComplaintText) : Prop where
  | legalEntity      : IsLegalEntity e c → EnterpriseMembership e c
  | associatedInFact : IsAssociatedInFactGroup e c → EnterpriseMembership e c


inductive RacketeeringActivityCase (a : RacketeeringActivity) (c : ComplaintText) : Prop where
  | statePredicate     : IsStatePredicateOffense a c → RacketeeringActivityCase a c
  | title18Predicate   : IsTitle18PredicateOffense a c → RacketeeringActivityCase a c
  | laborPayment       : IsLaborPaymentOffense a c → RacketeeringActivityCase a c
  | bankruptcySecDrug  : IsBankruptcySecuritiesOrDrugOffense a c → RacketeeringActivityCase a c
  | currencyReporting  : IsCurrencyReportingOffense a c → RacketeeringActivityCase a c
  | immigrationForGain : IsImmigrationForFinancialGainOffense a c → RacketeeringActivityCase a c
  | listedTerrorism    : IsListedTerrorismOffense a c → RacketeeringActivityCase a c





structure PatternMembership (pat : Pattern) (c : ComplaintText) : Prop where
  atLeastTwoActs    : 2 ≤ racketeeringActCount pat c
  oneAfterEffective : OneActAfterEffectiveDate pat c
  withinTenYears    : priorToLastActSpanYears pat c ≤ 10



structure UnlawfulDebtMembership (d : UnlawfulDebt) (c : ComplaintText) : Prop where
  clauseA        : DebtFromUnlawfulGamblingOrUsury d c
  clauseB        : DebtInGamblingOrUsuriousLendingBusiness d c
  usuriousDouble : 2 * enforceableRateBps d c ≤ debtRateBps d c



inductive ForfeitablePropertyCase (prop : ForfeitableProperty) (c : ComplaintText) : Prop where
  | real     : IsRealProperty prop c → ForfeitablePropertyCase prop c
  | personal : IsPersonalProperty prop c → ForfeitablePropertyCase prop c

end Proving.USC.T18.Ch96.Ontology
