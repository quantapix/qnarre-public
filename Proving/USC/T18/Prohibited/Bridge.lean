





































import Proving.USC.T18.Prohibited.Elements.Statute
import Proving.USC.T18.Prohibited.Deontic.Statute
import Proving.USC.T18.Prohibited.Ontology.Statute
import Proving.USC.Common.Predicates
import Proving.Rico.Statute

namespace Proving.USC.T18.Prohibited.Bridge
open Proving.USC.Common










axiom corr_a_addressee {p : Person} {i : Elements.Income} {c : ComplaintText} :
    Elements.CulpablePersonCapableOfIntent p c → Elements.IncomeDerivedFromPattern p i c →
    Deontic.AddresseeInClass1962a p c
axiom corr_a_condition {e : Entity} {c : ComplaintText} :
    EngagedInInterstateCommerce e c → Deontic.EnterpriseAffectsCommerce e c
axiom corr_a_act {p : Person} {i : Elements.Income} {e : Entity} {c : ComplaintText} :
    Elements.InvestedIncomeInEnterprise p i e c → Deontic.UsedOrInvestedIncome p e c


theorem s1962a_elements_implies_deontic
    {p : Person} {i : Elements.Income} {e : Entity} {acts : List Elements.Act} {c : ComplaintText}
    (h : Elements.Section1962a p i e acts c) :
    Deontic.ProhibitionViolated1962a p e c :=
  ⟨⟨corr_a_addressee h.culpable h.incomeFromPattern, corr_a_condition h.interstateCommerce⟩,
   corr_a_act h.invested⟩








axiom corr_b_condition {e : Entity} {c : ComplaintText} :
    EngagedInInterstateCommerce e c → Deontic.EnterpriseAffectsCommerce e c
axiom corr_b_act {p : Person} {x : Elements.Interest} {e : Entity} {c : ComplaintText} :
    Elements.AcquiredOrMaintainedInterest p x e c → Deontic.AcquiredOrMaintainedInterest p e c


theorem s1962b_elements_implies_deontic
    {p : Person} {x : Elements.Interest} {e : Entity} {acts : List Elements.Act} {c : ComplaintText}
    (h : Elements.Section1962b p x e acts c) :
    Deontic.ProhibitionViolated1962b p e c :=
  ⟨⟨corr_b_condition h.interstateCommerce⟩, corr_b_act h.acquired⟩








axiom corr_c_addressee {p : Person} {e : Entity} {c : ComplaintText} :
    Elements.EmployedOrAssociated p e c → Deontic.AssociatedWithEnterprise p e c
axiom corr_c_condition {e : Entity} {c : ComplaintText} :
    EngagedInInterstateCommerce e c → Deontic.EnterpriseAffectsCommerce e c
axiom corr_c_act {p : Person} {e : Entity} {c : ComplaintText} :
    Elements.ConductsOrParticipates p e c → Elements.ThroughPatternNexus p e c →
    Deontic.ConductedAffairsThroughPattern p e c




theorem s1962c_elements_implies_deontic
    {p : Person} {e : Entity} {acts : List Elements.Act} {c : ComplaintText}
    (h : Elements.Section1962c p e acts c) :
    Deontic.ProhibitionViolated1962c p e c :=
  ⟨⟨.associated (corr_c_addressee h.associated), corr_c_condition h.interstateCommerce⟩,
   corr_c_act h.conducts h.throughPattern⟩








axiom corr_d_act {p : Person} {ag : Agreement} {c : ComplaintText} :
    AgreementAmongTwoOrMore ag c → Elements.AgreedToSubstantiveOffense p c →
    Deontic.ConspiredToViolate p ag c


theorem s1962d_elements_implies_deontic
    {p : Person} {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section1962d p ag c) :
    Deontic.ProhibitionViolated1962d p ag c :=
  corr_d_act h.agreement h.agreedToSubstantive











axiom corr_ent_purpose {e : Entity} {oe : Ontology.Enterprise} {c : ComplaintText} :
    Elements.HasSharedPurpose e c → Ontology.HasCommonPurpose oe c
axiom corr_ent_rel {e : Entity} {oe : Ontology.Enterprise} {c : ComplaintText} :
    Elements.HasOngoingRelationships e c → Ontology.HasRelationships oe c
axiom corr_ent_long {e : Entity} {oe : Ontology.Enterprise} {c : ComplaintText} :
    Elements.HasLongevity e c → Ontology.HasLongevity oe c



theorem enterprise_elements_implies_ontology
    {e : Entity} {oe : Ontology.Enterprise} {c : ComplaintText}
    (h : Elements.AssociationInFact e c) :
    Ontology.EnterpriseMembership oe c :=
  ⟨corr_ent_purpose h.purpose, corr_ent_rel h.relationships, corr_ent_long h.longevity⟩










axiom corr_pat_count {acts : List Elements.Act} {op : Ontology.Pattern} {c : ComplaintText} :
    Elements.AtLeastTwoActs c → Ontology.HasTwoOrMorePredicateActs op c
axiom corr_pat_rel {acts : List Elements.Act} {op : Ontology.Pattern} {c : ComplaintText} :
    Elements.ActsAreRelated acts c → Ontology.ActsAreRelated op c
axiom corr_pat_cont {acts : List Elements.Act} {op : Ontology.Pattern} {c : ComplaintText} :
    Elements.ActsShowContinuity acts c → Ontology.ActsShowContinuity op c



theorem pattern_elements_implies_ontology
    {acts : List Elements.Act} {op : Ontology.Pattern} {c : ComplaintText}
    (h : Elements.PatternComposite acts c) :
    Ontology.PatternMembership op c :=
  ⟨corr_pat_count (acts := acts) h.count, corr_pat_rel h.related, corr_pat_cont h.continuity⟩



















namespace Golden
open Proving.USC.Common

axiom mapPerson    : Person          → Proving.Rico.Person
axiom mapEntity    : Entity          → Proving.Rico.Entity
axiom mapComplaint : ComplaintText   → Proving.Rico.ComplaintText
axiom mapAgreement : Agreement       → Proving.Rico.Agreement
axiom mapActs      : List Elements.Act → List Proving.Rico.Act
axiom mapIncome    : Elements.Income   → Proving.Rico.Investment
axiom mapIC        : Elements.Interest → Proving.Rico.InterestOrControl





axiom gcorr_culpable {p c} : Elements.CulpablePersonCapableOfIntent p c →
    Proving.Rico.CulpablePersonCapableOfIntent (mapPerson p) (mapComplaint c)
axiom gcorr_enterprise {e c} : Elements.IsEnterprise e c →
    Proving.Rico.IsEnterprise (mapEntity e) (mapComplaint c)
axiom gcorr_commerce {e c} : EngagedInInterstateCommerce e c →
    Proving.Rico.EngagedInInterstateCommerce (mapEntity e) (mapComplaint c)
axiom gcorr_pattern {acts c} : Elements.PatternOfRacketeering acts c →
    Proving.Rico.PatternOfRacketeering (mapActs acts) (mapComplaint c)
axiom gcorr_derived {p i acts c} : Elements.IncomeDerivedFromPattern p i c →
    Proving.Rico.DerivedFromPattern (mapIncome i) (mapActs acts) (mapComplaint c)
axiom gcorr_invested {p i e c} : Elements.InvestedIncomeInEnterprise p i e c →
    Proving.Rico.InvestedInEnterprise (mapPerson p) (mapIncome i) (mapEntity e) (mapComplaint c)
axiom gcorr_acquired {p x e c} : Elements.AcquiredOrMaintainedInterest p x e c →
    Proving.Rico.AcquiredOrMaintainedControl (mapPerson p) (mapIC x) (mapEntity e) (mapComplaint c)
axiom gcorr_through_b {p : Person} {x : Elements.Interest} {e : Entity} {acts : List Elements.Act} {c : ComplaintText} :
    Elements.ThroughPatternNexus p e c →
    Proving.Rico.AcquisitionThroughPattern (mapIC x) (mapActs acts) (mapComplaint c)
axiom gcorr_associated {p e c} : Elements.EmployedOrAssociated p e c →
    Proving.Rico.EmployedOrAssociated (mapPerson p) (mapEntity e) (mapComplaint c)
axiom gcorr_conducts {p e c} : Elements.ConductsOrParticipates p e c →
    Proving.Rico.ConductsOrParticipates (mapPerson p) (mapEntity e) (mapComplaint c)
axiom gcorr_agreed {p ag c} : AgreementAmongTwoOrMore ag c → Elements.AgreedToSubstantiveOffense p c →
    Proving.Rico.AgreementToViolateRico (mapPerson p) (mapAgreement ag) (mapComplaint c)
axiom gcorr_knew {p ag c} : Elements.AgreedToSubstantiveOffense p c →
    Proving.Rico.KnowledgeOfRicoObjective (mapPerson p) (mapAgreement ag) (mapComplaint c)
axiom gcorr_underlying {ag c} : AgreementAmongTwoOrMore ag c →
    Proving.Rico.UnderlyingSubstantiveViolationContemplated (mapAgreement ag) (mapComplaint c)


theorem cand_a_implies_golden_a
    {p : Person} {i : Elements.Income} {e : Entity} {acts : List Elements.Act} {c : ComplaintText}
    (h : Elements.Section1962a p i e acts c) :
    Proving.Rico.Section1962a (mapPerson p) (mapEntity e) (mapIncome i) (mapActs acts) (mapComplaint c) :=
  ⟨gcorr_culpable h.culpable, gcorr_enterprise h.enterprise, gcorr_commerce h.interstateCommerce,
   gcorr_pattern h.pattern, gcorr_derived h.incomeFromPattern, gcorr_invested h.invested⟩


theorem cand_b_implies_golden_b
    {p : Person} {x : Elements.Interest} {e : Entity} {acts : List Elements.Act} {c : ComplaintText}
    (h : Elements.Section1962b p x e acts c) :
    Proving.Rico.Section1962b (mapPerson p) (mapEntity e) (mapIC x) (mapActs acts) (mapComplaint c) :=
  ⟨gcorr_culpable h.culpable, gcorr_enterprise h.enterprise, gcorr_commerce h.interstateCommerce,
   gcorr_pattern h.pattern, gcorr_acquired h.acquired, gcorr_through_b h.throughPattern⟩






















theorem cand_d_implies_golden_d
    {p : Person} {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section1962d p ag c) :
    Proving.Rico.Section1962d (mapPerson p) (mapAgreement ag) (mapComplaint c) :=
  ⟨gcorr_culpable h.culpable, gcorr_agreed h.agreement h.agreedToSubstantive,
   gcorr_knew h.agreedToSubstantive, gcorr_underlying h.agreement⟩

end Golden

end Proving.USC.T18.Prohibited.Bridge
