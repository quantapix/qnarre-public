



































import Proving.USC.T18.Ch1.Elements.Theorems
import Proving.USC.T18.Ch1.Deontic.Theorems
import Proving.USC.T18.Ch1.Ontology.Theorems
import Proving.USC.T18.Ch1.Procedure.Theorems
import Proving.USC.T18.Ch1.Structure.Theorems

namespace Proving.USC.T18.Ch1.Bridge

open Proving.USC.Common (Person Entity ComplaintText)











axiom corr_s2_direct (p : Person) (c : ComplaintText) :
  Elements.CommitsOffenseAgainstUS p c → Ontology.IsPrincipal p c
axiom corr_s2_accomplice (p : Person) (c : ComplaintText) :
  Elements.OffenseAgainstUSCommitted c → Elements.AidsAbetsOffense p c → Ontology.IsPrincipal p c
axiom corr_s2_causer (p : Person) (c : ComplaintText) :
  Elements.WillfullyCausesOffendingAct p c → Ontology.IsPrincipal p c

theorem s2_elements_implies_ontology (p : Person) (c : ComplaintText)
    (h : Elements.PrincipalLiable p c) : Ontology.IsPrincipal p c :=
  match h with
  | .direct hd          => corr_s2_direct p c hd
  | .accomplice ho ha   => corr_s2_accomplice p c ho ha
  | .causer hc          => corr_s2_causer p c hc

axiom corr_s2a_deon_ontology (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  Deontic.OffenseAgainstUS o c → Deontic.AbettedCommission p o c → Ontology.IsPrincipal p c
axiom corr_s2b_deon_ontology (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  Deontic.WillfullyCausedOffense p o c → Ontology.IsPrincipal p c

theorem s2_deontic2a_implies_ontology (p : Person) (o : Deontic.Offense) (c : ComplaintText)
    (h : Deontic.Prohibition2aViolated p o c) : Ontology.IsPrincipal p c :=
  corr_s2a_deon_ontology p o c h.1.offense h.2
theorem s2_deontic2b_implies_ontology (p : Person) (o : Deontic.Offense) (c : ComplaintText)
    (h : Deontic.Prohibition2bViolated p o c) : Ontology.IsPrincipal p c :=
  corr_s2b_deon_ontology p o c h



axiom corr_s2_accomplice_ed (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  Elements.OffenseAgainstUSCommitted c → Elements.AidsAbetsOffense p c → Deontic.Prohibition2aViolated p o c
axiom corr_s2_causer_ed (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  Elements.WillfullyCausesOffendingAct p c → Deontic.Prohibition2bViolated p o c

theorem s2_elements_implies_deontic_modulo_gaps
    (p : Person) (o : Deontic.Offense) (c : ComplaintText)
    (gap_direct : Elements.CommitsOffenseAgainstUS p c →
      Deontic.Prohibition2aViolated p o c ∨ Deontic.Prohibition2bViolated p o c)
    (h : Elements.PrincipalLiable p c) :
    Deontic.Prohibition2aViolated p o c ∨ Deontic.Prohibition2bViolated p o c :=
  match h with
  | .direct hd        => gap_direct hd
  | .accomplice ho ha => Or.inl (corr_s2_accomplice_ed p o c ho ha)
  | .causer hc        => Or.inr (corr_s2_causer_ed p o c hc)




axiom corr_s3_eo (p : Person) (c : ComplaintText) :
  Elements.OffenseAgainstUSCommitted c → Elements.KnowsOffenseCommitted p c →
  Elements.AssistsOffender p c → Elements.IntendsToHinderApprehension p c →
  Ontology.IsAccessoryAfterTheFact p c
theorem s3_elements_implies_ontology (p : Person) (c : ComplaintText)
    (h : Elements.Section3 p c) : Ontology.IsAccessoryAfterTheFact p c :=
  corr_s3_eo p c h.offenseCommitted h.knows h.assists h.intent

axiom corr_s3_do (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  Deontic.OffenseAgainstUS o c → Deontic.KnowsOffenseCommitted p o c →
  Deontic.AssistedOffenderToHinder p o c → Ontology.IsAccessoryAfterTheFact p c
theorem s3_deontic_implies_ontology (p : Person) (o : Deontic.Offense) (c : ComplaintText)
    (h : Deontic.Prohibition3Violated p o c) : Ontology.IsAccessoryAfterTheFact p c :=
  corr_s3_do p o c h.1.offense h.1.scienter h.2

axiom corr_s3_ed_offense (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  Elements.OffenseAgainstUSCommitted c → Deontic.OffenseAgainstUS o c
axiom corr_s3_ed_know (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  Elements.KnowsOffenseCommitted p c → Deontic.KnowsOffenseCommitted p o c
axiom corr_s3_ed_assist (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  Elements.AssistsOffender p c → Elements.IntendsToHinderApprehension p c →
  Deontic.AssistedOffenderToHinder p o c
theorem s3_elements_implies_deontic (p : Person) (o : Deontic.Offense) (c : ComplaintText)
    (h : Elements.Section3 p c) : Deontic.Prohibition3Violated p o c :=
  ⟨⟨corr_s3_ed_offense p o c h.offenseCommitted, corr_s3_ed_know p o c h.knows⟩,
   corr_s3_ed_assist p o c h.assists h.intent⟩





axiom corr_s4_eo (p : Person) (c : ComplaintText) :
  Elements.KnowsOfFelonyCommission p c → Elements.ConcealsFelony p c →
  Elements.FailsToDiscloseToAuthority p c → Ontology.IsMisprisionOfFelony p c
theorem s4_elements_implies_ontology (p : Person) (c : ComplaintText)
    (h : Elements.Section4 p c) : Ontology.IsMisprisionOfFelony p c :=
  corr_s4_eo p c h.knowledge h.conceals h.failsDisclose

axiom corr_s4_ed_know (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  Elements.KnowsOfFelonyCommission p c → Deontic.KnowsFelonyCommitted p o c
axiom corr_s4_ed_fail (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  Elements.FailsToDiscloseToAuthority p c → ¬ Deontic.MadeKnownAsSoonAsPossible p o c
axiom corr_s4_ed_conceal (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  Elements.ConcealsFelony p c → Deontic.ConcealedFelony p o c
theorem s4_elements_implies_deontic (p : Person) (o : Deontic.Offense) (c : ComplaintText)
    (h : Elements.Section4 p c) : Deontic.Misprision4 p o c :=
  ⟨⟨⟨corr_s4_ed_know p o c h.knowledge⟩, corr_s4_ed_fail p o c h.failsDisclose⟩,
   corr_s4_ed_conceal p o c h.conceals⟩

axiom corr_s4_ep_know (p : Person) (c : ComplaintText) :
  Elements.KnowsOfFelonyCommission p c → Procedure.HadKnowledgeOfFelony p c
axiom corr_s4_ep_conceal (p : Person) (c : ComplaintText) :
  Elements.ConcealsFelony p c → Procedure.ConcealedFelony p c
axiom corr_s4_ep_fail (p : Person) (c : ComplaintText) :
  Elements.FailsToDiscloseToAuthority p c → ¬ Procedure.DisclosureMade p c
theorem s4_elements_implies_procedure (p : Person) (c : ComplaintText)
    (h : Elements.Section4 p c) : Procedure.MisprisionBreach p c :=
  ⟨corr_s4_ep_know p c h.knowledge, corr_s4_ep_conceal p c h.conceals,
   corr_s4_ep_fail p c h.failsDisclose⟩

axiom corr_s4_do (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  Deontic.KnowsFelonyCommitted p o c → Deontic.ConcealedFelony p o c →
  Ontology.IsMisprisionOfFelony p c
theorem s4_deontic_implies_ontology (p : Person) (o : Deontic.Offense) (c : ComplaintText)
    (h : Deontic.Misprision4 p o c) : Ontology.IsMisprisionOfFelony p c :=
  corr_s4_do p o c h.1.1.scienter h.2

axiom corr_s4_dp_know (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  Deontic.KnowsFelonyCommitted p o c → Procedure.HadKnowledgeOfFelony p c
axiom corr_s4_dp_conceal (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  Deontic.ConcealedFelony p o c → Procedure.ConcealedFelony p c
axiom corr_s4_dp_fail (p : Person) (o : Deontic.Offense) (c : ComplaintText) :
  ¬ Deontic.MadeKnownAsSoonAsPossible p o c → ¬ Procedure.DisclosureMade p c
theorem s4_deontic_implies_procedure (p : Person) (o : Deontic.Offense) (c : ComplaintText)
    (h : Deontic.Misprision4 p o c) : Procedure.MisprisionBreach p c :=
  ⟨corr_s4_dp_know p o c h.1.1.scienter, corr_s4_dp_conceal p o c h.2,
   corr_s4_dp_fail p o c h.1.2⟩

axiom corr_s4_po (p : Person) (c : ComplaintText) :
  Procedure.HadKnowledgeOfFelony p c → Procedure.ConcealedFelony p c →
  Ontology.IsMisprisionOfFelony p c
theorem s4_procedure_implies_ontology (p : Person) (c : ComplaintText)
    (h : Procedure.MisprisionBreach p c) : Ontology.IsMisprisionOfFelony p c :=
  corr_s4_po p c h.knowledge h.concealed




axiom corr_s5_eo (loc : Elements.Location) (pl : Ontology.Place) (c : ComplaintText) :
  Elements.SubjectToUSJurisdiction loc c → ¬ Elements.IsCanalZone loc c → Ontology.IsUnitedStates pl c
theorem s5_elements_implies_ontology (loc : Elements.Location) (pl : Ontology.Place) (c : ComplaintText)
    (h : Elements.WithinUnitedStates loc c) : Ontology.IsUnitedStates pl c :=
  corr_s5_eo loc pl c h.subject h.notCanalZone



axiom corr_s6_department (e : Entity) (c : ComplaintText) :
  Elements.IsDepartmentOfUS e c → Ontology.IsDepartment e c
axiom corr_s6_agency (e : Entity) (c : ComplaintText) :
  Elements.IsAgencyOfUS e c → Ontology.IsAgency e c
theorem s6_elements_implies_ontology_department (e : Entity) (c : ComplaintText)
    (h : Elements.IsDepartmentOfUS e c) : Ontology.IsDepartment e c := corr_s6_department e c h
theorem s6_elements_implies_ontology_agency (e : Entity) (c : ComplaintText)
    (h : Elements.IsAgencyOfUS e c) : Ontology.IsAgency e c := corr_s6_agency e c h







axiom corr_s7_eo (loc : Elements.Location) (pl : Ontology.Place) (c : ComplaintText) :
  Elements.WithinSpecialMaritimeTerritorialJurisdiction loc c →
  Ontology.IsSpecialMaritimeTerritorialJurisdiction pl c
theorem s7_elements_implies_ontology (loc : Elements.Location) (pl : Ontology.Place) (c : ComplaintText)
    (h : Elements.WithinSpecialMaritimeTerritorialJurisdiction loc c) :
    Ontology.IsSpecialMaritimeTerritorialJurisdiction pl c := corr_s7_eo loc pl c h

axiom corr_s7_ep (loc : Elements.Location) (loc' : Procedure.Location) (c : ComplaintText) :
  Elements.WithinSpecialMaritimeTerritorialJurisdiction loc c → Procedure.WithinSMTJ loc' c
theorem s7_elements_implies_procedure (loc : Elements.Location) (loc' : Procedure.Location) (c : ComplaintText)
    (h : Elements.WithinSpecialMaritimeTerritorialJurisdiction loc c) :
    Procedure.WithinSMTJ loc' c := corr_s7_ep loc loc' c h

axiom corr_s7_po (loc : Procedure.Location) (pl : Ontology.Place) (c : ComplaintText) :
  Procedure.WithinSMTJ loc c → Ontology.IsSpecialMaritimeTerritorialJurisdiction pl c
theorem s7_procedure_implies_ontology (loc : Procedure.Location) (pl : Ontology.Place) (c : ComplaintText)
    (h : Procedure.WithinSMTJ loc c) : Ontology.IsSpecialMaritimeTerritorialJurisdiction pl c :=
  corr_s7_po loc pl c h



axiom corr_s8_eo (i : Elements.Instrument) (i' : Ontology.Instrument) (c : ComplaintText) :
  Elements.IsObligationOrSecurityOfUS i c → Ontology.IsObligationOrSecurityOfUS i' c
theorem s8_elements_implies_ontology (i : Elements.Instrument) (i' : Ontology.Instrument) (c : ComplaintText)
    (h : Elements.IsObligationOrSecurityOfUS i c) : Ontology.IsObligationOrSecurityOfUS i' c :=
  corr_s8_eo i i' c h



axiom corr_s9_eo (v : Elements.Vessel) (v' : Ontology.Vessel) (c : ComplaintText) :
  Elements.IsVesselOfUS v c → Ontology.IsVesselOfUnitedStates v' c
theorem s9_elements_implies_ontology (v : Elements.Vessel) (v' : Ontology.Vessel) (c : ComplaintText)
    (h : Elements.IsVesselOfUS v c) : Ontology.IsVesselOfUnitedStates v' c := corr_s9_eo v v' c h



axiom corr_s10_interstate (a : Ontology.CommerceActivity) (c : ComplaintText) :
  Elements.InvolvesInterstateCommerce c → Ontology.IsInterstateCommerce a c
axiom corr_s10_foreign (a : Ontology.CommerceActivity) (c : ComplaintText) :
  Elements.InvolvesForeignCommerce c → Ontology.IsForeignCommerce a c
theorem s10_elements_implies_ontology_interstate (a : Ontology.CommerceActivity) (c : ComplaintText)
    (h : Elements.InvolvesInterstateCommerce c) : Ontology.IsInterstateCommerce a c := corr_s10_interstate a c h
theorem s10_elements_implies_ontology_foreign (a : Ontology.CommerceActivity) (c : ComplaintText)
    (h : Elements.InvolvesForeignCommerce c) : Ontology.IsForeignCommerce a c := corr_s10_foreign a c h



axiom corr_s11_eo (e : Entity) (c : ComplaintText) :
  Elements.IsForeignGovernment e c → Ontology.IsForeignGovernment e c
theorem s11_elements_implies_ontology (e : Entity) (c : ComplaintText)
    (h : Elements.IsForeignGovernment e c) : Ontology.IsForeignGovernment e c := corr_s11_eo e c h



axiom corr_s12_eo (e : Entity) (c : ComplaintText) :
  Elements.IsPostalService e c → Ontology.IsPostalService e c
theorem s12_elements_implies_ontology (e : Entity) (c : ComplaintText)
    (h : Elements.IsPostalService e c) : Ontology.IsPostalService e c := corr_s12_eo e c h









axiom corr_s13a_ed_enclave (p : Person) (loc : Elements.Location) (c : ComplaintText) :
  Elements.WithinFederalEnclaveOrTerritorialSea loc c → Deontic.WithinFederalEnclave p c
axiom corr_s13a_ed_notfed (p : Person) (c : ComplaintText) :
  ¬ Elements.PunishableByCongressEnactment p c → Deontic.NotPunishableByCongress c
axiom corr_s13a_ed_state (p : Person) (c : ComplaintText) :
  Elements.PunishableUnderAssimilatedStateLaw p c → Deontic.PunishableUnderStateLaw c
axiom corr_s13a_ed_act (p : Person) (c : ComplaintText) :
  Elements.CommittedActOrOmission p c → Deontic.CommittedAssimilatedActOrOmission p c
theorem s13a_elements_implies_deontic (p : Person) (loc : Elements.Location) (c : ComplaintText)
    (h : Elements.Section13a p loc c) : Deontic.Prohibition13aViolated p c :=
  ⟨⟨corr_s13a_ed_enclave p loc c h.withinJurisdiction,
    corr_s13a_ed_notfed p c h.notFederalPunishable,
    corr_s13a_ed_state p c h.statePunishable⟩,
   corr_s13a_ed_act p c h.actOrOmission⟩


axiom corr_s13a_ep_place (loc : Elements.Location) (loc' : Procedure.Location) (c : ComplaintText) :
  Elements.WithinFederalEnclaveOrTerritorialSea loc c → Procedure.WithinSection7Place loc' c
axiom corr_s13a_ep_notfed (p : Person) (c : ComplaintText) :
  ¬ Elements.PunishableByCongressEnactment p c → Procedure.NotPunishableByFederalEnactment p c
axiom corr_s13a_ep_state (p : Person) (c : ComplaintText) :
  Elements.PunishableUnderAssimilatedStateLaw p c → Procedure.PunishableUnderStateLaw p c
theorem s13a_elements_implies_procedure (p : Person) (loc : Elements.Location)
    (loc' : Procedure.Location) (c : ComplaintText)
    (h : Elements.Section13a p loc c) : Procedure.AssimilatedOffense p loc' c :=
  ⟨corr_s13a_ep_place loc loc' c h.withinJurisdiction,
   corr_s13a_ep_notfed p c h.notFederalPunishable,
   corr_s13a_ep_state p c h.statePunishable⟩


axiom corr_s13a_dp_place (p : Person) (loc' : Procedure.Location) (c : ComplaintText) :
  Deontic.WithinFederalEnclave p c → Procedure.WithinSection7Place loc' c
axiom corr_s13a_dp_notfed (p : Person) (c : ComplaintText) :
  Deontic.NotPunishableByCongress c → Procedure.NotPunishableByFederalEnactment p c
axiom corr_s13a_dp_state (p : Person) (c : ComplaintText) :
  Deontic.PunishableUnderStateLaw c → Procedure.PunishableUnderStateLaw p c
theorem s13a_deontic_implies_procedure (p : Person) (loc' : Procedure.Location) (c : ComplaintText)
    (h : Deontic.Prohibition13aViolated p c) : Procedure.AssimilatedOffense p loc' c :=
  ⟨corr_s13a_dp_place p loc' c h.1.enclave,
   corr_s13a_dp_notfed p c h.1.notFed,
   corr_s13a_dp_state p c h.1.stateCrime⟩


axiom corr_s13b_eo (p : Person) (c : ComplaintText) :
  Elements.PresentPersonIsMinor c → Ontology.IsMinor p c
theorem s13b_elements_implies_ontology (p : Person) (c : ComplaintText)
    (h : Elements.Section13bEnhancement p c) : Ontology.IsMinor p c :=
  corr_s13b_eo p c h.isMinor

end Proving.USC.T18.Ch1.Bridge
