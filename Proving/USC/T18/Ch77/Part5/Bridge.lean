

































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part5.Elements.Theorems
import Proving.USC.T18.Ch77.Part5.Deontic.Theorems
import Proving.USC.T18.Ch77.Part5.Ontology.Theorems
import Proving.USC.T18.Ch77.Part5.Procedure.Theorems
import Proving.USC.T18.Ch77.Part5.Scienter.Theorems

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part5.Bridge

open Proving.USC.Common






private theorem k_ge_k : MentalState.atLeast .Knowledge .Knowledge :=
  MentalState.atLeast_refl _

private theorem r_ge_r : MentalState.atLeast .Recklessness .Recklessness :=
  MentalState.atLeast_refl _

private theorem k_ge_r : MentalState.atLeast .Knowledge .Recklessness := by
  unfold MentalState.atLeast
  decide













private theorem meansDemand_knowledge {a : Bool} {d : Person} {c : ComplaintText}
    (h : Scienter.MentalStateProvenAsTo d .meansCircumstance .Knowledge c) :
    Scienter.DemandMet (Scienter.RequiredMeansScienter1591a a) d .meansCircumstance c := by
  cases a
  · exact Scienter.demandMet_of_proven k_ge_r h
  · exact Scienter.demandMet_of_proven k_ge_k h

private theorem meansDemand_reckless {a : Bool} {d : Person} {c : ComplaintText}
    (ha : a = false)
    (h : Scienter.MentalStateProvenAsTo d .meansCircumstance .Recklessness c) :
    Scienter.DemandMet (Scienter.RequiredMeansScienter1591a a) d .meansCircumstance c := by
  subst ha
  exact Scienter.demandMet_of_proven r_ge_r h

private theorem ageDemand_knowledge {a u o : Bool} {d : Person} {c : ComplaintText}
    (h : Scienter.MentalStateProvenAsTo d .ageCircumstance .Knowledge c) :
    Scienter.DemandMet (Scienter.RequiredAgeScienter1591 a u o) d .ageCircumstance c := by
  cases u <;> cases o <;> cases a <;>
    first
      | exact trivial
      | exact Scienter.demandMet_of_proven k_ge_r h
      | exact Scienter.demandMet_of_proven k_ge_k h

private theorem ageDemand_reckless {a u o : Bool} {d : Person} {c : ComplaintText}
    (ha : a = false)
    (h : Scienter.MentalStateProvenAsTo d .ageCircumstance .Recklessness c) :
    Scienter.DemandMet (Scienter.RequiredAgeScienter1591 a u o) d .ageCircumstance c := by
  subst ha
  cases u <;> cases o <;>
    first
      | exact trivial
      | exact Scienter.demandMet_of_proven r_ge_r h











axiom corr_ed_knowingly {d : Person} {c : ComplaintText} :
    ActedWithScienter d c → Deontic.ActedKnowingly d c




axiom corr_ed_nexus {d : Person} {act : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.CommerceOrMaritimeNexus act c → Deontic.JurisdictionalNexusMet d c



axiom corr_ed_conduct {d v : Person} {act : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.TraffickingConduct1591a1 d act v c → Deontic.TraffickingActOccurred d v c



axiom corr_ed_notAdvertising {d : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    ¬ Elements.ViolatingActIsAdvertising act c →
    ¬ Deontic.ActConstitutingViolationIsAdvertising d c



axiom corr_ed_observe {d v : Person} {c : ComplaintText} :
    Elements.HadReasonableOpportunityToObservePerson d v c →
    Deontic.ReasonableOpportunityToObserve d v c
















theorem s1591a1_elements_implies_deontic_modulo_gaps
    {d v : Person} {act : Elements.TraffickingAct} {sx : Elements.SexAct}
    {c : ComplaintText}
    (hPros : Deontic.ProsecutionUnderSubsectionAOne c)
    (gap_elements_omits_deontic_addressee_class : Deontic.AddresseeAnyPerson d c)
    (gap_ed_means_object :
        (Elements.KnowsOfProhibitedCircumstance d v c →
            Elements.MeansRoute1591a d v sx c →
            Deontic.KnewCoerciveMeansWillBeUsed d v c) ∧
        (Elements.RecklesslyDisregardsProhibitedCircumstance d v c →
            Elements.MeansRoute1591a d v sx c →
            Deontic.RecklesslyDisregardedCoerciveMeans d v c))
    (gap_ed_minority_object :
        (Elements.KnowsOfProhibitedCircumstance d v c →
            Elements.MinorityRoute1591a v sx c →
            Deontic.KnewVictimUnderEighteen d v c) ∧
        (Elements.RecklesslyDisregardsProhibitedCircumstance d v c →
            Elements.MinorityRoute1591a v sx c →
            Deontic.RecklesslyDisregardedVictimUnderEighteen d v c))
    (h : Elements.Section1591a1 d act v sx c) :
    Deontic.Prohibition1591aViolated d v c :=
  ⟨⟨gap_elements_omits_deontic_addressee_class,
    corr_ed_knowingly h.knowingly,
    match h.circumstance with
    | .observedMinority hObs _ =>
        .asToMinority (.reasonableOpportunityToObserve hPros (corr_ed_observe hObs))
    | .general (.knowingMeans hk hR) =>
        .asToCoerciveMeans (.knowledge (gap_ed_means_object.1 hk hR))
    | .general (.recklessMeans hr hna hR) =>
        .asToCoerciveMeans
          (.recklessDisregard (corr_ed_notAdvertising hna) (gap_ed_means_object.2 hr hR))
    | .general (.knowingMinority hk hR) =>
        .asToMinority (.knowledge (gap_ed_minority_object.1 hk hR))
    | .general (.recklessMinority hr hna hR) =>
        .asToMinority
          (.recklessDisregard (corr_ed_notAdvertising hna) (gap_ed_minority_object.2 hr hR))⟩,
   .paragraphOne (corr_ed_nexus h.nexus) (corr_ed_conduct h.conduct)⟩






axiom corr_es_knowingly {d : Person} {c : ComplaintText} :
    ActedWithScienter d c →
    Scienter.MentalStateProvenAsTo d .traffickingActA1 .Knowledge c


axiom corr_es_notAdvertising {d : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    ¬ Elements.ViolatingActIsAdvertising act c → Scienter.actIsAdvertising d c = false


axiom corr_es_observe {d v : Person} {c : ComplaintText} :
    Elements.HadReasonableOpportunityToObservePerson d v c →
    Scienter.hadReasonableOpportunityToObserve d v c = true







theorem s1591a1_elements_implies_scienter_modulo_gaps
    {d v : Person} {act : Elements.TraffickingAct} {sx : Elements.SexAct}
    {c : ComplaintText}
    (hA1 : Scienter.chargedUnderParagraph1 d c = true)
    (gap_es_means_object :
        (Elements.KnowsOfProhibitedCircumstance d v c →
            Elements.MeansRoute1591a d v sx c →
            Scienter.MentalStateProvenAsTo d .meansCircumstance .Knowledge c) ∧
        (Elements.RecklesslyDisregardsProhibitedCircumstance d v c →
            Elements.MeansRoute1591a d v sx c →
            Scienter.MentalStateProvenAsTo d .meansCircumstance .Recklessness c))
    (gap_es_minority_object :
        (Elements.KnowsOfProhibitedCircumstance d v c →
            Elements.MinorityRoute1591a v sx c →
            Scienter.MentalStateProvenAsTo d .ageCircumstance .Knowledge c) ∧
        (Elements.RecklesslyDisregardsProhibitedCircumstance d v c →
            Elements.MinorityRoute1591a v sx c →
            Scienter.MentalStateProvenAsTo d .ageCircumstance .Recklessness c))
    (h : Elements.Section1591a1 d act v sx c) :
    Scienter.Scienter1591a1 d v c :=
  ⟨Scienter.demandMet_of_proven k_ge_k (corr_es_knowingly h.knowingly),
   match h.circumstance with
   | .observedMinority hObs _ =>
       .byAge (Scienter.ageScienter_relieved_by1591c hA1 (corr_es_observe hObs))
   | .general (.knowingMeans hk hR) =>
       .byMeans (meansDemand_knowledge (gap_es_means_object.1 hk hR))
   | .general (.recklessMeans hr hna hR) =>
       .byMeans (meansDemand_reckless (corr_es_notAdvertising hna) (gap_es_means_object.2 hr hR))
   | .general (.knowingMinority hk hR) =>
       .byAge (ageDemand_knowledge (gap_es_minority_object.1 hk hR))
   | .general (.recklessMinority hr hna hR) =>
       .byAge (ageDemand_reckless (corr_es_notAdvertising hna) (gap_es_minority_object.2 hr hR))⟩






axiom corr_ds_meansKnowledge {d v : Person} {c : ComplaintText} :
    Deontic.KnewCoerciveMeansWillBeUsed d v c →
    Scienter.MentalStateProvenAsTo d .meansCircumstance .Knowledge c

axiom corr_ds_meansReckless {d v : Person} {c : ComplaintText} :
    Deontic.RecklesslyDisregardedCoerciveMeans d v c →
    Scienter.MentalStateProvenAsTo d .meansCircumstance .Recklessness c

axiom corr_ds_minorityKnowledge {d v : Person} {c : ComplaintText} :
    Deontic.KnewVictimUnderEighteen d v c →
    Scienter.MentalStateProvenAsTo d .ageCircumstance .Knowledge c

axiom corr_ds_minorityReckless {d v : Person} {c : ComplaintText} :
    Deontic.RecklesslyDisregardedVictimUnderEighteen d v c →
    Scienter.MentalStateProvenAsTo d .ageCircumstance .Recklessness c

axiom corr_ds_notAdvertising {d : Person} {c : ComplaintText} :
    ¬ Deontic.ActConstitutingViolationIsAdvertising d c →
    Scienter.actIsAdvertising d c = false



axiom corr_ds_underA1 {d : Person} {c : ComplaintText} :
    Deontic.ProsecutionUnderSubsectionAOne c → Scienter.chargedUnderParagraph1 d c = true

axiom corr_ds_observe {d v : Person} {c : ComplaintText} :
    Deontic.ReasonableOpportunityToObserve d v c →
    Scienter.hadReasonableOpportunityToObserve d v c = true



theorem s1591a_deontic_implies_scienter {d v : Person} {c : ComplaintText}
    (h : Deontic.Scienter1591a d v c) : Scienter.CircumstanceScienter1591 d v c :=
  match h with
  | .asToCoerciveMeans (.knowledge hk) =>
      .byMeans (meansDemand_knowledge (corr_ds_meansKnowledge hk))
  | .asToCoerciveMeans (.recklessDisregard hna hr) =>
      .byMeans (meansDemand_reckless (corr_ds_notAdvertising hna) (corr_ds_meansReckless hr))
  | .asToMinority (.knowledge hk) =>
      .byAge (ageDemand_knowledge (corr_ds_minorityKnowledge hk))
  | .asToMinority (.recklessDisregard hna hr) =>
      .byAge (ageDemand_reckless (corr_ds_notAdvertising hna) (corr_ds_minorityReckless hr))
  | .asToMinority (.reasonableOpportunityToObserve hPros hObs) =>
      .byAge (Scienter.ageScienter_relieved_by1591c (corr_ds_underA1 hPros) (corr_ds_observe hObs))







axiom corr_ps_meansKnowledge {d : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.KnowledgeOfMeansProved d pr c →
    Scienter.MentalStateProvenAsTo d .meansCircumstance .Knowledge c

axiom corr_ps_meansReckless {d : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.RecklessDisregardOfMeansProved d pr c →
    Scienter.MentalStateProvenAsTo d .meansCircumstance .Recklessness c

axiom corr_ps_minorityKnowledge {d : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.KnowledgeOfMinorityProved d pr c →
    Scienter.MentalStateProvenAsTo d .ageCircumstance .Knowledge c

axiom corr_ps_minorityReckless {d : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.RecklessDisregardOfMinorityProved d pr c →
    Scienter.MentalStateProvenAsTo d .ageCircumstance .Recklessness c

axiom corr_ps_notAdvertising {d : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    ¬ Procedure.ChargedConductIsAdvertising d pr c →
    Scienter.actIsAdvertising d c = false

axiom corr_ps_underA1 {d : Person} {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.ChargedUnderSubsectionA1 d pr c →
    Scienter.chargedUnderParagraph1 d c = true

axiom corr_ps_observe {d v : Person} {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.ReasonableOpportunityToObserveProved d pr c →
    Scienter.hadReasonableOpportunityToObserve d v c = true



theorem s1591a_procedure_implies_scienter
    {d v : Person} {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Procedure.SubsectionAScienterSatisfied d pr c) :
    Scienter.CircumstanceScienter1591 d v c :=
  match h with
  | .inl (.inl hk) => .byMeans (meansDemand_knowledge (corr_ps_meansKnowledge hk))
  | .inl (.inr ⟨hna, hr⟩) =>
      .byMeans (meansDemand_reckless (corr_ps_notAdvertising hna) (corr_ps_meansReckless hr))
  | .inr (.inl (.inl hk)) => .byAge (ageDemand_knowledge (corr_ps_minorityKnowledge hk))
  | .inr (.inl (.inr ⟨hna, hr⟩)) =>
      .byAge (ageDemand_reckless (corr_ps_notAdvertising hna) (corr_ps_minorityReckless hr))
  | .inr (.inr ⟨hA1, hObs⟩) =>
      .byAge (Scienter.ageScienter_relieved_by1591c (corr_ps_underA1 hA1) (corr_ps_observe hObs))



axiom corr_pd_nexus {d : Person} {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.FederalJurisdictionalNexusProved d pr c → Deontic.JurisdictionalNexusMet d c

axiom corr_pd_act {d v : Person} {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.ProhibitedTraffickingActProved d pr c → Deontic.TraffickingActOccurred d v c

axiom corr_pd_benefit {d : Person} {ven : Deontic.Venture}
    {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.VentureBenefitProved d pr c → Deontic.BenefitFromVentureOccurred d ven c

axiom corr_pd_meansKnowledge {d v : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.KnowledgeOfMeansProved d pr c → Deontic.KnewCoerciveMeansWillBeUsed d v c

axiom corr_pd_meansReckless {d v : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.RecklessDisregardOfMeansProved d pr c →
    Deontic.RecklesslyDisregardedCoerciveMeans d v c

axiom corr_pd_minorityKnowledge {d v : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.KnowledgeOfMinorityProved d pr c → Deontic.KnewVictimUnderEighteen d v c

axiom corr_pd_minorityReckless {d v : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Procedure.RecklessDisregardOfMinorityProved d pr c →
    Deontic.RecklesslyDisregardedVictimUnderEighteen d v c

axiom corr_pd_notAdvertising {d : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    ¬ Procedure.ChargedConductIsAdvertising d pr c →
    ¬ Deontic.ActConstitutingViolationIsAdvertising d c

axiom corr_pd_observe {d v : Person} {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.ReasonableOpportunityToObserveProved d pr c →
    Deontic.ReasonableOpportunityToObserve d v c
















theorem s1591a_procedure_implies_deontic_modulo_gaps
    {d v : Person} {ven : Deontic.Venture} {pr : Procedure.Prosecution}
    {c : ComplaintText}
    (hPros : Deontic.ProsecutionUnderSubsectionAOne c)
    (gap_procedure_omits_deontic_addressee_class : Deontic.AddresseeAnyPerson d c)
    (gap_procedure_omits_chapeau_knowingly : Deontic.ActedKnowingly d c)
    (gap_procedure_folds_venture_benefit_and_venture_violation :
        Deontic.VentureEngagedInParagraphOneViolation ven v c)
    (h : Procedure.GovernmentProofUnderSubsectionA d pr c) :
    Deontic.Prohibition1591aViolated d v c :=
  ⟨⟨gap_procedure_omits_deontic_addressee_class,
    gap_procedure_omits_chapeau_knowingly,
    match h.scienter with
    | .inl (.inl hk) => .asToCoerciveMeans (.knowledge (corr_pd_meansKnowledge hk))
    | .inl (.inr ⟨hna, hr⟩) =>
        .asToCoerciveMeans
          (.recklessDisregard (corr_pd_notAdvertising hna) (corr_pd_meansReckless hr))
    | .inr (.inl (.inl hk)) => .asToMinority (.knowledge (corr_pd_minorityKnowledge hk))
    | .inr (.inl (.inr ⟨hna, hr⟩)) =>
        .asToMinority
          (.recklessDisregard (corr_pd_notAdvertising hna) (corr_pd_minorityReckless hr))
    | .inr (.inr ⟨_, hObs⟩) =>
        .asToMinority (.reasonableOpportunityToObserve hPros (corr_pd_observe hObs))⟩,
   match h.conduct with
   | .inl ⟨_, hAct⟩ => .paragraphOne (corr_pd_nexus h.jurisdiction) (corr_pd_act hAct)
   | .inr ⟨_, hBen⟩ =>
       .paragraphTwo ven gap_procedure_folds_venture_benefit_and_venture_violation
         (corr_pd_benefit hBen)⟩














theorem s1591c_route_elements_implies_scienter
    {d v : Person} {sx : Elements.SexAct} {c : ComplaintText}
    (hA1 : Scienter.chargedUnderParagraph1 d c = true) :
    Elements.HadReasonableOpportunityToObservePerson d v c →
    Elements.MinorityRoute1591a v sx c →
    Scienter.CircumstanceScienter1591 d v c :=
  fun hObs _ => .byAge (Scienter.ageScienter_relieved_by1591c hA1 (corr_es_observe hObs))




theorem s1591c_route_deontic_implies_scienter {d v : Person} {c : ComplaintText}
    (h : Deontic.MinorityScienter d v c) : Scienter.CircumstanceScienter1591 d v c :=
  match h with
  | .knowledge hk => .byAge (ageDemand_knowledge (corr_ds_minorityKnowledge hk))
  | .recklessDisregard hna hr =>
      .byAge (ageDemand_reckless (corr_ds_notAdvertising hna) (corr_ds_minorityReckless hr))
  | .reasonableOpportunityToObserve hPros hObs =>
      .byAge (Scienter.ageScienter_relieved_by1591c (corr_ds_underA1 hPros) (corr_ds_observe hObs))


theorem s1591c_route_procedure_implies_scienter
    {d v : Person} {pr : Procedure.Prosecution} {c : ComplaintText}
    (h : Procedure.MinorityScienterProofSatisfied d pr c) :
    Scienter.CircumstanceScienter1591 d v c :=
  match h with
  | .inl (.inl hk) => .byAge (ageDemand_knowledge (corr_ps_minorityKnowledge hk))
  | .inl (.inr ⟨hna, hr⟩) =>
      .byAge (ageDemand_reckless (corr_ps_notAdvertising hna) (corr_ps_minorityReckless hr))
  | .inr ⟨hA1, hObs⟩ =>
      .byAge (Scienter.ageScienter_relieved_by1591c (corr_ps_underA1 hA1) (corr_ps_observe hObs))



axiom corr_pe_observe {d v : Person} {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.ReasonableOpportunityToObserveProved d pr c →
    Elements.HadReasonableOpportunityToObservePerson d v c












theorem s1591c_route_procedure_implies_elements_modulo_gaps
    {d v : Person} {act : Elements.TraffickingAct} {sx : Elements.SexAct}
    {pr : Procedure.Prosecution} {c : ComplaintText}
    (gap_1591c_route_procedure_omits_objective_minority_and_result_facts :
        Elements.MinorityRoute1591a v sx c)
    (h : Procedure.MinorityScienterProofExcused d pr c) :
    Elements.CircumstanceEstablished1591a1 d act v sx c :=
  .observedMinority (corr_pe_observe h.2)
    gap_1591c_route_procedure_omits_objective_minority_and_result_facts



axiom corr_ed_obstruction {d : Person} {oa : Elements.ObstructiveAct}
    {c : ComplaintText} :
    Elements.ObstructiveConduct1591d d oa c → Deontic.ObstructionActOccurred d c

axiom corr_pe_obstruction {d : Person} {oa : Elements.ObstructiveAct}
    {pr : Procedure.Prosecution} {c : ComplaintText} :
    Procedure.EnforcementObstructionProved d pr c →
    Elements.ObstructiveConduct1591d d oa c









theorem s1591d_elements_implies_deontic_modulo_gaps
    {d : Person} {oa : Elements.ObstructiveAct} {c : ComplaintText}
    (gap_elements_omits_deontic_addressee_class_1591d : Deontic.AddresseeAnyPerson d c)
    (gap_elements_omits_enforcement_at_issue : Deontic.EnforcementOfSectionAtIssue c)
    (h : Elements.Section1591d d oa c) :
    Deontic.Prohibition1591dViolated d c :=
  ⟨⟨gap_elements_omits_deontic_addressee_class_1591d,
    gap_elements_omits_enforcement_at_issue⟩,
   corr_ed_obstruction h.conduct⟩




theorem s1591d_procedure_implies_elements
    {d : Person} {oa : Elements.ObstructiveAct} {pr : Procedure.Prosecution}
    {c : ComplaintText}
    (h : Procedure.ObstructionConviction d pr c) : Elements.Section1591d d oa c :=
  ⟨corr_pe_obstruction h.obstruction⟩









axiom seamSexAct : Ontology.SexAct → Elements.SexAct


axiom seamVenture : Ontology.Venture → Elements.Venture



axiom corr_oe_threats {m : Ontology.CoerciveMeans} {v : Person} {c : ComplaintText} :
    Ontology.IsCoercion m c → Elements.ThreatsOfSeriousHarmOrPhysicalRestraint v c


axiom corr_oe_scheme {m : Ontology.CoerciveMeans} {v : Person} {c : ComplaintText} :
    Ontology.IsSchemePlanOrPattern m c →
    Elements.SchemeCausingBeliefOfSeriousHarmOrRestraint v c


axiom corr_oe_process {u : Ontology.LegalProcessAbuse} {v : Person} {c : ComplaintText} :
    Ontology.IsAbuseOrThreatenedAbuseOfLegalProcess u c →
    Elements.AbuseOrThreatenedAbuseOfLawOrLegalProcess v c


theorem s1591e2_ontology_implies_elements_coercion
    {m : Ontology.CoerciveMeans} {v : Person} {c : ComplaintText}
    (h : Ontology.CoercionMembership m c) : Elements.Coercion1591e2 v c :=
  match h with
  | .threatOfSeriousHarm _ _ _ _ hMem => .threats (corr_oe_threats hMem)
  | .physicalRestraint _ _ hMem => .threats (corr_oe_threats hMem)
  | .schemePlanOrPattern _ hScheme _ _ _ => .scheme (corr_oe_scheme hScheme)
  | .abuseOfLegalProcess _ _ hAbuse _ => .process (corr_oe_process hAbuse)


axiom corr_oe_sexAct {a : Ontology.SexAct} {c : ComplaintText} :
    Ontology.IsSexAct a c → Elements.IsSexAct (seamSexAct a) c




axiom corr_oe_value {a : Ontology.SexAct} {tv : Ontology.ThingOfValue} {p : Person}
    {c : ComplaintText} :
    Ontology.IsThingOfValue tv c →
    Ontology.ThingOfValueGivenOrReceivedOnAccountOf tv a p c →
    Elements.AnythingOfValueGivenOrReceived (seamSexAct a) c



theorem s1591e3_ontology_implies_elements_commercialSexAct
    {a : Ontology.SexAct} {tv : Ontology.ThingOfValue} {p : Person} {c : ComplaintText}
    (h : Ontology.CommercialSexActMembership a tv p c) :
    Elements.CommercialSexAct1591e3 (seamSexAct a) c :=
  ⟨corr_oe_sexAct h.sexAct, corr_oe_value h.valueItem h.onAccountOf⟩


axiom corr_oe_group {ven : Ontology.Venture} {c : ComplaintText} :
    Ontology.HasTwoOrMoreIndividuals ven c →
    Elements.GroupOfTwoOrMoreIndividuals (seamVenture ven) c


axiom corr_oe_associated {ven : Ontology.Venture} {c : ComplaintText} :
    Ontology.AssociatedInFact ven c → Elements.AssociatedInFact (seamVenture ven) c




theorem s1591e6_ontology_implies_elements_venture
    {ven : Ontology.Venture} {c : ComplaintText}
    (h : Ontology.VentureMembership ven c) :
    Elements.Venture1591e6 (seamVenture ven) c :=
  ⟨corr_oe_group h.twoOrMore, corr_oe_associated h.associatedInFact⟩

end Proving.USC.T18.Ch77.Part5.Bridge
