










































import Proving.USC.Common.Types
import Proving.USC.T42.ADA.Reslice.Elements.Statute
import Proving.USC.T42.ADA.Reslice.Deontic.Statute
import Proving.USC.T42.ADA.Reslice.Ontology.Statute
import Proving.USC.T42.ADA.Reslice.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T42.Bridge.ADAReslice

open Proving.USC.Common











structure DeonticB5ARoute (e : Entity) (p : Person)
    (a : Proving.USC.T42.ADA.Reslice.Deontic.Accommodation) (c : ComplaintText) : Prop where
  known : Proving.USC.T42.ADA.Reslice.Deontic.LimitationsKnownToCoveredEntity e p c
  omitted : Proving.USC.T42.ADA.Reslice.Deontic.ReasonableAccommodationNotMade e p a c
  noHardship : ¬ Proving.USC.T42.ADA.Reslice.Deontic.AccommodationImposesUndueHardship e a c


theorem deonticB5ARoute_intro {e : Entity} {p : Person}
    {a : Proving.USC.T42.ADA.Reslice.Deontic.Accommodation} {c : ComplaintText}
    (h : DeonticB5ARoute e p a c) :
    Proving.USC.T42.ADA.Reslice.Deontic.DiscriminatoryAct12112b e p c :=
  .accommodationFailure a h.known h.omitted h.noHardship








namespace B5A_EO



axiom entOf : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity → Entity

axiom accOf : Proving.USC.T42.ADA.Reslice.Elements.Accommodation →
    Proving.USC.T42.ADA.Reslice.Ontology.Accommodation



axiom disOf : Person → ComplaintText → Proving.USC.T42.ADA.Reslice.Ontology.Disability

axiom corr_coveredEntity {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.IsCoveredEntity d c →
    Proving.USC.T42.ADA.Reslice.Ontology.IsCoveredEntity (entOf d) c



axiom corr_otherwiseQualified {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.HasDisability p c →
    Proving.USC.T42.ADA.Reslice.Elements.QualifiedIndividual p c →
    Proving.USC.T42.ADA.Reslice.Ontology.IsOtherwiseQualifiedIndividualWithDisability
      p (disOf p c) c



axiom corr_applicantOrEmployee {p : Person} {c : ComplaintText} (e : Entity) :
    Proving.USC.T42.ADA.Reslice.Elements.IsApplicantOrEmployee p c →
    (Proving.USC.T42.ADA.Reslice.Ontology.IsJobApplicant p e c ∨
     Proving.USC.T42.ADA.Reslice.Ontology.IsEmployee p e c)

axiom corr_knownLimitation {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.LimitationsKnownToCoveredEntity d p c →
    Proving.USC.T42.ADA.Reslice.Ontology.IsKnownPhysicalOrMentalLimitation
      p (disOf p c) (entOf d) c

axiom corr_reasonable {acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation}
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.AccommodationIsReasonable acc p c →
    Proving.USC.T42.ADA.Reslice.Ontology.IsReasonableAccommodation (accOf acc) c

axiom corr_failure {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation} {p : Person}
    {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.FailsToMakeAccommodation d acc p c →
    Proving.USC.T42.ADA.Reslice.Ontology.FailsToMakeReasonableAccommodation
      (entOf d) p (accOf acc) c





axiom corr_hardship {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Ontology.DemonstratesUndueHardship (entOf d) (accOf acc) c →
    Proving.USC.T42.ADA.Reslice.Elements.ImposesUndueHardship acc d c





theorem s12112b5A_elements_implies_ontology
    {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity} {p : Person}
    {acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation} {c : ComplaintText}
    (hCE : Proving.USC.T42.ADA.Reslice.Elements.IsCoveredEntity d c)
    (h : Proving.USC.T42.ADA.Reslice.Elements.Discrimination12112b5A d p acc c) :
    Proving.USC.T42.ADA.Reslice.Ontology.FailureToAccommodate
      (entOf d) p (accOf acc) (disOf p c) c :=
  ⟨corr_coveredEntity hCE,
   corr_otherwiseQualified h.disability h.qualified,
   corr_applicantOrEmployee (entOf d) h.applicantOrEmployee,
   corr_knownLimitation h.knownLimitations,
   corr_reasonable h.reasonable,
   corr_failure h.failure,
   fun hd => h.noUndueHardship (corr_hardship hd)⟩

end B5A_EO



namespace B5A_OE

axiom elemOf : Entity → Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity
axiom accOf : Proving.USC.T42.ADA.Reslice.Ontology.Accommodation →
    Proving.USC.T42.ADA.Reslice.Elements.Accommodation




axiom corr_hasDisability {p : Person}
    {d : Proving.USC.T42.ADA.Reslice.Ontology.Disability} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Ontology.IsOtherwiseQualifiedIndividualWithDisability p d c →
    Proving.USC.T42.ADA.Reslice.Elements.HasDisability p c
axiom corr_prerequisites {p : Person}
    {d : Proving.USC.T42.ADA.Reslice.Ontology.Disability} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Ontology.IsOtherwiseQualifiedIndividualWithDisability p d c →
    Proving.USC.T42.ADA.Reslice.Elements.SatisfiesJobPrerequisites p c
axiom corr_essentialFunctions {p : Person}
    {d : Proving.USC.T42.ADA.Reslice.Ontology.Disability} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Ontology.IsOtherwiseQualifiedIndividualWithDisability p d c →
    Proving.USC.T42.ADA.Reslice.Elements.CanPerformEssentialFunctions p c

axiom corr_applicantOrEmployee {p : Person} {e : Entity} {c : ComplaintText} :
    (Proving.USC.T42.ADA.Reslice.Ontology.IsJobApplicant p e c ∨
     Proving.USC.T42.ADA.Reslice.Ontology.IsEmployee p e c) →
    Proving.USC.T42.ADA.Reslice.Elements.IsApplicantOrEmployee p c

axiom corr_knownLimitation {p : Person}
    {d : Proving.USC.T42.ADA.Reslice.Ontology.Disability} {e : Entity} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Ontology.IsKnownPhysicalOrMentalLimitation p d e c →
    Proving.USC.T42.ADA.Reslice.Elements.LimitationsKnownToCoveredEntity (elemOf e) p c




axiom corr_reasonable {acc : Proving.USC.T42.ADA.Reslice.Ontology.Accommodation}
    {c : ComplaintText} (p : Person) :
    Proving.USC.T42.ADA.Reslice.Ontology.IsReasonableAccommodation acc c →
    Proving.USC.T42.ADA.Reslice.Elements.AccommodationIsReasonable (accOf acc) p c

axiom corr_failure {e : Entity} {p : Person}
    {acc : Proving.USC.T42.ADA.Reslice.Ontology.Accommodation} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Ontology.FailsToMakeReasonableAccommodation e p acc c →
    Proving.USC.T42.ADA.Reslice.Elements.FailsToMakeAccommodation (elemOf e) (accOf acc) p c


axiom corr_hardship {e : Entity} {acc : Proving.USC.T42.ADA.Reslice.Ontology.Accommodation}
    {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.ImposesUndueHardship (accOf acc) (elemOf e) c →
    Proving.USC.T42.ADA.Reslice.Ontology.DemonstratesUndueHardship e acc c





theorem s12112b5A_ontology_implies_elements
    {e : Entity} {p : Person} {acc : Proving.USC.T42.ADA.Reslice.Ontology.Accommodation}
    {d : Proving.USC.T42.ADA.Reslice.Ontology.Disability} {c : ComplaintText}
    (h : Proving.USC.T42.ADA.Reslice.Ontology.FailureToAccommodate e p acc d c) :
    Proving.USC.T42.ADA.Reslice.Elements.Discrimination12112b5A (elemOf e) p (accOf acc) c :=
  ⟨corr_hasDisability h.otherwiseQualified,
   ⟨corr_prerequisites h.otherwiseQualified, corr_essentialFunctions h.otherwiseQualified⟩,
   corr_applicantOrEmployee h.applicantOrEmployee,
   corr_knownLimitation h.knownLimitation,
   corr_reasonable p h.reasonable,
   corr_failure h.failure,
   fun hi => h.noUndueHardship (corr_hardship hi)⟩

end B5A_OE



namespace B5A_ED

axiom entOf : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity → Entity
axiom accOf : Proving.USC.T42.ADA.Reslice.Elements.Accommodation →
    Proving.USC.T42.ADA.Reslice.Deontic.Accommodation

axiom corr_known {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.LimitationsKnownToCoveredEntity d p c →
    Proving.USC.T42.ADA.Reslice.Deontic.LimitationsKnownToCoveredEntity (entOf d) p c

axiom corr_omitted {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation} {p : Person}
    {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.FailsToMakeAccommodation d acc p c →
    Proving.USC.T42.ADA.Reslice.Deontic.ReasonableAccommodationNotMade (entOf d) p (accOf acc) c

axiom corr_hardship {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Deontic.AccommodationImposesUndueHardship
      (entOf d) (accOf acc) c →
    Proving.USC.T42.ADA.Reslice.Elements.ImposesUndueHardship acc d c







theorem s12112b5A_elements_implies_deontic
    {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity} {p : Person}
    {acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation} {c : ComplaintText}
    (h : Proving.USC.T42.ADA.Reslice.Elements.Discrimination12112b5A d p acc c) :
    Proving.USC.T42.ADA.Reslice.Deontic.DiscriminatoryAct12112b (entOf d) p c :=
  .accommodationFailure (accOf acc)
    (corr_known h.knownLimitations)
    (corr_omitted h.failure)
    (fun hh => h.noUndueHardship (corr_hardship hh))

end B5A_ED



namespace B5A_OD

axiom accOf : Proving.USC.T42.ADA.Reslice.Ontology.Accommodation →
    Proving.USC.T42.ADA.Reslice.Deontic.Accommodation

axiom corr_known {p : Person} {d : Proving.USC.T42.ADA.Reslice.Ontology.Disability}
    {e : Entity} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Ontology.IsKnownPhysicalOrMentalLimitation p d e c →
    Proving.USC.T42.ADA.Reslice.Deontic.LimitationsKnownToCoveredEntity e p c

axiom corr_omitted {e : Entity} {p : Person}
    {acc : Proving.USC.T42.ADA.Reslice.Ontology.Accommodation} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Ontology.FailsToMakeReasonableAccommodation e p acc c →
    Proving.USC.T42.ADA.Reslice.Deontic.ReasonableAccommodationNotMade e p (accOf acc) c

axiom corr_hardship {e : Entity} {acc : Proving.USC.T42.ADA.Reslice.Ontology.Accommodation}
    {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Deontic.AccommodationImposesUndueHardship e (accOf acc) c →
    Proving.USC.T42.ADA.Reslice.Ontology.DemonstratesUndueHardship e acc c





theorem s12112b5A_ontology_implies_deontic
    {e : Entity} {p : Person} {acc : Proving.USC.T42.ADA.Reslice.Ontology.Accommodation}
    {d : Proving.USC.T42.ADA.Reslice.Ontology.Disability} {c : ComplaintText}
    (h : Proving.USC.T42.ADA.Reslice.Ontology.FailureToAccommodate e p acc d c) :
    Proving.USC.T42.ADA.Reslice.Deontic.DiscriminatoryAct12112b e p c :=
  .accommodationFailure (accOf acc)
    (corr_known h.knownLimitation)
    (corr_omitted h.failure)
    (fun hh => h.noUndueHardship (corr_hardship hh))

end B5A_OD



namespace B5A_EP

axiom procOf : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity →
    Proving.USC.T42.ADA.Reslice.Procedure.CoveredEntity

axiom corr_known {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.LimitationsKnownToCoveredEntity d p c →
    Proving.USC.T42.ADA.Reslice.Procedure.KnownLimitationBroughtToEntityAttention
      (procOf d) p c








axiom corr_noAccommodationMade {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation} {p : Person}
    {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.AccommodationIsReasonable acc p c →
    Proving.USC.T42.ADA.Reslice.Elements.FailsToMakeAccommodation d acc p c →
    ¬ Proving.USC.T42.ADA.Reslice.Procedure.ReasonableAccommodationMade (procOf d) p c


axiom corr_hardship {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation} {p : Person}
    {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Procedure.UndueHardshipDemonstratedByEntity (procOf d) p c →
    Proving.USC.T42.ADA.Reslice.Elements.ImposesUndueHardship acc d c



theorem s12112b5A_elements_implies_procedure
    {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity} {p : Person}
    {acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation} {c : ComplaintText}
    (h : Proving.USC.T42.ADA.Reslice.Elements.Discrimination12112b5A d p acc c) :
    Proving.USC.T42.ADA.Reslice.Procedure.AccommodationProcessBreach (procOf d) p c :=
  ⟨corr_known h.knownLimitations,
   corr_noAccommodationMade h.reasonable h.failure,
   fun hh => h.noUndueHardship (corr_hardship hh)⟩

end B5A_EP



namespace B5A_OP

axiom procOf : Entity → Proving.USC.T42.ADA.Reslice.Procedure.CoveredEntity

axiom corr_known {p : Person} {d : Proving.USC.T42.ADA.Reslice.Ontology.Disability}
    {e : Entity} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Ontology.IsKnownPhysicalOrMentalLimitation p d e c →
    Proving.USC.T42.ADA.Reslice.Procedure.KnownLimitationBroughtToEntityAttention
      (procOf e) p c


axiom corr_noAccommodationMade {e : Entity} {p : Person}
    {acc : Proving.USC.T42.ADA.Reslice.Ontology.Accommodation} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Ontology.IsReasonableAccommodation acc c →
    Proving.USC.T42.ADA.Reslice.Ontology.FailsToMakeReasonableAccommodation e p acc c →
    ¬ Proving.USC.T42.ADA.Reslice.Procedure.ReasonableAccommodationMade (procOf e) p c

axiom corr_hardship {e : Entity} {p : Person}
    {acc : Proving.USC.T42.ADA.Reslice.Ontology.Accommodation} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Procedure.UndueHardshipDemonstratedByEntity (procOf e) p c →
    Proving.USC.T42.ADA.Reslice.Ontology.DemonstratesUndueHardship e acc c


theorem s12112b5A_ontology_implies_procedure
    {e : Entity} {p : Person} {acc : Proving.USC.T42.ADA.Reslice.Ontology.Accommodation}
    {d : Proving.USC.T42.ADA.Reslice.Ontology.Disability} {c : ComplaintText}
    (h : Proving.USC.T42.ADA.Reslice.Ontology.FailureToAccommodate e p acc d c) :
    Proving.USC.T42.ADA.Reslice.Procedure.AccommodationProcessBreach (procOf e) p c :=
  ⟨corr_known h.knownLimitation,
   corr_noAccommodationMade h.reasonable h.failure,
   fun hh => h.noUndueHardship (corr_hardship hh)⟩

end B5A_OP



namespace B5A_DP

axiom procOf : Entity → Proving.USC.T42.ADA.Reslice.Procedure.CoveredEntity

axiom corr_known {e : Entity} {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Deontic.LimitationsKnownToCoveredEntity e p c →
    Proving.USC.T42.ADA.Reslice.Procedure.KnownLimitationBroughtToEntityAttention
      (procOf e) p c





axiom corr_noAccommodationMade {e : Entity} {p : Person}
    {a : Proving.USC.T42.ADA.Reslice.Deontic.Accommodation} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Deontic.ReasonableAccommodationNotMade e p a c →
    ¬ Proving.USC.T42.ADA.Reslice.Procedure.ReasonableAccommodationMade (procOf e) p c

axiom corr_hardship {e : Entity} {p : Person}
    {a : Proving.USC.T42.ADA.Reslice.Deontic.Accommodation} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Procedure.UndueHardshipDemonstratedByEntity (procOf e) p c →
    Proving.USC.T42.ADA.Reslice.Deontic.AccommodationImposesUndueHardship e a c




theorem s12112b5A_deontic_implies_procedure
    {e : Entity} {p : Person} {a : Proving.USC.T42.ADA.Reslice.Deontic.Accommodation}
    {c : ComplaintText} (h : DeonticB5ARoute e p a c) :
    Proving.USC.T42.ADA.Reslice.Procedure.AccommodationProcessBreach (procOf e) p c :=
  ⟨corr_known h.known,
   corr_noAccommodationMade h.omitted,
   fun hh => h.noHardship (corr_hardship hh)⟩

end B5A_DP












namespace A_ED

axiom entOf : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity → Entity
axiom termOf : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction →
    Proving.USC.T42.ADA.Reslice.Deontic.EmploymentTerm

axiom corr_coveredEntity {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.IsCoveredEntity d c →
    Proving.USC.T42.ADA.Reslice.Deontic.IsCoveredEntity (entOf d) c




axiom corr_protectedClass {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.HasDisability p c →
    Proving.USC.T42.ADA.Reslice.Elements.QualifiedIndividual p c →
    Proving.USC.T42.ADA.Reslice.Deontic.IsQualifiedIndividualWithDisability p (entOf d) c

axiom corr_employmentMatter {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {p : Person} {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction}
    {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.AffectsCoveredEmploymentPractice a c →
    Proving.USC.T42.ADA.Reslice.Deontic.ActionConcernsEmploymentTerm
      (entOf d) p (termOf a) c

axiom corr_basis {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity} {p : Person}
    {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.OnTheBasisOfDisability p a c →
    Proving.USC.T42.ADA.Reslice.Deontic.OnBasisOfDisability (entOf d) p c


axiom corr_residualAct {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {p : Person} {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction}
    {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.AdverseToIndividual p a c →
    Proving.USC.T42.ADA.Reslice.Elements.PracticeAttributedToCoveredEntity d a c →
    Proving.USC.T42.ADA.Reslice.Deontic.AdverseEmploymentActionTaken (entOf d) p (termOf a) c




axiom corr_foreignLaw {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Deontic.ForeignLawExempt12112c1 (entOf d) p c →
    Proving.USC.T42.ADA.Reslice.Elements.ForeignLawComplianceConflict d p c


axiom corr_scopeExclusion {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Deontic.ScopeExclusion12112c2B (entOf d) p c →
    Proving.USC.T42.ADA.Reslice.Elements.ForeignOperationsOfUncontrolledForeignEmployer d p c









theorem s12112a_elements_implies_deontic
    {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity} {p : Person}
    {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction} {c : ComplaintText}
    (h : Proving.USC.T42.ADA.Reslice.Elements.Section12112 d p a c)
    (hGen : Proving.USC.T42.ADA.Reslice.Elements.GeneralDiscrimination12112a p a c) :
    Proving.USC.T42.ADA.Reslice.Deontic.Violation12112a (entOf d) p (termOf a) c :=
  ⟨⟨corr_coveredEntity h.coveredEntity,
    corr_protectedClass hGen.disability hGen.qualified,
    corr_employmentMatter h.employmentPractice⟩,
   corr_basis hGen.causation,
   .residual (termOf a) (corr_residualAct hGen.adverse h.attribution),
   fun hf => h.notForeignLawConflict (corr_foreignLaw hf),
   fun hs => h.notUncontrolledForeignEmployer (corr_scopeExclusion hs)⟩

end A_ED



namespace A_EO

axiom entOf : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity → Entity
axiom pracOf : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction →
    Proving.USC.T42.ADA.Reslice.Ontology.EmploymentPractice
axiom disOf : Person → ComplaintText → Proving.USC.T42.ADA.Reslice.Ontology.Disability

axiom corr_coveredEntity {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.IsCoveredEntity d c →
    Proving.USC.T42.ADA.Reslice.Ontology.IsCoveredEntity (entOf d) c

axiom corr_qualified {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.QualifiedIndividual p c →
    Proving.USC.T42.ADA.Reslice.Ontology.IsQualifiedIndividual p c
axiom corr_isDisability {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.HasDisability p c →
    Proving.USC.T42.ADA.Reslice.Ontology.IsDisability (disOf p c) c
axiom corr_bearer {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.HasDisability p c →
    Proving.USC.T42.ADA.Reslice.Ontology.HasDisability p (disOf p c) c





axiom corr_engaged {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.PracticeAttributedToCoveredEntity d a c →
    Proving.USC.T42.ADA.Reslice.Ontology.EngagedInPractice (entOf d) (pracOf a) c





axiom corr_aspect {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction}
    {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.AffectsCoveredEmploymentPractice a c →
    Proving.USC.T42.ADA.Reslice.Ontology.CoveredEmploymentAspect (pracOf a) c

axiom corr_onBasis {p : Person}
    {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.OnTheBasisOfDisability p a c →
    Proving.USC.T42.ADA.Reslice.Ontology.IsOnTheBasisOfDisability (pracOf a) (disOf p c) c

















theorem s12112a_elements_implies_ontology_modulo_gaps
    {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity} {p : Person}
    {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction} {c : ComplaintText}
    (h : Proving.USC.T42.ADA.Reslice.Elements.Section12112 d p a c)
    (hGen : Proving.USC.T42.ADA.Reslice.Elements.GeneralDiscrimination12112a p a c)
    (gap_discriminate :
      Proving.USC.T42.ADA.Reslice.Ontology.DiscriminateOnBasisOfDisability (entOf d) p c) :
    Proving.USC.T42.ADA.Reslice.Ontology.Section12112a
      (entOf d) p (disOf p c) (pracOf a) c :=
  ⟨corr_coveredEntity h.coveredEntity,
   ⟨corr_qualified hGen.qualified, corr_isDisability hGen.disability,
    corr_bearer hGen.disability⟩,
   corr_engaged h.attribution,
   corr_aspect h.employmentPractice,
   corr_onBasis hGen.causation,
   gap_discriminate⟩

end A_EO



namespace A_DO

axiom pracOf : Proving.USC.T42.ADA.Reslice.Deontic.EmploymentTerm →
    Proving.USC.T42.ADA.Reslice.Ontology.EmploymentPractice
axiom disOf : Person → ComplaintText → Proving.USC.T42.ADA.Reslice.Ontology.Disability

axiom corr_coveredEntity {e : Entity} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Deontic.IsCoveredEntity e c →
    Proving.USC.T42.ADA.Reslice.Ontology.IsCoveredEntity e c

axiom corr_qualified {p : Person} {e : Entity} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Deontic.IsQualifiedIndividualWithDisability p e c →
    Proving.USC.T42.ADA.Reslice.Ontology.IsQualifiedIndividual p c
axiom corr_isDisability {p : Person} {e : Entity} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Deontic.IsQualifiedIndividualWithDisability p e c →
    Proving.USC.T42.ADA.Reslice.Ontology.IsDisability (disOf p c) c
axiom corr_bearer {p : Person} {e : Entity} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Deontic.IsQualifiedIndividualWithDisability p e c →
    Proving.USC.T42.ADA.Reslice.Ontology.HasDisability p (disOf p c) c

axiom corr_engaged {e : Entity} {p : Person}
    {t : Proving.USC.T42.ADA.Reslice.Deontic.EmploymentTerm} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Deontic.AdverseEmploymentActionTaken e p t c →
    Proving.USC.T42.ADA.Reslice.Ontology.EngagedInPractice e (pracOf t) c

axiom corr_aspect {e : Entity} {p : Person}
    {t : Proving.USC.T42.ADA.Reslice.Deontic.EmploymentTerm} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Deontic.ActionConcernsEmploymentTerm e p t c →
    Proving.USC.T42.ADA.Reslice.Ontology.CoveredEmploymentAspect (pracOf t) c

axiom corr_onBasis {e : Entity} {p : Person}
    {t : Proving.USC.T42.ADA.Reslice.Deontic.EmploymentTerm} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Deontic.OnBasisOfDisability e p c →
    Proving.USC.T42.ADA.Reslice.Ontology.IsOnTheBasisOfDisability (pracOf t) (disOf p c) c






theorem s12112a_deontic_implies_ontology_modulo_gaps
    {e : Entity} {p : Person} {t : Proving.USC.T42.ADA.Reslice.Deontic.EmploymentTerm}
    {c : ComplaintText}
    (hNorm : Proving.USC.T42.ADA.Reslice.Deontic.Prohibition12112a e p t c)
    (hBasis : Proving.USC.T42.ADA.Reslice.Deontic.OnBasisOfDisability e p c)
    (hAct : Proving.USC.T42.ADA.Reslice.Deontic.AdverseEmploymentActionTaken e p t c)
    (gap_discriminate :
      Proving.USC.T42.ADA.Reslice.Ontology.DiscriminateOnBasisOfDisability e p c) :
    Proving.USC.T42.ADA.Reslice.Ontology.Section12112a e p (disOf p c) (pracOf t) c :=
  ⟨corr_coveredEntity hNorm.addressee,
   ⟨corr_qualified hNorm.protectedClass, corr_isDisability hNorm.protectedClass,
    corr_bearer hNorm.protectedClass⟩,
   corr_engaged hAct,
   corr_aspect hNorm.employmentMatter,
   corr_onBasis hBasis,
   gap_discriminate⟩

end A_DO

end Proving.USC.T42.Bridge.ADAReslice
