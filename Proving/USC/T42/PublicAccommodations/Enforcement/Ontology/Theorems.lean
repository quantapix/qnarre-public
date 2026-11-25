





import Proving.USC.Common.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Ontology.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Ontology.Predicates
import Proving.USC.T42.PublicAccommodations.Enforcement.Ontology.Statute

namespace Proving.USC.T42.PublicAccommodations.Enforcement.Ontology

open Proving.USC.Common


theorem agCivilActionMembership_intro
    {act : AttorneyGeneralCivilAction} {p : PersonOrGroup} {x : PatternOrPractice}
    {r : SubchapterRight} {rel : PreventiveRelief} {c : ComplaintText}
    (hAction : IsAttorneyGeneralCivilAction act c)
    (hPerson : IsPersonOrGroup p c)
    (hPattern : IsPatternOrPractice x c)
    (hRight : IsSubchapterRight r c)
    (hRelief : IsPreventiveRelief rel c)
    : AGCivilActionMembership act p x r rel c :=
  ⟨hAction, hPerson, hPattern, hRight, hRelief⟩


theorem threeJudgeCourtMembership_intro
    {ct : ThreeJudgeCourt} {cert : GeneralPublicImportanceCertificate}
    {c : ComplaintText}
    (hCourt : IsThreeJudgeCourt ct c)
    (hCert : IsGeneralPublicImportanceCertificate cert c)
    : ThreeJudgeCourtMembership ct cert c :=
  ⟨hCourt, hCert⟩


theorem serviceConciliationMembership_intro
    {e : CommunityRelationsService} {rc : ReferredComplaint}
    {s : VoluntarySettlement} {c : ComplaintText}
    (hService : IsCommunityRelationsService e c)
    (hReferred : IsReferredComplaint rc c)
    (hSettlement : IsVoluntarySettlement s c)
    : ServiceConciliationMembership e rc s c :=
  ⟨hService, hReferred, hSettlement⟩

end Proving.USC.T42.PublicAccommodations.Enforcement.Ontology
