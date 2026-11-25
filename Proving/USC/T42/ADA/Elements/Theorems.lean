






import Proving.USC.T42.ADA.Elements.Statute

namespace Proving.USC.T42.ADA.Elements

open Proving.USC.Common


theorem section12112_intro {p ce a c}
    (hDis : HasDisability p c) (hQual : IsQualifiedIndividualEmployment p c)
    (hCE : IsCoveredEntity ce c) (hAdv : AdverseEmploymentActionTaken a c)
    (hCaus : ActionOnBasisOfDisability p a c) (hNotThreat : ¬ PosesDirectThreat p c)
    : Section12112 p ce a c :=
  ⟨hDis, hQual, hCE, hAdv, hCaus, hNotThreat⟩


theorem section12112FailureToAccommodate_intro {p ce c}
    (hDis : HasDisability p c) (hQual : IsQualifiedIndividualEmployment p c)
    (hCE : IsCoveredEntity ce c) (hFail : FailedToReasonablyAccommodate ce p c)
    (hNotUH : ¬ AccommodationImposesUndueHardship ce c)
    (hNotThreat : ¬ PosesDirectThreat p c)
    : Section12112FailureToAccommodate p ce c :=
  ⟨hDis, hQual, hCE, hFail, hNotUH, hNotThreat⟩


theorem section12132_intro {p pe s c}
    (hPE : IsPublicEntity pe c) (hQual : IsQualifiedIndividualPublicService p c)
    (hExcl : ExcludedFromPublicService s c) (hCaus : ExclusionByReasonOfDisability p s c)
    (hNotThreat : ¬ PosesDirectThreat p c)
    : Section12132 p pe s c :=
  ⟨hPE, hQual, hExcl, hCaus, hNotThreat⟩


theorem section12182_intro {p pa a c}
    (hDis : HasDisability p c) (hPA : OperatesPublicAccommodation pa c)
    (hDenied : DeniedFullEqualEnjoyment a c) (hCaus : DenialOnBasisOfDisability p a c)
    (hNotThreat : ¬ PosesDirectThreat p c)
    : Section12182 p pa a c :=
  ⟨hDis, hPA, hDenied, hCaus, hNotThreat⟩


theorem section12203_intro {p c}
    (hProt : EngagedInProtectedActivityADA p c) (hRet : RetaliatoryActOccurredADA p c)
    (hCaus : RetaliationCausalNexus p c)
    : Section12203 p c :=
  ⟨hProt, hRet, hCaus⟩

end Proving.USC.T42.ADA.Elements
