



































import Proving.USC.T42.PublicAccommodations.Prohibition.Elements.Theorems
import Proving.USC.T42.PublicAccommodations.Prohibition.Deontic.Theorems
import Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.Theorems
import Proving.USC.T42.PublicAccommodations.Prohibition.Procedure.Theorems
import Proving.USC.T42.PublicAccommodations.Prohibition.Structure.Theorems

namespace Proving.USC.T42.PublicAccommodations.Prohibition.Bridge
open Proving.USC.Common









namespace S2000a1
open Proving.USC.T42.PublicAccommodations
















axiom corr_addressee {p est c} :
    IsPersonInUS p c → Elements.AtEstablishmentOrPlace est c →
    Deontic.StateActorAddressee2000a1 p c
axiom corr_condition {c} :
    Elements.RequiredByStateLaw c → Deontic.RequiredByStateLaw2000a1 c
axiom corr_act {p est c} :
    Elements.SufferedDiscriminationOrSegregation p est c → OnProtectedGround p c →
    Deontic.DiscriminationOrSegregationAct2000a1 p c



theorem elements_implies_deontic {p est c} (h : Elements.Section2000a1 p est c) :
    Deontic.ProhibitionViolated2000a1 p c :=
  ⟨⟨corr_addressee h.person h.atPlace, corr_condition h.stateRequired⟩,
   corr_act h.discrimination h.protectedGround⟩







axiom mapEstablishment : Elements.Establishment → Ontology.Establishment
axiom corr_isEstablishment {est c} :
    Elements.AtEstablishmentOrPlace est c →
    Ontology.IsEstablishment (mapEstablishment est) c
axiom corr_isStateInstrument {c} (s : Ontology.StateLawInstrument) :
    Elements.RequiredByStateLaw c → Ontology.IsStateLawInstrument s c
axiom corr_isDiscTreatment {p est c} (t : Ontology.DiscriminatoryTreatment) :
    Elements.SufferedDiscriminationOrSegregation p est c →
    Ontology.IsDiscriminatoryTreatment t c
axiom corr_isOnGround {p c} (t : Ontology.DiscriminatoryTreatment) (g : Ontology.ProtectedGround) :
    OnProtectedGround p c → Ontology.IsOnProtectedGround t g c




theorem elements_implies_ontology {p est c}
    (s : Ontology.StateLawInstrument) (t : Ontology.DiscriminatoryTreatment)
    (g : Ontology.ProtectedGround)
    (h : Elements.Section2000a1 p est c) :
    Ontology.Section2000a1Membership (mapEstablishment est) s t g c :=
  ⟨corr_isEstablishment h.atPlace,
   corr_isStateInstrument s h.stateRequired,
   ⟨corr_isDiscTreatment t h.discrimination, corr_isOnGround t g h.protectedGround⟩⟩








axiom corr_stateRequiredDisc {p est c} :
    Elements.SufferedDiscriminationOrSegregation p est c → Elements.RequiredByStateLaw c →
    Procedure.StateRequiredDiscrimination p c
axiom corr_rightSecured {p est c} :
    Elements.Section2000a1 p est c → Procedure.RightSecuredToPerson p c
axiom corr_interfered {p est c} :
    Elements.SufferedDiscriminationOrSegregation p est c → Procedure.InterferenceActOccurred p c





theorem elements_implies_procedure_modulo_gaps {p est c} (h : Elements.Section2000a1 p est c)
    (gap_rightExercised : Procedure.RightExercised p c)
    (gap_withinWindow : Procedure.WithinEnforcementWindow p c) :
    Procedure.StateMandatedEnforcement p c :=
  ⟨corr_stateRequiredDisc h.discrimination h.stateRequired,
   ⟨corr_rightSecured h, gap_rightExercised, corr_interfered h.discrimination, gap_withinWindow⟩⟩

end S2000a1








namespace S2000a2
open Proving.USC.T42.PublicAccommodations

axiom mapR : Elements.SecuredRight → Deontic.SecuredRight








axiom corr_addressee {p c} : IsPersonInUS p c → Deontic.AnyPersonAddressee2000a2 p c
axiom corr_condition {r c} :
    Elements.RightSecuredBy2000a r c → Deontic.RightSecuredBy2000aOr2000a1 (mapR r) c
axiom corr_deprive {p r c} :
    Elements.WithheldOrDeprivedRight p r c → Deontic.WithholdOrDenyAct2000a2 p (mapR r) c
axiom corr_coerce {p r c} :
    Elements.IntimidatedThreatenedCoerced p c → Elements.PurposeOfInterfering p r c →
    Deontic.IntimidateOrCoerceAct2000a2 p (mapR r) c
axiom corr_punish {p r c} :
    Elements.PunishedForExercising p r c → Deontic.PunishForExerciseAct2000a2 p (mapR r) c




theorem elements_implies_deontic {p r c} (h : Elements.ProhibitedInterference p r c) :
    Deontic.ProhibitionViolated2000a2 p (mapR r) c := by
  cases h with
  | deprive hd =>
      exact ⟨⟨corr_addressee hd.person, corr_condition hd.secured⟩,
             Or.inl (corr_deprive hd.conduct)⟩
  | coerce hc =>
      exact ⟨⟨corr_addressee hc.person, corr_condition hc.secured⟩,
             Or.inr (Or.inl (corr_coerce hc.conduct hc.purpose))⟩
  | punish hp =>
      exact ⟨⟨corr_addressee hp.person, corr_condition hp.secured⟩,
             Or.inr (Or.inr (corr_punish hp.conduct))⟩




axiom mapRO : Elements.SecuredRight → Ontology.SecuredRight
axiom corr_isSecuredRight {r c} :
    Elements.RightSecuredBy2000a r c → Ontology.IsSecuredRight (mapRO r) c
axiom corr_isInterfering {p r c} (a : Ontology.InterferingAct) :
    Elements.WithheldOrDeprivedRight p r c → Ontology.IsInterferingAct a (mapRO r) c
axiom corr_isAffected {p c} : IsPersonInUS p c → Ontology.IsAffectedPerson p c



theorem elements_implies_ontology {p r c} (a : Ontology.InterferingAct)
    (h : Elements.Section2000a2_Deprive p r c) :
    Ontology.Section2000a2Membership (mapRO r) a p c :=
  ⟨corr_isSecuredRight h.secured, corr_isInterfering a h.conduct, corr_isAffected h.person⟩














theorem elements_implies_structure_modulo_gaps {p r c} (_h : Elements.Section2000a2_Deprive p r c)
    (gap_coreExists  : Structure.ReferencedSectionExists Structure.edge_2000a2_incorporates_2000a c)
    (gap_coreHonored : Structure.IncorporationHonored Structure.edge_2000a2_incorporates_2000a c)
    (gap_a1Exists    : Structure.ReferencedSectionExists Structure.edge_2000a2_incorporates_2000a1 c)
    (gap_a1Honored   : Structure.IncorporationHonored Structure.edge_2000a2_incorporates_2000a1 c) :
    Structure.Coherent2000a2 c :=
  ⟨gap_coreExists, gap_coreHonored, gap_a1Exists, gap_a1Honored⟩

end S2000a2

end Proving.USC.T42.PublicAccommodations.Prohibition.Bridge
