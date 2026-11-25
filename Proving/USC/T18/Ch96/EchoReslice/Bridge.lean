



































import Proving.USC.T18.Ch96.EchoReslice.Elements.Statute
import Proving.USC.T18.Ch96.EchoReslice.Deontic.Statute
import Proving.USC.T18.Ch96.EchoReslice.Ontology.Statute
import Proving.USC.T18.Ch96.EchoReslice.Procedure.Statute
import Proving.USC.T18.Ch96.EchoReslice.Evidentiary.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Bridge

open Proving.USC.Common (Person ComplaintText)







axiom mapEDct     : Elements.Court        → Deontic.Court
axiom mapEDpr     : Elements.Proceeding   → Deontic.Proceeding
axiom mapEDaction : Elements.CivilAction  → Deontic.Proceeding

axiom mapEPct     : Elements.Court        → Procedure.Court
axiom mapEPpr     : Elements.Proceeding   → Procedure.Proceeding
axiom mapEPaction : Elements.CivilAction  → Procedure.Proceeding

axiom mapEOct     : Elements.Court        → Ontology.Court
axiom mapEOpr     : Elements.Proceeding   → Ontology.Proceeding
axiom mapEOaction : Elements.CivilAction  → Ontology.CivilAction

axiom mapDPct     : Deontic.Court         → Procedure.Court
axiom mapDPpr     : Deontic.Proceeding    → Procedure.Proceeding






namespace ED


axiom corr_presiding {ct : Elements.Court} {pr : Elements.Proceeding}
    {c : ComplaintText} :
    Elements.IsPresidingCourt ct pr c → Deontic.IsPresidingCourt (mapEDct ct) (mapEDpr pr) c



axiom corr_qualifying {a : Elements.CivilAction} {c : ComplaintText} :
    Elements.QualifyingUnitedStatesAction a c →
    Deontic.QualifyingCivilAction1967 (mapEDaction a) c



axiom corr_isTheAction {pr : Elements.Proceeding} {a : Elements.CivilAction}
    {c : ComplaintText} :
    Elements.ProceedingIsTheCivilAction pr a c →
    Elements.QualifyingUnitedStatesAction a c →
    Deontic.QualifyingCivilAction1967 (mapEDpr pr) c


axiom corr_ancillary {pr : Elements.Proceeding} {a : Elements.CivilAction}
    {c : ComplaintText} :
    Elements.IsAncillaryProceeding pr a c →
    Deontic.IsAncillaryTo (mapEDpr pr) (mapEDaction a) c




axiom corr_opened {ct : Elements.Court} {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.ProceedingsOpenToPublic pr c → Elements.IsPresidingCourt ct pr c →
    Deontic.DeterminedOpenToPublic (mapEDct ct) (mapEDpr pr) c


axiom corr_closed {ct : Elements.Court} {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.ProceedingsClosedToPublic pr c → Elements.IsPresidingCourt ct pr c →
    Deontic.DeterminedClosedToPublic (mapEDct ct) (mapEDpr pr) c





axiom corr_rosterComplete {pr : Elements.Proceeding} {persons : List Person}
    {p : Person} {c : ComplaintText} :
    Elements.AffectedPersonsIdentified pr persons c →
    Deontic.IsAffectedPerson p (mapEDpr pr) c → p ∈ persons


axiom corr_rightsConsidered {ct : Elements.Court} {p : Person}
    {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.CourtConsideredRightsOfPerson ct p pr c →
    Deontic.RightsConsidered (mapEDct ct) p (mapEDpr pr) c



axiom corr_sequencing {ct : Elements.Court} {pr : Elements.Proceeding}
    {c : ComplaintText} :
    Elements.ConsiderationPrecededDetermination ct pr c →
    Deontic.ConsiderationPrecededDetermination (mapEDct ct) (mapEDpr pr) c

end ED












theorem s1967_elements_implies_deontic_modulo_gaps
    {ct : Elements.Court} {pr : Elements.Proceeding} {a : Elements.CivilAction}
    {persons : List Person} {c : ComplaintText}
    (h : Elements.Section1967 ct pr a persons c)
    (gap_discretion_actually_exercised :
      Deontic.DiscretionActuallyExercised (mapEDct ct) (mapEDpr pr) c) :
    Deontic.ValidExercise1967 (mapEDct ct) (mapEDpr pr) c :=
  have hcond : Deontic.ConditionMet (mapEDpr pr) c :=
    match h.within with
    | .ancillary hq hanc => Or.inr ⟨mapEDaction a, ED.corr_ancillary hanc, ED.corr_qualifying hq⟩
    | .theAction hq hself => Or.inl (ED.corr_isTheAction hself hq)
  have hact : Deontic.RegulatedActOccurred (mapEDct ct) (mapEDpr pr) c :=
    match h.disposition with
    | .opened ho => Deontic.AccessDetermination1967.opened (ED.corr_opened ho h.presiding)
    | .closed hcl => Deontic.AccessDetermination1967.closed (ED.corr_closed hcl h.presiding)
  ⟨⟨⟨ED.corr_presiding h.presiding, hcond⟩, hact, gap_discretion_actually_exercised⟩,
   ⟨fun p hp =>
      ED.corr_rightsConsidered
        (h.consideration.eachConsidered p
          (ED.corr_rosterComplete h.consideration.identified hp)).considered,
    ED.corr_sequencing h.consideration.precededDetermination⟩⟩









namespace EP

axiom corr_us {a : Elements.CivilAction} {c : ComplaintText} :
    Elements.IsCivilActionInstitutedByUnitedStates a c →
    Procedure.InstitutedByUnitedStates (mapEPaction a) c

axiom corr_ch96 {a : Elements.CivilAction} {c : ComplaintText} :
    Elements.ArisesUnderChapter96 a c →
    Procedure.IsCivilActionUnderChapter96 (mapEPaction a) c

axiom corr_selfUs {pr : Elements.Proceeding} {a : Elements.CivilAction}
    {c : ComplaintText} :
    Elements.ProceedingIsTheCivilAction pr a c →
    Elements.IsCivilActionInstitutedByUnitedStates a c →
    Procedure.InstitutedByUnitedStates (mapEPpr pr) c

axiom corr_selfCh96 {pr : Elements.Proceeding} {a : Elements.CivilAction}
    {c : ComplaintText} :
    Elements.ProceedingIsTheCivilAction pr a c →
    Elements.ArisesUnderChapter96 a c →
    Procedure.IsCivilActionUnderChapter96 (mapEPpr pr) c

axiom corr_ancillary {pr : Elements.Proceeding} {a : Elements.CivilAction}
    {c : ComplaintText} :
    Elements.IsAncillaryProceeding pr a c →
    Procedure.IsAncillaryTo (mapEPpr pr) (mapEPaction a) c


axiom corr_affected {p : Person} {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.RightsOfPersonAffected p pr c → Procedure.IsAffectedPerson p (mapEPpr pr) c



axiom corr_aggregate {ct : Elements.Court} {pr : Elements.Proceeding}
    {persons : List Person} {c : ComplaintText} :
    Elements.RightsConsideration ct pr persons c →
    Procedure.CourtConsideredRightsOfAffectedPersons (mapEPct ct) (mapEPpr pr) c


axiom corr_rosterComplete {pr : Elements.Proceeding} {persons : List Person}
    {p : Person} {c : ComplaintText} :
    Elements.AffectedPersonsIdentified pr persons c →
    Procedure.IsAffectedPerson p (mapEPpr pr) c → p ∈ persons



axiom corr_orderEntered {ct : Elements.Court} {pr : Elements.Proceeding}
    {c : ComplaintText} :
    Elements.PublicAccessDisposition pr c → Elements.IsPresidingCourt ct pr c →
    ∃ ord : Procedure.PublicAccessOrder,
      Procedure.PublicAccessOrderEntered (mapEPct ct) (mapEPpr pr) ord c



axiom corr_sequencing {ct : Elements.Court} {pr : Elements.Proceeding}
    {ord : Procedure.PublicAccessOrder} {c : ComplaintText} :
    Elements.ConsiderationPrecededDetermination ct pr c →
    Procedure.PublicAccessOrderEntered (mapEPct ct) (mapEPpr pr) ord c →
    Procedure.ConsiderationPrecededOrder (mapEPct ct) (mapEPpr pr) ord c

end EP








theorem s1967_elements_implies_procedure
    {ct : Elements.Court} {pr : Elements.Proceeding} {a : Elements.CivilAction}
    {persons : List Person} {c : ComplaintText}
    (h : Elements.Section1967 ct pr a persons c) :
    ∃ ord : Procedure.PublicAccessOrder,
      Procedure.ValidPublicAccessDetermination (mapEPct ct) (mapEPpr pr) ord c :=
  have hscope : Procedure.Section1967Scope (mapEPpr pr) c :=
    match h.within with
    | .ancillary hq hanc =>
        Procedure.Section1967Scope.ancillary (mapEPaction a) (EP.corr_ancillary hanc)
          (EP.corr_us hq.institutedByUnitedStates) (EP.corr_ch96 hq.underChapter96)
    | .theAction hq hself =>
        Procedure.Section1967Scope.civilAction
          (EP.corr_selfUs hself hq.institutedByUnitedStates)
          (EP.corr_selfCh96 hself hq.underChapter96)
  have hcons : Procedure.AffectedPersonsConsidered (mapEPct ct) (mapEPpr pr) c :=
    match persons, h.consideration with
    | [], hrc =>
        Procedure.AffectedPersonsConsidered.noneAffected (EP.corr_aggregate hrc)
          (fun _p hp => nomatch (EP.corr_rosterComplete hrc.identified hp))
    | q :: qs, hrc =>
        Procedure.AffectedPersonsConsidered.witness q
          (EP.corr_affected (hrc.eachConsidered q (List.Mem.head qs)).affected)
          (EP.corr_aggregate hrc)
  match EP.corr_orderEntered h.disposition h.presiding with
  | ⟨ord, hord⟩ =>
      ⟨ord, hscope, hcons, hord,
       EP.corr_sequencing h.consideration.precededDetermination hord⟩



namespace DP

axiom corr_us {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.IsCivilActionInstitutedByUnitedStates pr c →
    Procedure.InstitutedByUnitedStates (mapDPpr pr) c

axiom corr_ch96 {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.ArisesUnderChapter96 pr c →
    Procedure.IsCivilActionUnderChapter96 (mapDPpr pr) c

axiom corr_ancillary {pr pr' : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.IsAncillaryTo pr pr' c →
    Procedure.IsAncillaryTo (mapDPpr pr) (mapDPpr pr') c




axiom corr_affected {p : Person} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.IsAffectedPerson p pr c ↔ Procedure.IsAffectedPerson p (mapDPpr pr) c

axiom corr_aggregate {ct : Deontic.Court} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.ConsiderationOfAffectedRightsGiven ct pr c →
    Procedure.CourtConsideredRightsOfAffectedPersons (mapDPct ct) (mapDPpr pr) c

axiom corr_orderEntered {ct : Deontic.Court} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.RegulatedActOccurred ct pr c →
    ∃ ord : Procedure.PublicAccessOrder,
      Procedure.PublicAccessOrderEntered (mapDPct ct) (mapDPpr pr) ord c

axiom corr_sequencing {ct : Deontic.Court} {pr : Deontic.Proceeding}
    {ord : Procedure.PublicAccessOrder} {c : ComplaintText} :
    Deontic.ConsiderationPrecededDetermination ct pr c →
    Procedure.PublicAccessOrderEntered (mapDPct ct) (mapDPpr pr) ord c →
    Procedure.ConsiderationPrecededOrder (mapDPct ct) (mapDPpr pr) ord c

end DP








theorem s1967_deontic_implies_procedure
    {ct : Deontic.Court} {pr : Deontic.Proceeding} {c : ComplaintText}
    (h : Deontic.ValidExercise1967 ct pr c) :
    ∃ ord : Procedure.PublicAccessOrder,
      Procedure.ValidPublicAccessDetermination (mapDPct ct) (mapDPpr pr) ord c :=
  have hscope : Procedure.Section1967Scope (mapDPpr pr) c :=
    match h.1.1.condition with
    | Or.inl hq => Procedure.Section1967Scope.civilAction (DP.corr_us hq.1) (DP.corr_ch96 hq.2)
    | Or.inr ⟨pr', hanc, hq⟩ =>
        Procedure.Section1967Scope.ancillary (mapDPpr pr') (DP.corr_ancillary hanc)
          (DP.corr_us hq.1) (DP.corr_ch96 hq.2)
  have hcons : Procedure.AffectedPersonsConsidered (mapDPct ct) (mapDPpr pr) c :=
    (Classical.em (∃ p : Person, Deontic.IsAffectedPerson p pr c)).elim
      (fun hex =>
        match hex with
        | ⟨p, hp⟩ =>
            Procedure.AffectedPersonsConsidered.witness p (DP.corr_affected.mp hp)
              (DP.corr_aggregate h.2))
      (fun hne =>
        Procedure.AffectedPersonsConsidered.noneAffected (DP.corr_aggregate h.2)
          (fun p hp => hne ⟨p, DP.corr_affected.mpr hp⟩))
  match DP.corr_orderEntered h.1.2.1 with
  | ⟨ord, hord⟩ => ⟨ord, hscope, hcons, hord, DP.corr_sequencing h.2.2 hord⟩



namespace EV

axiom corr_selfRoute {pr : Elements.Proceeding} {a : Elements.CivilAction}
    {c : ComplaintText} :
    Elements.QualifyingUnitedStatesAction a c →
    Elements.ProceedingIsTheCivilAction pr a c →
    Evidentiary.CivilActionInstitutedByUnitedStates c

axiom corr_ancillaryRoute {pr : Elements.Proceeding} {a : Elements.CivilAction}
    {c : ComplaintText} :
    Elements.QualifyingUnitedStatesAction a c →
    Elements.IsAncillaryProceeding pr a c →
    Evidentiary.ProceedingAncillaryToChapterAction c

axiom corr_considered {ct : Elements.Court} {pr : Elements.Proceeding}
    {persons : List Person} {c : ComplaintText} :
    Elements.RightsConsideration ct pr persons c →
    Evidentiary.CourtConsideredRightsOfAffectedPersons c

end EV















theorem s1967_elements_implies_evidentiary_modulo_gaps
    {ct : Elements.Court} {pr : Elements.Proceeding} {a : Elements.CivilAction}
    {persons : List Person} {c : ComplaintText}
    (h : Elements.Section1967 ct pr a persons c)
    (gap_burden_carried :
      Evidentiary.BurdenCarried Evidentiary.Bearer.Government
        Evidentiary.Standard.Preponderance c)
    (gap_ownDiscretion_open :
      Elements.ProceedingsOpenToPublic pr c →
      Evidentiary.AccessRulingMadeByCourt Evidentiary.AccessRuling.Open c)
    (gap_ownDiscretion_closed :
      Elements.ProceedingsClosedToPublic pr c →
      Evidentiary.AccessRulingMadeByCourt Evidentiary.AccessRuling.Closed c) :
    ∃ r : Evidentiary.AccessRuling, Evidentiary.Section1967RulingAuthorized r c :=
  have hwithin : Evidentiary.Section1967Proceeding c :=
    match h.within with
    | .ancillary hq hanc =>
        Evidentiary.Section1967Proceeding.ancillary (EV.corr_ancillaryRoute hq hanc)
    | .theAction hq hself =>
        Evidentiary.Section1967Proceeding.civilAction (EV.corr_selfRoute hq hself)
  have hscope : Evidentiary.Proof1967Scope c :=
    ⟨hwithin, gap_burden_carried,
     Or.inl (fun heq => Evidentiary.Presumption.noConfusion heq)⟩
  match h.disposition with
  | .opened ho =>
      ⟨Evidentiary.AccessRuling.Open, hscope, EV.corr_considered h.consideration,
       gap_ownDiscretion_open ho⟩
  | .closed hcl =>
      ⟨Evidentiary.AccessRuling.Closed, hscope, EV.corr_considered h.consideration,
       gap_ownDiscretion_closed hcl⟩



namespace DV

axiom corr_selfRoute {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.QualifyingCivilAction1967 pr c →
    Evidentiary.CivilActionInstitutedByUnitedStates c

axiom corr_ancillaryRoute {pr pr' : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.IsAncillaryTo pr pr' c → Deontic.QualifyingCivilAction1967 pr' c →
    Evidentiary.ProceedingAncillaryToChapterAction c

axiom corr_considered {ct : Deontic.Court} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.ConsiderationOfAffectedRightsGiven ct pr c →
    Evidentiary.CourtConsideredRightsOfAffectedPersons c



axiom corr_ruledOpen {ct : Deontic.Court} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.DeterminedOpenToPublic ct pr c → Deontic.DiscretionActuallyExercised ct pr c →
    Evidentiary.AccessRulingMadeByCourt Evidentiary.AccessRuling.Open c

axiom corr_ruledClosed {ct : Deontic.Court} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.DeterminedClosedToPublic ct pr c → Deontic.DiscretionActuallyExercised ct pr c →
    Evidentiary.AccessRulingMadeByCourt Evidentiary.AccessRuling.Closed c

end DV






theorem s1967_deontic_implies_evidentiary_modulo_gaps
    {ct : Deontic.Court} {pr : Deontic.Proceeding} {c : ComplaintText}
    (h : Deontic.ValidExercise1967 ct pr c)
    (gap_burden_carried :
      Evidentiary.BurdenCarried Evidentiary.Bearer.Government
        Evidentiary.Standard.Preponderance c) :
    ∃ r : Evidentiary.AccessRuling, Evidentiary.Section1967RulingAuthorized r c :=
  have hwithin : Evidentiary.Section1967Proceeding c :=
    match h.1.1.condition with
    | Or.inl hq => Evidentiary.Section1967Proceeding.civilAction (DV.corr_selfRoute hq)
    | Or.inr ⟨_, hanc, hq⟩ =>
        Evidentiary.Section1967Proceeding.ancillary (DV.corr_ancillaryRoute hanc hq)
  have hscope : Evidentiary.Proof1967Scope c :=
    ⟨hwithin, gap_burden_carried,
     Or.inl (fun heq => Evidentiary.Presumption.noConfusion heq)⟩
  match h.1.2.1 with
  | .opened ho =>
      ⟨Evidentiary.AccessRuling.Open, hscope, DV.corr_considered h.2,
       DV.corr_ruledOpen ho h.1.2.2⟩
  | .closed hcl =>
      ⟨Evidentiary.AccessRuling.Closed, hscope, DV.corr_considered h.2,
       DV.corr_ruledClosed hcl h.1.2.2⟩






namespace PV

axiom corr_selfRoute {pr : Procedure.Proceeding} {c : ComplaintText} :
    Procedure.InstitutedByUnitedStates pr c → Procedure.IsCivilActionUnderChapter96 pr c →
    Evidentiary.CivilActionInstitutedByUnitedStates c

axiom corr_ancillaryRoute {pr main : Procedure.Proceeding} {c : ComplaintText} :
    Procedure.IsAncillaryTo pr main c → Procedure.InstitutedByUnitedStates main c →
    Procedure.IsCivilActionUnderChapter96 main c →
    Evidentiary.ProceedingAncillaryToChapterAction c

axiom corr_considered {crt : Procedure.Court} {pr : Procedure.Proceeding}
    {c : ComplaintText} :
    Procedure.AffectedPersonsConsidered crt pr c →
    Evidentiary.CourtConsideredRightsOfAffectedPersons c

end PV








theorem s1967_procedure_implies_evidentiary_modulo_gaps
    {crt : Procedure.Court} {pr : Procedure.Proceeding}
    {ord : Procedure.PublicAccessOrder} {c : ComplaintText}
    (h : Procedure.PublicAccessDisposition crt pr ord c)
    (gap_burden_carried :
      Evidentiary.BurdenCarried Evidentiary.Bearer.Government
        Evidentiary.Standard.Preponderance c)
    (gap_ownDiscretion_open :
      Procedure.OrderOpensProceedingToPublic ord c →
      Evidentiary.AccessRulingMadeByCourt Evidentiary.AccessRuling.Open c)
    (gap_ownDiscretion_closed :
      Procedure.OrderClosesProceedingToPublic ord c →
      Evidentiary.AccessRulingMadeByCourt Evidentiary.AccessRuling.Closed c) :
    ∃ r : Evidentiary.AccessRuling, Evidentiary.Section1967RulingAuthorized r c :=
  have scopeOf : Procedure.ValidPublicAccessDetermination crt pr ord c →
      Evidentiary.Proof1967Scope c := fun hv =>
    have hwithin : Evidentiary.Section1967Proceeding c :=
      match hv.inScope with
      | .civilAction hUS hCh => Evidentiary.Section1967Proceeding.civilAction
          (PV.corr_selfRoute hUS hCh)
      | .ancillary _ hAnc hUS hCh => Evidentiary.Section1967Proceeding.ancillary
          (PV.corr_ancillaryRoute hAnc hUS hCh)
    ⟨hwithin, gap_burden_carried,
     Or.inl (fun heq => Evidentiary.Presumption.noConfusion heq)⟩
  match h with
  | .opened hValid hOpen =>
      ⟨Evidentiary.AccessRuling.Open, scopeOf hValid,
       PV.corr_considered hValid.rightsConsidered, gap_ownDiscretion_open hOpen⟩
  | .closed hValid hClosed =>
      ⟨Evidentiary.AccessRuling.Closed, scopeOf hValid,
       PV.corr_considered hValid.rightsConsidered, gap_ownDiscretion_closed hClosed⟩










namespace EO

axiom corr_qualifying {a : Elements.CivilAction} {c : ComplaintText} :
    Elements.QualifyingUnitedStatesAction a c →
    Ontology.IsUnitedStatesCivilAction (mapEOaction a) c

axiom corr_ancillary {pr : Elements.Proceeding} {a : Elements.CivilAction}
    {c : ComplaintText} :
    Elements.IsAncillaryProceeding pr a c →
    Ontology.IsAncillaryProceeding (mapEOpr pr) (mapEOaction a) c

axiom corr_isTheAction {pr : Elements.Proceeding} {a : Elements.CivilAction}
    {c : ComplaintText} :
    Elements.ProceedingIsTheCivilAction pr a c →
    Ontology.IsTheActionItself (mapEOpr pr) (mapEOaction a) c

axiom corr_court {ct : Elements.Court} {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.IsPresidingCourt ct pr c →
    Ontology.IsCourtOfTheProceeding (mapEOct ct) (mapEOpr pr) c

axiom corr_open {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.ProceedingsOpenToPublic pr c → Ontology.IsOpenToPublic (mapEOpr pr) c

axiom corr_closed {pr : Elements.Proceeding} {c : ComplaintText} :
    Elements.ProceedingsClosedToPublic pr c → Ontology.IsClosedToPublic (mapEOpr pr) c

end EO







theorem s1967_elements_implies_ontology
    {ct : Elements.Court} {pr : Elements.Proceeding} {a : Elements.CivilAction}
    {persons : List Person} {c : ComplaintText}
    (h : Elements.Section1967 ct pr a persons c) :
    ∃ s : Ontology.PublicAccessStatus,
      Ontology.Section1967AccessDetermination (mapEOpr pr) (mapEOaction a) (mapEOct ct) s c :=
  have hcov : Ontology.CoveredProceeding (mapEOpr pr) (mapEOaction a) c :=
    match h.within with
    | .ancillary hq hanc =>
        Ontology.CoveredProceeding.ancillary (EO.corr_ancillary hanc) (EO.corr_qualifying hq)
    | .theAction hq hself =>
        Ontology.CoveredProceeding.theAction (EO.corr_isTheAction hself) (EO.corr_qualifying hq)
  have hscope : Ontology.Section1967Scope (mapEOpr pr) (mapEOaction a) (mapEOct ct) c :=
    ⟨hcov, EO.corr_court h.presiding⟩
  match h.disposition with
  | .opened ho => ⟨Ontology.PublicAccessStatus.openToPublic, hscope, EO.corr_open ho⟩
  | .closed hcl => ⟨Ontology.PublicAccessStatus.closedToPublic, hscope, EO.corr_closed hcl⟩

end Proving.USC.T18.Ch96.EchoReslice.Bridge
