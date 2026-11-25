






































import Proving.ADA.Statute
import Proving.USC.Common.Types
import Proving.USC.T42.ADA.Reslice.Elements.Statute

set_option autoImplicit false

namespace Proving.USC.T42.GoldenBridge.ADAReslice

open Proving.USC.Common









axiom mapPerson : Person → Proving.ADA.Person
axiom mapText : ComplaintText → Proving.ADA.ComplaintText
axiom mapEnt : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity → Proving.ADA.CoveredEntity
axiom mapAct : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction → Proving.ADA.Action



axiom corr_hasDisability {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.HasDisability p c →
    Proving.ADA.HasDisability (mapPerson p) (mapText c)









axiom corr_coveredEmployer {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity}
    {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.IsCoveredEntity d c →
    Proving.ADA.IsCoveredEmployer (mapEnt d) (mapText c)





axiom corr_qualified {p : Person} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.SatisfiesJobPrerequisites p c →
    Proving.USC.T42.ADA.Reslice.Elements.CanPerformEssentialFunctions p c →
    Proving.ADA.IsQualifiedIndividualForEmployment (mapPerson p) (mapText c)

axiom corr_employmentContext
    {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.AffectsCoveredEmploymentPractice a c →
    Proving.ADA.OccursInEmploymentContext (mapAct a) (mapText c)




theorem coverage_of
    {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity} {p : Person}
    {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction} {c : ComplaintText}
    (hCE : Proving.USC.T42.ADA.Reslice.Elements.IsCoveredEntity d c)
    (hPractice : Proving.USC.T42.ADA.Reslice.Elements.AffectsCoveredEmploymentPractice a c)
    (hDis : Proving.USC.T42.ADA.Reslice.Elements.HasDisability p c)
    (hQual : Proving.USC.T42.ADA.Reslice.Elements.QualifiedIndividual p c) :
    Proving.ADA.Title1Coverage (mapPerson p) (mapEnt d) (mapAct a) (mapText c) :=
  ⟨corr_hasDisability hDis,
   corr_coveredEmployer hCE,
   corr_qualified hQual.prerequisites hQual.essentialFunctions,
   corr_employmentContext hPractice⟩






axiom corr_onBasis {p : Person}
    {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.OnTheBasisOfDisability p a c →
    Proving.ADA.DiscriminatedAgainstOnBasisOfDisability
      (mapAct a) Proving.ADA.ProtectedGround.disability (mapText c)

axiom corr_adverse {p : Person}
    {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction} {c : ComplaintText} :
    Proving.USC.T42.ADA.Reslice.Elements.AdverseToIndividual p a c →
    Proving.ADA.AdverseEmploymentAction (mapAct a) (mapPerson p) (mapText c)


















theorem elements_implies_golden_title1DisparateTreatment
    {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity} {p : Person}
    {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction} {c : ComplaintText}
    (h : Proving.USC.T42.ADA.Reslice.Elements.Section12112 d p a c)
    (hGen : Proving.USC.T42.ADA.Reslice.Elements.GeneralDiscrimination12112a p a c) :
    Proving.ADA.Title1DisparateTreatmentClaim
      (mapPerson p) (mapEnt d) (mapAct a) Proving.ADA.ProtectedGround.disability
      (mapText c) :=
  ⟨coverage_of h.coveredEntity h.employmentPractice hGen.disability hGen.qualified,
   corr_onBasis hGen.causation,
   corr_adverse hGen.adverse⟩











axiom corr_needed {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity} {p : Person}
    {c : ComplaintText}
    (a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction)
    (acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation) :
    Proving.USC.T42.ADA.Reslice.Elements.LimitationsKnownToCoveredEntity d p c →
    Proving.USC.T42.ADA.Reslice.Elements.AccommodationIsReasonable acc p c →
    Proving.ADA.NeededReasonableAccommodation (mapAct a) (mapPerson p) (mapText c)






axiom corr_reasonableNotHardship
    {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity} {p : Person}
    {c : ComplaintText}
    (a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction)
    (acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation) :
    Proving.USC.T42.ADA.Reslice.Elements.AccommodationIsReasonable acc p c →
    ¬ Proving.USC.T42.ADA.Reslice.Elements.ImposesUndueHardship acc d c →
    Proving.ADA.AccommodationReasonableNotUndueHardship (mapAct a) (mapText c)

axiom corr_failed {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity} {p : Person}
    {c : ComplaintText}
    (a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction)
    {acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation} :
    Proving.USC.T42.ADA.Reslice.Elements.FailsToMakeAccommodation d acc p c →
    Proving.ADA.EmployerFailedToAccommodate (mapAct a) (mapPerson p) (mapText c)



















theorem elements_implies_golden_title1FailureToAccommodate
    {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity} {p : Person}
    {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction}
    {acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation} {c : ComplaintText}
    (h : Proving.USC.T42.ADA.Reslice.Elements.Section12112 d p a c)
    (hAcc : Proving.USC.T42.ADA.Reslice.Elements.Discrimination12112b5A d p acc c) :
    Proving.ADA.Title1FailureToAccommodateClaim
      (mapPerson p) (mapEnt d) (mapAct a) (mapText c) :=
  ⟨coverage_of h.coveredEntity h.employmentPractice hAcc.disability hAcc.qualified,
   corr_needed a acc hAcc.knownLimitations hAcc.reasonable,
   corr_reasonableNotHardship a acc hAcc.reasonable hAcc.noUndueHardship,
   corr_failed a hAcc.failure⟩






theorem elements_implies_golden_validADAComplaint
    {d : Proving.USC.T42.ADA.Reslice.Elements.CoveredEntity} {p : Person}
    {a : Proving.USC.T42.ADA.Reslice.Elements.EmploymentAction}
    {acc : Proving.USC.T42.ADA.Reslice.Elements.Accommodation} {c : ComplaintText}
    (h : Proving.USC.T42.ADA.Reslice.Elements.Section12112 d p a c)
    (hAcc : Proving.USC.T42.ADA.Reslice.Elements.Discrimination12112b5A d p acc c) :
    Proving.ADA.ValidADAComplaint (mapPerson p) (mapEnt d) (mapText c) :=
  .viaTitle1FailureToAccommodate (mapAct a)
    (elements_implies_golden_title1FailureToAccommodate h hAcc)

end Proving.USC.T42.GoldenBridge.ADAReslice
