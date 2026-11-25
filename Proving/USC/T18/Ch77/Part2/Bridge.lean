

































import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part2.Elements.Statute
import Proving.USC.T18.Ch77.Part2.Deontic.Statute
import Proving.USC.T18.Ch77.Part2.Ontology.Statute
import Proving.USC.T18.Ch77.Part2.Procedure.Statute
import Proving.USC.T18.Ch77.Part2.Scienter.Theorems

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part2.Bridge

open Proving.USC.Common
open Proving.USC.T18.Ch77.Part2











axiom ventureEO : Elements.Venture → Ontology.Venture
axiom coercionEO : Elements.CoerciveMeans → Ontology.Coercion
axiom abuseEO : Elements.CoerciveMeans → Ontology.AbuseOfLegalProcess
axiom seriousHarmEO : Elements.Harm → Ontology.SeriousHarm
axiom sexActEO : Elements.SexAct → Ontology.SexAct
axiom commercialSexActEO : Elements.SexAct → Ontology.CommercialSexAct
axiom thingOfValueEO : Elements.SexAct → Ontology.ThingOfValue
axiom participationEO : Person → Elements.Venture → Ontology.ParticipationInVenture
axiom traffickingConductEO : Elements.Venture → Ontology.TraffickingConduct
axiom offenseEP : Elements.TraffickingAct → Procedure.Offense
axiom prosecutionOf : Person → Procedure.Prosecution
axiom offenseOf : Person → Procedure.Offense
axiom coercionDO : Person → Ontology.Coercion
axiom seriousHarmDO : Person → Ontology.SeriousHarm
axiom abuseDO : Person → Ontology.AbuseOfLegalProcess
axiom coercionPO : Procedure.Offense → Ontology.Coercion
axiom participationSO : Person → Ontology.ParticipationInVenture
axiom traffickingConductSO : Person → Ontology.TraffickingConduct








private theorem knowledge_atLeast_means (posture : Scienter.ChargingPosture) :
    MentalState.atLeast MentalState.Knowledge
      (Scienter.RequiredMentalState1591aMeans posture) := by
  cases hb : posture.actIsAdvertising
  · rw [Scienter.required1591aMeans_nonAdvertising hb]
    show MentalState.rank MentalState.Recklessness
        ≤ MentalState.rank MentalState.Knowledge
    decide
  · rw [Scienter.required1591aMeans_advertising hb]
    show MentalState.rank MentalState.Knowledge
        ≤ MentalState.rank MentalState.Knowledge
    decide

private theorem recklessness_atLeast_means {posture : Scienter.ChargingPosture}
    (h : posture.actIsAdvertising = false) :
    MentalState.atLeast MentalState.Recklessness
      (Scienter.RequiredMentalState1591aMeans posture) := by
  rw [Scienter.required1591aMeans_nonAdvertising h]
  show MentalState.rank MentalState.Recklessness
      ≤ MentalState.rank MentalState.Recklessness
  decide

private theorem knowledge_atLeast_age (posture : Scienter.ChargingPosture) :
    MentalState.atLeast MentalState.Knowledge
      (Scienter.RequiredMentalState1591aAge posture) := by
  show MentalState.rank (Scienter.RequiredMentalState1591aAge posture)
      ≤ MentalState.rank MentalState.Knowledge
  unfold Scienter.RequiredMentalState1591aAge
  split
  · decide
  · split <;> decide

private theorem recklessness_atLeast_age {posture : Scienter.ChargingPosture}
    (h : posture.actIsAdvertising = false) :
    MentalState.atLeast MentalState.Recklessness
      (Scienter.RequiredMentalState1591aAge posture) := by
  show MentalState.rank (Scienter.RequiredMentalState1591aAge posture)
      ≤ MentalState.rank MentalState.Recklessness
  unfold Scienter.RequiredMentalState1591aAge
  split
  · decide
  · rw [h]
    decide








axiom corr_ed_whoever {p v : Person} {a : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.PerformsEnumeratedTraffickingAct p v a c →
    Deontic.AddresseeWhoever1591 p c

axiom corr_ed_knowingly {p : Person} {c : ComplaintText} :
    ActedWithScienter p c → Deontic.ActedKnowingly1591a p c

axiom corr_ed_commerce {p : Person} {a : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.InOrAffectingInterstateOrForeignCommerce a c →
    Deontic.InterstateOrForeignCommerceNexus1591a1 p c

axiom corr_ed_maritime {p : Person} {a : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.WithinSpecialMaritimeAndTerritorialJurisdiction a c →
    Deontic.SpecialMaritimeOrTerritorialJurisdiction1591a1 p c

axiom corr_ed_regulatedAct {p v : Person} {a : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.PerformsEnumeratedTraffickingAct p v a c →
    Deontic.RegulatedActTraffickingPerson1591a1 p v c





theorem s1591a1_elements_implies_deontic {p v : Person}
    {a : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.Section1591a1 p v a c) :
    Deontic.Prohibition1591a1 p c ∧ Deontic.RegulatedActTraffickingPerson1591a1 p v c := by
  refine ⟨{ addressee := corr_ed_whoever h.act
            jurisdiction := ?_
            knowingly := corr_ed_knowingly h.knowingly }, corr_ed_regulatedAct h.act⟩
  cases h.jurisdiction with
  | commerce hc => exact Or.inl (corr_ed_commerce (p := p) hc)
  | maritimeOrTerritorial hm => exact Or.inr (corr_ed_maritime (p := p) hm)

axiom corr_ed_means {p v : Person} {m : Elements.CoerciveMeans} {hm : Elements.Harm}
    {c : ComplaintText} :
    Elements.ProhibitedMeans1591 m hm v c →
    Deontic.MeansOfForceFraudOrCoercion1591a p v c

axiom corr_ed_meansMensRea {p v : Person} {a : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.CulpableMentalState1591a p a c → Deontic.MensReaAsToMeans1591a p v c

axiom corr_ed_causeViaMeans {v : Person} {m : Elements.CoerciveMeans}
    {s : Elements.SexAct} {c : ComplaintText} :
    Elements.MeansWillBeUsedToCauseCommercialSexAct v m s c →
    Elements.CommercialSexAct1591e3 s c →
    Deontic.WillBeCausedToEngageInCommercialSexAct1591a v c


theorem s1591a_elements_implies_deontic_means {p v : Person}
    {a : Elements.TraffickingAct} {m : Elements.CoerciveMeans} {hm : Elements.Harm}
    {s : Elements.SexAct} {c : ComplaintText}
    (h : Elements.MeansTheory1591a p v a m hm s c) :
    Deontic.MensReaTheory1591a p v c :=
  Deontic.MensReaTheory1591a.byMeans
    (corr_ed_means (p := p) h.means)
    (corr_ed_meansMensRea (v := v) h.mentalState)
    (corr_ed_causeViaMeans h.causation h.commerciality)

axiom corr_ed_underAge {v : Person} {c : ComplaintText} :
    Elements.victimAgeYearsAtOffense v c < 18 →
    Deontic.VictimUnderStatutoryAge1591a v c

axiom corr_ed_causeViaMinority {v : Person} {s : Elements.SexAct}
    {c : ComplaintText} :
    Elements.WillBeCausedToEngageInCommercialSexAct v s c →
    Elements.CommercialSexAct1591e3 s c →
    Deontic.WillBeCausedToEngageInCommercialSexAct1591a v c

axiom corr_ed_minorityMensRea {p v : Person} {a : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.CulpableMentalState1591a p a c →
    Deontic.MensReaAsToMinority1591a p v c






axiom corr_ed_observationRoute {gov : Entity} {p v : Person} {c : ComplaintText} :
    Elements.ProsecutedUnderParagraphOne p c →
    Elements.ReasonableOpportunityToObserve p v c →
    Deontic.Permission1591c gov p v c







theorem s1591c_elements_implies_deontic_minority_route {gov : Entity} {p v : Person}
    {a : Elements.TraffickingAct} {s : Elements.SexAct} {c : ComplaintText}
    (h : Elements.MinorityTheory1591a p v a s c) :
    Deontic.MinorityTheoryEstablished1591 gov p v c := by
  unfold Deontic.MinorityTheoryEstablished1591
  refine ⟨corr_ed_underAge h.underEighteen,
          corr_ed_causeViaMinority h.causation h.commerciality, ?_⟩
  cases h.mentalState with
  | proven hp => exact Or.inl (corr_ed_minorityMensRea (v := v) hp)
  | relievedByObservation hpros hopp =>
      exact Or.inr (corr_ed_observationRoute (gov := gov) hpros hopp)









axiom corr_eo_seriousHarmMember {hm : Elements.Harm} {v : Person}
    {c : ComplaintText} :
    Elements.SeriousHarm1591e5 hm v c → Ontology.IsSeriousHarm (seriousHarmEO hm) c

axiom corr_eo_harmKind {hm : Elements.Harm} {c : ComplaintText} :
    Elements.IsHarmPhysicalOrNonphysical hm c →
    Ontology.IsHarmPhysicalOrNonphysical (seriousHarmEO hm) c

axiom corr_eo_compels {hm : Elements.Harm} {v : Person} {c : ComplaintText} :
    Elements.SufficientToCompelReasonablePersonSimilarlySituated hm v c →
    Ontology.CompelsReasonablePersonToPerformCommercialSexualActivity
      (seriousHarmEO hm) v c


theorem s1591e5_elements_implies_ontology {hm : Elements.Harm} {v : Person}
    {c : ComplaintText} (h : Elements.SeriousHarm1591e5 hm v c) :
    Ontology.SeriousHarmMembership (seriousHarmEO hm) v c :=
  { member := corr_eo_seriousHarmMember h
    harm := corr_eo_harmKind h.harm
    compels := corr_eo_compels h.sufficiency }

axiom corr_eo_coercionMember {m : Elements.CoerciveMeans} {hm : Elements.Harm}
    {v : Person} {c : ComplaintText} :
    Elements.Coercion1591e2 m hm v c → Ontology.IsCoercion (coercionEO m) c

axiom corr_eo_threatensSeriousHarm {m : Elements.CoerciveMeans} {hm : Elements.Harm}
    {v : Person} {c : ComplaintText} :
    Elements.ThreatensConsequenceAgainstPerson m v c →
    Elements.SeriousHarm1591e5 hm v c →
    Ontology.ThreatensSeriousHarm (coercionEO m) (seriousHarmEO hm) c

axiom corr_eo_restraint {m : Elements.CoerciveMeans} {v : Person}
    {c : ComplaintText} :
    Elements.PhysicalRestraintAgainstPerson v c →
    Ontology.ThreatensOrAppliesPhysicalRestraint (coercionEO m) c

axiom corr_eo_schemeSeriousHarm {m : Elements.CoerciveMeans} {hm : Elements.Harm}
    {v : Person} {c : ComplaintText} :
    Elements.IsSchemePlanOrPattern m c →
    Elements.IntendedToCauseBeliefFailureToPerformCausesConsequence m v c →
    Elements.SeriousHarm1591e5 hm v c →
    Ontology.SchemeInducingBeliefOfSeriousHarm (coercionEO m) (seriousHarmEO hm) c

axiom corr_eo_schemeRestraint {m : Elements.CoerciveMeans} {v : Person}
    {c : ComplaintText} :
    Elements.IsSchemePlanOrPattern m c →
    Elements.IntendedToCauseBeliefFailureToPerformCausesConsequence m v c →
    Ontology.SchemeInducingBeliefOfPhysicalRestraint (coercionEO m) c

axiom corr_eo_abuse {m : Elements.CoerciveMeans} {v : Person} {c : ComplaintText} :
    Elements.AbuseOfLegalProcess1591e1 m v c →
    Ontology.IsAbuseOrThreatenedAbuseOfLegalProcess (abuseEO m) c




theorem s1591e2_elements_implies_ontology {m : Elements.CoerciveMeans}
    {hm : Elements.Harm} {v : Person} {c : ComplaintText}
    (h : Elements.Coercion1591e2 m hm v c) :
    Ontology.CoercionMembership (coercionEO m) (seriousHarmEO hm) (abuseEO m) c := by
  refine { member := corr_eo_coercionMember h, route := ?_ }
  cases h with
  | threatsOfSeriousHarm hA =>
      cases hA.consequence with
      | seriousHarm hSH =>
          exact Ontology.CoercionRoute.threatOfSeriousHarm
            (corr_eo_seriousHarmMember hSH)
            (corr_eo_threatensSeriousHarm hA.threat hSH)
      | physicalRestraint hR =>
          exact Ontology.CoercionRoute.physicalRestraint
            (corr_eo_restraint (m := m) hR)
  | schemePlanOrPattern hB =>
      cases hB.consequence with
      | seriousHarm hSH =>
          exact Ontology.CoercionRoute.schemeOfSeriousHarm
            (corr_eo_seriousHarmMember hSH)
            (corr_eo_schemeSeriousHarm hB.scheme hB.intent hSH)
      | physicalRestraint _ =>
          exact Ontology.CoercionRoute.schemeOfPhysicalRestraint
            (corr_eo_schemeRestraint hB.scheme hB.intent)
  | abuseOfLegalProcess hAb =>
      exact Ontology.CoercionRoute.abuseOfLegalProcess (corr_eo_abuse hAb)

axiom corr_eo_csaMember {s : Elements.SexAct} {c : ComplaintText} :
    Elements.CommercialSexAct1591e3 s c →
    Ontology.IsCommercialSexAct (commercialSexActEO s) c

axiom corr_eo_sexAct {s : Elements.SexAct} {c : ComplaintText} :
    Elements.IsSexAct s c → Ontology.IsSexAct (sexActEO s) c

axiom corr_eo_value {s : Elements.SexAct} {c : ComplaintText} :
    Elements.AnythingOfValueGivenOrReceivedForAct s c →
    Ontology.IsAnythingOfValue (thingOfValueEO s) c

axiom corr_eo_onAccountOf {s : Elements.SexAct} {p : Person} {c : ComplaintText} :
    Elements.AnythingOfValueGivenOrReceivedForAct s c →
    Ontology.ValueGivenOrReceivedOnAccountOfSexAct
      (commercialSexActEO s) (sexActEO s) (thingOfValueEO s) p c


theorem s1591e3_elements_implies_ontology {s : Elements.SexAct} {p : Person}
    {c : ComplaintText} (h : Elements.CommercialSexAct1591e3 s c) :
    Ontology.CommercialSexActMembership
      (commercialSexActEO s) (sexActEO s) (thingOfValueEO s) p c :=
  { member := corr_eo_csaMember h
    sexAct := corr_eo_sexAct h.sexAct
    value := corr_eo_value h.consideration
    onAccountOf := corr_eo_onAccountOf h.consideration }



theorem s1591a1_elements_implies_ontology_termUsage {m : Elements.CoerciveMeans}
    {hm : Elements.Harm} {s : Elements.SexAct} {v p : Person} {c : ComplaintText}
    (hCoercion : Elements.Coercion1591e2 m hm v c)
    (hCsa : Elements.CommercialSexAct1591e3 s c) :
    Ontology.Section1591a1TermUsage (coercionEO m) (seriousHarmEO hm) (abuseEO m)
      (commercialSexActEO s) (sexActEO s) (thingOfValueEO s) p c :=
  { coercion := s1591e2_elements_implies_ontology hCoercion
    commercialSexAct := s1591e3_elements_implies_ontology hCsa }

axiom corr_eo_ventureMember {ven : Elements.Venture} {c : ComplaintText} :
    Elements.Venture1591e6 ven c → Ontology.IsVenture (ventureEO ven) c


axiom corr_eo_ventureCount {ven : Elements.Venture} {c : ComplaintText} :
    Ontology.individualsInVenture (ventureEO ven) c
      = Elements.individualsAssociatedInVenture ven c

axiom corr_eo_inFact {ven : Elements.Venture} {c : ComplaintText} :
    Elements.IndividualsAssociatedInFact ven c →
    Ontology.AssociatedInFact (ventureEO ven) c




theorem s1591e6_elements_implies_ontology {ven : Elements.Venture}
    {c : ComplaintText} (h : Elements.Venture1591e6 ven c) :
    Ontology.VentureMembership (ventureEO ven) c := by
  refine { member := corr_eo_ventureMember h, twoOrMore := ?_,
           inFact := corr_eo_inFact h.associatedInFact }
  show 2 ≤ Ontology.individualsInVenture (ventureEO ven) c
  rw [corr_eo_ventureCount]
  exact h.twoOrMore

axiom corr_eo_partMember {p : Person} {ven : Elements.Venture} {c : ComplaintText} :
    Elements.ParticipationInVenture1591e4 p ven c →
    Ontology.IsParticipationInVenture (participationEO p ven) c

axiom corr_eo_partKnowingly {p : Person} {ven : Elements.Venture}
    {c : ComplaintText} :
    Elements.AssistsSupportsOrFacilitatesViolation p ven c →
    Elements.KnowsVentureViolatesParagraphOne p ven c →
    Ontology.KnowinglyAssistsSupportsOrFacilitates
      (participationEO p ven) (traffickingConductEO ven) c

axiom corr_eo_partViolation {ven : Elements.Venture} {c : ComplaintText} :
    Elements.VentureEngagedInParagraphOneAct ven c →
    Ontology.IsViolationOfSubsectionA1 (traffickingConductEO ven) c


theorem s1591e4_elements_implies_ontology {p : Person} {ven : Elements.Venture}
    {c : ComplaintText} (h : Elements.ParticipationInVenture1591e4 p ven c)
    (hAct : Elements.VentureEngagedInParagraphOneAct ven c) :
    Ontology.ParticipationInVentureMembership
      (participationEO p ven) (traffickingConductEO ven) c :=
  { member := corr_eo_partMember h
    knowingly := corr_eo_partKnowingly h.conduct h.knowledge
    violation := corr_eo_partViolation hAct }


theorem s1591a2_elements_implies_ontology_termUsage {p : Person}
    {ven : Elements.Venture} {c : ComplaintText}
    (h : Elements.Section1591a2 p ven c) :
    Ontology.Section1591a2TermUsage
      (participationEO p ven) (ventureEO ven) (traffickingConductEO ven) c :=
  { venture := s1591e6_elements_implies_ontology h.venture
    participation :=
      s1591e4_elements_implies_ontology h.participation h.venturePredicateAct }



axiom corr_ep_commerce {a : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.InOrAffectingInterstateOrForeignCommerce a c →
    Procedure.InterstateOrForeignCommerceNexus (offenseEP a) c

axiom corr_ep_maritime {a : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.WithinSpecialMaritimeAndTerritorialJurisdiction a c →
    Procedure.WithinSpecialMaritimeAndTerritorialJurisdiction (offenseEP a) c


theorem s1591a1_elements_implies_procedure_jurisdiction
    {a : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.JurisdictionalNexus1591a1 a c) :
    Procedure.FederalJurisdictionAttaches (offenseEP a) c := by
  cases h with
  | commerce hc => exact Procedure.FederalJurisdictionAttaches.commerce (corr_ep_commerce hc)
  | maritimeOrTerritorial hm =>
      exact Procedure.FederalJurisdictionAttaches.maritimeTerritorial (corr_ep_maritime hm)

axiom corr_ep_advertising {a : Elements.TraffickingAct} {c : ComplaintText} :
    Procedure.ActConstitutingViolationIsAdvertising (offenseEP a) c →
    Elements.TraffickingActIsAdvertising a c

axiom corr_ep_knowsMeans {p : Person} {c : ComplaintText} :
    Elements.KnowsAggravatingFact p c →
    Procedure.GovernmentProvedKnowledgeOfCoerciveMeans (prosecutionOf p) c

axiom corr_ep_recklessMeans {p : Person} {c : ComplaintText} :
    Elements.RecklesslyDisregardsAggravatingFact p c →
    Procedure.GovernmentProvedRecklessDisregardOfCoerciveMeans (prosecutionOf p) c

axiom corr_ep_knowsMinor {p : Person} {c : ComplaintText} :
    Elements.KnowsAggravatingFact p c →
    Procedure.GovernmentProvedKnowledgeOfMinority (prosecutionOf p) c

axiom corr_ep_recklessMinor {p : Person} {c : ComplaintText} :
    Elements.RecklesslyDisregardsAggravatingFact p c →
    Procedure.GovernmentProvedRecklessDisregardOfMinority (prosecutionOf p) c


axiom corr_ep_prosecutionUnderA1 {p : Person} {c : ComplaintText} :
    Elements.ProsecutedUnderParagraphOne p c →
    Procedure.ProsecutionUnderSubsectionA1 (prosecutionOf p) c

axiom corr_ep_observe {p v : Person} {c : ComplaintText} :
    Elements.ReasonableOpportunityToObserve p v c →
    Procedure.DefendantHadReasonableOpportunityToObserve p v c


axiom corr_ep_age {v : Person} {a : Elements.TraffickingAct} {c : ComplaintText} :
    Procedure.ageOfVictimAtOffense v (offenseEP a) c
      = Elements.victimAgeYearsAtOffense v c





theorem s1591a_elements_implies_procedure_chapeau {p v : Person}
    {a : Elements.TraffickingAct} {ven : Elements.Venture}
    {m : Elements.CoerciveMeans} {hm : Elements.Harm} {s : Elements.SexAct}
    {c : ComplaintText}
    (h : Elements.AggravatingFact1591a p v a ven m hm s c) :
    Procedure.ChapeauScienterBurdenDischarged
      (prosecutionOf p) p v (offenseEP a) c := by
  cases h with
  | byMeans hM =>
      refine Procedure.ChapeauScienterBurdenDischarged.meansTheory ?_
      cases hM.mentalState with
      | knowing hk =>
          exact Procedure.MeansScienterProved.actualKnowledge (corr_ep_knowsMeans hk)
      | recklessDisregard hr hNotAdv =>
          exact Procedure.MeansScienterProved.recklessDisregard
            (fun hy => hNotAdv (corr_ep_advertising hy)) (corr_ep_recklessMeans hr)
  | byMinority hMin =>
      refine Procedure.ChapeauScienterBurdenDischarged.minorityTheory ?_ ?_
      · cases hMin.mentalState with
        | proven hp =>
            cases hp with
            | knowing hk =>
                exact Procedure.MinorityScienterProved.actualKnowledge
                  (corr_ep_knowsMinor hk)
            | recklessDisregard hr hNotAdv =>
                exact Procedure.MinorityScienterProved.recklessDisregard
                  (fun hy => hNotAdv (corr_ep_advertising hy))
                  (corr_ep_recklessMinor hr)
        | relievedByObservation hpros hopp =>
            exact Procedure.MinorityScienterProved.subsectionCRelief
              (corr_ep_prosecutionUnderA1 hpros) (corr_ep_observe hopp)
      · show Procedure.ageOfVictimAtOffense v (offenseEP a) c < 18
        rw [corr_ep_age]
        exact hMin.underEighteen














axiom corr_es_knowsAct {p : Person} {c : ComplaintText} :
    ActedWithScienter p c →
    Scienter.MentalStateProven p Scienter.ScienterTarget.traffickingAct
      MentalState.Knowledge c

axiom corr_es_knowsMeans {p : Person} {c : ComplaintText} :
    Elements.KnowsAggravatingFact p c →
    Scienter.MentalStateProven p Scienter.ScienterTarget.meansOfCompulsion
      MentalState.Knowledge c

axiom corr_es_recklessMeans {p : Person} {c : ComplaintText} :
    Elements.RecklesslyDisregardsAggravatingFact p c →
    Scienter.MentalStateProven p Scienter.ScienterTarget.meansOfCompulsion
      MentalState.Recklessness c

axiom corr_es_knowsMinor {p : Person} {c : ComplaintText} :
    Elements.KnowsAggravatingFact p c →
    Scienter.MentalStateProven p Scienter.ScienterTarget.victimMinority
      MentalState.Knowledge c

axiom corr_es_recklessMinor {p : Person} {c : ComplaintText} :
    Elements.RecklesslyDisregardsAggravatingFact p c →
    Scienter.MentalStateProven p Scienter.ScienterTarget.victimMinority
      MentalState.Recklessness c

axiom corr_es_notAdvertising {p : Person} {a : Elements.TraffickingAct}
    {c : ComplaintText} :
    ¬ Elements.TraffickingActIsAdvertising a c →
    Scienter.actConstitutingViolationIsAdvertising1591 p c = false

axiom corr_es_prosecutionUnderA1 {p : Person} {c : ComplaintText} :
    Elements.ProsecutedUnderParagraphOne p c →
    Scienter.chargedUnderSubsection1591a1 p c = true

axiom corr_es_observe {p v : Person} {c : ComplaintText} :
    Elements.ReasonableOpportunityToObserve p v c →
    Scienter.reasonableOpportunityToObserve1591c p c = true






theorem s1591a1_elements_implies_scienter_modulo_gaps {p v : Person}
    {a : Elements.TraffickingAct} {ven : Elements.Venture}
    {m : Elements.CoerciveMeans} {hm : Elements.Harm} {s : Elements.SexAct}
    {c : ComplaintText}
    (gap_1591c_route_supplies_no_proven_mental_state_rung :
      Scienter.MentalStateProven p Scienter.ScienterTarget.victimMinority
        MentalState.StrictLiability c)
    (hConduct : Elements.Section1591a1 p v a c)
    (hAgg : Elements.AggravatingFact1591a p v a ven m hm s c) :
    Scienter.Scienter1591a1Culpable p (Scienter.posture1591 p c) c := by
  refine { knowingAct := ⟨MentalState.Knowledge,
                          Scienter.mentalState_atLeast_refl MentalState.Knowledge,
                          corr_es_knowsAct hConduct.knowingly⟩,
           circumstance := ?_ }
  cases hAgg with
  | byMeans hM =>
      refine Scienter.Scienter1591aCircumstance.byMeansOfCompulsion ?_
      cases hM.mentalState with
      | knowing hk =>
          exact ⟨MentalState.Knowledge, knowledge_atLeast_means _, corr_es_knowsMeans hk⟩
      | recklessDisregard hr hNotAdv =>
          have hb : (Scienter.posture1591 p c).actIsAdvertising = false :=
            corr_es_notAdvertising (a := a) hNotAdv
          exact ⟨MentalState.Recklessness, recklessness_atLeast_means hb,
                 corr_es_recklessMeans hr⟩
  | byMinority hMin =>
      refine Scienter.Scienter1591aCircumstance.byVictimMinority ?_
      cases hMin.mentalState with
      | proven hp =>
          cases hp with
          | knowing hk =>
              exact ⟨MentalState.Knowledge, knowledge_atLeast_age _, corr_es_knowsMinor hk⟩
          | recklessDisregard hr hNotAdv =>
              have hb : (Scienter.posture1591 p c).actIsAdvertising = false :=
                corr_es_notAdvertising (a := a) hNotAdv
              exact ⟨MentalState.Recklessness, recklessness_atLeast_age hb,
                     corr_es_recklessMinor hr⟩
      | relievedByObservation hpros hopp =>
          exact Scienter.scienter1591aAge_underC
            (corr_es_prosecutionUnderA1 hpros)
            (corr_es_observe (v := v) hopp)
            MentalState.StrictLiability
            gap_1591c_route_supplies_no_proven_mental_state_rung



axiom corr_do_coercionMember {p v : Person} {c : ComplaintText} :
    Deontic.Coercion1591e2 p v c → Ontology.IsCoercion (coercionDO p) c

axiom corr_do_isSeriousHarm {p v : Person} {c : ComplaintText} :
    Deontic.HarmIsSufficientlySerious1591e5 p v c →
    Ontology.IsSeriousHarm (seriousHarmDO p) c

axiom corr_do_threatens {p v : Person} {c : ComplaintText} :
    Deontic.ThreatOfHarmAgainstPerson1591e2a p v c →
    Deontic.HarmIsSufficientlySerious1591e5 p v c →
    Ontology.ThreatensSeriousHarm (coercionDO p) (seriousHarmDO p) c

axiom corr_do_restraint {p v : Person} {c : ComplaintText} :
    Deontic.PhysicalRestraintAgainstPerson1591e2a p v c →
    Ontology.ThreatensOrAppliesPhysicalRestraint (coercionDO p) c

axiom corr_do_scheme {p v : Person} {c : ComplaintText} :
    Deontic.SchemePlanOrPatternCausingBeliefOfHarm1591e2b p v c →
    Deontic.HarmIsSufficientlySerious1591e5 p v c →
    Ontology.SchemeInducingBeliefOfSeriousHarm (coercionDO p) (seriousHarmDO p) c

axiom corr_do_abuse {p v : Person} {c : ComplaintText} :
    Deontic.AbuseOrThreatenedAbuseOfLawOrLegalProcess1591e2c p v c →
    Ontology.IsAbuseOrThreatenedAbuseOfLegalProcess (abuseDO p) c




theorem s1591e2_deontic_implies_ontology {p v : Person} {c : ComplaintText}
    (h : Deontic.Coercion1591e2 p v c) :
    Ontology.CoercionMembership (coercionDO p) (seriousHarmDO p) (abuseDO p) c := by
  refine { member := corr_do_coercionMember h, route := ?_ }
  unfold Deontic.Coercion1591e2 at h
  cases h with
  | inl hThreat =>
      exact Ontology.CoercionRoute.threatOfSeriousHarm
        (corr_do_isSeriousHarm hThreat.2) (corr_do_threatens hThreat.1 hThreat.2)
  | inr h1 =>
      cases h1 with
      | inl hRestraint =>
          exact Ontology.CoercionRoute.physicalRestraint (corr_do_restraint hRestraint)
      | inr h2 =>
          cases h2 with
          | inl hScheme =>
              exact Ontology.CoercionRoute.schemeOfSeriousHarm
                (corr_do_isSeriousHarm hScheme.2) (corr_do_scheme hScheme.1 hScheme.2)
          | inr hAbuse =>
              exact Ontology.CoercionRoute.abuseOfLegalProcess (corr_do_abuse hAbuse)



axiom corr_dp_commerce {p : Person} {c : ComplaintText} :
    Deontic.InterstateOrForeignCommerceNexus1591a1 p c →
    Procedure.InterstateOrForeignCommerceNexus (offenseOf p) c

axiom corr_dp_maritime {p : Person} {c : ComplaintText} :
    Deontic.SpecialMaritimeOrTerritorialJurisdiction1591a1 p c →
    Procedure.WithinSpecialMaritimeAndTerritorialJurisdiction (offenseOf p) c


theorem s1591a1_deontic_implies_procedure_jurisdiction {p : Person}
    {c : ComplaintText} (h : Deontic.Prohibition1591a1 p c) :
    Procedure.FederalJurisdictionAttaches (offenseOf p) c := by
  cases h.jurisdiction with
  | inl hc => exact Procedure.FederalJurisdictionAttaches.commerce (corr_dp_commerce hc)
  | inr hm =>
      exact Procedure.FederalJurisdictionAttaches.maritimeTerritorial (corr_dp_maritime hm)

axiom corr_dp_advertising {p v : Person} {c : ComplaintText} :
    Procedure.ActConstitutingViolationIsAdvertising (offenseOf p) c →
    Deontic.ActConstitutingViolationIsAdvertising1591a p v c

axiom corr_dp_knewMeans {p v : Person} {c : ComplaintText} :
    Deontic.ActuallyKnewMeansWillBeUsed1591a p v c →
    Procedure.GovernmentProvedKnowledgeOfCoerciveMeans (prosecutionOf p) c

axiom corr_dp_recklessMeans {p v : Person} {c : ComplaintText} :
    Deontic.RecklesslyDisregardedMeansWillBeUsed1591a p v c →
    Procedure.GovernmentProvedRecklessDisregardOfCoerciveMeans (prosecutionOf p) c

axiom corr_dp_knewMinor {p v : Person} {c : ComplaintText} :
    Deontic.ActuallyKnewVictimUnderStatutoryAge1591a p v c →
    Procedure.GovernmentProvedKnowledgeOfMinority (prosecutionOf p) c

axiom corr_dp_recklessMinor {p v : Person} {c : ComplaintText} :
    Deontic.RecklesslyDisregardedVictimUnderStatutoryAge1591a p v c →
    Procedure.GovernmentProvedRecklessDisregardOfMinority (prosecutionOf p) c

axiom corr_dp_age {p v : Person} {c : ComplaintText} :
    Deontic.VictimUnderStatutoryAge1591a v c →
    Procedure.ageOfVictimAtOffense v (offenseOf p) c < 18









theorem s1591a_deontic_implies_procedure_chapeau {p v : Person} {c : ComplaintText}
    (h : Deontic.MensReaTheory1591a p v c) :
    Procedure.ChapeauScienterBurdenDischarged
      (prosecutionOf p) p v (offenseOf p) c := by
  cases h with
  | byMeans hMeans hMens _ =>
      refine Procedure.ChapeauScienterBurdenDischarged.meansTheory ?_
      unfold Deontic.MensReaAsToMeans1591a at hMens
      cases hMens with
      | inl hk => exact Procedure.MeansScienterProved.actualKnowledge (corr_dp_knewMeans hk)
      | inr hr =>
          exact Procedure.MeansScienterProved.recklessDisregard
            (fun hy => hr.1 (corr_dp_advertising (v := v) hy)) (corr_dp_recklessMeans hr.2)
  | byMinority hAge hMens _ =>
      refine Procedure.ChapeauScienterBurdenDischarged.minorityTheory ?_ (corr_dp_age hAge)
      unfold Deontic.MensReaAsToMinority1591a at hMens
      cases hMens with
      | inl hk => exact Procedure.MinorityScienterProved.actualKnowledge (corr_dp_knewMinor hk)
      | inr hr =>
          exact Procedure.MinorityScienterProved.recklessDisregard
            (fun hy => hr.1 (corr_dp_advertising (v := v) hy)) (corr_dp_recklessMinor hr.2)



axiom corr_ds_knewMeans {p v : Person} {c : ComplaintText} :
    Deontic.ActuallyKnewMeansWillBeUsed1591a p v c →
    Scienter.MentalStateProven p Scienter.ScienterTarget.meansOfCompulsion
      MentalState.Knowledge c

axiom corr_ds_recklessMeans {p v : Person} {c : ComplaintText} :
    Deontic.RecklesslyDisregardedMeansWillBeUsed1591a p v c →
    Scienter.MentalStateProven p Scienter.ScienterTarget.meansOfCompulsion
      MentalState.Recklessness c

axiom corr_ds_knewMinor {p v : Person} {c : ComplaintText} :
    Deontic.ActuallyKnewVictimUnderStatutoryAge1591a p v c →
    Scienter.MentalStateProven p Scienter.ScienterTarget.victimMinority
      MentalState.Knowledge c

axiom corr_ds_recklessMinor {p v : Person} {c : ComplaintText} :
    Deontic.RecklesslyDisregardedVictimUnderStatutoryAge1591a p v c →
    Scienter.MentalStateProven p Scienter.ScienterTarget.victimMinority
      MentalState.Recklessness c

axiom corr_ds_notAdvertising {p v : Person} {c : ComplaintText} :
    ¬ Deontic.ActConstitutingViolationIsAdvertising1591a p v c →
    Scienter.actConstitutingViolationIsAdvertising1591 p c = false






theorem s1591a_deontic_implies_scienter_circumstance {p v : Person}
    {c : ComplaintText} (h : Deontic.MensReaTheory1591a p v c) :
    Scienter.Scienter1591aCircumstance p (Scienter.posture1591 p c) c := by
  cases h with
  | byMeans _ hMens _ =>
      refine Scienter.Scienter1591aCircumstance.byMeansOfCompulsion ?_
      unfold Deontic.MensReaAsToMeans1591a at hMens
      cases hMens with
      | inl hk =>
          exact ⟨MentalState.Knowledge, knowledge_atLeast_means _, corr_ds_knewMeans hk⟩
      | inr hr =>
          have hb : (Scienter.posture1591 p c).actIsAdvertising = false :=
            corr_ds_notAdvertising (v := v) hr.1
          exact ⟨MentalState.Recklessness, recklessness_atLeast_means hb,
                 corr_ds_recklessMeans hr.2⟩
  | byMinority _ hMens _ =>
      refine Scienter.Scienter1591aCircumstance.byVictimMinority ?_
      unfold Deontic.MensReaAsToMinority1591a at hMens
      cases hMens with
      | inl hk =>
          exact ⟨MentalState.Knowledge, knowledge_atLeast_age _, corr_ds_knewMinor hk⟩
      | inr hr =>
          have hb : (Scienter.posture1591 p c).actIsAdvertising = false :=
            corr_ds_notAdvertising (v := v) hr.1
          exact ⟨MentalState.Recklessness, recklessness_atLeast_age hb,
                 corr_ds_recklessMinor hr.2⟩









axiom corr_po_coercion {o : Procedure.Offense} {c : ComplaintText} :
    Procedure.OffenseEffectedByForceThreatsFraudOrCoercion o c →
    Ontology.IsCoercion (coercionPO o) c


theorem s1591e2_procedure_implies_ontology_membership {o : Procedure.Offense}
    {c : ComplaintText}
    (h : Procedure.OffenseEffectedByForceThreatsFraudOrCoercion o c) :
    Ontology.IsCoercion (coercionPO o) c :=
  corr_po_coercion h



axiom corr_ps_knowsMeans {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.GovernmentProvedKnowledgeOfCoerciveMeans pr c →
    Scienter.MentalStateProven p Scienter.ScienterTarget.meansOfCompulsion
      MentalState.Knowledge c

axiom corr_ps_recklessMeans {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.GovernmentProvedRecklessDisregardOfCoerciveMeans pr c →
    Scienter.MentalStateProven p Scienter.ScienterTarget.meansOfCompulsion
      MentalState.Recklessness c

axiom corr_ps_knowsMinor {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.GovernmentProvedKnowledgeOfMinority pr c →
    Scienter.MentalStateProven p Scienter.ScienterTarget.victimMinority
      MentalState.Knowledge c

axiom corr_ps_recklessMinor {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.GovernmentProvedRecklessDisregardOfMinority pr c →
    Scienter.MentalStateProven p Scienter.ScienterTarget.victimMinority
      MentalState.Recklessness c

axiom corr_ps_notAdvertising {p : Person} {o : Procedure.Offense}
    {c : ComplaintText} :
    ¬ Procedure.ActConstitutingViolationIsAdvertising o c →
    Scienter.actConstitutingViolationIsAdvertising1591 p c = false

axiom corr_ps_prosecutionUnderA1 {p : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.ProsecutionUnderSubsectionA1 pr c →
    Scienter.chargedUnderSubsection1591a1 p c = true

axiom corr_ps_observe {p v : Person} {c : ComplaintText} :
    Procedure.DefendantHadReasonableOpportunityToObserve p v c →
    Scienter.reasonableOpportunityToObserve1591c p c = true






theorem s1591a_procedure_implies_scienter_modulo_gaps {p v : Person}
    {pr : Procedure.Prosecution} {o : Procedure.Offense} {c : ComplaintText}
    (gap_1591c_route_supplies_no_proven_mental_state_rung :
      Scienter.MentalStateProven p Scienter.ScienterTarget.victimMinority
        MentalState.StrictLiability c)
    (h : Procedure.ChapeauScienterBurdenDischarged pr p v o c) :
    Scienter.Scienter1591aCircumstance p (Scienter.posture1591 p c) c := by
  cases h with
  | meansTheory hM =>
      refine Scienter.Scienter1591aCircumstance.byMeansOfCompulsion ?_
      cases hM with
      | actualKnowledge hk =>
          exact ⟨MentalState.Knowledge, knowledge_atLeast_means _,
                 corr_ps_knowsMeans (p := p) hk⟩
      | recklessDisregard hNotAdv hr =>
          have hb : (Scienter.posture1591 p c).actIsAdvertising = false :=
            corr_ps_notAdvertising (p := p) hNotAdv
          exact ⟨MentalState.Recklessness, recklessness_atLeast_means hb,
                 corr_ps_recklessMeans (p := p) hr⟩
  | minorityTheory hMin _ =>
      refine Scienter.Scienter1591aCircumstance.byVictimMinority ?_
      cases hMin with
      | actualKnowledge hk =>
          exact ⟨MentalState.Knowledge, knowledge_atLeast_age _,
                 corr_ps_knowsMinor (p := p) hk⟩
      | recklessDisregard hNotAdv hr =>
          have hb : (Scienter.posture1591 p c).actIsAdvertising = false :=
            corr_ps_notAdvertising (p := p) hNotAdv
          exact ⟨MentalState.Recklessness, recklessness_atLeast_age hb,
                 corr_ps_recklessMinor (p := p) hr⟩
      | subsectionCRelief hpros hopp =>
          exact Scienter.scienter1591aAge_underC
            (corr_ps_prosecutionUnderA1 (p := p) hpros)
            (corr_ps_observe hopp)
            MentalState.StrictLiability
            gap_1591c_route_supplies_no_proven_mental_state_rung








axiom corr_so_knowingParticipation {p : Person} {c : ComplaintText} :
    Scienter.Scienter1591e4 p c →
    Ontology.KnowinglyAssistsSupportsOrFacilitates
      (participationSO p) (traffickingConductSO p) c


theorem s1591e4_scienter_implies_ontology {p : Person} {c : ComplaintText}
    (h : Scienter.Scienter1591e4 p c) :
    Ontology.KnowinglyAssistsSupportsOrFacilitates
      (participationSO p) (traffickingConductSO p) c :=
  corr_so_knowingParticipation h

end Proving.USC.T18.Ch77.Part2.Bridge
