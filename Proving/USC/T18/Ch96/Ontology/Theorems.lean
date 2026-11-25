import Proving.USC.T18.Ch96.Ontology.Statute

set_option autoImplicit false









namespace Proving.USC.T18.Ch96.Ontology


theorem personMembership_intro {p : Person} {c : ComplaintText}
    (hq : IsPerson p c) (hp : CanHoldPropertyInterest p c) : PersonMembership p c :=
  ⟨hq, hp⟩


theorem enterpriseMembership_intro_legalEntity {e : Enterprise} {c : ComplaintText}
    (h : IsLegalEntity e c) : EnterpriseMembership e c :=
  .legalEntity h


theorem enterpriseMembership_intro_associatedInFact {e : Enterprise} {c : ComplaintText}
    (h : IsAssociatedInFactGroup e c) : EnterpriseMembership e c :=
  .associatedInFact h


theorem racketeeringActivityCase_intro_statePredicate {a : RacketeeringActivity}
    {c : ComplaintText} (h : IsStatePredicateOffense a c) : RacketeeringActivityCase a c :=
  .statePredicate h


theorem racketeeringActivityCase_intro_title18Predicate {a : RacketeeringActivity}
    {c : ComplaintText} (h : IsTitle18PredicateOffense a c) : RacketeeringActivityCase a c :=
  .title18Predicate h



theorem patternMembership_intro {pat : Pattern} {c : ComplaintText}
    (h2 : 2 ≤ racketeeringActCount pat c) (he : OneActAfterEffectiveDate pat c)
    (ht : priorToLastActSpanYears pat c ≤ 10) : PatternMembership pat c :=
  ⟨h2, he, ht⟩


theorem unlawfulDebtMembership_intro {d : UnlawfulDebt} {c : ComplaintText}
    (ha : DebtFromUnlawfulGamblingOrUsury d c) (hb : DebtInGamblingOrUsuriousLendingBusiness d c)
    (hr : 2 * enforceableRateBps d c ≤ debtRateBps d c) : UnlawfulDebtMembership d c :=
  ⟨ha, hb, hr⟩


theorem forfeitablePropertyCase_intro_real {prop : ForfeitableProperty} {c : ComplaintText}
    (h : IsRealProperty prop c) : ForfeitablePropertyCase prop c :=
  .real h


theorem forfeitablePropertyCase_intro_personal {prop : ForfeitableProperty} {c : ComplaintText}
    (h : IsPersonalProperty prop c) : ForfeitablePropertyCase prop c :=
  .personal h

end Proving.USC.T18.Ch96.Ontology
