







































import Proving.USC.T22.Elements.Statute
import Proving.USC.T22.Deontic.Statute
import Proving.USC.T22.Ontology.Statute
import Proving.USC.T22.Procedure.Statute

namespace Proving.USC.T22.Bridge
open Proving.USC.Common









axiom oPractice : Elements.Practice → Ontology.Practice


axiom oCondition : Elements.Practice → Ontology.Condition

axiom oSexAct : Elements.Practice → Ontology.SexAct

axiom oLegalProcess : Elements.Practice → Ontology.LegalProcess

axiom oJurisdiction : Elements.Jurisdiction → Ontology.Jurisdiction






axiom dtAbuseOfLegalProcess : Deontic.DefinedTerm
axiom dtCoercion            : Deontic.DefinedTerm
axiom dtCommercialSexAct    : Deontic.DefinedTerm
axiom dtDebtBondage         : Deontic.DefinedTerm
axiom dtInvoluntaryServitude : Deontic.DefinedTerm
axiom dtSevereForms         : Deontic.DefinedTerm
axiom dtSexTrafficking      : Deontic.DefinedTerm
axiom dtState               : Deontic.DefinedTerm
axiom dtUnitedStates        : Deontic.DefinedTerm
axiom dtVictimSevereForm    : Deontic.DefinedTerm
axiom dtVictimTrafficking   : Deontic.DefinedTerm



axiom corr_alp_eo {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsAbuseOfLegalProcess pr c → Ontology.IsAbuseOfLegalProcess (oLegalProcess pr) c
axiom corr_alp_ed {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsAbuseOfLegalProcess pr c → Deontic.TermIsDefined dtAbuseOfLegalProcess c
axiom corr_alp_od {lp : Ontology.LegalProcess} {c : ComplaintText} :
    Ontology.IsAbuseOfLegalProcess lp c → Deontic.TermIsDefined dtAbuseOfLegalProcess c

theorem abuseOfLegalProcess_elements_implies_ontology
    {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.IsAbuseOfLegalProcess pr c) :
    Ontology.IsAbuseOfLegalProcess (oLegalProcess pr) c := corr_alp_eo h
theorem abuseOfLegalProcess_elements_implies_deontic
    {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.IsAbuseOfLegalProcess pr c) :
    Deontic.TermIsDefined dtAbuseOfLegalProcess c := corr_alp_ed h
theorem abuseOfLegalProcess_ontology_implies_deontic
    {lp : Ontology.LegalProcess} {c : ComplaintText}
    (h : Ontology.IsAbuseOfLegalProcess lp c) :
    Deontic.TermIsDefined dtAbuseOfLegalProcess c := corr_alp_od h



axiom corr_coercion_threats {pr : Elements.Practice} {c : ComplaintText} :
    Elements.CoercionThreatOfSeriousHarmOrRestraint pr c → Ontology.IsCoercion (oCondition pr) c
axiom corr_coercion_scheme {pr : Elements.Practice} {c : ComplaintText} :
    Elements.CoercionSchemeToInduceFearOfHarm pr c → Ontology.IsCoercion (oCondition pr) c
axiom corr_coercion_lp {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsAbuseOfLegalProcess pr c → Ontology.IsCoercion (oCondition pr) c
axiom corr_coercion_ed {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsCoercion pr c → Deontic.TermIsDefined dtCoercion c
axiom corr_coercion_od {cond : Ontology.Condition} {c : ComplaintText} :
    Ontology.IsCoercion cond c → Deontic.TermIsDefined dtCoercion c


theorem coercion_elements_implies_ontology
    {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.Coercion pr c) : Ontology.IsCoercion (oCondition pr) c :=
  match h with
  | .threats ht      => corr_coercion_threats ht
  | .scheme hs       => corr_coercion_scheme hs
  | .legalProcess hl => corr_coercion_lp hl
theorem coercion_elements_implies_deontic
    {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.IsCoercion pr c) : Deontic.TermIsDefined dtCoercion c := corr_coercion_ed h
theorem coercion_ontology_implies_deontic
    {cond : Ontology.Condition} {c : ComplaintText}
    (h : Ontology.IsCoercion cond c) : Deontic.TermIsDefined dtCoercion c := corr_coercion_od h



axiom corr_csa_eo {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsCommercialSexAct pr c → Ontology.IsCommercialSexAct (oSexAct pr) c
axiom corr_csa_ed {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsCommercialSexAct pr c → Deontic.TermIsDefined dtCommercialSexAct c
axiom corr_csa_od {a : Ontology.SexAct} {c : ComplaintText} :
    Ontology.IsCommercialSexAct a c → Deontic.TermIsDefined dtCommercialSexAct c

theorem commercialSexAct_elements_implies_ontology
    {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.IsCommercialSexAct pr c) : Ontology.IsCommercialSexAct (oSexAct pr) c := corr_csa_eo h
theorem commercialSexAct_elements_implies_deontic
    {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.IsCommercialSexAct pr c) : Deontic.TermIsDefined dtCommercialSexAct c := corr_csa_ed h
theorem commercialSexAct_ontology_implies_deontic
    {a : Ontology.SexAct} {c : ComplaintText}
    (h : Ontology.IsCommercialSexAct a c) : Deontic.TermIsDefined dtCommercialSexAct c := corr_csa_od h



axiom corr_db_eo {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsDebtBondage pr c → Ontology.IsDebtBondage (oCondition pr) c
axiom corr_db_ed {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsDebtBondage pr c → Deontic.TermIsDefined dtDebtBondage c
axiom corr_db_od {cond : Ontology.Condition} {c : ComplaintText} :
    Ontology.IsDebtBondage cond c → Deontic.TermIsDefined dtDebtBondage c

theorem debtBondage_elements_implies_ontology
    {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.IsDebtBondage pr c) : Ontology.IsDebtBondage (oCondition pr) c := corr_db_eo h
theorem debtBondage_elements_implies_deontic
    {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.IsDebtBondage pr c) : Deontic.TermIsDefined dtDebtBondage c := corr_db_ed h
theorem debtBondage_ontology_implies_deontic
    {cond : Ontology.Condition} {c : ComplaintText}
    (h : Ontology.IsDebtBondage cond c) : Deontic.TermIsDefined dtDebtBondage c := corr_db_od h



axiom corr_is_scheme {pr : Elements.Practice} {c : ComplaintText} :
    Elements.ServitudeSchemeToInduceFearOfHarm pr c → Ontology.IsInvoluntaryServitude (oCondition pr) c
axiom corr_is_lp {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsAbuseOfLegalProcess pr c → Ontology.IsInvoluntaryServitude (oCondition pr) c
axiom corr_is_ed {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsInvoluntaryServitude pr c → Deontic.TermIsDefined dtInvoluntaryServitude c
axiom corr_is_od {cond : Ontology.Condition} {c : ComplaintText} :
    Ontology.IsInvoluntaryServitude cond c → Deontic.TermIsDefined dtInvoluntaryServitude c

theorem involuntaryServitude_elements_implies_ontology
    {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.InvoluntaryServitude pr c) : Ontology.IsInvoluntaryServitude (oCondition pr) c :=
  match h with
  | .scheme hs       => corr_is_scheme hs
  | .legalProcess hl => corr_is_lp hl
theorem involuntaryServitude_elements_implies_deontic
    {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.IsInvoluntaryServitude pr c) : Deontic.TermIsDefined dtInvoluntaryServitude c := corr_is_ed h
theorem involuntaryServitude_ontology_implies_deontic
    {cond : Ontology.Condition} {c : ComplaintText}
    (h : Ontology.IsInvoluntaryServitude cond c) : Deontic.TermIsDefined dtInvoluntaryServitude c := corr_is_od h



axiom corr_severe_sex {pr : Elements.Practice} {c : ComplaintText} :
    Elements.SexTraffickingSevere pr c → Ontology.IsSevereFormsOfTrafficking (oPractice pr) c
axiom corr_severe_labor {pr : Elements.Practice} {c : ComplaintText} :
    Elements.LaborTraffickingSevere pr c → Ontology.IsSevereFormsOfTrafficking (oPractice pr) c
axiom corr_severe_ed {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsSevereFormOfTrafficking pr c → Deontic.TermIsDefined dtSevereForms c
axiom corr_severe_od {pr : Ontology.Practice} {c : ComplaintText} :
    Ontology.IsSevereFormsOfTrafficking pr c → Deontic.TermIsDefined dtSevereForms c


theorem severeForms_elements_implies_ontology
    {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.SevereFormOfTrafficking pr c) : Ontology.IsSevereFormsOfTrafficking (oPractice pr) c :=
  match h with
  | .sex hs   => corr_severe_sex hs
  | .labor hl => corr_severe_labor hl
theorem severeForms_elements_implies_deontic
    {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.IsSevereFormOfTrafficking pr c) : Deontic.TermIsDefined dtSevereForms c := corr_severe_ed h
theorem severeForms_ontology_implies_deontic
    {pr : Ontology.Practice} {c : ComplaintText}
    (h : Ontology.IsSevereFormsOfTrafficking pr c) : Deontic.TermIsDefined dtSevereForms c := corr_severe_od h



axiom corr_st_eo {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsSexTrafficking pr c → Ontology.IsSexTrafficking (oPractice pr) c
axiom corr_st_ed {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsSexTrafficking pr c → Deontic.TermIsDefined dtSexTrafficking c
axiom corr_st_od {pr : Ontology.Practice} {c : ComplaintText} :
    Ontology.IsSexTrafficking pr c → Deontic.TermIsDefined dtSexTrafficking c

theorem sexTrafficking_elements_implies_ontology
    {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.IsSexTrafficking pr c) : Ontology.IsSexTrafficking (oPractice pr) c := corr_st_eo h
theorem sexTrafficking_elements_implies_deontic
    {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.IsSexTrafficking pr c) : Deontic.TermIsDefined dtSexTrafficking c := corr_st_ed h
theorem sexTrafficking_ontology_implies_deontic
    {pr : Ontology.Practice} {c : ComplaintText}
    (h : Ontology.IsSexTrafficking pr c) : Deontic.TermIsDefined dtSexTrafficking c := corr_st_od h



axiom corr_state_eo {j : Elements.Jurisdiction} {c : ComplaintText} :
    Elements.IsState j c → Ontology.IsState (oJurisdiction j) c
axiom corr_state_ed {j : Elements.Jurisdiction} {c : ComplaintText} :
    Elements.IsState j c → Deontic.TermIsDefined dtState c
axiom corr_state_od {j : Ontology.Jurisdiction} {c : ComplaintText} :
    Ontology.IsState j c → Deontic.TermIsDefined dtState c

theorem state_elements_implies_ontology
    {j : Elements.Jurisdiction} {c : ComplaintText}
    (h : Elements.IsState j c) : Ontology.IsState (oJurisdiction j) c := corr_state_eo h
theorem state_elements_implies_deontic
    {j : Elements.Jurisdiction} {c : ComplaintText}
    (h : Elements.IsState j c) : Deontic.TermIsDefined dtState c := corr_state_ed h
theorem state_ontology_implies_deontic
    {j : Ontology.Jurisdiction} {c : ComplaintText}
    (h : Ontology.IsState j c) : Deontic.TermIsDefined dtState c := corr_state_od h



axiom corr_us_eo {j : Elements.Jurisdiction} {c : ComplaintText} :
    Elements.IsUnitedStates j c → Ontology.IsUnitedStates (oJurisdiction j) c
axiom corr_us_ed {j : Elements.Jurisdiction} {c : ComplaintText} :
    Elements.IsUnitedStates j c → Deontic.TermIsDefined dtUnitedStates c
axiom corr_us_od {j : Ontology.Jurisdiction} {c : ComplaintText} :
    Ontology.IsUnitedStates j c → Deontic.TermIsDefined dtUnitedStates c

theorem unitedStates_elements_implies_ontology
    {j : Elements.Jurisdiction} {c : ComplaintText}
    (h : Elements.IsUnitedStates j c) : Ontology.IsUnitedStates (oJurisdiction j) c := corr_us_eo h
theorem unitedStates_elements_implies_deontic
    {j : Elements.Jurisdiction} {c : ComplaintText}
    (h : Elements.IsUnitedStates j c) : Deontic.TermIsDefined dtUnitedStates c := corr_us_ed h
theorem unitedStates_ontology_implies_deontic
    {j : Ontology.Jurisdiction} {c : ComplaintText}
    (h : Ontology.IsUnitedStates j c) : Deontic.TermIsDefined dtUnitedStates c := corr_us_od h



axiom corr_vsf_eo {p : Person} {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsVictimOfSevereFormOfTrafficking p pr c → Ontology.IsVictimOfSevereFormOfTrafficking p c
axiom corr_vsf_ed {p : Person} {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsVictimOfSevereFormOfTrafficking p pr c → Deontic.TermIsDefined dtVictimSevereForm c
axiom corr_vsf_od {p : Person} {c : ComplaintText} :
    Ontology.IsVictimOfSevereFormOfTrafficking p c → Deontic.TermIsDefined dtVictimSevereForm c

theorem victimSevereForm_elements_implies_ontology
    {p : Person} {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.IsVictimOfSevereFormOfTrafficking p pr c) :
    Ontology.IsVictimOfSevereFormOfTrafficking p c := corr_vsf_eo h
theorem victimSevereForm_elements_implies_deontic
    {p : Person} {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.IsVictimOfSevereFormOfTrafficking p pr c) :
    Deontic.TermIsDefined dtVictimSevereForm c := corr_vsf_ed h
theorem victimSevereForm_ontology_implies_deontic
    {p : Person} {c : ComplaintText}
    (h : Ontology.IsVictimOfSevereFormOfTrafficking p c) :
    Deontic.TermIsDefined dtVictimSevereForm c := corr_vsf_od h



axiom corr_vt_severe {p : Person} {pr : Elements.Practice} {c : ComplaintText} :
    Elements.VictimOfSevereForm p pr c → Ontology.IsVictimOfTrafficking p c
axiom corr_vt_sex {p : Person} {pr : Elements.Practice} {c : ComplaintText} :
    Elements.PersonSubjectToPractice p pr c → Elements.IsSexTrafficking pr c →
    Ontology.IsVictimOfTrafficking p c
axiom corr_vt_ed {p : Person} {pr : Elements.Practice} {c : ComplaintText} :
    Elements.IsVictimOfTrafficking p pr c → Deontic.TermIsDefined dtVictimTrafficking c
axiom corr_vt_od {p : Person} {c : ComplaintText} :
    Ontology.IsVictimOfTrafficking p c → Deontic.TermIsDefined dtVictimTrafficking c


theorem victimTrafficking_elements_implies_ontology
    {p : Person} {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.VictimOfTrafficking p pr c) : Ontology.IsVictimOfTrafficking p c :=
  match h with
  | .severe hv      => corr_vt_severe hv
  | .sex hSubj hST  => corr_vt_sex hSubj hST
theorem victimTrafficking_elements_implies_deontic
    {p : Person} {pr : Elements.Practice} {c : ComplaintText}
    (h : Elements.IsVictimOfTrafficking p pr c) : Deontic.TermIsDefined dtVictimTrafficking c := corr_vt_ed h
theorem victimTrafficking_ontology_implies_deontic
    {p : Person} {c : ComplaintText}
    (h : Ontology.IsVictimOfTrafficking p c) : Deontic.TermIsDefined dtVictimTrafficking c := corr_vt_od h










theorem deontic_inert_agreement : Deontic.DeonticallyInert7102 := rfl



theorem procedure_inert_agreement : Procedure.Reachable Procedure.State.Definitional := trivial








def s7102_payload_tierA_discharge : Prop :=
  (∀ {pr : Elements.Practice} {c : ComplaintText},
      Elements.IsAbuseOfLegalProcess pr c → Ontology.IsAbuseOfLegalProcess (oLegalProcess pr) c)
  ∧ (∀ {pr : Elements.Practice} {c : ComplaintText},
      Elements.Coercion pr c → Ontology.IsCoercion (oCondition pr) c)
  ∧ (∀ {pr : Elements.Practice} {c : ComplaintText},
      Elements.IsCommercialSexAct pr c → Ontology.IsCommercialSexAct (oSexAct pr) c)
  ∧ (∀ {pr : Elements.Practice} {c : ComplaintText},
      Elements.IsDebtBondage pr c → Ontology.IsDebtBondage (oCondition pr) c)
  ∧ (∀ {pr : Elements.Practice} {c : ComplaintText},
      Elements.InvoluntaryServitude pr c → Ontology.IsInvoluntaryServitude (oCondition pr) c)
  ∧ (∀ {pr : Elements.Practice} {c : ComplaintText},
      Elements.SevereFormOfTrafficking pr c → Ontology.IsSevereFormsOfTrafficking (oPractice pr) c)
  ∧ (∀ {pr : Elements.Practice} {c : ComplaintText},
      Elements.IsSexTrafficking pr c → Ontology.IsSexTrafficking (oPractice pr) c)
  ∧ (∀ {j : Elements.Jurisdiction} {c : ComplaintText},
      Elements.IsState j c → Ontology.IsState (oJurisdiction j) c)
  ∧ (∀ {j : Elements.Jurisdiction} {c : ComplaintText},
      Elements.IsUnitedStates j c → Ontology.IsUnitedStates (oJurisdiction j) c)
  ∧ (∀ {p : Person} {pr : Elements.Practice} {c : ComplaintText},
      Elements.IsVictimOfSevereFormOfTrafficking p pr c → Ontology.IsVictimOfSevereFormOfTrafficking p c)
  ∧ (∀ {p : Person} {pr : Elements.Practice} {c : ComplaintText},
      Elements.VictimOfTrafficking p pr c → Ontology.IsVictimOfTrafficking p c)

theorem s7102_payload_tierA : s7102_payload_tierA_discharge :=
  ⟨fun h => abuseOfLegalProcess_elements_implies_ontology h,
   fun h => coercion_elements_implies_ontology h,
   fun h => commercialSexAct_elements_implies_ontology h,
   fun h => debtBondage_elements_implies_ontology h,
   fun h => involuntaryServitude_elements_implies_ontology h,
   fun h => severeForms_elements_implies_ontology h,
   fun h => sexTrafficking_elements_implies_ontology h,
   fun h => state_elements_implies_ontology h,
   fun h => unitedStates_elements_implies_ontology h,
   fun h => victimSevereForm_elements_implies_ontology h,
   fun h => victimTrafficking_elements_implies_ontology h⟩

end Proving.USC.T22.Bridge
