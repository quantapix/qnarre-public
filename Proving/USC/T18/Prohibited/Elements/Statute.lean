
















import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.Common.Tactic
import Proving.USC.T18.Prohibited.Elements.Types
import Proving.USC.T18.Prohibited.Elements.Predicates

namespace Proving.USC.T18.Prohibited.Elements

open Proving.USC.Common





structure AssociationInFact (e : Entity) (c : ComplaintText) : Prop where
  purpose       : HasSharedPurpose e c
  relationships : HasOngoingRelationships e c
  longevity     : HasLongevity e c
  distinct      : DistinctFromPattern e c



inductive Enterprise1961_4 (e : Entity) (c : ComplaintText) : Prop where
  | juridical (h : IsJuridicalPerson e c)
  | natural   (h : IsNaturalPerson e c)
  | aif       (h : AssociationInFact e c)


abbrev IsEnterprise (e : Entity) (c : ComplaintText) : Prop := Enterprise1961_4 e c

@[grind →] theorem aif_intro {e c}
    (h1 : HasSharedPurpose e c) (h2 : HasOngoingRelationships e c)
    (h3 : HasLongevity e c) (h4 : DistinctFromPattern e c) :
    AssociationInFact e c := ⟨h1, h2, h3, h4⟩
@[grind →] theorem enterprise_of_juridical {e c} (h : IsJuridicalPerson e c) :
    Enterprise1961_4 e c := .juridical h
@[grind →] theorem enterprise_of_natural {e c} (h : IsNaturalPerson e c) :
    Enterprise1961_4 e c := .natural h
@[grind →] theorem enterprise_of_aif {e c} (h : AssociationInFact e c) :
    Enterprise1961_4 e c := .aif h

example {e c} (h1 : HasSharedPurpose e c) (h2 : HasOngoingRelationships e c)
    (h3 : HasLongevity e c) (h4 : DistinctFromPattern e c) : IsEnterprise e c := by
  prove_element








abbrev AtLeastTwoActs (c : ComplaintText) : Prop := 2 ≤ PredicateActCount c


structure PatternComposite (acts : List Act) (c : ComplaintText) : Prop where
  count      : AtLeastTwoActs c
  related    : ActsAreRelated acts c
  continuity : ActsShowContinuity acts c


abbrev PatternOfRacketeering (acts : List Act) (c : ComplaintText) : Prop :=
  PatternComposite acts c

@[grind →] theorem pattern_intro {acts c}
    (h1 : AtLeastTwoActs c) (h2 : ActsAreRelated acts c)
    (h3 : ActsShowContinuity acts c) : PatternComposite acts c := ⟨h1, h2, h3⟩

example {acts c} (h1 : AtLeastTwoActs c) (h2 : ActsAreRelated acts c)
    (h3 : ActsShowContinuity acts c) : PatternOfRacketeering acts c := by
  prove_element



structure Section1962a (p : Person) (i : Income) (e : Entity) (acts : List Act)
    (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent p c
  incomeFromPattern  : IncomeDerivedFromPattern p i c
  pattern            : PatternOfRacketeering acts c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  invested           : InvestedIncomeInEnterprise p i e c
  notSafeHarbor      : ¬ PassiveSecuritiesSafeHarbor p e c



structure Section1962b (p : Person) (x : Interest) (e : Entity) (acts : List Act)
    (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent p c
  pattern            : PatternOfRacketeering acts c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  acquired           : AcquiredOrMaintainedInterest p x e c
  throughPattern     : ThroughPatternNexus p e c



structure Section1962c (p : Person) (e : Entity) (acts : List Act)
    (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent p c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  associated         : EmployedOrAssociated p e c
  conducts           : ConductsOrParticipates p e c
  pattern            : PatternOfRacketeering acts c
  throughPattern     : ThroughPatternNexus p e c



structure Section1962d (p : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  culpable   : CulpablePersonCapableOfIntent p c
  agreement  : AgreementAmongTwoOrMore ag c
  agreedToSubstantive : AgreedToSubstantiveOffense p c



inductive ViolationOfSection1962
    (p : Person) (i : Income) (x : Interest) (e : Entity) (acts : List Act)
    (ag : Agreement) (c : ComplaintText) : Prop where
  | investA   (h : Section1962a p i e acts c)
  | acquireB  (h : Section1962b p x e acts c)
  | conductC  (h : Section1962c p e acts c)
  | conspireD (h : Section1962d p ag c)

end Proving.USC.T18.Prohibited.Elements
