





import Proving.USC.T42.ADA.Ontology.Statute

namespace Proving.USC.T42.ADA.Ontology

open Proving.USC.Common


theorem disabilityMembershipActual_intro {i : Impairment} {a : MajorLifeActivity}
    {c : ComplaintText}
    (hImp : IsImpairment i c)
    (hMla : IsMajorLifeActivity a c)
    (hLim : SubstantiallyLimits i a c)
    : DisabilityMembershipActual i a c :=
  ⟨hImp, hMla, hLim⟩


theorem coveredEntityMembership_intro {ce : CoveredEntity} {c : ComplaintText}
    (hCov : IsCoveredEntity ce c)
    : CoveredEntityMembership ce c :=
  ⟨hCov⟩



theorem publicAccommodationMembership_intro {prv : PrivateEntity}
    {pa : PublicAccommodation} {c : ComplaintText}
    (hPrv : IsPrivateEntity prv c)
    (hPa : IsPublicAccommodation pa c)
    : PublicAccommodationMembership prv pa c :=
  ⟨hPrv, hPa⟩



theorem section12112TermsInhabited_intro {ce : CoveredEntity} {p : Person}
    {i : Impairment} {a : MajorLifeActivity} {c : ComplaintText}
    (hCe : IsCoveredEntity ce c)
    (hQi : IsQualifiedIndividual p c)
    (hDis : DisabilityMembershipActual i a c)
    : Section12112TermsInhabited ce p i a c :=
  ⟨hCe, hQi, hDis⟩



theorem section12132TermsInhabited_intro {pe : PublicEntity} {p : Person}
    {c : ComplaintText}
    (hPe : IsPublicEntity pe c)
    (hQid : IsQualifiedIndividualWithDisability p c)
    : Section12132TermsInhabited pe p c :=
  ⟨hPe, hQid⟩



theorem section12182TermsInhabited_intro {pa : PublicAccommodation}
    {prv : PrivateEntity} {i : Impairment} {a : MajorLifeActivity} {c : ComplaintText}
    (hPa : IsPublicAccommodation pa c)
    (hPrv : IsPrivateEntity prv c)
    (hDis : DisabilityMembershipActual i a c)
    : Section12182TermsInhabited pa prv i a c :=
  ⟨hPa, hPrv, hDis⟩

end Proving.USC.T42.ADA.Ontology
