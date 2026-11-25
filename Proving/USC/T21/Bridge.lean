





















































import Proving.USC.T21.Elements.Statute
import Proving.USC.T21.Deontic.Statute
import Proving.USC.T21.Ontology.Statute
import Proving.USC.T21.Procedure.Statute
import Proving.USC.T21.Structure.Statute

namespace Proving.USC.T21.Bridge
open Proving.USC.Common







axiom oSub : Elements.Substance → Ontology.Substance

axiom oOff : Person → Elements.Substance → Procedure.Offense

axiom oOffD : Person → ComplaintText → Procedure.Offense

axiom oObj : Person → ComplaintText → Procedure.Offense

axiom oConv : Procedure.Conviction → Ontology.Offense

axiom oCt : ComplaintText → Deontic.Court

axiom oTreat : Person → ComplaintText → Ontology.DrugAct






axiom dtControlledSubstance  : Deontic.DefinedTerm
axiom dtCounterfeitSubstance : Deontic.DefinedTerm
axiom dtListedChemical       : Deontic.DefinedTerm
axiom dtDateRapeDrug         : Deontic.DefinedTerm





axiom corr_cs_eo : ∀ {s : Elements.Substance} {c : ComplaintText},
    Elements.IsControlledSubstance s c → Ontology.IsControlledSubstance (oSub s) c
axiom corr_cs_od : ∀ {s : Ontology.Substance} {c : ComplaintText},
    Ontology.IsControlledSubstance s c → Deontic.TermDefined dtControlledSubstance c

theorem controlledSubstance_elements_implies_ontology
    {s : Elements.Substance} {c : ComplaintText}
    (h : Elements.IsControlledSubstance s c) :
    Ontology.IsControlledSubstance (oSub s) c := corr_cs_eo h
theorem controlledSubstance_ontology_implies_deontic
    {s : Ontology.Substance} {c : ComplaintText}
    (h : Ontology.IsControlledSubstance s c) :
    Deontic.TermDefined dtControlledSubstance c := corr_cs_od h

theorem controlledSubstance_elements_implies_deontic
    {s : Elements.Substance} {c : ComplaintText}
    (h : Elements.IsControlledSubstance s c) :
    Deontic.TermDefined dtControlledSubstance c := corr_cs_od (corr_cs_eo h)



axiom corr_cf_eo : ∀ {s : Elements.Substance} {c : ComplaintText},
    Elements.IsCounterfeitSubstance s c → Ontology.IsCounterfeitSubstance (oSub s) c
axiom corr_cf_od : ∀ {s : Ontology.Substance} {c : ComplaintText},
    Ontology.IsCounterfeitSubstance s c → Deontic.TermDefined dtCounterfeitSubstance c

theorem counterfeitSubstance_elements_implies_ontology
    {s : Elements.Substance} {c : ComplaintText}
    (h : Elements.IsCounterfeitSubstance s c) :
    Ontology.IsCounterfeitSubstance (oSub s) c := corr_cf_eo h
theorem counterfeitSubstance_ontology_implies_deontic
    {s : Ontology.Substance} {c : ComplaintText}
    (h : Ontology.IsCounterfeitSubstance s c) :
    Deontic.TermDefined dtCounterfeitSubstance c := corr_cf_od h
theorem counterfeitSubstance_elements_implies_deontic
    {s : Elements.Substance} {c : ComplaintText}
    (h : Elements.IsCounterfeitSubstance s c) :
    Deontic.TermDefined dtCounterfeitSubstance c := corr_cf_od (corr_cf_eo h)



axiom corr_lc_eo : ∀ {s : Elements.Substance} {c : ComplaintText},
    Elements.IsListedChemical s c → Ontology.IsListedChemical (oSub s) c
axiom corr_lc_od : ∀ {s : Ontology.Substance} {c : ComplaintText},
    Ontology.IsListedChemical s c → Deontic.TermDefined dtListedChemical c

theorem listedChemical_elements_implies_ontology
    {s : Elements.Substance} {c : ComplaintText}
    (h : Elements.IsListedChemical s c) :
    Ontology.IsListedChemical (oSub s) c := corr_lc_eo h
theorem listedChemical_ontology_implies_deontic
    {s : Ontology.Substance} {c : ComplaintText}
    (h : Ontology.IsListedChemical s c) :
    Deontic.TermDefined dtListedChemical c := corr_lc_od h
theorem listedChemical_elements_implies_deontic
    {s : Elements.Substance} {c : ComplaintText}
    (h : Elements.IsListedChemical s c) :
    Deontic.TermDefined dtListedChemical c := corr_lc_od (corr_lc_eo h)







axiom corr_fdo_po : ∀ {p : Person} {k : Procedure.Conviction} {m : Nat} {c : ComplaintText},
    Procedure.PriorFelonyDrugConviction p k c →
    Procedure.OffensePunishableByImprisonmentMonths k m c →
    Procedure.punishableByMoreThanOneYear m →
    Ontology.IsFelonyDrugOffense (oConv k) c

theorem s802p44_procedure_implies_ontology
    {p : Person} {k : Procedure.Conviction} {m : Nat} {c : ComplaintText}
    (h : Procedure.FelonyDrugOffense p k m c) :
    Ontology.IsFelonyDrugOffense (oConv k) c :=
  corr_fdo_po h.drugRelated h.punishable h.threshold






axiom corr_maint_po : ∀ {p : Person} {d : Nat} {c : ComplaintText},
    Procedure.NarcoticDispensedForTreatmentDays p d c →
    Procedure.maintenanceTreatmentPeriod d →
    Ontology.IsMaintenanceTreatment (oTreat p c) c
axiom corr_detox_po : ∀ {p : Person} {d : Nat} {c : ComplaintText},
    Procedure.NarcoticDispensedForTreatmentDays p d c →
    Procedure.detoxificationTreatmentPeriod d →
    Ontology.IsDetoxificationTreatment (oTreat p c) c

theorem s802p29_procedure_implies_ontology
    {p : Person} {d : Nat} {c : ComplaintText}
    (h : Procedure.MaintenanceTreatmentWindow p d c) :
    Ontology.IsMaintenanceTreatment (oTreat p c) c :=
  corr_maint_po h.dispensed h.window
theorem s802p30_procedure_implies_ontology
    {p : Person} {d : Nat} {c : ComplaintText}
    (h : Procedure.DetoxificationTreatmentWindow p d c) :
    Ontology.IsDetoxificationTreatment (oTreat p c) c :=
  corr_detox_po h.dispensed h.window







axiom corr_notAuthorized : ∀ {p : Person} {c : ComplaintText},
    ¬ Elements.AuthorizedBySubchapter p c → Deontic.NotAuthorizedBySubchapter p c



axiom corr_841a_addr : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841a p s c → Deontic.AnyPersonAddressee p c
axiom corr_841a1_act : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841a1 p s c → Deontic.ControlledSubstanceActOccurred841a1 p c
axiom corr_841a2_act : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841a2 p s c → Deontic.CounterfeitSubstanceActOccurred841a2 p c




theorem s841a_elements_implies_deontic
    {p : Person} {s : Elements.Substance} {c : ComplaintText}
    (h : Elements.Section841a p s c) :
    Deontic.ProhibitionViolated841a p c :=
  match h with
  | .controlled h1 =>
      ⟨⟨corr_841a_addr (.controlled h1), corr_notAuthorized h1.notAuthorized⟩,
        .controlled (corr_841a1_act h1)⟩
  | .counterfeit h2 =>
      ⟨⟨corr_841a_addr (.counterfeit h2), corr_notAuthorized h2.notAuthorized⟩,
        .counterfeit (corr_841a2_act h2)⟩



axiom corr_841a_violation : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841a p s c → Procedure.ViolationCommitted p (oOff p s) c

theorem s841a_elements_implies_procedure
    {p : Person} {s : Elements.Substance} {c : ComplaintText}
    (h : Elements.Section841a p s c) :
    Procedure.Reaches p (oOff p s) c .violated :=
  .violated (corr_841a_violation h)



axiom corr_841a_dp : ∀ {p : Person} {c : ComplaintText},
    Deontic.ProhibitionViolated841a p c → Procedure.ViolationCommitted p (oOffD p c) c

theorem s841a_deontic_implies_procedure
    {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated841a p c) :
    Procedure.Reaches p (oOffD p c) c .violated :=
  .violated (corr_841a_dp h)










axiom corr_841c_addr : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841c p s c → Deontic.AnyPersonAddressee p c
axiom corr_841c1_act : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841c1 p s c → Deontic.ListedChemicalActOccurred841c p c
axiom corr_841c2_act : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841c2 p s c → Deontic.ListedChemicalActOccurred841c p c
axiom corr_841c3_act : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841c3 p s c → Deontic.ListedChemicalActOccurred841c p c

theorem s841c_elements_implies_deontic_modulo_gaps
    {p : Person} {s : Elements.Substance} {c : ComplaintText}
    (gap_841c3_authorization_condition : Deontic.NotAuthorizedBySubchapter p c)
    (h : Elements.Section841c p s c) :
    Deontic.ProhibitionViolated841c p c :=
  match h with
  | .possessionWithIntent h1 =>
      ⟨⟨corr_841c_addr (.possessionWithIntent h1),
        corr_notAuthorized h1.notAuthorized⟩, corr_841c1_act h1⟩
  | .knowingSupply h2 =>
      ⟨⟨corr_841c_addr (.knowingSupply h2),
        corr_notAuthorized h2.notAuthorized⟩, corr_841c2_act h2⟩
  | .recordkeepingEvasion h3 =>
      ⟨⟨corr_841c_addr (.recordkeepingEvasion h3),
        gap_841c3_authorization_condition⟩, corr_841c3_act h3⟩



axiom corr_841d_addr : ∀ {p : Person} {c : ComplaintText},
    Elements.Section841d1 p c → Deontic.AnyPersonAddressee p c
axiom corr_841d_act : ∀ {p : Person} {c : ComplaintText},
    Elements.PlacedOrMaintainedBoobytrap p c → Deontic.BoobytrapActOccurred841d p c
axiom corr_841d_cond : ∀ {p : Person} {c : ComplaintText},
    Elements.SiteIsFederalProperty c → Elements.ControlledSubstanceActivityAtSite c →
    Deontic.FederalDrugPropertyCondition841d p c

theorem s841d_elements_implies_deontic
    {p : Person} {c : ComplaintText}
    (h : Elements.Section841d1 p c) :
    Deontic.ProhibitionViolated841d p c :=
  ⟨⟨corr_841d_addr h, corr_841d_cond h.federalProperty h.drugActivity⟩,
    corr_841d_act h.placed⟩



axiom corr_841f1_addr : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841f1 p s c → Deontic.AnyPersonAddressee p c
axiom corr_841f1_act : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841f1 p s c → Deontic.ListedChemicalDistributionOccurred841f1 p c

theorem s841f1_elements_implies_deontic
    {p : Person} {s : Elements.Substance} {c : ComplaintText}
    (h : Elements.Section841f1 p s c) :
    Deontic.ProhibitionViolated841f1 p c :=
  ⟨⟨corr_841f1_addr h⟩, corr_841f1_act h⟩



axiom corr_841f2_addr : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841f2 p s c → Deontic.AnyPersonAddressee p c
axiom corr_841f2_know : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.PossessedSubstance p s c → Elements.IsListedChemical s c →
    Elements.KnewRecordkeepingNotAdheredTo p s c →
    Deontic.KnowledgeOfRecordkeepingViolation841f2 p c
axiom corr_841f2_fail : ∀ {p : Person} {c : ComplaintText},
    Elements.FailedToRemedyViolation p c → ¬ Deontic.RemedialStepsTaken841f2 p c

theorem s841f2_elements_implies_deontic
    {p : Person} {s : Elements.Substance} {c : ComplaintText}
    (h : Elements.Section841f2 p s c) :
    Deontic.ObligationBreached841f2 p c :=
  ⟨⟨corr_841f2_addr h, corr_841f2_know h.possessed h.listed h.knewRecordLapse⟩,
    corr_841f2_fail h.failedToRemedy⟩






axiom corr_841f2_remedy_pd : ∀ {p : Person} {c : ComplaintText},
    Procedure.ImmediateRemedialStepsTaken p c → Deontic.RemedialStepsTaken841f2 p c

theorem s841f2_procedure_remediation_excludes_deontic_breach
    {p : Person} {c : ComplaintText}
    (h : Procedure.TimelyChemicalRemediation p c) :
    ¬ Deontic.ObligationBreached841f2 p c :=
  fun hb => hb.2 (corr_841f2_remedy_pd h.remedied)



axiom corr_841g1_addr : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841g1 p s c → Deontic.AnyPersonAddressee p c
axiom corr_841g1_act : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841g1 p s c → Deontic.DateRapeDrugInternetActOccurred841g1 p c

theorem s841g1_elements_implies_deontic
    {p : Person} {s : Elements.Substance} {c : ComplaintText}
    (h : Elements.Section841g1 p s c) :
    Deontic.ProhibitionViolated841g1 p c :=
  ⟨⟨corr_841g1_addr h⟩, corr_841g1_act h⟩



axiom corr_drd_eo : ∀ {s : Elements.Substance} {c : ComplaintText},
    Elements.IsDateRapeDrug s c → Ontology.IsDateRapeDrug (oSub s) c
axiom corr_drd_od : ∀ {s : Ontology.Substance} {c : ComplaintText},
    Ontology.IsDateRapeDrug s c → Deontic.TermDefined dtDateRapeDrug c

theorem dateRapeDrug_elements_implies_ontology
    {s : Elements.Substance} {c : ComplaintText}
    (h : Elements.IsDateRapeDrug s c) :
    Ontology.IsDateRapeDrug (oSub s) c := corr_drd_eo h
theorem dateRapeDrug_ontology_implies_deontic
    {s : Ontology.Substance} {c : ComplaintText}
    (h : Ontology.IsDateRapeDrug s c) :
    Deontic.TermDefined dtDateRapeDrug c := corr_drd_od h



axiom corr_841h_addr : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841h p s c → Deontic.AnyPersonAddressee p c
axiom corr_841h_act : ∀ {p : Person} {s : Elements.Substance} {c : ComplaintText},
    Elements.Section841h p s c → Deontic.InternetDistributionActOccurred841h p c

theorem s841h_elements_implies_deontic
    {p : Person} {s : Elements.Substance} {c : ComplaintText}
    (h : Elements.Section841h p s c) :
    Deontic.ProhibitionViolated841h p c :=
  ⟨⟨corr_841h_addr h, corr_notAuthorized h.notAuthorized⟩, corr_841h_act h⟩







axiom corr_841h_registration_authorizes : ∀ {p : Person} {c : ComplaintText},
    Procedure.ValidlyRegisteredWithInternetModification p c →
    Elements.AuthorizedBySubchapter p c

theorem s841h_elements_excludes_procedure_registration
    {p : Person} {s : Elements.Substance} {c : ComplaintText}
    (h : Elements.Section841h p s c) :
    ¬ Procedure.ValidlyRegisteredWithInternetModification p c :=
  fun hReg => h.notAuthorized (corr_841h_registration_authorizes hReg)



axiom corr_841b1C_court : ∀ {p : Person} {o : Procedure.Offense}
    {s : Procedure.Sentence} {c : ComplaintText},
    Procedure.SentenceImposed p o s c → Deontic.CourtAddressee (oCt c) c
axiom corr_841b1C_mandatory : ∀ {p : Person} {o : Procedure.Offense} {c : ComplaintText},
    Procedure.ProbationBarApplies p o c → Deontic.MandatoryTermApplies841b1C p c
axiom corr_841b1C_probation : ∀ {p : Person} {s : Procedure.Sentence} {c : ComplaintText},
    Procedure.PlacedOnProbationOrSentenceSuspended p s c →
    Deontic.ProbationOrSuspensionGranted841b1C (oCt c) p c

theorem s841b1C_procedure_implies_deontic
    {p : Person} {o : Procedure.Offense} {s : Procedure.Sentence} {c : ComplaintText}
    (h : Procedure.ProbationBarBreached p o s c) :
    Deontic.ProhibitionViolated841b1C (oCt c) p c :=
  ⟨⟨corr_841b1C_court h.sentenced, corr_841b1C_mandatory h.bar⟩,
    corr_841b1C_probation h.probation⟩



axiom corr_841e_conv : ∀ {p : Person} {o : Procedure.Offense} {c : ComplaintText},
    Procedure.FelonyListedChemicalConviction p o c →
    Deontic.FelonyListedChemicalConviction841e p c
axiom corr_841e_court : ∀ {p : Person} {y : Nat} {c : ComplaintText},
    Procedure.EnjoinedFromListedChemicalTransactionsForYears p y c →
    Deontic.CourtAddressee (oCt c) c

theorem s841e_procedure_implies_deontic
    {p : Person} {o : Procedure.Offense} {y : Nat} {c : ComplaintText}
    (h : Procedure.ChemicalInjunctionWithinCap p o y c) :
    Deontic.Power841e (oCt c) p c :=
  ⟨corr_841e_court h.enjoined, corr_841e_conv h.conviction⟩







axiom corr_auth_es : ∀ {p : Person} {c : ComplaintText},
    Elements.AuthorizedBySubchapter p c →
    Structure.ExceptionApplies Structure.edge_841a_exceptAs_subchapterAuth c

theorem s841a_elements_authorization_implies_structure_exception
    {p : Person} {c : ComplaintText}
    (h : Elements.AuthorizedBySubchapter p c) :
    Structure.ExceptionApplies Structure.edge_841a_exceptAs_subchapterAuth c :=
  corr_auth_es h

axiom corr_841b1C_override_ds : ∀ {p : Person} {c : ComplaintText},
    Deontic.MandatoryTermApplies841b1C p c →
    Structure.OverrideTriggered Structure.edge_841b1C_notwithstanding_anyLaw c

theorem s841b1C_deontic_implies_structure_override
    {p : Person} {c : ComplaintText}
    (h : Deontic.MandatoryTermApplies841b1C p c) :
    Structure.OverrideTriggered Structure.edge_841b1C_notwithstanding_anyLaw c :=
  corr_841b1C_override_ds h



axiom corr_846_addr : ∀ {p : Person} {ag : Agreement} {c : ComplaintText},
    Elements.Section846 p ag c → Deontic.AnyPersonAddressee p c
axiom corr_846_attempt_act : ∀ {p : Person} {c : ComplaintText},
    Elements.Attempt846 p c → Deontic.ConspiracyOrAttemptActOccurred846 p c
axiom corr_846_consp_act : ∀ {p : Person} {ag : Agreement} {c : ComplaintText},
    Elements.Conspiracy846 p ag c → Deontic.ConspiracyOrAttemptActOccurred846 p c
axiom corr_846_attempt_obj : ∀ {p : Person} {c : ComplaintText},
    Elements.IntendedToCommitPredicateOffense p c → Deontic.ObjectOffenseInSubchapter846 p c
axiom corr_846_consp_obj : ∀ {p : Person} {ag : Agreement} {c : ComplaintText},
    Elements.ObjectWasSubchapterOffense ag c → Deontic.ObjectOffenseInSubchapter846 p c




theorem s846_elements_implies_deontic
    {p : Person} {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section846 p ag c) :
    Deontic.ProhibitionViolated846 p c :=
  match h with
  | .attempt ha =>
      ⟨⟨corr_846_addr (Elements.Section846.attempt (p := p) (ag := ag) ha),
        corr_846_attempt_obj ha.intent⟩, corr_846_attempt_act ha⟩
  | .conspiracy hc =>
      ⟨⟨corr_846_addr (Elements.Section846.conspiracy hc),
        corr_846_consp_obj (p := p) hc.objectOffense⟩, corr_846_consp_act hc⟩



axiom corr_846_attempt_inchoate : ∀ {p : Person} {c : ComplaintText},
    Elements.Attempt846 p c → Procedure.AttemptsOrConspiresToCommit p (oObj p c) c
axiom corr_846_consp_inchoate : ∀ {p : Person} {ag : Agreement} {c : ComplaintText},
    Elements.Conspiracy846 p ag c → Procedure.AttemptsOrConspiresToCommit p (oObj p c) c
axiom corr_846_attempt_objdef : ∀ {p : Person} {c : ComplaintText},
    Elements.IntendedToCommitPredicateOffense p c →
    Procedure.OffenseDefinedInSubchapter (oObj p c) c
axiom corr_846_consp_objdef : ∀ {p : Person} {ag : Agreement} {c : ComplaintText},
    Elements.ObjectWasSubchapterOffense ag c →
    Procedure.OffenseDefinedInSubchapter (oObj p c) c

theorem s846_elements_implies_procedure
    {p : Person} {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section846 p ag c) :
    Procedure.AttemptConspiracyPenaltyParity p (oObj p c) c :=
  match h with
  | .attempt ha =>
      ⟨corr_846_attempt_inchoate ha, corr_846_attempt_objdef ha.intent⟩
  | .conspiracy hc =>
      ⟨corr_846_consp_inchoate hc, corr_846_consp_objdef (p := p) hc.objectOffense⟩



axiom corr_846_dp_inchoate : ∀ {p : Person} {c : ComplaintText},
    Deontic.ConspiracyOrAttemptActOccurred846 p c →
    Procedure.AttemptsOrConspiresToCommit p (oObj p c) c
axiom corr_846_dp_objdef : ∀ {p : Person} {c : ComplaintText},
    Deontic.ObjectOffenseInSubchapter846 p c →
    Procedure.OffenseDefinedInSubchapter (oObj p c) c

theorem s846_deontic_implies_procedure
    {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated846 p c) :
    Procedure.AttemptConspiracyPenaltyParity p (oObj p c) c :=
  ⟨corr_846_dp_inchoate h.2, corr_846_dp_objdef h.1.condition⟩

end Proving.USC.T21.Bridge
