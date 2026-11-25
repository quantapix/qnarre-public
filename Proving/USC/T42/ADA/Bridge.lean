






























import Proving.USC.T42.ADA.Elements.Theorems
import Proving.USC.T42.ADA.Deontic.Statute
import Proving.USC.T42.ADA.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.ADA.Bridge

open Proving.USC.Common







axiom mapDeonticEntityToCE  : Deontic.CoveredAddressee → Elements.CoveredEntity
axiom mapDeonticEntityToPE  : Deontic.CoveredAddressee → Elements.PublicEntity
axiom mapDeonticEntityToPA  : Deontic.CoveredAddressee → Elements.PublicAccommodation
axiom mapIndivToPerson      : Deontic.ProtectedIndividual → Person
axiom mapEmploymentAction   : Deontic.ProtectedIndividual → Elements.EmploymentAction
axiom mapPublicService      : Deontic.ProtectedIndividual → Elements.PublicService
axiom mapAccommodationAct   : Deontic.ProtectedIndividual → Elements.AccommodationAct
































axiom corr_directThreat12112 {i c} :
    Deontic.ConditionMet12112 i c → ¬ Elements.PosesDirectThreat (mapIndivToPerson i) c

axiom corr12112_addressee {a c} :
    Deontic.AddresseeInClass12112 a c → Elements.IsCoveredEntity (mapDeonticEntityToCE a) c
axiom corr12112_disability {i c} :
    Deontic.ConditionMet12112 i c → Elements.HasDisability (mapIndivToPerson i) c
axiom corr12112_qualified {i c} :
    Deontic.ConditionMet12112 i c → Elements.IsQualifiedIndividualEmployment (mapIndivToPerson i) c
axiom corr12112_adverse {a i c} :
    Deontic.RegulatedActOccurred12112 a i c →
    Elements.AdverseEmploymentActionTaken (mapEmploymentAction i) c
axiom corr12112_causation {a i c} :
    Deontic.RegulatedActOccurred12112 a i c →
    Elements.ActionOnBasisOfDisability (mapIndivToPerson i) (mapEmploymentAction i) c





theorem s12112_deontic_implies_elements
    {a i c}
    (h : Deontic.Prohibition12112Violated a i c)
    : Elements.Section12112 (mapIndivToPerson i) (mapDeonticEntityToCE a) (mapEmploymentAction i) c :=
  ⟨corr12112_disability h.1.condition,
   corr12112_qualified h.1.condition,
   corr12112_addressee h.1.addressee,
   corr12112_adverse h.2,
   corr12112_causation h.2,
   corr_directThreat12112 h.1.condition⟩











axiom corr12112b5_failed {a i c} :
    ¬ Deontic.AccommodationProvided12112b5 a i c →
    Elements.FailedToReasonablyAccommodate (mapDeonticEntityToCE a) (mapIndivToPerson i) c
axiom corr12112b5_noUndueHardship {a i c} :
    ¬ Deontic.UndueHardship12112b5 a i c →
    ¬ Elements.AccommodationImposesUndueHardship (mapDeonticEntityToCE a) c


theorem s12112b5_deontic_implies_elements
    {a i c}
    (h : Deontic.Obligation12112b5Breached a i c)
    : Elements.Section12112FailureToAccommodate (mapIndivToPerson i) (mapDeonticEntityToCE a) c :=
  ⟨corr12112_disability h.1.condition,
   corr12112_qualified h.1.condition,
   corr12112_addressee h.1.addressee,
   corr12112b5_failed h.2,
   corr12112b5_noUndueHardship h.1.noExcuse,
   corr_directThreat12112 h.1.condition⟩





















axiom corr_directThreat12132 {i c} :
    Deontic.ConditionMet12132 i c → ¬ Elements.PosesDirectThreat (mapIndivToPerson i) c
axiom corr12132_addressee {a c} :
    Deontic.AddresseeInClass12132 a c → Elements.IsPublicEntity (mapDeonticEntityToPE a) c
axiom corr12132_qualified {i c} :
    Deontic.ConditionMet12132 i c →
    Elements.IsQualifiedIndividualPublicService (mapIndivToPerson i) c
axiom corr12132_excluded {a i c} :
    Deontic.RegulatedActOccurred12132 a i c →
    Elements.ExcludedFromPublicService (mapPublicService i) c
axiom corr12132_causation {a i c} :
    Deontic.RegulatedActOccurred12132 a i c →
    Elements.ExclusionByReasonOfDisability (mapIndivToPerson i) (mapPublicService i) c


theorem s12132_deontic_implies_elements
    {a i c}
    (h : Deontic.Prohibition12132Violated a i c)
    : Elements.Section12132 (mapIndivToPerson i) (mapDeonticEntityToPE a) (mapPublicService i) c :=
  ⟨corr12132_addressee h.1.addressee,
   corr12132_qualified h.1.condition,
   corr12132_excluded h.2,
   corr12132_causation h.2,
   corr_directThreat12132 h.1.condition⟩










axiom corr12182_addressee {a c} :
    Deontic.AddresseeInClass12182 a c →
    Elements.OperatesPublicAccommodation (mapDeonticEntityToPA a) c
axiom corr12182_disability {i c} :
    Deontic.ConditionMet12182 i c → Elements.HasDisability (mapIndivToPerson i) c
axiom corr12182_denied {a i c} :
    Deontic.RegulatedActOccurred12182 a i c →
    Elements.DeniedFullEqualEnjoyment (mapAccommodationAct i) c
axiom corr12182_causation {a i c} :
    Deontic.RegulatedActOccurred12182 a i c →
    Elements.DenialOnBasisOfDisability (mapIndivToPerson i) (mapAccommodationAct i) c
axiom corr12182_noThreat {i c} :
    ¬ Deontic.DirectThreat12182 i c → ¬ Elements.PosesDirectThreat (mapIndivToPerson i) c



theorem s12182_deontic_implies_elements
    {a i c}
    (h : Deontic.Prohibition12182Violated a i c)
    : Elements.Section12182 (mapIndivToPerson i) (mapDeonticEntityToPA a) (mapAccommodationAct i) c :=
  ⟨corr12182_disability h.1.condition,
   corr12182_addressee h.1.addressee,
   corr12182_denied h.2,
   corr12182_causation h.2,
   corr12182_noThreat h.1.noThreat⟩











axiom corr12203a_protected {i c} :
    Deontic.ConditionMet12203a i c →
    Elements.EngagedInProtectedActivityADA (mapIndivToPerson i) c
axiom corr12203a_causal {i c} :
    Deontic.ConditionMet12203a i c →
    Elements.RetaliationCausalNexus (mapIndivToPerson i) c
axiom corr12203a_retaliatory {a i c} :
    Deontic.RegulatedActOccurred12203a a i c →
    Elements.RetaliatoryActOccurredADA (mapIndivToPerson i) c


theorem s12203_deontic_implies_elements
    {a i c}
    (h : Deontic.Prohibition12203aViolated a i c)
    : Elements.Section12203 (mapIndivToPerson i) c :=
  ⟨corr12203a_protected h.1.condition,
   corr12203a_retaliatory h.2,
   corr12203a_causal h.1.condition⟩














axiom mapOntoCEtoElem  : Ontology.CoveredEntity → Elements.CoveredEntity
axiom mapOntoPersonToElem : Person → Person
axiom corrOnto12112_ce {ce c} :
    Ontology.IsCoveredEntity ce c → Elements.IsCoveredEntity (mapOntoCEtoElem ce) c
axiom corrOnto12112_qualified {p c} :
    Ontology.IsQualifiedIndividual p c → Elements.IsQualifiedIndividualEmployment p c
axiom corrOnto12112_actualImpairment {i a c} :
    Ontology.DisabilityMembershipActual i a c →
    ∀ p, Elements.HasActualImpairmentLimitingMLA p c





theorem s12112_ontology_implies_elements_coverage
    {ce p i a c}
    (h : Ontology.Section12112TermsInhabited ce p i a c)
    : Elements.IsCoveredEntity (mapOntoCEtoElem ce) c
      ∧ Elements.IsQualifiedIndividualEmployment p c
      ∧ Elements.HasDisability p c :=
  ⟨corrOnto12112_ce h.coveredEntity,
   corrOnto12112_qualified h.qualified,
   Elements.HasDisability.actual (corrOnto12112_actualImpairment h.disability p)⟩

end Proving.USC.T42.ADA.Bridge
