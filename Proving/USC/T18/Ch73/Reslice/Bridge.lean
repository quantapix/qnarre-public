








































import Proving.USC.T18.Ch73.Reslice.Elements.Statute
import Proving.USC.T18.Ch73.Reslice.Deontic.Statute
import Proving.USC.T18.Ch73.Reslice.Ontology.Statute
import Proving.USC.T18.Ch73.Reslice.Procedure.Statute
import Proving.USC.T18.Ch73.Reslice.Scienter.Statute
import Proving.USC.T18.Ch73.Reslice.Structure.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Bridge

open Proving.USC.Common (Person Entity Agreement ComplaintText ProximateCause ActedWithScienter)
open Proving.USC.T18.Ch73.Reslice











axiom mapProcED : Elements.OfficialProceeding → Deontic.OfficialProceeding

axiom mapProcEO : Elements.OfficialProceeding → Ontology.Proceeding

axiom mapProcEP : Elements.OfficialProceeding → Procedure.OfficialProceeding

axiom mapProcDO : Deontic.OfficialProceeding → Ontology.Proceeding

axiom mapProcDP : Deontic.OfficialProceeding → Procedure.OfficialProceeding

axiom mapProcOP : Ontology.Proceeding → Procedure.OfficialProceeding

axiom mapDistDP : Deontic.District → Procedure.District








namespace ED




axiom corr_addressee {d v : Person} {r : Elements.RecordOrObject}
    {pr : Elements.OfficialProceeding} {o : Person} {ag : Agreement} {c : ComplaintText} :
    Elements.Section1512Offense d v r pr o ag c → Deontic.IsPersonSubjectToSection1512 d c



axiom corr_forum {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    Elements.IsOfficialProceeding pr c → Deontic.IsOfficialProceeding1515a1 (mapProcED pr) c



axiom corr_officer {o : Person} {c : ComplaintText} :
    Elements.IsFederalLawEnforcementOfficerOrJudge o c →
    Deontic.IsLawEnforcementOfficerOrJudge1515a4 o c





axiom corr_a1_attendance {d : Person} {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    Elements.IntentToPreventAttendanceOrTestimony d pr c →
    Deontic.IntentToPreventOrInfluenceTestimonyOrEvidence1512 d (mapProcED pr) c



axiom corr_a1_production {d : Person} {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    Elements.IntentToPreventProductionOfRecord d pr c →
    Deontic.IntentToPreventOrInfluenceTestimonyOrEvidence1512 d (mapProcED pr) c



axiom corr_comm_prevent {d o : Person} {c : ComplaintText} :
    Elements.IntentToPreventCommunicationToFederalOfficer d o c →
    Deontic.IntentToHinderLawEnforcementCommunication1512 d o c



axiom corr_act_kill {d v : Person} {c : ComplaintText} :
    Elements.KillingConduct1512a1 d v c → Deontic.KillsOrAttemptsToKill1512a1 d v c



theorem obstructiveIntent_a1 {d : Person} {pr : Elements.OfficialProceeding} {o : Person}
    {c : ComplaintText} (h : Elements.KillingIntent1512a1 d pr o c) :
    Deontic.ObstructiveIntent1512a1 d c :=
  match h with
  | .preventAttendanceOrTestimony hp hi =>
      .proceeding (mapProcED pr) (corr_forum hp) (corr_a1_attendance hi)
  | .preventProduction hp hi =>
      .proceeding (mapProcED pr) (corr_forum hp) (corr_a1_production hi)
  | .preventCommunication ho hi =>
      .communication o (corr_officer ho) (corr_comm_prevent hi)











def DirectedAt (d v : Person) (c : ComplaintText) : Prop :=
  Elements.ForceConduct1512a2 d v c ∨ Elements.TamperingConduct1512b d v c


axiom corr_influence {d : Person} {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    Elements.IntentToInfluenceDelayOrPreventTestimony d pr c →
    Deontic.IntentToPreventOrInfluenceTestimonyOrEvidence1512 d (mapProcED pr) c



axiom corr_induce_withhold {d v : Person} {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    DirectedAt d v c → Elements.IntentToCauseWithholdingOfTestimonyOrObject d pr c →
    Deontic.IntentToInduceWitnessNoncompliance1512 d v (mapProcED pr) c



axiom corr_induce_impair {d v : Person} {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    DirectedAt d v c → Elements.IntentToCauseObjectImpairment d pr c →
    Deontic.IntentToInduceWitnessNoncompliance1512 d v (mapProcED pr) c


axiom corr_induce_evade {d v : Person} {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    DirectedAt d v c → Elements.IntentToCauseEvasionOfLegalProcess d pr c →
    Deontic.IntentToInduceWitnessNoncompliance1512 d v (mapProcED pr) c


axiom corr_induce_absence {d v : Person} {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    DirectedAt d v c → Elements.IntentToCauseAbsenceFromProceeding d pr c →
    Deontic.IntentToInduceWitnessNoncompliance1512 d v (mapProcED pr) c



axiom corr_comm_hinder {d o : Person} {c : ComplaintText} :
    Elements.IntentToHinderCommunicationToFederalOfficer d o c →
    Deontic.IntentToHinderLawEnforcementCommunication1512 d o c



theorem obstructiveIntent_a2b {d v : Person} {pr : Elements.OfficialProceeding} {o : Person}
    {c : ComplaintText} (hDir : DirectedAt d v c) (h : Elements.TamperingIntent1512 d pr o c) :
    Deontic.ObstructiveIntent1512a2b d c :=
  match h with
  | .influenceTestimony hp hi =>
      .proceeding (mapProcED pr) (corr_forum hp) (corr_influence hi)
  | .causeWithholding hp hi =>
      .inducement v (mapProcED pr) (corr_forum hp) (corr_induce_withhold hDir hi)
  | .causeObjectImpairment hp hi =>
      .inducement v (mapProcED pr) (corr_forum hp) (corr_induce_impair hDir hi)
  | .causeEvasion hp hi =>
      .inducement v (mapProcED pr) (corr_forum hp) (corr_induce_evade hDir hi)
  | .causeAbsence hp hi =>
      .inducement v (mapProcED pr) (corr_forum hp) (corr_induce_absence hDir hi)
  | .hinderCommunication ho hi =>
      .communication o (corr_officer ho) (corr_comm_hinder hi)




axiom corr_act_force {d v : Person} {c : ComplaintText} :
    Elements.ForceConduct1512a2 d v c → Deontic.UsesOrThreatensPhysicalForce1512a2 d v c




axiom corr_force_qualifies {d v : Person} {c : ComplaintText} :
    Elements.ForceConduct1512a2 d v c → Deontic.IsPhysicalForce1515a2 d v c




axiom corr_b_intimidation {d v : Person} {c : ComplaintText} :
    Elements.UsesIntimidation d v c → Deontic.UsesIntimidationOrThreatens1512b d v c

axiom corr_b_threat {d v : Person} {c : ComplaintText} :
    Elements.ThreatensAnotherPerson d v c → Deontic.UsesIntimidationOrThreatens1512b d v c


axiom corr_b_attempt {d v : Person} {c : ComplaintText} :
    Elements.AttemptsIntimidationThreatOrPersuasion d v c →
    Deontic.UsesIntimidationOrThreatens1512b d v c

axiom corr_b_persuade {d v : Person} {c : ComplaintText} :
    Elements.CorruptlyPersuades d v c → Deontic.CorruptlyPersuades1515a6 d v c



axiom corr_b_persuade_excl {d v : Person} {c : ComplaintText} :
    Elements.CorruptlyPersuades d v c →
    ¬ Deontic.WouldBeMisleadingConductButForStateOfMind1515a6 d v c

axiom corr_b_misleading {d v : Person} {c : ComplaintText} :
    Elements.EngagesInMisleadingConduct d v c → Deontic.IsMisleadingConduct1515a3 d v c



theorem act_b {d v : Person} {c : ComplaintText} (h : Elements.TamperingConduct1512b d v c) :
    Deontic.Act1512b d v c :=
  match h with
  | .intimidation hi => .intimidation (corr_b_intimidation hi)
  | .threat ht => .intimidation (corr_b_threat ht)
  | .attempt ha => .intimidation (corr_b_attempt ha)
  | .corruptPersuasion hp => .corruptPersuasion (corr_b_persuade hp) (corr_b_persuade_excl hp)
  | .misleadingConduct hm => .misleadingConduct (corr_b_misleading hm)



axiom corr_knowingly {d : Person} {c : ComplaintText} :
    ActedWithScienter d c → Deontic.ActedKnowingly1512b d c




axiom corr_corruptly {d : Person} {c : ComplaintText} :
    Elements.ActsCorruptly d c → Deontic.ActedCorruptly1512c d c



axiom corr_c1_act {d : Person} {r : Elements.RecordOrObject}
    {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    Elements.ObjectTampering1512c1 d r c → Elements.ActsCorruptly d c →
    Deontic.CorruptlyAltersDestroysOrConceals1512c1 d (mapProcED pr) c


axiom corr_c1_intent {d : Person} {r : Elements.RecordOrObject}
    {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    Elements.IntentToImpairObjectForProceeding d r pr c →
    Deontic.IntentToImpairObjectIntegrity1512c1 d (mapProcED pr) c


axiom corr_c2_act {d : Person} {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    Elements.ObstructionConduct1512c2 d pr c → Elements.ActsCorruptly d c →
    Deontic.CorruptlyObstructsOfficialProceeding1512c2 d (mapProcED pr) c


theorem act_c {d : Person} {r : Elements.RecordOrObject} {pr : Elements.OfficialProceeding}
    {c : ComplaintText} (h : Elements.Section1512c d r pr c) : Deontic.Act1512c d c :=
  match h with
  | .objectImpairment hCorrupt hi =>
      .recordImpairment (mapProcED pr) (corr_forum hi.proceeding)
        (corr_c1_act hi.conduct hCorrupt) (corr_c1_intent hi.intent)
  | .otherObstruction hCorrupt hi =>
      .otherObstruction (mapProcED pr) (corr_forum hi.proceeding)
        (corr_c2_act hi.conduct hCorrupt)




axiom corr_d_act {d v : Person} {c : ComplaintText} :
    Elements.IntentionallyHarasses d v c → Deontic.IntentionallyHarasses1512d d v c

axiom corr_d_scienter {d v : Person} {c : ComplaintText} :
    Elements.IntentionallyHarasses d v c → Deontic.ActedIntentionally1512d d c


axiom corr_d_causation {d v : Person} {c : ComplaintText} :
    Elements.IntentionallyHarasses d v c → ProximateCause d c →
    Deontic.HarassmentCausedDissuasion1512d d v c

axiom corr_d1 {v : Person} {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    Elements.DissuadedFromAttendingOrTestifying v pr c →
    Deontic.DissuadedFromAttendingOrTestifying1512d1 v c

axiom corr_d2 {v o : Person} {c : ComplaintText} :
    Elements.DissuadedFromReportingToFederalOfficer v o c →
    Deontic.DissuadedFromReportingToLawEnforcement1512d2 v c

axiom corr_d3 {v : Person} {c : ComplaintText} :
    Elements.DissuadedFromSeekingArrest v c → Deontic.DissuadedFromSeekingArrest1512d3 v c

axiom corr_d4 {v : Person} {c : ComplaintText} :
    Elements.DissuadedFromCausingProsecutionOrRevocation v c →
    Deontic.DissuadedFromCausingProsecution1512d4 v c



theorem protectedActivity_d {v : Person} {pr : Elements.OfficialProceeding} {o : Person}
    {c : ComplaintText} (h : Elements.HarassmentEffect1512d v pr o c) :
    Deontic.ProtectedActivity1512d v c :=
  match h with
  | .attendanceOrTestimony _ hd => .attendOrTestify (corr_d1 hd)
  | .reporting _ hd => .reportToLawEnforcement (corr_d2 hd)
  | .arrest hd => .seekArrest (corr_d3 hd)
  | .prosecutionOrRevocation hd => .causeProsecution (corr_d4 hd)





axiom corr_k {d : Person} {ag : Agreement} {c : ComplaintText} :
    Elements.Section1512k d ag c → Deontic.ConspiresToCommitSection1512Offense1512k d c










axiom corr_escape_defense {d : Person} {c : ComplaintText} :
    Deontic.AffirmativeDefenseLawfulTruthfulPersuasion1512e d c →
    Elements.LawfulConductSolelyToEncourageTruthfulTestimony d c


axiom corr_escape_repr {d : Person} {c : ComplaintText} :
    Deontic.LawfulBonaFideLegalRepresentation1515c d c →
    Elements.LawfulBonaFideLegalRepresentation d c


theorem noEscape {d v : Person} {r : Elements.RecordOrObject} {pr : Elements.OfficialProceeding}
    {o : Person} {ag : Agreement} {c : ComplaintText}
    (h : Elements.ValidSection1512Prosecution d v r pr o ag c) : ¬ Deontic.Escape1512 d c :=
  fun he =>
    match he with
    | Or.inl hd => h.noTruthfulTestimonyDefense (corr_escape_defense hd.lawfulConductOnly)
    | Or.inr hr => h.noLegalRepresentationCarveOut (corr_escape_repr hr)





theorem s1512a1_elements_implies_deontic {d v : Person} {pr : Elements.OfficialProceeding}
    {o : Person} {c : ComplaintText} (hAddr : Deontic.IsPersonSubjectToSection1512 d c)
    (hNo : ¬ Deontic.Escape1512 d c) (h : Elements.Section1512a1 d v pr o c) :
    Deontic.Prohibition1512a1Violated d v c :=
  ⟨⟨hAddr, obstructiveIntent_a1 h.intent⟩, corr_act_kill h.conduct, hNo⟩


theorem s1512a2_elements_implies_deontic {d v : Person} {pr : Elements.OfficialProceeding}
    {o : Person} {c : ComplaintText} (hAddr : Deontic.IsPersonSubjectToSection1512 d c)
    (hNo : ¬ Deontic.Escape1512 d c) (h : Elements.Section1512a2 d v pr o c) :
    Deontic.Prohibition1512a2Violated d v c :=
  ⟨⟨hAddr, obstructiveIntent_a2b (Or.inl h.conduct) h.intent⟩,
   ⟨corr_act_force h.conduct, corr_force_qualifies h.conduct⟩, hNo⟩


theorem s1512b_elements_implies_deontic {d v : Person} {pr : Elements.OfficialProceeding}
    {o : Person} {c : ComplaintText} (hAddr : Deontic.IsPersonSubjectToSection1512 d c)
    (hNo : ¬ Deontic.Escape1512 d c) (h : Elements.Section1512b d v pr o c) :
    Deontic.Prohibition1512bViolated d v c :=
  ⟨⟨hAddr, corr_knowingly h.knowingly, obstructiveIntent_a2b (Or.inr h.conduct) h.intent⟩,
   act_b h.conduct, hNo⟩


theorem s1512c_elements_implies_deontic {d : Person} {r : Elements.RecordOrObject}
    {pr : Elements.OfficialProceeding} {c : ComplaintText}
    (hAddr : Deontic.IsPersonSubjectToSection1512 d c) (hNo : ¬ Deontic.Escape1512 d c)
    (hCorrupt : Elements.ActsCorruptly d c) (h : Elements.Section1512c d r pr c) :
    Deontic.Prohibition1512cViolated d c :=
  ⟨⟨hAddr, corr_corruptly hCorrupt⟩, act_c h, hNo⟩




theorem s1512d_completed_elements_implies_deontic {d v : Person}
    {pr : Elements.OfficialProceeding} {o : Person} {c : ComplaintText}
    (hAddr : Deontic.IsPersonSubjectToSection1512 d c) (hNo : ¬ Deontic.Escape1512 d c)
    (h : Elements.HarassmentCompleted1512d d v pr o c) :
    Deontic.Prohibition1512dViolated d v c :=
  ⟨⟨hAddr, corr_d_scienter h.harassment⟩, corr_d_act h.harassment,
   corr_d_causation h.harassment h.causation, protectedActivity_d h.effect, hNo⟩


theorem s1512k_elements_implies_deontic {d : Person} {ag : Agreement} {c : ComplaintText}
    (hAddr : Deontic.IsPersonSubjectToSection1512 d c) (hNo : ¬ Deontic.Escape1512 d c)
    (h : Elements.Section1512k d ag c) : Deontic.Prohibition1512kViolated d c :=
  ⟨⟨hAddr⟩, corr_k h, hNo⟩

















theorem s1512_elements_implies_deontic_modulo_gaps {d v : Person}
    {r : Elements.RecordOrObject} {pr : Elements.OfficialProceeding} {o : Person}
    {ag : Agreement} {c : ComplaintText}
    (gap_1512d_attempt : Elements.IntentionallyHarasses d v c →
      Elements.AttemptsToHarassAndDissuade d v c → Deontic.Prohibition1512dViolated d v c)
    (h : Elements.ValidSection1512Prosecution d v r pr o ag c) :
    Deontic.Section1512Offense d c :=
  match h.offense with
  | .killing hk =>
      .killing v (s1512a1_elements_implies_deontic (corr_addressee h.offense) (noEscape h) hk)
  | .force hf =>
      .force v (s1512a2_elements_implies_deontic (corr_addressee h.offense) (noEscape h) hf)
  | .tampering ht =>
      .tampering v (s1512b_elements_implies_deontic (corr_addressee h.offense) (noEscape h) ht)
  | .obstruction hc =>
      .obstruction (s1512c_elements_implies_deontic (corr_addressee h.offense) (noEscape h)
        (match hc with
         | .objectImpairment hCorrupt _ => hCorrupt
         | .otherObstruction hCorrupt _ => hCorrupt) hc)
  | .harassment hh =>
      .harassment v
        (match hh with
         | .completed hcm =>
             s1512d_completed_elements_implies_deontic (corr_addressee h.offense) (noEscape h) hcm
         | .attempted hi ha => gap_1512d_attempt hi ha)
  | .conspiracy hcs =>
      .conspiracy (s1512k_elements_implies_deontic (corr_addressee h.offense) (noEscape h) hcs)

end ED








namespace EO




axiom corr_corruptly1512 {d : Person} {c : ComplaintText} (cd : Ontology.Conduct) :
    Elements.ActsCorruptly d c → Ontology.IsCorruptlyAsUsedInSection1512 cd c


axiom corr_forum_judicial {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    Elements.IsFederalJudicialOrGrandJuryProceeding pr c →
    Ontology.IsProceedingBeforeFederalCourtOrGrandJury (mapProcEO pr) c

axiom corr_forum_congress {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    Elements.IsCongressionalProceeding pr c → Ontology.IsProceedingBeforeCongress (mapProcEO pr) c

axiom corr_forum_agency {pr : Elements.OfficialProceeding} {c : ComplaintText} :
    Elements.IsAuthorizedFederalAgencyProceeding pr c →
    Ontology.IsProceedingBeforeAuthorizedFederalAgency (mapProcEO pr) c



axiom corr_forum_insurance {pr : Elements.OfficialProceeding} {e : Entity} {c : ComplaintText} :
    Elements.IsInsuranceRegulatoryProceeding pr c →
    Proving.USC.Common.EngagedInInterstateCommerce e c →
    Ontology.IsInsuranceRegulatoryProceedingAffectingCommerce (mapProcEO pr) c



theorem forum_elements_implies_ontology {pr : Elements.OfficialProceeding} {c : ComplaintText}
    (h : Elements.IsOfficialProceeding pr c) : Ontology.OfficialProceedingMembership (mapProcEO pr) c :=
  match h with
  | .judicial hj => .federalCourtOrGrandJury (corr_forum_judicial hj)
  | .congressional hg => .congress (corr_forum_congress hg)
  | .agency ha => .authorizedFederalAgency (corr_forum_agency ha)
  | .insurance _ hi hc => .insuranceRegulatory (corr_forum_insurance hi hc)




theorem s1512c_elements_implies_ontology {d : Person} {r : Elements.RecordOrObject}
    {pr : Elements.OfficialProceeding} {c : ComplaintText} (cd : Ontology.Conduct)
    (hCorrupt : Elements.ActsCorruptly d c) (h : Elements.Section1512c d r pr c) :
    Ontology.Section1512cTermUse cd (mapProcEO pr) c :=
  { corruptlyTerm := corr_corruptly1512 cd hCorrupt
    forumTerm :=
      forum_elements_implies_ontology
        (match h with
         | .objectImpairment _ hi => hi.proceeding
         | .otherObstruction _ hi => hi.proceeding) }

end EO









namespace EP



axiom corr_venue_intended {pr : Elements.OfficialProceeding} {c : ComplaintText}
    (dist : Procedure.District) :
    Elements.ProsecutedWhereProceedingIntendedToBeAffected pr c →
    Procedure.ProceedingIntendedToBeAffectedInDistrict (mapProcEP pr) dist c



axiom corr_venue_conduct {d : Person} {c : ComplaintText}
    (cd : Procedure.Conduct) (dist : Procedure.District) :
    Elements.ProsecutedWhereConductOccurred d c →
    Procedure.ConductOccurredInDistrict cd dist c



theorem s1512i_elements_implies_procedure {d : Person} {pr : Elements.OfficialProceeding}
    {c : ComplaintText} (cd : Procedure.Conduct) (dist : Procedure.District)
    (h : Elements.VenueProper d pr c) :
    Procedure.VenueBasis cd (mapProcEP pr) dist c :=
  match h with
  | .districtOfIntendedEffect hg => Or.inl (corr_venue_intended dist hg)
  | .districtOfConduct hg => Or.inr (corr_venue_conduct cd dist hg)

end EP








namespace ESc



axiom corr_a1 {d : Person} {pr : Elements.OfficialProceeding} {o : Person} {c : ComplaintText} :
    Elements.KillingIntent1512a1 d pr o c → Scienter.ClauseCulpable .S1512a1 d c

axiom corr_a2 {d : Person} {pr : Elements.OfficialProceeding} {o : Person} {c : ComplaintText} :
    Elements.TamperingIntent1512 d pr o c → Scienter.ClauseCulpable .S1512a2 d c

axiom corr_b_conduct {d : Person} {c : ComplaintText} :
    ActedWithScienter d c → Scienter.ClauseCulpable .S1512bConduct d c

axiom corr_b_objective {d : Person} {pr : Elements.OfficialProceeding} {o : Person}
    {c : ComplaintText} :
    Elements.TamperingIntent1512 d pr o c → Scienter.ClauseCulpable .S1512bObjective d c

axiom corr_corruptly {d : Person} {c : ComplaintText} :
    Elements.ActsCorruptly d c → Scienter.Corruptly d c


axiom corr_c2_state {d : Person} {c : ComplaintText} :
    Elements.ActsCorruptly d c → Scienter.ClauseCulpable .S1512c2 d c

axiom corr_d_harass {d v : Person} {c : ComplaintText} :
    Elements.IntentionallyHarasses d v c → Scienter.ClauseCulpable .S1512dHarassment d c



axiom corr_d_result {d : Person} {c : ComplaintText} :
    Scienter.ClauseCulpable .S1512dResult d c

axiom corr_k {d : Person} {ag : Agreement} {c : ComplaintText} :
    Elements.Section1512k d ag c → Scienter.ClauseCulpable .S1512kConspiracy d c




axiom corr_b_persuasionScienter {d v : Person} {c : ComplaintText} :
    Elements.CorruptlyPersuades d v c → Scienter.CorruptPersuasionScienter d c


axiom corr_b_misleadingScienter {d v : Person} {c : ComplaintText} :
    Elements.EngagesInMisleadingConduct d v c → Scienter.MisleadingConductScienter d c




theorem culpable_b {d v : Person} {pr : Elements.OfficialProceeding} {o : Person}
    {c : ComplaintText} (hK : ActedWithScienter d c)
    (hc : Elements.TamperingConduct1512b d v c) (hi : Elements.TamperingIntent1512 d pr o c) :
    Scienter.Section1512Culpable d c :=
  match hc with
  | .intimidation _ => .b .Intimidation ⟨corr_b_conduct hK, corr_b_objective hi⟩
  | .threat _ => .b .Threat ⟨corr_b_conduct hK, corr_b_objective hi⟩
  | .attempt _ => .b .Intimidation ⟨corr_b_conduct hK, corr_b_objective hi⟩
  | .corruptPersuasion hp =>
      .b .CorruptPersuasion
        ⟨⟨corr_b_conduct hK, corr_b_persuasionScienter hp⟩, corr_b_objective hi⟩
  | .misleadingConduct hm =>
      .b .MisleadingConduct
        ⟨⟨corr_b_conduct hK, corr_b_misleadingScienter hm⟩, corr_b_objective hi⟩




axiom corr_defense_back {d : Person} {c : ComplaintText} :
    Scienter.Defense1512e d c → Elements.LawfulConductSolelyToEncourageTruthfulTestimony d c

axiom corr_repr_back {d : Person} {c : ComplaintText} :
    Scienter.LawfulBonaFideLegalRepresentation d c → Elements.LawfulBonaFideLegalRepresentation d c


theorem culpable {d v : Person} {r : Elements.RecordOrObject} {pr : Elements.OfficialProceeding}
    {o : Person} {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section1512Offense d v r pr o ag c) : Scienter.Section1512Culpable d c :=
  match h with
  | .killing hk => .a1 (corr_a1 hk.intent)
  | .force hf => .a2 (corr_a2 hf.intent)
  | .tampering ht => culpable_b ht.knowingly ht.conduct ht.intent
  | .obstruction hc =>
      .c2 ⟨corr_corruptly
             (match hc with
              | .objectImpairment hCorrupt _ => hCorrupt
              | .otherObstruction hCorrupt _ => hCorrupt),
           corr_c2_state
             (match hc with
              | .objectImpairment hCorrupt _ => hCorrupt
              | .otherObstruction hCorrupt _ => hCorrupt)⟩
  | .harassment hh =>
      .d ⟨corr_d_harass
            (match hh with
             | .completed hcm => hcm.harassment
             | .attempted hi _ => hi),
          corr_d_result⟩
  | .conspiracy hcs => .k (corr_k hcs)




theorem s1512_elements_implies_scienter {d v : Person} {r : Elements.RecordOrObject}
    {pr : Elements.OfficialProceeding} {o : Person} {ag : Agreement} {c : ComplaintText}
    (h : Elements.ValidSection1512Prosecution d v r pr o ag c) :
    Scienter.Section1512ScienterLiable d c :=
  ⟨culpable h.offense,
   fun hd => h.noTruthfulTestimonyDefense (corr_defense_back hd),
   fun hr => h.noLegalRepresentationCarveOut (corr_repr_back hr)⟩

end ESc



namespace DO



axiom corr_corruptly1512 {d : Person} {c : ComplaintText} (cd : Ontology.Conduct) :
    Deontic.ActedCorruptly1512c d c → Ontology.IsCorruptlyAsUsedInSection1512 cd c





axiom corr_forum {pr : Deontic.OfficialProceeding} {c : ComplaintText} :
    Deontic.IsOfficialProceeding1515a1 pr c → Ontology.OfficialProceedingMembership (mapProcDO pr) c



theorem s1512c_deontic_implies_ontology {d : Person} {c : ComplaintText}
    (cd : Ontology.Conduct) (h : Deontic.Prohibition1512cViolated d c) :
    ∃ p : Ontology.Proceeding, Ontology.Section1512cTermUse cd p c :=
  match h.2.1 with
  | .recordImpairment pr hp _ _ =>
      ⟨mapProcDO pr, { corruptlyTerm := corr_corruptly1512 cd h.1.scienter
                       forumTerm := corr_forum hp }⟩
  | .otherObstruction pr hp _ =>
      ⟨mapProcDO pr, { corruptlyTerm := corr_corruptly1512 cd h.1.scienter
                       forumTerm := corr_forum hp }⟩

end DO



namespace DP



axiom corr_prosecution {e : Entity} {dd : Deontic.District} {c : ComplaintText}
    (pros : Procedure.Prosecution) :
    Deontic.ProsecutionBroughtInDistrict1512i e dd c → Procedure.ProsecutionUnderSection1512 pros c


axiom corr_ground_intended {dd : Deontic.District} {pr : Deontic.OfficialProceeding}
    {c : ComplaintText} :
    Deontic.DistrictWhereProceedingIntendedToBeAffected1512i dd pr c →
    Procedure.ProceedingIntendedToBeAffectedInDistrict (mapProcDP pr) (mapDistDP dd) c


axiom corr_ground_conduct {dd : Deontic.District} {p : Person} {c : ComplaintText}
    (cd : Procedure.Conduct) :
    Deontic.DistrictWhereConductOccurred1512i dd p c →
    Procedure.ConductOccurredInDistrict cd (mapDistDP dd) c


theorem s1512i_deontic_implies_procedure_intendedEffect {e : Entity} {dd : Deontic.District}
    {pr : Deontic.OfficialProceeding} {c : ComplaintText}
    (pros : Procedure.Prosecution) (cd : Procedure.Conduct)
    (hBrought : Deontic.ProsecutionBroughtInDistrict1512i e dd c)
    (hg : Deontic.DistrictWhereProceedingIntendedToBeAffected1512i dd pr c) :
    Procedure.ProperVenue pros cd (mapProcDP pr) (mapDistDP dd) c :=
  { prosecutionBrought := corr_prosecution pros hBrought
    basis := Or.inl (corr_ground_intended hg) }




theorem s1512i_deontic_implies_procedure_conductLocus {e : Entity} {dd : Deontic.District}
    {p : Person} {c : ComplaintText} (pros : Procedure.Prosecution) (cd : Procedure.Conduct)
    (op : Procedure.OfficialProceeding)
    (hBrought : Deontic.ProsecutionBroughtInDistrict1512i e dd c)
    (hg : Deontic.DistrictWhereConductOccurred1512i dd p c) :
    Procedure.ProperVenue pros cd op (mapDistDP dd) c :=
  { prosecutionBrought := corr_prosecution pros hBrought
    basis := Or.inr (corr_ground_conduct cd hg) }

end DP



namespace DSc



axiom corr_a1 {d : Person} {c : ComplaintText} :
    Deontic.ObstructiveIntent1512a1 d c → Scienter.ClauseCulpable .S1512a1 d c

axiom corr_a2 {d : Person} {c : ComplaintText} :
    Deontic.ObstructiveIntent1512a2b d c → Scienter.ClauseCulpable .S1512a2 d c

axiom corr_b_conduct {d : Person} {c : ComplaintText} :
    Deontic.ActedKnowingly1512b d c → Scienter.ClauseCulpable .S1512bConduct d c

axiom corr_b_objective {d : Person} {c : ComplaintText} :
    Deontic.ObstructiveIntent1512a2b d c → Scienter.ClauseCulpable .S1512bObjective d c

axiom corr_corruptly {d : Person} {c : ComplaintText} :
    Deontic.ActedCorruptly1512c d c → Scienter.Corruptly d c

axiom corr_c2_state {d : Person} {c : ComplaintText} :
    Deontic.ActedCorruptly1512c d c → Scienter.ClauseCulpable .S1512c2 d c

axiom corr_d_harass {d : Person} {c : ComplaintText} :
    Deontic.ActedIntentionally1512d d c → Scienter.ClauseCulpable .S1512dHarassment d c

axiom corr_d_result {d : Person} {c : ComplaintText} : Scienter.ClauseCulpable .S1512dResult d c

axiom corr_k {d : Person} {c : ComplaintText} :
    Deontic.ConspiresToCommitSection1512Offense1512k d c → Scienter.ClauseCulpable .S1512kConspiracy d c



axiom corr_b_persuasionScienter {d v : Person} {c : ComplaintText} :
    Deontic.CorruptlyPersuades1515a6 d v c →
    ¬ Deontic.WouldBeMisleadingConductButForStateOfMind1515a6 d v c →
    Scienter.CorruptPersuasionScienter d c

axiom corr_b_misleadingScienter {d v : Person} {c : ComplaintText} :
    Deontic.IsMisleadingConduct1515a3 d v c → Scienter.MisleadingConductScienter d c



theorem culpable_b {d v : Person} {c : ComplaintText} (hK : Deontic.ActedKnowingly1512b d c)
    (hi : Deontic.ObstructiveIntent1512a2b d c) (h : Deontic.Act1512b d v c) :
    Scienter.Section1512Culpable d c :=
  match h with
  | .intimidation _ => .b .Intimidation ⟨corr_b_conduct hK, corr_b_objective hi⟩
  | .corruptPersuasion hp hx =>
      .b .CorruptPersuasion
        ⟨⟨corr_b_conduct hK, corr_b_persuasionScienter hp hx⟩, corr_b_objective hi⟩
  | .misleadingConduct hm =>
      .b .MisleadingConduct
        ⟨⟨corr_b_conduct hK, corr_b_misleadingScienter hm⟩, corr_b_objective hi⟩



axiom corr_defense_back {d : Person} {c : ComplaintText} :
    Scienter.Defense1512e d c → Deontic.AffirmativeDefenseLawfulTruthfulPersuasion1512e d c

axiom corr_burden_back {d : Person} {c : ComplaintText} :
    Scienter.Defense1512e d c → Deontic.DefendantCarriedPreponderanceBurden1512e d c

axiom corr_repr_back {d : Person} {c : ComplaintText} :
    Scienter.LawfulBonaFideLegalRepresentation d c → Deontic.LawfulBonaFideLegalRepresentation1515c d c


theorem culpable {d : Person} {c : ComplaintText} (h : Deontic.Section1512Offense d c) :
    Scienter.Section1512Culpable d c :=
  match h with
  | .killing _ hv => .a1 (corr_a1 hv.1.condition)
  | .force _ hv => .a2 (corr_a2 hv.1.condition)
  | .tampering _ hv => culpable_b hv.1.scienter hv.1.condition hv.2.1
  | .obstruction hv => .c2 ⟨corr_corruptly hv.1.scienter, corr_c2_state hv.1.scienter⟩
  | .harassment _ hv => .d ⟨corr_d_harass hv.1.scienter, corr_d_result⟩
  | .conspiracy hv => .k (corr_k hv.2.1)



theorem noEscape {d : Person} {c : ComplaintText} (h : Deontic.Section1512Offense d c) :
    ¬ Deontic.Escape1512 d c :=
  match h with
  | .killing _ hv => hv.2.2
  | .force _ hv => hv.2.2
  | .tampering _ hv => hv.2.2
  | .obstruction hv => hv.2.2
  | .harassment _ hv => hv.2.2.2.2
  | .conspiracy hv => hv.2.2



theorem s1512_deontic_implies_scienter {d : Person} {c : ComplaintText}
    (h : Deontic.Section1512Offense d c) : Scienter.Section1512ScienterLiable d c :=
  ⟨culpable h,
   fun hd => noEscape h (Or.inl ⟨corr_defense_back hd, corr_burden_back hd⟩),
   fun hr => noEscape h (Or.inr (corr_repr_back hr))⟩

end DSc



namespace OP


axiom corr_judicial {p : Ontology.Proceeding} {c : ComplaintText} :
    Ontology.IsProceedingBeforeFederalCourtOrGrandJury p c →
    Procedure.ProceedingBeforeFederalCourtOrGrandJury (mapProcOP p) c

axiom corr_congress {p : Ontology.Proceeding} {c : ComplaintText} :
    Ontology.IsProceedingBeforeCongress p c → Procedure.ProceedingBeforeCongress (mapProcOP p) c

axiom corr_agency {p : Ontology.Proceeding} {c : ComplaintText} :
    Ontology.IsProceedingBeforeAuthorizedFederalAgency p c →
    Procedure.ProceedingBeforeFederalAgencyAuthorizedByLaw (mapProcOP p) c

axiom corr_insurance {p : Ontology.Proceeding} {c : ComplaintText} :
    Ontology.IsInsuranceRegulatoryProceedingAffectingCommerce p c →
    Procedure.ProceedingBeforeInsuranceRegulator (mapProcOP p) c



theorem forum_ontology_implies_procedure {p : Ontology.Proceeding} {c : ComplaintText}
    (h : Ontology.OfficialProceedingMembership p c) :
    Procedure.IsOfficialProceeding (mapProcOP p) c :=
  match h with
  | .federalCourtOrGrandJury hj => Or.inl (corr_judicial hj)
  | .congress hg => Or.inr (Or.inl (corr_congress hg))
  | .authorizedFederalAgency ha => Or.inr (Or.inr (Or.inl (corr_agency ha)))
  | .insuranceRegulatory hi => Or.inr (Or.inr (Or.inr (corr_insurance hi)))

end OP



namespace OSc


axiom corr_falseStatement {cd : Ontology.Conduct} {d : Person} {c : ComplaintText} :
    Ontology.IsKnowinglyFalseStatement cd c → Scienter.ClauseCulpable .S1515a3A d c

axiom corr_omission {cd : Ontology.Conduct} {d : Person} {c : ComplaintText} :
    Ontology.IsIntentionalOmissionOrConcealmentCreatingFalseImpression cd c →
    Scienter.ClauseCulpable .S1515a3B d c

axiom corr_writing_k {cd : Ontology.Conduct} {d : Person} {c : ComplaintText} :
    Ontology.IsKnowingInvitationOfRelianceOnFalseWriting cd c →
    Scienter.ClauseCulpable .S1515a3CKnowledge d c

axiom corr_writing_i {cd : Ontology.Conduct} {d : Person} {c : ComplaintText} :
    Ontology.IsKnowingInvitationOfRelianceOnFalseWriting cd c →
    Scienter.ClauseCulpable .S1515a3CIntent d c

axiom corr_object_k {cd : Ontology.Conduct} {d : Person} {c : ComplaintText} :
    Ontology.IsKnowingInvitationOfRelianceOnMisleadingObject cd c →
    Scienter.ClauseCulpable .S1515a3DKnowledge d c

axiom corr_object_i {cd : Ontology.Conduct} {d : Person} {c : ComplaintText} :
    Ontology.IsKnowingInvitationOfRelianceOnMisleadingObject cd c →
    Scienter.ClauseCulpable .S1515a3DIntent d c

axiom corr_trick_k {cd : Ontology.Conduct} {d : Person} {c : ComplaintText} :
    Ontology.IsKnowingUseOfTrickSchemeOrDevice cd c →
    Scienter.ClauseCulpable .S1515a3EKnowledge d c

axiom corr_trick_i {cd : Ontology.Conduct} {d : Person} {c : ComplaintText} :
    Ontology.IsKnowingUseOfTrickSchemeOrDevice cd c →
    Scienter.ClauseCulpable .S1515a3EIntent d c






theorem misleadingConduct_ontology_implies_scienter {cd : Ontology.Conduct} {d : Person}
    {c : ComplaintText} (h : Ontology.MisleadingConductMembership cd c) :
    Scienter.MisleadingConductScienter d c :=
  match h with
  | .falseStatement hf => ⟨.FalseStatement, corr_falseStatement hf⟩
  | .omissionOrConcealment ho => ⟨.OmissionOrConcealment, corr_omission ho⟩
  | .falseWriting hw => ⟨.WritingOrRecording, ⟨corr_writing_k hw, corr_writing_i hw⟩⟩
  | .misleadingObject hm => ⟨.SampleOrObject, ⟨corr_object_k hm, corr_object_i hm⟩⟩
  | .trickSchemeOrDevice ht => ⟨.TrickSchemeDevice, ⟨corr_trick_k ht, corr_trick_i ht⟩⟩

end OSc



namespace PSc


axiom corr_lawful {d : Person} {cd : Procedure.Conduct} {c : ComplaintText} :
    Procedure.ConductSolelyLawful cd c → Scienter.ConductSolelyLawful d c

axiom corr_soleIntent {d : Person} {cd : Procedure.Conduct} {c : ComplaintText} :
    Procedure.SoleIntentionToEncourageTruthfulTestimony d cd c →
    Scienter.SoleIntentionToEncourageTruthfulTestimony d c


axiom corr_pleadedIntent {d : Person} {c : ComplaintText} :
    Procedure.BurdenCarriedByPreponderance d c → Scienter.ClauseCulpable .S1512eDefense d c






theorem s1512e_procedure_implies_scienter {pr : Procedure.Prosecution} {d : Person}
    {cd : Procedure.Conduct} {c : ComplaintText}
    (h : Procedure.AffirmativeDefenseEstablished pr d cd c) : Scienter.Defense1512e d c :=
  { solelyLawfulConduct := corr_lawful h.solelyLawful
    soleIntention := corr_soleIntent h.soleIntentTruthful
    pleadedIntent := corr_pleadedIntent h.burdenCarried }

end PSc










namespace S1515


theorem s1515a1_elements_implies_ontology {pr : Elements.OfficialProceeding} {c : ComplaintText}
    (h : Elements.IsOfficialProceeding pr c) :
    Ontology.OfficialProceedingMembership (mapProcEO pr) c :=
  EO.forum_elements_implies_ontology h


theorem s1515a1_ontology_implies_procedure {p : Ontology.Proceeding} {c : ComplaintText}
    (h : Ontology.OfficialProceedingMembership p c) : Procedure.IsOfficialProceeding (mapProcOP p) c :=
  OP.forum_ontology_implies_procedure h



axiom corr_m_false {d v : Person} {c : ComplaintText} (cd : Ontology.Conduct) :
    Elements.KnowinglyMakesFalseStatement d v c → Ontology.IsKnowinglyFalseStatement cd c

axiom corr_m_omission {d v : Person} {c : ComplaintText} (cd : Ontology.Conduct) :
    Elements.IntentionallyOmitsOrConcealsMaterialFact d v c →
    Ontology.IsIntentionalOmissionOrConcealmentCreatingFalseImpression cd c

axiom corr_m_writing {d v : Person} {c : ComplaintText} (cd : Ontology.Conduct) :
    Elements.InvitesRelianceOnFalseWriting d v c →
    Ontology.IsKnowingInvitationOfRelianceOnFalseWriting cd c

axiom corr_m_object {d v : Person} {c : ComplaintText} (cd : Ontology.Conduct) :
    Elements.InvitesRelianceOnMisleadingObject d v c →
    Ontology.IsKnowingInvitationOfRelianceOnMisleadingObject cd c

axiom corr_m_trick {d v : Person} {c : ComplaintText} (cd : Ontology.Conduct) :
    Elements.KnowinglyUsesTrickSchemeOrDevice d v c →
    Ontology.IsKnowingUseOfTrickSchemeOrDevice cd c




theorem s1515a3_elements_implies_ontology {d v : Person} {c : ComplaintText}
    (cd : Ontology.Conduct) (h : Elements.MisleadingConduct1515a3 d v c) :
    Ontology.MisleadingConductMembership cd c :=
  match h with
  | .falseStatement hf => .falseStatement (corr_m_false cd hf)
  | .omissionOrConcealment ho => .omissionOrConcealment (corr_m_omission cd ho)
  | .falseWriting hw => .falseWriting (corr_m_writing cd hw)
  | .misleadingObject hm => .misleadingObject (corr_m_object cd hm)
  | .trickSchemeOrDevice ht => .trickSchemeOrDevice (corr_m_trick cd ht)


theorem s1515a3_ontology_implies_scienter {cd : Ontology.Conduct} {d : Person}
    {c : ComplaintText} (h : Ontology.MisleadingConductMembership cd c) :
    Scienter.MisleadingConductScienter d c :=
  OSc.misleadingConduct_ontology_implies_scienter h








axiom corr_officer_or_judge {o : Person} {c : ComplaintText} :
    Elements.IsFederalLawEnforcementOfficerOrJudge o c →
    Ontology.LawEnforcementOfficerMembership o c ∨ Ontology.IsJudgeOfTheUnitedStates o c



theorem s1512d_elements_implies_ontology_termUse {o : Person}
    {pr : Elements.OfficialProceeding} {c : ComplaintText}
    (hp : Elements.IsOfficialProceeding pr c)
    (ho : Elements.IsFederalLawEnforcementOfficerOrJudge o c) :
    Ontology.Section1512dTermUse (mapProcEO pr) o c :=
  { forumTerm := EO.forum_elements_implies_ontology hp
    recipientTerm := corr_officer_or_judge ho }





axiom corr_carveOut {d : Person} {c : ComplaintText}
    (cd : Ontology.Conduct) (p : Ontology.Proceeding) :
    Deontic.LawfulBonaFideLegalRepresentation1515c d c →
    Ontology.LawfulRepresentationCarveOut cd p c


theorem s1515c_deontic_implies_ontology {d : Person} {c : ComplaintText}
    (cd : Ontology.Conduct) (p : Ontology.Proceeding)
    (h : Deontic.LawfulBonaFideLegalRepresentation1515c d c) :
    Ontology.LawfulRepresentationCarveOut cd p c :=
  corr_carveOut cd p h

end S1515











def s1512_pairwise_discharge : Prop :=
  (∀ {d v : Person} {r : Elements.RecordOrObject} {pr : Elements.OfficialProceeding}
     {o : Person} {ag : Agreement} {c : ComplaintText},
     (Elements.IntentionallyHarasses d v c → Elements.AttemptsToHarassAndDissuade d v c →
       Deontic.Prohibition1512dViolated d v c) →
     Elements.ValidSection1512Prosecution d v r pr o ag c → Deontic.Section1512Offense d c)
  ∧ (∀ {d v : Person} {r : Elements.RecordOrObject} {pr : Elements.OfficialProceeding}
       {o : Person} {ag : Agreement} {c : ComplaintText},
       Elements.ValidSection1512Prosecution d v r pr o ag c → Scienter.Section1512ScienterLiable d c)
  ∧ (∀ {d : Person} {c : ComplaintText},
       Deontic.Section1512Offense d c → Scienter.Section1512ScienterLiable d c)





theorem s1512_pairwise_modulo_gaps : s1512_pairwise_discharge :=
  ⟨fun gap h => ED.s1512_elements_implies_deontic_modulo_gaps gap h,
   fun h => ESc.s1512_elements_implies_scienter h,
   fun h => DSc.s1512_deontic_implies_scienter h⟩




def s1515_definitional_discharge : Prop :=
  (∀ {pr : Elements.OfficialProceeding} {c : ComplaintText},
     Elements.IsOfficialProceeding pr c → Ontology.OfficialProceedingMembership (mapProcEO pr) c)
  ∧ (∀ {p : Ontology.Proceeding} {c : ComplaintText},
       Ontology.OfficialProceedingMembership p c → Procedure.IsOfficialProceeding (mapProcOP p) c)
  ∧ (∀ {d v : Person} {c : ComplaintText} (cd : Ontology.Conduct),
       Elements.MisleadingConduct1515a3 d v c → Ontology.MisleadingConductMembership cd c)


theorem s1515_definitional : s1515_definitional_discharge :=
  ⟨fun h => S1515.s1515a1_elements_implies_ontology h,
   fun h => S1515.s1515a1_ontology_implies_procedure h,
   fun cd h => S1515.s1515a3_elements_implies_ontology cd h⟩

end Proving.USC.T18.Ch73.Reslice.Bridge
