























































import Proving.USC.T18.Ch77TailCompletion.Elements.Statute
import Proving.USC.T18.Ch77TailCompletion.Deontic.Statute
import Proving.USC.T18.Ch77TailCompletion.Ontology.Statute
import Proving.USC.T18.Ch77TailCompletion.Scienter.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Ch77TailCompletion.Bridge

open Proving.USC.Common
open Proving.USC.T18.Ch77TailCompletion




axiom corr_d_addr1583_kidnap {p v : Person} {c : ComplaintText} :
    Elements.KidnapsOrCarriesAway p v c → Deontic.AddresseeInClass1583 p c
axiom corr_d_cond1583_kidnap {p : Person} {c : ComplaintText} :
    Elements.IntentToHoldOrSellAsSlave p c → Deontic.ConditionMet1583 p c
axiom corr_d_act1583_kidnap {p v : Person} {c : ComplaintText} :
    Elements.KidnapsOrCarriesAway p v c → Deontic.RegulatedActOccurred1583 p c
axiom corr_d_addr1583_entice {p v : Person} {c : ComplaintText} :
    Elements.EnticesToVesselOrPlace p v c → Deontic.AddresseeInClass1583 p c
axiom corr_d_cond1583_entice {p : Person} {c : ComplaintText} :
    Elements.IntentToMakeHeldOrSentAbroadAsSlave p c → Deontic.ConditionMet1583 p c
axiom corr_d_act1583_entice {p v : Person} {c : ComplaintText} :
    Elements.EnticesToVesselOrPlace p v c → Deontic.RegulatedActOccurred1583 p c



theorem s1583kidnap_elements_implies_deontic
    {p v : Person} {c : ComplaintText} (h : Elements.Section1583Kidnap p v c) :
    Deontic.Prohibition1583Violated p c :=
  ⟨⟨corr_d_addr1583_kidnap h.conduct, corr_d_cond1583_kidnap h.intent⟩,
   corr_d_act1583_kidnap h.conduct⟩


theorem s1583entice_elements_implies_deontic
    {p v : Person} {c : ComplaintText} (h : Elements.Section1583Entice p v c) :
    Deontic.Prohibition1583Violated p c :=
  ⟨⟨corr_d_addr1583_entice h.conduct, corr_d_cond1583_entice h.intent⟩,
   corr_d_act1583_entice h.conduct⟩


axiom corr_d_addr1584 {p v : Person} {c : ComplaintText} :
    Elements.Section1584Act p v c → Deontic.AddresseeInClass1584 p c
axiom corr_d_cond1584 {p : Person} {c : ComplaintText} :
    ActedWithScienter p c → Deontic.ConditionMet1584 p c
axiom corr_d_act1584 {p v : Person} {c : ComplaintText} :
    Elements.Section1584Act p v c → Deontic.RegulatedActOccurred1584 p c


theorem s1584_elements_implies_deontic
    {p v : Person} {c : ComplaintText} (h : Elements.Section1584 p v c) :
    Deontic.Prohibition1584Violated p c :=
  ⟨⟨corr_d_addr1584 h.act, corr_d_cond1584 h.scienter⟩, corr_d_act1584 h.act⟩


axiom corr_d_addr1593A {p : Person} {c : ComplaintText} :
    Elements.KnowinglyBenefitsFromVenture p c → Deontic.AddresseeInClass1593A p c
axiom corr_d_cond1593A {p : Person} {e : Entity} {c : ComplaintText} :
    Elements.VentureViolatedChapter e c →
    Elements.KnewOrRecklessDisregardOfVentureViolation p c → Deontic.ConditionMet1593A p c
axiom corr_d_act1593A {p : Person} {c : ComplaintText} :
    Elements.KnowinglyBenefitsFromVenture p c → Deontic.RegulatedActOccurred1593A p c


theorem s1593A_elements_implies_deontic
    {p : Person} {e : Entity} {c : ComplaintText} (h : Elements.Section1593A p e c) :
    Deontic.Prohibition1593AViolated p c :=
  ⟨⟨corr_d_addr1593A h.benefits, corr_d_cond1593A h.venture h.scienter⟩,
   corr_d_act1593A h.benefits⟩


axiom corr_d_addr1594 {p : Person} {c : ComplaintText} :
    Elements.IntentToCommitChapterOffense p c → Deontic.AddresseeInClass1594 p c
axiom corr_d_cond1594 {p : Person} {c : ComplaintText} :
    Elements.TargetsCoveredChapterOffense c → Deontic.ConditionMet1594 p c
axiom corr_d_act1594_attempt {p : Person} {c : ComplaintText} :
    Elements.SubstantialStepTaken p c → Deontic.RegulatedActOccurred1594 p c
axiom corr_d_act1594_conspiracy {p : Person} {ag : Agreement} {c : ComplaintText} :
    AgreementAmongTwoOrMore ag c → Deontic.RegulatedActOccurred1594 p c


theorem s1594_elements_implies_deontic
    {p : Person} {ag : Agreement} {c : ComplaintText} (h : Elements.Section1594 p ag c) :
    Deontic.Prohibition1594Violated p c :=
  match h with
  | .attempt ha =>
      ⟨⟨corr_d_addr1594 ha.intent, corr_d_cond1594 ha.target⟩, corr_d_act1594_attempt ha.step⟩
  | .conspiracy hc =>
      ⟨⟨corr_d_addr1594 hc.intent, corr_d_cond1594 hc.target⟩, corr_d_act1594_conspiracy hc.agreement⟩


axiom corr_d_addr1595 {v : Person} {c : ComplaintText} :
    Elements.IsChapterVictim v c → Deontic.AddresseeInClass1595 v c
axiom corr_d_cond1595 {v p : Person} {e : Entity} {c : ComplaintText} :
    Elements.WithinLimitationsPeriod1595 v c →
    Elements.Section1595Liability p e c → Deontic.ConditionMet1595 v c



theorem s1595_elements_implies_deontic
    {v p : Person} {e : Entity} {c : ComplaintText}
    (h : Elements.ValidChapter77CivilClaim v p e c) :
    Deontic.Permission1595Exercisable v c :=
  ⟨corr_d_addr1595 h.standing.victim, corr_d_cond1595 h.standing.limitations h.liability⟩


axiom corr_d_addr1595A {p : Person} {c : ComplaintText} :
    Elements.IsAttorneyGeneral p c → Deontic.AddresseeInClass1595A p c
axiom corr_d_cond1595A {p : Person} {c : ComplaintText} :
    Elements.PersonEngagedOrAboutToEngageInViolation p c →
    Elements.ConductConstitutesCoveredViolation c → Deontic.ConditionMet1595A p c



theorem s1595A_elements_implies_deontic
    {p : Person} {c : ComplaintText} (h : Elements.Section1595AInjunction p c) :
    Deontic.Power1595AExercisable p c :=
  ⟨corr_d_addr1595A h.attorneyGeneral, corr_d_cond1595A h.conduct h.coveredViolation⟩


axiom corr_d_addr1597 {p : Person} {doc : Elements.ImmigrationDocument} {c : ComplaintText} :
    Elements.TampersWithImmigrationDocument p doc c → Deontic.AddresseeInClass1597 p c
axiom corr_d_cond1597 {p : Person} {c : ComplaintText} :
    Elements.Section1597Purpose p c → Deontic.ConditionMet1597 p c
axiom corr_d_act1597 {p : Person} {doc : Elements.ImmigrationDocument} {c : ComplaintText} :
    Elements.TampersWithImmigrationDocument p doc c → Deontic.RegulatedActOccurred1597 p c


theorem s1597_elements_implies_deontic
    {p : Person} {doc : Elements.ImmigrationDocument} {c : ComplaintText}
    (h : Elements.Section1597 p doc c) : Deontic.Prohibition1597Violated p c :=
  ⟨⟨corr_d_addr1597 h.conduct, corr_d_cond1597 h.purpose⟩, corr_d_act1597 h.conduct⟩








axiom corr_d_cond1593 {d : Person} {c : ComplaintText} :
    Elements.OffenseUnderChapter d c → Deontic.ConditionMet1593 d c

theorem s1593_elements_implies_deontic_modulo_gaps
    {d v : Person} {c : ComplaintText}
    (h : Elements.Section1593Restitution d v c)
    (gap_courtAddressee1593 : Deontic.AddresseeInClass1593 d c)
    (gap_restitutionNotOrdered1593 : ¬ Deontic.RegulatedActOccurred1593 d c) :
    Deontic.Obligation1593Breached d c :=
  ⟨⟨gap_courtAddressee1593, corr_d_cond1593 h.offense⟩, gap_restitutionNotOrdered1593⟩







axiom corr_s1583_kidnap {p : Person} {c : ComplaintText} :
    Elements.IntentToHoldOrSellAsSlave p c → Scienter.Culpable1583 p c
axiom corr_s1583_entice {p : Person} {c : ComplaintText} :
    Elements.IntentToMakeHeldOrSentAbroadAsSlave p c → Scienter.Culpable1583 p c
axiom corr_s1584 {p : Person} {c : ComplaintText} :
    ActedWithScienter p c → Scienter.Culpable1584 p c
axiom corr_s1593A {p : Person} {c : ComplaintText} :
    Elements.KnewOrRecklessDisregardOfVentureViolation p c → Scienter.Culpable1593A p c
axiom corr_s1594 {p : Person} {c : ComplaintText} :
    Elements.IntentToCommitChapterOffense p c → Scienter.Culpable1594 p c
axiom corr_s1595 {p : Person} {c : ComplaintText} :
    Elements.KnewOrShouldHaveKnownOfViolation p c → Scienter.Culpable1595 p c
axiom corr_s1597 {p : Person} {c : ComplaintText} :
    ActedWithScienter p c → Scienter.Culpable1597 p c


theorem s1583kidnap_elements_implies_scienter
    {p v : Person} {c : ComplaintText} (h : Elements.Section1583Kidnap p v c) :
    Scienter.Culpable1583 p c := corr_s1583_kidnap h.intent


theorem s1583entice_elements_implies_scienter
    {p v : Person} {c : ComplaintText} (h : Elements.Section1583Entice p v c) :
    Scienter.Culpable1583 p c := corr_s1583_entice h.intent


theorem s1584_elements_implies_scienter
    {p v : Person} {c : ComplaintText} (h : Elements.Section1584 p v c) :
    Scienter.Culpable1584 p c := corr_s1584 h.scienter


theorem s1593A_elements_implies_scienter
    {p : Person} {e : Entity} {c : ComplaintText} (h : Elements.Section1593A p e c) :
    Scienter.Culpable1593A p c := corr_s1593A h.scienter


theorem s1594_elements_implies_scienter
    {p : Person} {ag : Agreement} {c : ComplaintText} (h : Elements.Section1594 p ag c) :
    Scienter.Culpable1594 p c :=
  match h with
  | .attempt ha => corr_s1594 ha.intent
  | .conspiracy hc => corr_s1594 hc.intent


theorem s1595_elements_implies_scienter
    {p : Person} {e : Entity} {c : ComplaintText} (h : Elements.Section1595Beneficiary p e c) :
    Scienter.Culpable1595 p c := corr_s1595 h.scienter


theorem s1597_elements_implies_scienter
    {p : Person} {doc : Elements.ImmigrationDocument} {c : ComplaintText}
    (h : Elements.Section1597 p doc c) :
    Scienter.Culpable1597 p c := corr_s1597 h.scienter




axiom corr_o_victim_harm1593 {v : Person} {c : ComplaintText} :
    Elements.IsChapterVictim v c → Ontology.HarmedByChapterCrime v c
axiom corr_o_victim_member1593 {v : Person} {c : ComplaintText} :
    Elements.IsChapterVictim v c → Ontology.IsVictim v c



theorem s1593_elements_implies_ontology
    {d v : Person} {c : ComplaintText} (h : Elements.Section1593Restitution d v c) :
    Ontology.VictimMembership v c :=
  ⟨.direct (corr_o_victim_harm1593 h.victim), corr_o_victim_member1593 h.victim⟩


axiom corr_o_nat1596 {p : Person} {c : ComplaintText} :
    Elements.OffenderIsNationalOrLPR p c → Ontology.IsNationalOfUS p c
axiom corr_o_present1596 {p : Person} {c : ComplaintText} :
    Elements.OffenderPresentInUS p c → Ontology.IsPresentInUS p c





theorem s1596_elements_implies_ontology
    {p : Person} {c : ComplaintText} (h : Elements.Section1596Nexus p c) :
    Ontology.JurisdictionalPersonClass p c :=
  match h with
  | .national hn => .national (corr_o_nat1596 hn)
  | .present hp => .present (corr_o_present1596 hp)

end Proving.USC.T18.Ch77TailCompletion.Bridge
