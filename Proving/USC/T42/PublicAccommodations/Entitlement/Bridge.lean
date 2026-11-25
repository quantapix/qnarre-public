






























import Proving.USC.T42.PublicAccommodations.Entitlement.Elements.Statute
import Proving.USC.T42.PublicAccommodations.Entitlement.Deontic.Statute
import Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.Statute
import Proving.USC.T42.PublicAccommodations.Entitlement.Procedure.Statute
import Proving.USC.T42.PublicAccommodations.Entitlement.Structure.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Bridge
open Proving.USC.Common










axiom mapEstED : Elements.Establishment → Deontic.Establishment



axiom corr_ed_condition {e : Elements.Establishment} {c : ComplaintText} :
    Elements.PlaceOfPublicAccommodation e c →
    Deontic.EstablishmentIsCovered (mapEstED e) c


axiom corr_ed_notExempt {e : Elements.Establishment} {c : ComplaintText} :
    Elements.NotExemptPrivateClub e c → ¬ Deontic.IsPrivateClubExempt (mapEstED e) c



axiom corr_ed_act {p : Person} {e : Elements.Establishment} {c : ComplaintText} :
    Elements.DeniedFullAndEqualEnjoyment p e c →
    Elements.DiscriminatedOnProhibitedGround p e c →
    Deontic.DiscriminationActOccurred p (mapEstED e) c


axiom corr_ed_addressee {p : Person} {e : Elements.Establishment} {c : ComplaintText} :
    Elements.PlaceOfPublicAccommodation e c →
    Deontic.AddresseeOperatesEstablishment p (mapEstED e) c




theorem s2000a_elements_implies_deontic
    {p : Person} {e : Elements.Establishment} {c : ComplaintText}
    (h : Elements.Section2000aViolation p e c)
    : Deontic.ProhibitionViolated2000a p (mapEstED e) c := by
  cases h with
  | commerce hc =>
      exact ⟨⟨corr_ed_addressee hc.covered, corr_ed_condition hc.covered,
              corr_ed_notExempt hc.covered.notExempt⟩,
             corr_ed_act hc.denied hc.onGround⟩
  | stateAction hs =>
      exact ⟨⟨corr_ed_addressee hs.covered, corr_ed_condition hs.covered,
              corr_ed_notExempt hs.covered.notExempt⟩,
             corr_ed_act hs.denied hs.onGround⟩







axiom mapEstEO : Elements.Establishment → Ontology.Establishment
axiom mapPpaEO : Elements.Establishment → Ontology.PlaceOfPublicAccommodation
axiom mapSAEO  : Elements.Establishment → Ontology.StateActionSupport

axiom corr_eo_ppa {e : Elements.Establishment} {c : ComplaintText} :
    Elements.PlaceOfPublicAccommodation e c →
    Ontology.IsPlaceOfPublicAccommodation (mapPpaEO e) c
axiom corr_eo_servesPublic {e : Elements.Establishment} {c : ComplaintText} :
    Elements.IsEnumeratedEstablishment e c →
    Ontology.IsEstablishmentServingPublic (mapEstEO e) c
axiom corr_eo_commerceGate {e : Elements.Establishment} {c : ComplaintText} :
    Elements.OperationsAffectCommerce e c →
    Ontology.OperationsAffectCommerce (mapEstEO e) c
axiom corr_eo_stateGate {e : Elements.Establishment} {c : ComplaintText} :
    Elements.DiscriminationSupportedByStateAction e c →
    Ontology.IsSupportedByStateAction (mapSAEO e) c




theorem s2000a_elements_implies_ontology
    {p : Person} {e : Elements.Establishment} {c : ComplaintText}
    (h : Elements.Section2000aViolation p e c)
    : Ontology.PlaceOfPublicAccommodationMembership (mapPpaEO e) (mapEstEO e) (mapSAEO e) c := by
  cases h with
  | commerce hc =>
      exact ⟨corr_eo_ppa hc.covered, corr_eo_servesPublic hc.covered.enumerated,
             Or.inl (corr_eo_commerceGate hc.commerce)⟩
  | stateAction hs =>
      exact ⟨corr_eo_ppa hs.covered, corr_eo_servesPublic hs.covered.enumerated,
             Or.inr (corr_eo_stateGate hs.stateAction)⟩










axiom corr_es_defExists {e : Elements.Establishment} {c : ComplaintText} :
    Elements.IsEnumeratedEstablishment e c →
    Structure.ReferencedSectionExists Structure.edge_2000a_incorporates_def c
axiom corr_es_defHonored {e : Elements.Establishment} {c : ComplaintText} :
    Elements.IsEnumeratedEstablishment e c →
    Structure.IncorporationHonored Structure.edge_2000a_incorporates_def c
axiom corr_es_commExists {e : Elements.Establishment} {c : ComplaintText} :
    Elements.OperationsAffectCommerce e c →
    Structure.ReferencedSectionExists Structure.edge_2000a_incorporates_commerce c
axiom corr_es_commHonored {e : Elements.Establishment} {c : ComplaintText} :
    Elements.OperationsAffectCommerce e c →
    Structure.IncorporationHonored Structure.edge_2000a_incorporates_commerce c
axiom corr_es_excScope {e : Elements.Establishment} {c : ComplaintText} :
    Elements.NotExemptPrivateClub e c →
    Structure.ReferencedSectionExists Structure.edge_2000a_exceptAsProvided_b c







theorem s2000a_elements_implies_structure_modulo_gaps
    {p : Person} {e : Elements.Establishment} {c : ComplaintText}
    (h : Elements.Section2000aViolation p e c)
    (gap_commExists  : Structure.ReferencedSectionExists Structure.edge_2000a_incorporates_commerce c)
    (gap_commHonored : Structure.IncorporationHonored Structure.edge_2000a_incorporates_commerce c)
    : Structure.Coherent2000a c := by
  cases h with
  | commerce hc =>
      exact ⟨corr_es_defExists hc.covered.enumerated, corr_es_defHonored hc.covered.enumerated,
             gap_commExists, gap_commHonored, corr_es_excScope hc.covered.notExempt⟩
  | stateAction hs =>
      exact ⟨corr_es_defExists hs.covered.enumerated, corr_es_defHonored hs.covered.enumerated,
             gap_commExists, gap_commHonored, corr_es_excScope hs.covered.notExempt⟩









axiom corr_ed3_aggrieved {p : Person} {c : ComplaintText} :
    Elements.IsPersonAggrieved p c → Deontic.IsPersonAggrieved p c
axiom corr_ed3_instituted {p : Person} {c : ComplaintText} :
    Elements.SeeksPreventiveRelief p c → Deontic.PreventiveReliefActionInstituted p c






theorem s2000a3_elements_implies_deontic_modulo_gaps
    {p : Person} {c : ComplaintText}
    (hAggr : Elements.IsPersonAggrieved p c)
    (hRelief : Elements.SeeksPreventiveRelief p c)
    (gap_trigger : Deontic.ProhibitedActEngagedOrImminent c)
    : Deontic.PermissionExercised2000a3 p c :=
  ⟨⟨corr_ed3_aggrieved hAggr, gap_trigger⟩, corr_ed3_instituted hRelief⟩











axiom corr_ep3_notice {p : Person} {c : ComplaintText} :
    Elements.GaveStatePresuitNotice p c →
    Procedure.StateNoticeGiven p c








theorem s2000a3_elements_implies_procedure_modulo_gaps
    {p : Person} {c : ComplaintText}
    (hNotice : Elements.GaveStatePresuitNotice p c)
    (gap_trigger    : Procedure.AggrievedTriggerExists p c)
    (gap_byAggrieved : Procedure.InstitutedByAggrieved p c)
    (gap_stateLaw   : Procedure.StateLawExists p c)
    (gap_window     : Procedure.WithinThirtyDayNoticeWindow p c)
    : Procedure.TimelyFilingNoticeBranch p c :=
  ⟨gap_trigger, gap_byAggrieved, gap_stateLaw, corr_ep3_notice hNotice, gap_window⟩








axiom corr_dp6_jurisdiction {p : Person} {c : ComplaintText} :
    Deontic.ProceedingInstitutedUnderSubchapter c →
    Procedure.DistrictCourtJurisdiction p c






theorem s2000a6_deontic_implies_procedure_modulo_gaps
    {p : Person} {c : ComplaintText}
    (hPower : Deontic.Power2000a6 c)
    (gap_noExhaustion : Procedure.ExhaustionNotRequired p c)
    : Procedure.ReachesMerits p c :=
  ⟨corr_dp6_jurisdiction hPower.condition, gap_noExhaustion⟩

end Proving.USC.T42.PublicAccommodations.Entitlement.Bridge
