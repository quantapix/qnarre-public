










































import Proving.USC.T18.Ch77.Part4.Elements.Theorems
import Proving.USC.T18.Ch77.Part4.Deontic.Theorems
import Proving.USC.T18.Ch77.Part4.Ontology.Theorems
import Proving.USC.T18.Ch77.Part4.Procedure.Theorems
import Proving.USC.T18.Ch77.Part4.Scienter.Theorems

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Bridge

open Proving.USC.Common










axiom dMeans : Elements.TraffickingAct → Deontic.Means

axiom dHarm : Elements.TraffickingAct → Deontic.Harm

axiom dVenture : Elements.Venture → Deontic.Venture

axiom pProsecution : Elements.TraffickingAct → Procedure.Prosecution

axiom pChargedAct : Elements.TraffickingAct → Procedure.ChargedAct


axiom oMeansOf : Person → Person → Ontology.Means


axiom oHarmOf : Person → Ontology.Harm

axiom oVenture : Elements.Venture → Ontology.Venture

axiom odMeans : Deontic.Means → Ontology.Means





axiom corr_es_chapeauAct {d : Person} {c : ComplaintText} :
    ActedWithScienter d c →
    Scienter.DemandMet Scienter.RequiredMentalState1591aConduct d
      Scienter.ScienterElement.traffickingAct c



axiom corr_es_chapeauBenefit {d : Person} {c : ComplaintText} :
    ActedWithScienter d c →
    Scienter.DemandMet Scienter.RequiredMentalState1591aConduct d
      Scienter.ScienterElement.benefitFromVenture c



axiom corr_es_ventureAssist {d : Person} {ven : Elements.Venture} {c : ComplaintText} :
    Elements.ParticipatesInVenture d ven c →
    Scienter.DemandMet Scienter.RequiredMentalState1591e4 d
      Scienter.ScienterElement.ventureAssistance c



axiom corr_es_knowsMeans {d v : Person} {c : ComplaintText} :
    Elements.KnowsMeansWillBeUsed d v c →
    Scienter.ProvenAtLeast d Scienter.ScienterElement.meansCircumstance
      MentalState.Knowledge c


axiom corr_es_recklessMeans {d v : Person} {c : ComplaintText} :
    Elements.RecklesslyDisregardsMeansWillBeUsed d v c →
    Scienter.ProvenAtLeast d Scienter.ScienterElement.meansCircumstance
      MentalState.Recklessness c



axiom corr_es_knowsAge {d v : Person} {c : ComplaintText} :
    Elements.KnowsVictimUnderageAndWillBeCaused d v c →
    Scienter.ProvenAtLeast d Scienter.ScienterElement.ageCircumstance
      MentalState.Knowledge c



axiom corr_es_recklessAge {d v : Person} {c : ComplaintText} :
    Elements.RecklesslyDisregardsVictimUnderageAndWillBeCaused d v c →
    Scienter.ProvenAtLeast d Scienter.ScienterElement.ageCircumstance
      MentalState.Recklessness c



axiom corr_es_notAdvertising {d : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    ¬ Elements.ViolationActIsAdvertising act c →
    ¬ Scienter.ActConstitutingViolationIsAdvertising d c



axiom corr_es_prosecutionA1 {d v : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.ParagraphOneConduct d act v c → Scienter.ProsecutionUnderParagraphOne c


axiom corr_es_observe {d v : Person} {c : ComplaintText} :
    Elements.HadReasonableOpportunityToObserve d v c →
    Scienter.ReasonableOpportunityToObserve d v c











theorem s1591c_relief_route_needs_no_proven_rung
    {d v : Person} {act : Elements.TraffickingAct} {c : ComplaintText}
    (hConduct : Elements.ParagraphOneConduct d act v c)
    (hObserve : Elements.HadReasonableOpportunityToObserve d v c) :
    Scienter.AgeCircumstanceScienterMet d v c :=
  Or.inl ⟨corr_es_prosecutionA1 hConduct, corr_es_observe hObserve⟩




theorem s1591a_mensRea_elements_implies_scienter
    {d v : Person} {act : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.MensRea1591a d act v c) :
    Scienter.CircumstanceScienter1591 d v c := by
  cases h with
  | means hm =>
      refine Scienter.CircumstanceScienter1591.byMeans ?_
      cases hm with
      | knowing hk => exact Scienter.circumstanceScienterMet_of_knowledge (corr_es_knowsMeans hk)
      | reckless hr hNotAd =>
          exact Scienter.circumstanceScienterMet_of_recklessness
            (fun ha => absurd ha (corr_es_notAdvertising hNotAd))
            (corr_es_recklessMeans hr)
  | age ha =>
      refine Scienter.CircumstanceScienter1591.byAge ?_
      cases ha with
      | knowing _ _ hk =>
          exact Or.inr (Scienter.circumstanceScienterMet_of_knowledge (corr_es_knowsAge hk))
      | reckless _ _ hr hNotAd =>
          exact Or.inr (Scienter.circumstanceScienterMet_of_recklessness
            (fun hx => absurd hx (corr_es_notAdvertising hNotAd))
            (corr_es_recklessAge hr))
      | reasonableOpportunityToObserve _ _ hConduct hObs =>
          exact s1591c_relief_route_needs_no_proven_rung hConduct hObs




theorem s1591a_elements_implies_scienter
    {d v : Person} {ven : Elements.Venture} {act : Elements.TraffickingAct}
    {c : ComplaintText}
    (h : Elements.Section1591a d ven act v c) :
    Scienter.Scienter1591Culpable d v c := by
  have hCirc : Scienter.CircumstanceScienter1591 d v c :=
    s1591a_mensRea_elements_implies_scienter h.mensRea
  cases h.conduct with
  | paragraphOne _ =>
      exact Scienter.Scienter1591Culpable.viaParagraphOne
        ⟨corr_es_chapeauAct h.knowingly, hCirc⟩
  | paragraphTwo hp =>
      exact Scienter.Scienter1591Culpable.viaParagraphTwo
        ⟨corr_es_chapeauBenefit h.knowingly,
         corr_es_ventureAssist hp.participation, hCirc⟩




axiom corr_ep_commerce {act : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.InOrAffectingInterstateOrForeignCommerce act c →
    Procedure.InOrAffectingInterstateOrForeignCommerce (pProsecution act) c


axiom corr_ep_smtj {act : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.WithinSpecialMaritimeAndTerritorialJurisdiction act c →
    Procedure.WithinSpecialMaritimeAndTerritorialJurisdiction (pProsecution act) c



axiom corr_ep_chapeau {d : Person} {act : Elements.TraffickingAct} {c : ComplaintText} :
    ActedWithScienter d c →
    Procedure.GovernmentProvedKnowingActusReus (pProsecution act) c



axiom corr_ep_knowsMeans {d v : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.KnowsMeansWillBeUsed d v c →
    Procedure.GovernmentProvedKnowledgeOfMeansTheory (pProsecution act) c



axiom corr_ep_recklessMeans {d v : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.RecklesslyDisregardsMeansWillBeUsed d v c →
    Procedure.GovernmentProvedRecklessDisregardOfMeansTheory (pProsecution act) c



axiom corr_ep_knowsAge {d v : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.KnowsVictimUnderageAndWillBeCaused d v c →
    Procedure.GovernmentProvedKnowledgeOfMinorityTheory (pProsecution act) c



axiom corr_ep_recklessAge {d v : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.RecklesslyDisregardsVictimUnderageAndWillBeCaused d v c →
    Procedure.GovernmentProvedRecklessDisregardOfMinorityTheory (pProsecution act) c



axiom corr_ep_nonAdvertising {act : Elements.TraffickingAct} {c : ComplaintText} :
    ¬ Elements.ViolationActIsAdvertising act c →
    Procedure.ChargedActIsNonAdvertisingEnumeratedAct (pChargedAct act) c


axiom corr_ep_prosecutionA1 {d v : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.ParagraphOneConduct d act v c →
    Procedure.ProsecutionUnderSubsectionA1 (pProsecution act) c


axiom corr_ep_observe {d v : Person} {c : ComplaintText} :
    Elements.HadReasonableOpportunityToObserve d v c →
    Procedure.ReasonableOpportunityToObserve d v c







theorem s1591a_mensRea_elements_implies_procedure
    {d v : Person} {act : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.MensRea1591a d act v c) :
    Procedure.ScienterProofObligationDischarged
      (pProsecution act) d v (pChargedAct act) c := by
  cases h with
  | means hm =>
      cases hm with
      | knowing hk =>
          exact Procedure.ScienterProofObligationDischarged.meansKnowledge
            (corr_ep_knowsMeans hk)
      | reckless hr hNotAd =>
          exact Procedure.ScienterProofObligationDischarged.meansReckless
            (corr_ep_nonAdvertising hNotAd) (corr_ep_recklessMeans hr)
  | age ha =>
      cases ha with
      | knowing _ _ hk =>
          exact Procedure.ScienterProofObligationDischarged.minorityKnowledge
            (corr_ep_knowsAge hk)
      | reckless _ _ hr hNotAd =>
          exact Procedure.ScienterProofObligationDischarged.minorityReckless
            (corr_ep_nonAdvertising hNotAd) (corr_ep_recklessAge hr)
      | reasonableOpportunityToObserve _ _ hConduct hObs =>
          exact Procedure.ScienterProofObligationDischarged.subsectionCRelief
            (corr_ep_prosecutionA1 hConduct) (corr_ep_observe hObs)











theorem s1591a1_elements_implies_procedure
    {d v : Person} {act : Elements.TraffickingAct} {c : ComplaintText}
    (hKnowingly : ActedWithScienter d c)
    (hConduct : Elements.ParagraphOneConduct d act v c)
    (hMens : Elements.MensRea1591a d act v c) :
    Procedure.FederalJurisdictionEstablished (pProsecution act) c
      ∧ Procedure.GovernmentProvedKnowingActusReus (pProsecution act) c
      ∧ Procedure.ScienterProofObligationDischarged
          (pProsecution act) d v (pChargedAct act) c := by
  refine ⟨?_, corr_ep_chapeau hKnowingly,
          s1591a_mensRea_elements_implies_procedure hMens⟩
  cases hConduct.jurisdiction with
  | commerce hc => exact Procedure.FederalJurisdictionEstablished.commerce (corr_ep_commerce hc)
  | maritimeTerritorial hm =>
      exact Procedure.FederalJurisdictionEstablished.enclave (corr_ep_smtj hm)





axiom corr_sp_conduct {d : Person} {pr : Procedure.Prosecution} {c : ComplaintText} :
    Scienter.DemandMet Scienter.RequiredMentalState1591aConduct d
      Scienter.ScienterElement.traffickingAct c →
    Procedure.GovernmentProvedKnowingActusReus pr c





axiom corr_sp_means {d : Person} {pr : Procedure.Prosecution}
    {ca : Procedure.ChargedAct} {c : ComplaintText} :
    Scienter.CircumstanceScienterMet d Scienter.ScienterElement.meansCircumstance c →
    Procedure.GovernmentProvedKnowledgeOfMeansTheory pr c
      ∨ (Procedure.ChargedActIsNonAdvertisingEnumeratedAct ca c ∧
         Procedure.GovernmentProvedRecklessDisregardOfMeansTheory pr c)



axiom corr_sp_age {d : Person} {pr : Procedure.Prosecution}
    {ca : Procedure.ChargedAct} {c : ComplaintText} :
    Scienter.CircumstanceScienterMet d Scienter.ScienterElement.ageCircumstance c →
    Procedure.GovernmentProvedKnowledgeOfMinorityTheory pr c
      ∨ (Procedure.ChargedActIsNonAdvertisingEnumeratedAct ca c ∧
         Procedure.GovernmentProvedRecklessDisregardOfMinorityTheory pr c)


axiom corr_sp_prosecutionA1 {pr : Procedure.Prosecution} {c : ComplaintText} :
    Scienter.ProsecutionUnderParagraphOne c → Procedure.ProsecutionUnderSubsectionA1 pr c


axiom corr_sp_observe {d v : Person} {c : ComplaintText} :
    Scienter.ReasonableOpportunityToObserve d v c →
    Procedure.ReasonableOpportunityToObserve d v c












theorem s1591a1_scienter_implies_procedure
    {d v : Person} {pr : Procedure.Prosecution} {ca : Procedure.ChargedAct}
    {c : ComplaintText}
    (h : Scienter.Scienter1591a1 d v c) :
    Procedure.GovernmentProvedKnowingActusReus pr c
      ∧ Procedure.ScienterProofObligationDischarged pr d v ca c := by
  refine ⟨corr_sp_conduct h.conduct, ?_⟩
  cases h.circumstance with
  | byMeans hm =>
      cases corr_sp_means (ca := ca) (pr := pr) hm with
      | inl hk => exact Procedure.ScienterProofObligationDischarged.meansKnowledge hk
      | inr hr =>
          exact Procedure.ScienterProofObligationDischarged.meansReckless hr.1 hr.2
  | byAge ha =>
      cases ha with
      | inl hRelief =>
          exact Procedure.ScienterProofObligationDischarged.subsectionCRelief
            (corr_sp_prosecutionA1 hRelief.1) (corr_sp_observe hRelief.2)
      | inr hProved =>
          cases corr_sp_age (ca := ca) (pr := pr) hProved with
          | inl hk => exact Procedure.ScienterProofObligationDischarged.minorityKnowledge hk
          | inr hr =>
              exact Procedure.ScienterProofObligationDischarged.minorityReckless hr.1 hr.2











axiom corr_de_addressee {d v : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    Deontic.ActTraffickingConduct1591a1 d v c →
    Elements.PerformsProhibitedTraffickingAct d act v c



axiom corr_de_jurisdiction {d v : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    Deontic.CommerceOrMaritimeNexus1591a1 d v c →
    Elements.InOrAffectingInterstateOrForeignCommerce act c


axiom corr_de_chapeau {d : Person} {c : ComplaintText} :
    Deontic.ActedKnowingly d c → ActedWithScienter d c


axiom corr_de_knewMeans {d v : Person} {m : Deontic.Means} {c : ComplaintText} :
    Deontic.KnewMeansCondition1591a d v m c → Elements.KnowsMeansWillBeUsed d v c


axiom corr_de_recklessMeans {d v : Person} {m : Deontic.Means} {c : ComplaintText} :
    Deontic.RecklesslyDisregardedMeansCondition1591a d v m c →
    Elements.RecklesslyDisregardsMeansWillBeUsed d v c


axiom corr_de_knewAge {d v : Person} {c : ComplaintText} :
    Deontic.KnewUnderageCondition1591a d v c →
    Elements.KnowsVictimUnderageAndWillBeCaused d v c


axiom corr_de_recklessAge {d v : Person} {c : ComplaintText} :
    Deontic.RecklesslyDisregardedUnderageCondition1591a d v c →
    Elements.RecklesslyDisregardsVictimUnderageAndWillBeCaused d v c



axiom corr_de_notAdvertising {d : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    ¬ Deontic.ActConstitutingViolationIsAdvertising1591a d c →
    ¬ Elements.ViolationActIsAdvertising act c





axiom corr_de_under18 {v : Person} {c : ComplaintText} :
    Deontic.VictimUnderEighteenWillBeCaused1591a v c →
    Elements.victimAgeYearsAtOffense v c < 18


axiom corr_de_willBeCaused {v : Person} {c : ComplaintText} :
    Deontic.VictimUnderEighteenWillBeCaused1591a v c →
    Elements.WillBeCausedToEngageInCommercialSexAct v c



theorem s1591a_mensRea_deontic_implies_elements
    {d v : Person} {m : Deontic.Means} {hm : Deontic.Harm}
    {act : Elements.TraffickingAct} {c : ComplaintText}
    (h : Deontic.TraffickingMensRea1591a d v m hm c) :
    Elements.MensRea1591a d act v c := by
  cases h with
  | byForceFraudOrCoercion hmeans =>
      refine Elements.MensRea1591a.means ?_
      cases hmeans.2 with
      | inl hk => exact Elements.MensReaAsToMeans.knowing (corr_de_knewMeans hk)
      | inr hr =>
          exact Elements.MensReaAsToMeans.reckless (corr_de_recklessMeans hr.2)
            (corr_de_notAdvertising hr.1)
  | byVictimMinority hmin =>
      refine Elements.MensRea1591a.age ?_
      cases hmin.2 with
      | inl hk =>
          exact Elements.MensReaAsToAge.knowing (corr_de_under18 hmin.1)
            (corr_de_willBeCaused hmin.1) (corr_de_knewAge hk)
      | inr hr =>
          exact Elements.MensReaAsToAge.reckless (corr_de_under18 hmin.1)
            (corr_de_willBeCaused hmin.1) (corr_de_recklessAge hr.2)
            (corr_de_notAdvertising hr.1)




theorem s1591a1_deontic_implies_elements
    {d v : Person} {m : Deontic.Means} {hm : Deontic.Harm}
    {ven : Elements.Venture} {act : Elements.TraffickingAct} {c : ComplaintText}
    (h : Deontic.Prohibition1591a1Violated d v m hm c) :
    Elements.Section1591a d ven act v c :=
  ⟨corr_de_chapeau h.1.scienter,
   Elements.Conduct1591a.paragraphOne
     ⟨Elements.JurisdictionalNexus1591a1.commerce (corr_de_jurisdiction h.1.jurisdiction),
      corr_de_addressee h.2⟩,
   s1591a_mensRea_deontic_implies_elements h.1.mensRea⟩




axiom corr_ds_chapeau {d : Person} {c : ComplaintText} :
    Deontic.ActedKnowingly d c →
    Scienter.DemandMet Scienter.RequiredMentalState1591aConduct d
      Scienter.ScienterElement.traffickingAct c


axiom corr_ds_knewMeans {d v : Person} {m : Deontic.Means} {c : ComplaintText} :
    Deontic.KnewMeansCondition1591a d v m c →
    Scienter.ProvenAtLeast d Scienter.ScienterElement.meansCircumstance
      MentalState.Knowledge c


axiom corr_ds_recklessMeans {d v : Person} {m : Deontic.Means} {c : ComplaintText} :
    Deontic.RecklesslyDisregardedMeansCondition1591a d v m c →
    Scienter.ProvenAtLeast d Scienter.ScienterElement.meansCircumstance
      MentalState.Recklessness c


axiom corr_ds_knewAge {d v : Person} {c : ComplaintText} :
    Deontic.KnewUnderageCondition1591a d v c →
    Scienter.ProvenAtLeast d Scienter.ScienterElement.ageCircumstance
      MentalState.Knowledge c


axiom corr_ds_recklessAge {d v : Person} {c : ComplaintText} :
    Deontic.RecklesslyDisregardedUnderageCondition1591a d v c →
    Scienter.ProvenAtLeast d Scienter.ScienterElement.ageCircumstance
      MentalState.Recklessness c


axiom corr_ds_notAdvertising {d : Person} {c : ComplaintText} :
    ¬ Deontic.ActConstitutingViolationIsAdvertising1591a d c →
    ¬ Scienter.ActConstitutingViolationIsAdvertising d c





theorem s1591a1_deontic_implies_scienter
    {d v : Person} {m : Deontic.Means} {hm : Deontic.Harm} {c : ComplaintText}
    (h : Deontic.Prohibition1591a1 d v m hm c) :
    Scienter.Scienter1591a1 d v c := by
  refine ⟨corr_ds_chapeau h.scienter, ?_⟩
  cases h.mensRea with
  | byForceFraudOrCoercion hmeans =>
      refine Scienter.CircumstanceScienter1591.byMeans ?_
      cases hmeans.2 with
      | inl hk => exact Scienter.circumstanceScienterMet_of_knowledge (corr_ds_knewMeans hk)
      | inr hr =>
          exact Scienter.circumstanceScienterMet_of_recklessness
            (fun ha => absurd ha (corr_ds_notAdvertising hr.1)) (corr_ds_recklessMeans hr.2)
  | byVictimMinority hmin =>
      refine Scienter.CircumstanceScienter1591.byAge (Or.inr ?_)
      cases hmin.2 with
      | inl hk => exact Scienter.circumstanceScienterMet_of_knowledge (corr_ds_knewAge hk)
      | inr hr =>
          exact Scienter.circumstanceScienterMet_of_recklessness
            (fun ha => absurd ha (corr_ds_notAdvertising hr.1)) (corr_ds_recklessAge hr.2)




axiom corr_dp_chapeau {d : Person} {pr : Procedure.Prosecution} {c : ComplaintText} :
    Deontic.ActedKnowingly d c → Procedure.GovernmentProvedKnowingActusReus pr c



axiom corr_dp_knewMeans {d v : Person} {m : Deontic.Means}
    {pr : Procedure.Prosecution} {c : ComplaintText} :
    Deontic.KnewMeansCondition1591a d v m c →
    Procedure.GovernmentProvedKnowledgeOfMeansTheory pr c



axiom corr_dp_recklessMeans {d v : Person} {m : Deontic.Means}
    {pr : Procedure.Prosecution} {c : ComplaintText} :
    Deontic.RecklesslyDisregardedMeansCondition1591a d v m c →
    Procedure.GovernmentProvedRecklessDisregardOfMeansTheory pr c



axiom corr_dp_knewAge {d v : Person} {pr : Procedure.Prosecution} {c : ComplaintText} :
    Deontic.KnewUnderageCondition1591a d v c →
    Procedure.GovernmentProvedKnowledgeOfMinorityTheory pr c



axiom corr_dp_recklessAge {d v : Person} {pr : Procedure.Prosecution}
    {c : ComplaintText} :
    Deontic.RecklesslyDisregardedUnderageCondition1591a d v c →
    Procedure.GovernmentProvedRecklessDisregardOfMinorityTheory pr c



axiom corr_dp_nonAdvertising {d : Person} {ca : Procedure.ChargedAct}
    {c : ComplaintText} :
    ¬ Deontic.ActConstitutingViolationIsAdvertising1591a d c →
    Procedure.ChargedActIsNonAdvertisingEnumeratedAct ca c





theorem s1591a1_deontic_implies_procedure
    {d v : Person} {m : Deontic.Means} {hm : Deontic.Harm}
    {pr : Procedure.Prosecution} {ca : Procedure.ChargedAct} {c : ComplaintText}
    (h : Deontic.Prohibition1591a1 d v m hm c) :
    Procedure.GovernmentProvedKnowingActusReus pr c
      ∧ Procedure.ScienterProofObligationDischarged pr d v ca c := by
  refine ⟨corr_dp_chapeau h.scienter, ?_⟩
  cases h.mensRea with
  | byForceFraudOrCoercion hmeans =>
      cases hmeans.2 with
      | inl hk =>
          exact Procedure.ScienterProofObligationDischarged.meansKnowledge (corr_dp_knewMeans hk)
      | inr hr =>
          exact Procedure.ScienterProofObligationDischarged.meansReckless
            (corr_dp_nonAdvertising hr.1) (corr_dp_recklessMeans hr.2)
  | byVictimMinority hmin =>
      cases hmin.2 with
      | inl hk =>
          exact Procedure.ScienterProofObligationDischarged.minorityKnowledge (corr_dp_knewAge hk)
      | inr hr =>
          exact Procedure.ScienterProofObligationDischarged.minorityReckless
            (corr_dp_nonAdvertising hr.1) (corr_dp_recklessAge hr.2)
























axiom corr_ed_knewMeans {d v : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.KnowsMeansWillBeUsed d v c →
    Deontic.KnewMeansCondition1591a d v (dMeans act) c


axiom corr_ed_recklessMeans {d v : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    Elements.RecklesslyDisregardsMeansWillBeUsed d v c →
    Deontic.RecklesslyDisregardedMeansCondition1591a d v (dMeans act) c


axiom corr_ed_knewAge {d v : Person} {c : ComplaintText} :
    Elements.KnowsVictimUnderageAndWillBeCaused d v c →
    Deontic.KnewUnderageCondition1591a d v c


axiom corr_ed_recklessAge {d v : Person} {c : ComplaintText} :
    Elements.RecklesslyDisregardsVictimUnderageAndWillBeCaused d v c →
    Deontic.RecklesslyDisregardedUnderageCondition1591a d v c


axiom corr_ed_notAdvertising {d : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    ¬ Elements.ViolationActIsAdvertising act c →
    ¬ Deontic.ActConstitutingViolationIsAdvertising1591a d c



axiom corr_ed_under18AndCaused {v : Person} {c : ComplaintText} :
    Elements.VictimUnderEighteen v c →
    Elements.WillBeCausedToEngageInCommercialSexAct v c →
    Deontic.VictimUnderEighteenWillBeCaused1591a v c




theorem s1591a_meansRoute_elements_implies_deontic_modulo_gaps
    {d v : Person} {act : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.MensReaAsToMeans d act v c)
    (gap_means_route_supplies_no_objective_means_or_result :
        Elements.MensReaAsToMeans d act v c →
        Deontic.MeansWillCauseCommercialSexAct1591a v (dMeans act) (dHarm act) c) :
    Deontic.TraffickingMensRea1591a d v (dMeans act) (dHarm act) c := by
  refine Deontic.TraffickingMensRea1591a.byForceFraudOrCoercion
    ⟨gap_means_route_supplies_no_objective_means_or_result h, ?_⟩
  cases h with
  | knowing hk => exact Or.inl (corr_ed_knewMeans hk)
  | reckless hr hNotAd => exact Or.inr ⟨corr_ed_notAdvertising hNotAd, corr_ed_recklessMeans hr⟩





theorem s1591a_knownMinorityRoute_elements_implies_deontic
    {d v : Person} {act : Elements.TraffickingAct} {c : ComplaintText}
    (hUnder18 : Elements.VictimUnderEighteen v c)
    (hCaused : Elements.WillBeCausedToEngageInCommercialSexAct v c)
    (hMind : Elements.KnowsVictimUnderageAndWillBeCaused d v c
             ∨ (¬ Elements.ViolationActIsAdvertising act c ∧
                Elements.RecklesslyDisregardsVictimUnderageAndWillBeCaused d v c)) :
    Deontic.TraffickingMensRea1591a d v (dMeans act) (dHarm act) c := by
  refine Deontic.TraffickingMensRea1591a.byVictimMinority
    ⟨corr_ed_under18AndCaused hUnder18 hCaused, ?_⟩
  cases hMind with
  | inl hk => exact Or.inl (corr_ed_knewAge hk)
  | inr hr => exact Or.inr ⟨corr_ed_notAdvertising hr.1, corr_ed_recklessAge hr.2⟩




axiom corr_eo_seriousHarm {v : Person} {c : ComplaintText} :
    Elements.SeriousHarm1591e5 v c → Ontology.IsSeriousHarm (oHarmOf v) c


axiom corr_eo_threat {d v : Person} {c : ComplaintText} :
    Elements.ThreatensSeriousHarmToAnyPerson d v c →
    Ontology.ThreatensSeriousHarmToPerson (oMeansOf d v) v (oHarmOf v) c


axiom corr_eo_restraint {d v : Person} {c : ComplaintText} :
    Elements.ThreatensOrUsesPhysicalRestraint d v c →
    Ontology.ThreatensPhysicalRestraintAgainstPerson (oMeansOf d v) v c


axiom corr_eo_scheme {d v : Person} {c : ComplaintText} :
    Elements.EmploysSchemeCausingBeliefOfSeriousHarm d v c →
    Ontology.SchemeInducingBeliefOfHarmFromNonperformance (oMeansOf d v) v (oHarmOf v) c


axiom corr_eo_abuse {d v : Person} {c : ComplaintText} :
    Elements.AbuseOfLegalProcess1591e1 d v c →
    Ontology.IsAbuseOrThreatenedAbuseOfLegalProcess (oMeansOf d v) c


axiom corr_eo_coercionTerm {d v : Person} {c : ComplaintText} :
    Elements.Coercion1591e2 d v c → Ontology.IsCoercion (oMeansOf d v) c





theorem s1591e2_elements_implies_ontology
    {d v : Person} {c : ComplaintText}
    (h : Elements.Coercion1591e2 d v c) :
    Ontology.CoercionTerm (oMeansOf d v) v (oHarmOf v) c := by
  refine ⟨?_, corr_eo_coercionTerm h⟩
  cases h with
  | threatsOfSeriousHarm ht hs =>
      exact Ontology.CoercionMembership.threatOfSeriousHarm (corr_eo_threat ht)
        (corr_eo_seriousHarm hs)
  | physicalRestraint hr => exact Ontology.CoercionMembership.physicalRestraint (corr_eo_restraint hr)
  | schemePlanOrPattern hs hser =>
      exact Ontology.CoercionMembership.schemeOfSeriousHarm (corr_eo_scheme hs)
        (corr_eo_seriousHarm hser)
  | abuseOfLegalProcess hab =>
      exact Ontology.CoercionMembership.abuseOfLegalProcess (corr_eo_abuse hab)


axiom corr_eo_twoOrMore {ven : Elements.Venture} {c : ComplaintText} :
    2 ≤ Elements.ventureMemberCount ven c →
    Ontology.HasTwoOrMoreIndividuals (oVenture ven) c


axiom corr_eo_assoc {ven : Elements.Venture} {c : ComplaintText} :
    Elements.MembersAssociatedInFact ven c → Ontology.IsAssociatedInFact (oVenture ven) c


axiom corr_eo_ventureTerm {ven : Elements.Venture} {c : ComplaintText} :
    Elements.Venture1591e6 ven c → Ontology.IsVenture (oVenture ven) c



theorem s1591e6_elements_implies_ontology
    {ven : Elements.Venture} {c : ComplaintText}
    (h : Elements.Venture1591e6 ven c) :
    Ontology.VentureMembership (oVenture ven) c :=
  ⟨corr_eo_twoOrMore h.twoOrMoreIndividuals, corr_eo_assoc h.associatedInFact,
   corr_eo_ventureTerm h⟩


axiom corr_do_coercionTerm {m : Deontic.Means} {hm : Deontic.Harm} {c : ComplaintText} :
    Deontic.CoercionUnder1591e2 m hm c → Ontology.IsCoercion (odMeans m) c



theorem s1591e2_deontic_implies_ontology
    {m : Deontic.Means} {hm : Deontic.Harm} {c : ComplaintText}
    (h : Deontic.CoercionUnder1591e2 m hm c) :
    Ontology.IsCoercion (odMeans m) c :=
  corr_do_coercionTerm h




axiom corr_ep_notEffected {d v : Person} {act : Elements.TraffickingAct}
    {c : ComplaintText} :
    ¬ Elements.EffectedByMeans1591b1 d v c →
    ¬ Procedure.OffenseEffectedByForceFraudOrCoercion (pProsecution act) c



axiom corr_ep_ageBand {v : Person} {act : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.VictimAtLeastFourteenAndUnderEighteen v c →
    Procedure.AtLeastFourteenAndUnderEighteenAtOffense (pProsecution act) c





theorem s1591b2_elements_implies_procedure
    {d v : Person} {ven : Elements.Venture} {act : Elements.TraffickingAct}
    {c : ComplaintText}
    (h : Elements.Section1591b2 d ven act v c) :
    Procedure.Section1591TierTwoTrigger (pProsecution act) c :=
  ⟨corr_ep_notEffected (act := act) h.notSoEffected, corr_ep_ageBand (act := act) h.ageBand⟩


axiom corr_de_obstructionAddressee {d : Person} {oact : Elements.ObstructionAct}
    {c : ComplaintText} :
    Elements.ObstructiveConduct1591d d oact c → Deontic.AddresseeWhoever d c


axiom corr_de_obstructionAct {d : Person} {oact : Elements.ObstructionAct}
    {c : ComplaintText} :
    Elements.Section1591d d oact c → Deontic.ActObstructEnforcement1591d d c


theorem s1591d_elements_implies_deontic
    {d : Person} {oact : Elements.ObstructionAct} {c : ComplaintText}
    (h : Elements.Section1591d d oact c) :
    Deontic.Prohibition1591dViolated d c :=
  ⟨⟨corr_de_obstructionAddressee h.conduct⟩, corr_de_obstructionAct h⟩



axiom corr_ep_obstructs {d : Person} {oact : Elements.ObstructionAct}
    {c : ComplaintText} :
    Elements.ObstructsEnforcement d oact c →
    Procedure.ObstructsOrInterferesWithEnforcement d c


axiom corr_ep_attempts {d : Person} {oact : Elements.ObstructionAct}
    {c : ComplaintText} :
    Elements.AttemptsToObstructEnforcement d oact c →
    Procedure.AttemptsToObstructEnforcement d c




axiom corr_ep_interferes {d : Person} {oact : Elements.ObstructionAct}
    {c : ComplaintText} :
    Elements.InterferesWithOrPreventsEnforcement d oact c →
    Procedure.ObstructsOrInterferesWithEnforcement d c


theorem s1591d_elements_implies_procedure
    {d : Person} {oact : Elements.ObstructionAct} {c : ComplaintText}
    (h : Elements.Section1591d d oact c) :
    Procedure.Section1591dObstructiveConduct d c := by
  cases h.conduct with
  | obstructs ho => exact Procedure.Section1591dObstructiveConduct.completed (corr_ep_obstructs ho)
  | attemptsToObstruct ha =>
      exact Procedure.Section1591dObstructiveConduct.attempted (corr_ep_attempts ha)
  | interferesOrPrevents hi =>
      exact Procedure.Section1591dObstructiveConduct.completed (corr_ep_interferes hi)











def s1591_pairwise_gapFree : Prop :=
  (∀ {d v : Person} {ven : Elements.Venture} {act : Elements.TraffickingAct}
      {c : ComplaintText},
      Elements.Section1591a d ven act v c → Scienter.Scienter1591Culpable d v c)
  ∧ (∀ {d v : Person} {act : Elements.TraffickingAct} {c : ComplaintText},
      Elements.MensRea1591a d act v c →
      Procedure.ScienterProofObligationDischarged
        (pProsecution act) d v (pChargedAct act) c)
  ∧ (∀ {d v : Person} {pr : Procedure.Prosecution} {ca : Procedure.ChargedAct}
      {c : ComplaintText},
      Scienter.Scienter1591a1 d v c →
      Procedure.GovernmentProvedKnowingActusReus pr c
        ∧ Procedure.ScienterProofObligationDischarged pr d v ca c)
  ∧ (∀ {d v : Person} {m : Deontic.Means} {hm : Deontic.Harm}
      {ven : Elements.Venture} {act : Elements.TraffickingAct} {c : ComplaintText},
      Deontic.Prohibition1591a1Violated d v m hm c →
      Elements.Section1591a d ven act v c)
  ∧ (∀ {d v : Person} {m : Deontic.Means} {hm : Deontic.Harm} {c : ComplaintText},
      Deontic.Prohibition1591a1 d v m hm c → Scienter.Scienter1591a1 d v c)
  ∧ (∀ {d v : Person} {m : Deontic.Means} {hm : Deontic.Harm}
      {pr : Procedure.Prosecution} {ca : Procedure.ChargedAct} {c : ComplaintText},
      Deontic.Prohibition1591a1 d v m hm c →
      Procedure.GovernmentProvedKnowingActusReus pr c
        ∧ Procedure.ScienterProofObligationDischarged pr d v ca c)







theorem s1591_pairwise_gapFree_witness : s1591_pairwise_gapFree :=
  ⟨fun h => s1591a_elements_implies_scienter h,
   fun h => s1591a_mensRea_elements_implies_procedure h,
   fun h => s1591a1_scienter_implies_procedure h,
   fun h => s1591a1_deontic_implies_elements h,
   fun h => s1591a1_deontic_implies_scienter h,
   fun h => s1591a1_deontic_implies_procedure h⟩

end Proving.USC.T18.Ch77.Part4.Bridge
