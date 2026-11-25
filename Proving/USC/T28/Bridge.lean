

















import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T28.Elements.Types
import Proving.USC.T28.Elements.Predicates
import Proving.USC.T28.Elements.Statute
import Proving.USC.T28.Deontic.Types
import Proving.USC.T28.Deontic.Predicates
import Proving.USC.T28.Deontic.Statute
import Proving.USC.T28.Ontology.Types
import Proving.USC.T28.Ontology.Predicates
import Proving.USC.T28.Ontology.Statute
import Proving.USC.T28.Procedure.Types
import Proving.USC.T28.Procedure.Predicates
import Proving.USC.T28.Procedure.Statute
import Proving.USC.T28.Structure.Types
import Proving.USC.T28.Structure.Predicates
import Proving.USC.T28.Structure.Statute

namespace Proving.USC.T28.Bridge

open Proving.USC.Common








axiom actED : Elements.CivilAction → Deontic.CivilAction

axiom actEO : Elements.CivilAction → Ontology.CivilAction

axiom actEP : Elements.CivilAction → Procedure.CivilAction

axiom actDO : Deontic.CivilAction → Ontology.CivilAction

axiom actDP : Deontic.CivilAction → Procedure.CivilAction

axiom actOP : Ontology.CivilAction → Procedure.CivilAction


axiom declDE : Deontic.Declaration → Elements.Declaration

axiom declOE : Ontology.Declaration → Elements.Declaration

axiom declPE : Procedure.Declaration → Elements.Declaration

axiom declDO : Deontic.Declaration → Ontology.Declaration

axiom declDP : Deontic.Declaration → Procedure.Declaration

axiom declOP : Ontology.Declaration → Procedure.Declaration












axiom corr_ed_authorized : ∀ (a : Elements.CivilAction) (c : ComplaintText),
  Elements.CivilActionAuthorizedByLaw a c →
  Deontic.CivilActionAuthorizedByLaw (actED a) c

axiom corr_ed_a1 : ∀ (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a1 a c → Deontic.ConspiracyInjuryClaim1343a1 (actED a) c

axiom corr_ed_a2 : ∀ (p : Person) (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a2 p a c → Deontic.NeglectToPreventClaim1343a2 (actED a) c

axiom corr_ed_a3 : ∀ (p : Person) (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a3 p a c → Deontic.ColorOfLawDeprivationClaim1343a3 (actED a) c

axiom corr_ed_a4 : ∀ (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a4 a c → Deontic.CivilRightsReliefClaim1343a4 (actED a) c






theorem s1343_elements_implies_deontic_modulo_gaps
    {pDef pPl : Person} {a : Elements.CivilAction} {ct : Deontic.Court}
    {c : ComplaintText}
    (gap_addressee_is_district_court : Deontic.AddresseeIsDistrictCourt ct c)
    (gap_commenced_by_person : Deontic.CommencedByPerson pPl (actED a) c)
    (h : Elements.Section1343Jurisdiction pDef a c) :
    Deontic.Power1343a ct pPl (actED a) c :=
  match h with
  | .a1 hp => ⟨gap_addressee_is_district_court, corr_ed_authorized a c hp.authorized,
               gap_commenced_by_person, .conspiracyInjury (corr_ed_a1 a c hp)⟩
  | .a2 hp => ⟨gap_addressee_is_district_court, corr_ed_authorized a c hp.authorized,
               gap_commenced_by_person, .neglectToPrevent (corr_ed_a2 pDef a c hp)⟩
  | .a3 hp => ⟨gap_addressee_is_district_court, corr_ed_authorized a c hp.authorized,
               gap_commenced_by_person, .colorOfLaw (corr_ed_a3 pDef a c hp)⟩
  | .a4 hp => ⟨gap_addressee_is_district_court, corr_ed_authorized a c hp.authorized,
               gap_commenced_by_person, .civilRightsRelief (corr_ed_a4 a c hp)⟩




axiom corr_eo_authorized : ∀ (a : Elements.CivilAction) (c : ComplaintText),
  Elements.CivilActionAuthorizedByLaw a c →
  Ontology.IsCivilActionAuthorizedByLaw (actEO a) c

axiom corr_eo_a1 : ∀ (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a1 a c → Ontology.IsConspiracyDamagesAction (actEO a) c

axiom corr_eo_a2 : ∀ (p : Person) (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a2 p a c → Ontology.IsNeglectToPreventAction (actEO a) c

axiom corr_eo_a3 : ∀ (p : Person) (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a3 p a c → Ontology.IsColorOfLawDeprivationAction (actEO a) c

axiom corr_eo_a4 : ∀ (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a4 a c → Ontology.IsCivilRightsProtectionAction (actEO a) c




theorem s1343_elements_implies_ontology_modulo_gaps
    {pDef pPl : Person} {a : Elements.CivilAction} {c : ComplaintText}
    (gap_commenced_by_person : Ontology.CommencedByPerson (actEO a) pPl c)
    (h : Elements.Section1343Jurisdiction pDef a c) :
    Ontology.Section1343Jurisdiction (actEO a) pPl c :=
  match h with
  | .a1 hp => ⟨corr_eo_authorized a c hp.authorized, gap_commenced_by_person,
               .conspiracyDamages (corr_eo_a1 a c hp)⟩
  | .a2 hp => ⟨corr_eo_authorized a c hp.authorized, gap_commenced_by_person,
               .neglectToPrevent (corr_eo_a2 pDef a c hp)⟩
  | .a3 hp => ⟨corr_eo_authorized a c hp.authorized, gap_commenced_by_person,
               .colorOfLawDeprivation (corr_eo_a3 pDef a c hp)⟩
  | .a4 hp => ⟨corr_eo_authorized a c hp.authorized, gap_commenced_by_person,
               .civilRightsProtection (corr_eo_a4 a c hp)⟩




axiom corr_ep_authorized : ∀ (a : Elements.CivilAction) (c : ComplaintText),
  Elements.CivilActionAuthorizedByLaw a c → Procedure.ActionAuthorizedByLaw (actEP a) c

axiom corr_ep_a1 : ∀ (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a1 a c → Procedure.SeeksConspiracyDeprivationDamages1985 (actEP a) c

axiom corr_ep_a2 : ∀ (p : Person) (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a2 p a c → Procedure.SeeksNeglectToPreventDamages1985 (actEP a) c

axiom corr_ep_a3 : ∀ (p : Person) (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a3 p a c → Procedure.SeeksRedressColorOfStateLaw (actEP a) c

axiom corr_ep_a4 : ∀ (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a4 a c → Procedure.SeeksCivilRightsActRelief (actEP a) c




theorem s1343_elements_implies_procedure_modulo_gaps
    {pDef : Person} {a : Elements.CivilAction} {c : ComplaintText}
    (gap_commenced_in_district_court :
      Procedure.ActionCommencedInDistrictCourt (actEP a) c)
    (h : Elements.Section1343Jurisdiction pDef a c) :
    Procedure.Section1343Jurisdiction (actEP a) c :=
  match h with
  | .a1 hp => ⟨gap_commenced_in_district_court, corr_ep_authorized a c hp.authorized,
               .conspiracyDamages (corr_ep_a1 a c hp)⟩
  | .a2 hp => ⟨gap_commenced_in_district_court, corr_ep_authorized a c hp.authorized,
               .neglectToPrevent (corr_ep_a2 pDef a c hp)⟩
  | .a3 hp => ⟨gap_commenced_in_district_court, corr_ep_authorized a c hp.authorized,
               .colorOfStateLaw (corr_ep_a3 pDef a c hp)⟩
  | .a4 hp => ⟨gap_commenced_in_district_court, corr_ep_authorized a c hp.authorized,
               .civilRightsRelief (corr_ep_a4 a c hp)⟩




axiom corr_do_authorized : ∀ (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.CivilActionAuthorizedByLaw a c →
  Ontology.IsCivilActionAuthorizedByLaw (actDO a) c


axiom corr_do_commenced : ∀ (p : Person) (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.CommencedByPerson p a c → Ontology.CommencedByPerson (actDO a) p c

axiom corr_do_a1 : ∀ (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.ConspiracyInjuryClaim1343a1 a c → Ontology.IsConspiracyDamagesAction (actDO a) c

axiom corr_do_a2 : ∀ (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.NeglectToPreventClaim1343a2 a c → Ontology.IsNeglectToPreventAction (actDO a) c

axiom corr_do_a3 : ∀ (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.ColorOfLawDeprivationClaim1343a3 a c →
  Ontology.IsColorOfLawDeprivationAction (actDO a) c

axiom corr_do_a4 : ∀ (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.CivilRightsReliefClaim1343a4 a c →
  Ontology.IsCivilRightsProtectionAction (actDO a) c




theorem s1343_deontic_implies_ontology
    {ct : Deontic.Court} {p : Person} {a : Deontic.CivilAction} {c : ComplaintText}
    (h : Deontic.Power1343a ct p a c) :
    Ontology.Section1343Jurisdiction (actDO a) p c :=
  ⟨corr_do_authorized a c h.authorized,
   corr_do_commenced p a c h.commenced,
   (match h.basis with
    | .conspiracyInjury hb  => .conspiracyDamages (corr_do_a1 a c hb)
    | .neglectToPrevent hb  => .neglectToPrevent (corr_do_a2 a c hb)
    | .colorOfLaw hb        => .colorOfLawDeprivation (corr_do_a3 a c hb)
    | .civilRightsRelief hb => .civilRightsProtection (corr_do_a4 a c hb))⟩






axiom corr_dp_commenced_in_court :
  ∀ (ct : Deontic.Court) (p : Person) (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.AddresseeIsDistrictCourt ct c → Deontic.CommencedByPerson p a c →
  Procedure.ActionCommencedInDistrictCourt (actDP a) c

axiom corr_dp_authorized : ∀ (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.CivilActionAuthorizedByLaw a c → Procedure.ActionAuthorizedByLaw (actDP a) c

axiom corr_dp_a1 : ∀ (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.ConspiracyInjuryClaim1343a1 a c →
  Procedure.SeeksConspiracyDeprivationDamages1985 (actDP a) c

axiom corr_dp_a2 : ∀ (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.NeglectToPreventClaim1343a2 a c →
  Procedure.SeeksNeglectToPreventDamages1985 (actDP a) c

axiom corr_dp_a3 : ∀ (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.ColorOfLawDeprivationClaim1343a3 a c →
  Procedure.SeeksRedressColorOfStateLaw (actDP a) c

axiom corr_dp_a4 : ∀ (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.CivilRightsReliefClaim1343a4 a c →
  Procedure.SeeksCivilRightsActRelief (actDP a) c




theorem s1343_deontic_implies_procedure
    {ct : Deontic.Court} {p : Person} {a : Deontic.CivilAction} {c : ComplaintText}
    (h : Deontic.Power1343a ct p a c) :
    Procedure.Section1343Jurisdiction (actDP a) c :=
  ⟨corr_dp_commenced_in_court ct p a c h.addressee h.commenced,
   corr_dp_authorized a c h.authorized,
   (match h.basis with
    | .conspiracyInjury hb  => .conspiracyDamages (corr_dp_a1 a c hb)
    | .neglectToPrevent hb  => .neglectToPrevent (corr_dp_a2 a c hb)
    | .colorOfLaw hb        => .colorOfStateLaw (corr_dp_a3 a c hb)
    | .civilRightsRelief hb => .civilRightsRelief (corr_dp_a4 a c hb))⟩




axiom corr_op_authorized : ∀ (act : Ontology.CivilAction) (c : ComplaintText),
  Ontology.IsCivilActionAuthorizedByLaw act c →
  Procedure.ActionAuthorizedByLaw (actOP act) c

axiom corr_op_a1 : ∀ (act : Ontology.CivilAction) (c : ComplaintText),
  Ontology.IsConspiracyDamagesAction act c →
  Procedure.SeeksConspiracyDeprivationDamages1985 (actOP act) c

axiom corr_op_a2 : ∀ (act : Ontology.CivilAction) (c : ComplaintText),
  Ontology.IsNeglectToPreventAction act c →
  Procedure.SeeksNeglectToPreventDamages1985 (actOP act) c

axiom corr_op_a3 : ∀ (act : Ontology.CivilAction) (c : ComplaintText),
  Ontology.IsColorOfLawDeprivationAction act c →
  Procedure.SeeksRedressColorOfStateLaw (actOP act) c

axiom corr_op_a4 : ∀ (act : Ontology.CivilAction) (c : ComplaintText),
  Ontology.IsCivilRightsProtectionAction act c →
  Procedure.SeeksCivilRightsActRelief (actOP act) c





theorem s1343_ontology_implies_procedure_modulo_gaps
    {act : Ontology.CivilAction} {p : Person} {c : ComplaintText}
    (gap_commenced_in_district_court :
      Procedure.ActionCommencedInDistrictCourt (actOP act) c)
    (h : Ontology.Section1343Jurisdiction act p c) :
    Procedure.Section1343Jurisdiction (actOP act) c :=
  ⟨gap_commenced_in_district_court,
   corr_op_authorized act c h.authorized,
   (match h.basis with
    | .conspiracyDamages hb     => .conspiracyDamages (corr_op_a1 act c hb)
    | .neglectToPrevent hb      => .neglectToPrevent (corr_op_a2 act c hb)
    | .colorOfLawDeprivation hb => .colorOfStateLaw (corr_op_a3 act c hb)
    | .civilRightsProtection hb => .civilRightsRelief (corr_op_a4 act c hb))⟩











axiom corr_es_a1 : ∀ (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a1 a c →
  Structure.ReferencedSectionExists Structure.edge_1343a1_incorporates_1985 c ∧
  Structure.IncorporationHonored Structure.edge_1343a1_incorporates_1985 c

axiom corr_es_a2 : ∀ (p : Person) (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a2 p a c →
  Structure.ReferencedSectionExists Structure.edge_1343a2_incorporates_1985 c ∧
  Structure.IncorporationHonored Structure.edge_1343a2_incorporates_1985 c

axiom corr_es_a4 : ∀ (a : Elements.CivilAction) (c : ComplaintText),
  Elements.Section1343a4 a c →
  Structure.IncorporationHonored Structure.edge_1343a4_incorporates_civilRightsActs c


theorem s1343_elements_implies_structure_modulo_gaps
    {pDef : Person} {a : Elements.CivilAction} {c : ComplaintText}
    (gap_a3_constitution_honored :
      Structure.IncorporationHonored Structure.edge_1343a3_incorporates_constitution c)
    (gap_a3_equal_rights_honored :
      Structure.IncorporationHonored Structure.edge_1343a3_incorporates_equalRightsActs c)
    (h : Elements.Section1343Jurisdiction pDef a c) :
    Structure.Grounded1343 c :=
  match h with
  | .a1 hp => .viaConspiracy (corr_es_a1 a c hp).1 (corr_es_a1 a c hp).2
  | .a2 hp => .viaPrevention (corr_es_a2 pDef a c hp).1 (corr_es_a2 pDef a c hp).2
  | .a3 _  => .viaEqualRights gap_a3_constitution_honored gap_a3_equal_rights_honored
  | .a4 hp => .viaCivilRightsActs (corr_es_a4 a c hp)


axiom corr_ds_a1 : ∀ (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.ConspiracyInjuryClaim1343a1 a c →
  Structure.ReferencedSectionExists Structure.edge_1343a1_incorporates_1985 c ∧
  Structure.IncorporationHonored Structure.edge_1343a1_incorporates_1985 c

axiom corr_ds_a2 : ∀ (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.NeglectToPreventClaim1343a2 a c →
  Structure.ReferencedSectionExists Structure.edge_1343a2_incorporates_1985 c ∧
  Structure.IncorporationHonored Structure.edge_1343a2_incorporates_1985 c

axiom corr_ds_a4 : ∀ (a : Deontic.CivilAction) (c : ComplaintText),
  Deontic.CivilRightsReliefClaim1343a4 a c →
  Structure.IncorporationHonored Structure.edge_1343a4_incorporates_civilRightsActs c


theorem s1343_deontic_implies_structure_modulo_gaps
    {ct : Deontic.Court} {p : Person} {a : Deontic.CivilAction} {c : ComplaintText}
    (gap_a3_constitution_honored :
      Structure.IncorporationHonored Structure.edge_1343a3_incorporates_constitution c)
    (gap_a3_equal_rights_honored :
      Structure.IncorporationHonored Structure.edge_1343a3_incorporates_equalRightsActs c)
    (h : Deontic.Power1343a ct p a c) :
    Structure.Grounded1343 c :=
  match h.basis with
  | .conspiracyInjury hb  => .viaConspiracy (corr_ds_a1 a c hb).1 (corr_ds_a1 a c hb).2
  | .neglectToPrevent hb  => .viaPrevention (corr_ds_a2 a c hb).1 (corr_ds_a2 a c hb).2
  | .colorOfLaw _         => .viaEqualRights gap_a3_constitution_honored gap_a3_equal_rights_honored
  | .civilRightsRelief hb => .viaCivilRightsActs (corr_ds_a4 a c hb)


axiom corr_os_a1 : ∀ (act : Ontology.CivilAction) (c : ComplaintText),
  Ontology.IsConspiracyDamagesAction act c →
  Structure.ReferencedSectionExists Structure.edge_1343a1_incorporates_1985 c ∧
  Structure.IncorporationHonored Structure.edge_1343a1_incorporates_1985 c

axiom corr_os_a2 : ∀ (act : Ontology.CivilAction) (c : ComplaintText),
  Ontology.IsNeglectToPreventAction act c →
  Structure.ReferencedSectionExists Structure.edge_1343a2_incorporates_1985 c ∧
  Structure.IncorporationHonored Structure.edge_1343a2_incorporates_1985 c

axiom corr_os_a4 : ∀ (act : Ontology.CivilAction) (c : ComplaintText),
  Ontology.IsCivilRightsProtectionAction act c →
  Structure.IncorporationHonored Structure.edge_1343a4_incorporates_civilRightsActs c


theorem s1343_ontology_implies_structure_modulo_gaps
    {act : Ontology.CivilAction} {p : Person} {c : ComplaintText}
    (gap_a3_constitution_honored :
      Structure.IncorporationHonored Structure.edge_1343a3_incorporates_constitution c)
    (gap_a3_equal_rights_honored :
      Structure.IncorporationHonored Structure.edge_1343a3_incorporates_equalRightsActs c)
    (h : Ontology.Section1343Jurisdiction act p c) :
    Structure.Grounded1343 c :=
  match h.basis with
  | .conspiracyDamages hb     => .viaConspiracy (corr_os_a1 act c hb).1 (corr_os_a1 act c hb).2
  | .neglectToPrevent hb      => .viaPrevention (corr_os_a2 act c hb).1 (corr_os_a2 act c hb).2
  | .colorOfLawDeprivation _  => .viaEqualRights gap_a3_constitution_honored gap_a3_equal_rights_honored
  | .civilRightsProtection hb => .viaCivilRightsActs (corr_os_a4 act c hb)


axiom corr_ps_a1 : ∀ (a : Procedure.CivilAction) (c : ComplaintText),
  Procedure.SeeksConspiracyDeprivationDamages1985 a c →
  Structure.ReferencedSectionExists Structure.edge_1343a1_incorporates_1985 c ∧
  Structure.IncorporationHonored Structure.edge_1343a1_incorporates_1985 c

axiom corr_ps_a2 : ∀ (a : Procedure.CivilAction) (c : ComplaintText),
  Procedure.SeeksNeglectToPreventDamages1985 a c →
  Structure.ReferencedSectionExists Structure.edge_1343a2_incorporates_1985 c ∧
  Structure.IncorporationHonored Structure.edge_1343a2_incorporates_1985 c

axiom corr_ps_a4 : ∀ (a : Procedure.CivilAction) (c : ComplaintText),
  Procedure.SeeksCivilRightsActRelief a c →
  Structure.IncorporationHonored Structure.edge_1343a4_incorporates_civilRightsActs c


theorem s1343_procedure_implies_structure_modulo_gaps
    {a : Procedure.CivilAction} {c : ComplaintText}
    (gap_a3_constitution_honored :
      Structure.IncorporationHonored Structure.edge_1343a3_incorporates_constitution c)
    (gap_a3_equal_rights_honored :
      Structure.IncorporationHonored Structure.edge_1343a3_incorporates_equalRightsActs c)
    (h : Procedure.Section1343Jurisdiction a c) :
    Structure.Grounded1343 c :=
  match h.ground with
  | .conspiracyDamages hb  => .viaConspiracy (corr_ps_a1 a c hb).1 (corr_ps_a1 a c hb).2
  | .neglectToPrevent hb   => .viaPrevention (corr_ps_a2 a c hb).1 (corr_ps_a2 a c hb).2
  | .colorOfStateLaw _     => .viaEqualRights gap_a3_constitution_honored gap_a3_equal_rights_honored
  | .civilRightsRelief hb  => .viaCivilRightsActs (corr_ps_a4 a c hb)















axiom corr_de_applicability :
  ∀ (p : Person) (m : Deontic.Matter) (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.MatterRequiresSwornSupport1746 m c →
  Deontic.UnswornWrittenDeclarationMade1746 p m d c →
  Elements.MatterRequiresOrPermitsSwornSupport (declDE d) c


axiom corr_de_not_excepted :
  ∀ (p : Person) (m : Deontic.Matter) (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.OutsideExceptedCategories1746 m c →
  Deontic.UnswornWrittenDeclarationMade1746 p m d c →
  ¬ Elements.ExceptedSwornMatter (declDE d) c


axiom corr_de_written :
  ∀ (p : Person) (m : Deontic.Matter) (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.UnswornWrittenDeclarationMade1746 p m d c →
  Elements.IsWrittenDeclaration (declDE d) c

axiom corr_de_subscribed : ∀ (p : Person) (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.SubscribedTrueUnderPenaltyOfPerjury p d c →
  Elements.SubscribedAsTrueUnderPenaltyOfPerjury (declDE d) c

axiom corr_de_dated : ∀ (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.DeclarationDated1746 d c → Elements.IsDated (declDE d) c


axiom corr_de_form_without : ∀ (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.PrescribedFormWithoutUS1746 d c →
  Elements.ExecutedOutsideUS (declDE d) c ∧
  Elements.UsesSubstantiallyPrescribedForeignForm (declDE d) c

axiom corr_de_form_within : ∀ (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.PrescribedFormWithinUS1746 d c →
  Elements.ExecutedWithinUS (declDE d) c ∧
  Elements.UsesSubstantiallyPrescribedDomesticForm (declDE d) c




theorem s1746_deontic_implies_elements
    {p : Person} {m : Deontic.Matter} {d : Deontic.Declaration} {c : ComplaintText}
    (h : Deontic.UnswornDeclarationEffective1746 p m d c) :
    Elements.Section1746Declaration (declDE d) c :=
  match h with
  | ⟨hPerm, hMade, hSub, hDated, hForm⟩ =>
    ⟨corr_de_applicability p m d c hPerm.condition hMade,
     corr_de_not_excepted p m d c hPerm.notExcepted hMade,
     corr_de_written p m d c hMade,
     corr_de_subscribed p d c hSub,
     corr_de_dated d c hDated,
     (match hForm with
      | .withoutUS hf =>
        .outsideUS (corr_de_form_without d c hf).1 (corr_de_form_without d c hf).2
      | .withinUS hf =>
        .withinUS (corr_de_form_within d c hf).1 (corr_de_form_within d c hf).2)⟩





axiom corr_oe_written : ∀ (d : Ontology.Declaration) (c : ComplaintText),
  Ontology.IsUnswornDeclaration d c → Elements.IsWrittenDeclaration (declOE d) c


axiom corr_oe_subscribed : ∀ (d : Ontology.Declaration) (c : ComplaintText),
  Ontology.BearsSignature d c → Ontology.DeclaresUnderPenaltyOfPerjury d c →
  Ontology.AssertsTrueAndCorrect d c →
  Elements.SubscribedAsTrueUnderPenaltyOfPerjury (declOE d) c

axiom corr_oe_dated : ∀ (d : Ontology.Declaration) (c : ComplaintText),
  Ontology.StatesExecutionDate d c → Elements.IsDated (declOE d) c


axiom corr_oe_form_without : ∀ (d : Ontology.Declaration) (c : ComplaintText),
  Ontology.ExecutedWithoutUnitedStates d c → Ontology.RecitesLawsOfUnitedStates d c →
  Elements.ExecutedOutsideUS (declOE d) c ∧
  Elements.UsesSubstantiallyPrescribedForeignForm (declOE d) c


axiom corr_oe_form_within : ∀ (d : Ontology.Declaration) (c : ComplaintText),
  Ontology.ExecutedWithinUnitedStates d c → Ontology.DeclaresUnderPenaltyOfPerjury d c →
  Elements.ExecutedWithinUS (declOE d) c ∧
  Elements.UsesSubstantiallyPrescribedDomesticForm (declOE d) c





theorem s1746_ontology_implies_elements_modulo_gaps
    {d : Ontology.Declaration} {c : ComplaintText}
    (gap_matter_requires_or_permits_sworn_support :
      Elements.MatterRequiresOrPermitsSwornSupport (declOE d) c)
    (gap_not_excepted_sworn_matter : ¬ Elements.ExceptedSwornMatter (declOE d) c)
    (h : Ontology.UnswornDeclarationDef d c) :
    Elements.Section1746Declaration (declOE d) c :=
  ⟨gap_matter_requires_or_permits_sworn_support,
   gap_not_excepted_sworn_matter,
   corr_oe_written d c h.member,
   corr_oe_subscribed d c h.signed h.declares h.trueAndCorrect,
   corr_oe_dated d c h.dated,
   (match h.form with
    | .withoutUS hLoc hLaws =>
      .outsideUS (corr_oe_form_without d c hLoc hLaws).1
                 (corr_oe_form_without d c hLoc hLaws).2
    | .withinUS hLoc =>
      .withinUS (corr_oe_form_within d c hLoc h.declares).1
                (corr_oe_form_within d c hLoc h.declares).2)⟩




axiom corr_pe_written : ∀ (d : Procedure.Declaration) (c : ComplaintText),
  Procedure.DeclarationSubscribed d c → Elements.IsWrittenDeclaration (declPE d) c


axiom corr_pe_subscribed_without : ∀ (d : Procedure.Declaration) (c : ComplaintText),
  Procedure.DeclarationSubscribed d c → Procedure.UsesPerjuryFormWithoutUS d c →
  Elements.SubscribedAsTrueUnderPenaltyOfPerjury (declPE d) c

axiom corr_pe_subscribed_within : ∀ (d : Procedure.Declaration) (c : ComplaintText),
  Procedure.DeclarationSubscribed d c → Procedure.UsesPerjuryFormWithinUS d c →
  Elements.SubscribedAsTrueUnderPenaltyOfPerjury (declPE d) c

axiom corr_pe_dated : ∀ (d : Procedure.Declaration) (c : ComplaintText),
  Procedure.DeclarationDated d c → Elements.IsDated (declPE d) c

axiom corr_pe_form_without : ∀ (d : Procedure.Declaration) (c : ComplaintText),
  Procedure.ExecutedWithoutUnitedStates d c → Procedure.UsesPerjuryFormWithoutUS d c →
  Elements.ExecutedOutsideUS (declPE d) c ∧
  Elements.UsesSubstantiallyPrescribedForeignForm (declPE d) c

axiom corr_pe_form_within : ∀ (d : Procedure.Declaration) (c : ComplaintText),
  Procedure.ExecutedWithinUnitedStates d c → Procedure.UsesPerjuryFormWithinUS d c →
  Elements.ExecutedWithinUS (declPE d) c ∧
  Elements.UsesSubstantiallyPrescribedDomesticForm (declPE d) c



theorem s1746_procedure_implies_elements_modulo_gaps
    {d : Procedure.Declaration} {c : ComplaintText}
    (gap_matter_requires_or_permits_sworn_support :
      Elements.MatterRequiresOrPermitsSwornSupport (declPE d) c)
    (gap_not_excepted_sworn_matter : ¬ Elements.ExceptedSwornMatter (declPE d) c)
    (h : Procedure.ValidUnswornDeclaration1746 d c) :
    Elements.Section1746Declaration (declPE d) c :=
  match h with
  | .withoutUS he =>
    ⟨gap_matter_requires_or_permits_sworn_support,
     gap_not_excepted_sworn_matter,
     corr_pe_written d c he.subscribed,
     corr_pe_subscribed_without d c he.subscribed he.form,
     corr_pe_dated d c he.dated,
     .outsideUS (corr_pe_form_without d c he.outsideUS he.form).1
                (corr_pe_form_without d c he.outsideUS he.form).2⟩
  | .withinUS he =>
    ⟨gap_matter_requires_or_permits_sworn_support,
     gap_not_excepted_sworn_matter,
     corr_pe_written d c he.subscribed,
     corr_pe_subscribed_within d c he.subscribed he.form,
     corr_pe_dated d c he.dated,
     .withinUS (corr_pe_form_within d c he.insideUS he.form).1
               (corr_pe_form_within d c he.insideUS he.form).2⟩




axiom corr_do46_declares : ∀ (p : Person) (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.SubscribedTrueUnderPenaltyOfPerjury p d c →
  Ontology.DeclaresUnderPenaltyOfPerjury (declDO d) c

axiom corr_do46_true_and_correct : ∀ (p : Person) (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.SubscribedTrueUnderPenaltyOfPerjury p d c →
  Ontology.AssertsTrueAndCorrect (declDO d) c

axiom corr_do46_signed : ∀ (p : Person) (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.SubscribedTrueUnderPenaltyOfPerjury p d c →
  Ontology.BearsSignature (declDO d) c

axiom corr_do46_dated : ∀ (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.DeclarationDated1746 d c → Ontology.StatesExecutionDate (declDO d) c

axiom corr_do46_form_without : ∀ (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.PrescribedFormWithoutUS1746 d c →
  Ontology.ExecutedWithoutUnitedStates (declDO d) c ∧
  Ontology.RecitesLawsOfUnitedStates (declDO d) c

axiom corr_do46_form_within : ∀ (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.PrescribedFormWithinUS1746 d c →
  Ontology.ExecutedWithinUnitedStates (declDO d) c



axiom corr_do46_member :
  ∀ (p : Person) (m : Deontic.Matter) (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.UnswornWrittenDeclarationMade1746 p m d c →
  Deontic.SubscribedTrueUnderPenaltyOfPerjury p d c →
  Ontology.IsUnswornDeclaration (declDO d) c



theorem s1746_deontic_implies_ontology
    {p : Person} {m : Deontic.Matter} {d : Deontic.Declaration} {c : ComplaintText}
    (h : Deontic.UnswornDeclarationEffective1746 p m d c) :
    Ontology.UnswornDeclarationDef (declDO d) c :=
  match h with
  | ⟨_, hMade, hSub, hDated, hForm⟩ =>
    ⟨corr_do46_declares p d c hSub,
     corr_do46_true_and_correct p d c hSub,
     corr_do46_dated d c hDated,
     corr_do46_signed p d c hSub,
     (match hForm with
      | .withoutUS hf =>
        .withoutUS (corr_do46_form_without d c hf).1 (corr_do46_form_without d c hf).2
      | .withinUS hf => .withinUS (corr_do46_form_within d c hf)),
     corr_do46_member p m d c hMade hSub⟩




axiom corr_dp46_subscribed : ∀ (p : Person) (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.SubscribedTrueUnderPenaltyOfPerjury p d c →
  Procedure.DeclarationSubscribed (declDP d) c

axiom corr_dp46_dated : ∀ (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.DeclarationDated1746 d c → Procedure.DeclarationDated (declDP d) c

axiom corr_dp46_form_without : ∀ (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.PrescribedFormWithoutUS1746 d c →
  Procedure.ExecutedWithoutUnitedStates (declDP d) c ∧
  Procedure.UsesPerjuryFormWithoutUS (declDP d) c

axiom corr_dp46_form_within : ∀ (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.PrescribedFormWithinUS1746 d c →
  Procedure.ExecutedWithinUnitedStates (declDP d) c ∧
  Procedure.UsesPerjuryFormWithinUS (declDP d) c


theorem s1746_deontic_implies_procedure
    {p : Person} {m : Deontic.Matter} {d : Deontic.Declaration} {c : ComplaintText}
    (h : Deontic.UnswornDeclarationEffective1746 p m d c) :
    Procedure.ValidUnswornDeclaration1746 (declDP d) c :=
  match h with
  | ⟨_, _, hSub, hDated, hForm⟩ =>
    (match hForm with
     | .withoutUS hf =>
       .withoutUS ⟨(corr_dp46_form_without d c hf).1, (corr_dp46_form_without d c hf).2,
                   corr_dp46_subscribed p d c hSub, corr_dp46_dated d c hDated⟩
     | .withinUS hf =>
       .withinUS ⟨(corr_dp46_form_within d c hf).1, (corr_dp46_form_within d c hf).2,
                  corr_dp46_subscribed p d c hSub, corr_dp46_dated d c hDated⟩)




axiom corr_op46_subscribed : ∀ (d : Ontology.Declaration) (c : ComplaintText),
  Ontology.BearsSignature d c → Procedure.DeclarationSubscribed (declOP d) c

axiom corr_op46_dated : ∀ (d : Ontology.Declaration) (c : ComplaintText),
  Ontology.StatesExecutionDate d c → Procedure.DeclarationDated (declOP d) c

axiom corr_op46_form_without : ∀ (d : Ontology.Declaration) (c : ComplaintText),
  Ontology.ExecutedWithoutUnitedStates d c → Ontology.DeclaresUnderPenaltyOfPerjury d c →
  Ontology.AssertsTrueAndCorrect d c → Ontology.RecitesLawsOfUnitedStates d c →
  Procedure.ExecutedWithoutUnitedStates (declOP d) c ∧
  Procedure.UsesPerjuryFormWithoutUS (declOP d) c

axiom corr_op46_form_within : ∀ (d : Ontology.Declaration) (c : ComplaintText),
  Ontology.ExecutedWithinUnitedStates d c → Ontology.DeclaresUnderPenaltyOfPerjury d c →
  Ontology.AssertsTrueAndCorrect d c →
  Procedure.ExecutedWithinUnitedStates (declOP d) c ∧
  Procedure.UsesPerjuryFormWithinUS (declOP d) c




theorem s1746_ontology_implies_procedure
    {d : Ontology.Declaration} {c : ComplaintText}
    (h : Ontology.UnswornDeclarationDef d c) :
    Procedure.ValidUnswornDeclaration1746 (declOP d) c :=
  match h.form with
  | .withoutUS hLoc hLaws =>
    .withoutUS ⟨(corr_op46_form_without d c hLoc h.declares h.trueAndCorrect hLaws).1,
                (corr_op46_form_without d c hLoc h.declares h.trueAndCorrect hLaws).2,
                corr_op46_subscribed d c h.signed, corr_op46_dated d c h.dated⟩
  | .withinUS hLoc =>
    .withinUS ⟨(corr_op46_form_within d c hLoc h.declares h.trueAndCorrect).1,
               (corr_op46_form_within d c hLoc h.declares h.trueAndCorrect).2,
               corr_op46_subscribed d c h.signed, corr_op46_dated d c h.dated⟩








axiom corr_es46_without : ∀ (d : Elements.Declaration) (c : ComplaintText),
  Elements.UsesSubstantiallyPrescribedForeignForm d c →
  Structure.IncorporationHonored Structure.edge_1746p1_incorporates_perjuryLaw c

axiom corr_es46_within : ∀ (d : Elements.Declaration) (c : ComplaintText),
  Elements.UsesSubstantiallyPrescribedDomesticForm d c →
  Structure.IncorporationHonored Structure.edge_1746p2_incorporates_perjuryLaw c


theorem s1746_elements_implies_structure
    {d : Elements.Declaration} {c : ComplaintText}
    (h : Elements.Section1746Declaration d c) :
    Structure.Grounded1746 c :=
  match h.form with
  | .outsideUS _ hForm => .viaWithoutUS (corr_es46_without d c hForm)
  | .withinUS _ hForm  => .viaWithinUS (corr_es46_within d c hForm)


axiom corr_ds46_without : ∀ (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.PrescribedFormWithoutUS1746 d c →
  Structure.IncorporationHonored Structure.edge_1746p1_incorporates_perjuryLaw c

axiom corr_ds46_within : ∀ (d : Deontic.Declaration) (c : ComplaintText),
  Deontic.PrescribedFormWithinUS1746 d c →
  Structure.IncorporationHonored Structure.edge_1746p2_incorporates_perjuryLaw c


theorem s1746_deontic_implies_structure
    {p : Person} {m : Deontic.Matter} {d : Deontic.Declaration} {c : ComplaintText}
    (h : Deontic.UnswornDeclarationEffective1746 p m d c) :
    Structure.Grounded1746 c :=
  match h with
  | ⟨_, _, _, _, hForm⟩ =>
    (match hForm with
     | .withoutUS hf => .viaWithoutUS (corr_ds46_without d c hf)
     | .withinUS hf  => .viaWithinUS (corr_ds46_within d c hf))


axiom corr_os46_without : ∀ (d : Ontology.Declaration) (c : ComplaintText),
  Ontology.RecitesLawsOfUnitedStates d c → Ontology.DeclaresUnderPenaltyOfPerjury d c →
  Structure.IncorporationHonored Structure.edge_1746p1_incorporates_perjuryLaw c

axiom corr_os46_within : ∀ (d : Ontology.Declaration) (c : ComplaintText),
  Ontology.ExecutedWithinUnitedStates d c → Ontology.DeclaresUnderPenaltyOfPerjury d c →
  Structure.IncorporationHonored Structure.edge_1746p2_incorporates_perjuryLaw c


theorem s1746_ontology_implies_structure
    {d : Ontology.Declaration} {c : ComplaintText}
    (h : Ontology.UnswornDeclarationDef d c) :
    Structure.Grounded1746 c :=
  match h.form with
  | .withoutUS _ hLaws => .viaWithoutUS (corr_os46_without d c hLaws h.declares)
  | .withinUS hLoc     => .viaWithinUS (corr_os46_within d c hLoc h.declares)


axiom corr_ps46_without : ∀ (d : Procedure.Declaration) (c : ComplaintText),
  Procedure.UsesPerjuryFormWithoutUS d c →
  Structure.IncorporationHonored Structure.edge_1746p1_incorporates_perjuryLaw c

axiom corr_ps46_within : ∀ (d : Procedure.Declaration) (c : ComplaintText),
  Procedure.UsesPerjuryFormWithinUS d c →
  Structure.IncorporationHonored Structure.edge_1746p2_incorporates_perjuryLaw c


theorem s1746_procedure_implies_structure
    {d : Procedure.Declaration} {c : ComplaintText}
    (h : Procedure.ValidUnswornDeclaration1746 d c) :
    Structure.Grounded1746 c :=
  match h with
  | .withoutUS he => .viaWithoutUS (corr_ps46_without d c he.form)
  | .withinUS he  => .viaWithinUS (corr_ps46_within d c he.form)

end Proving.USC.T28.Bridge
