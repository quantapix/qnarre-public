







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T08.Inadmissibility.Elements.Types
import Proving.USC.T08.Inadmissibility.Elements.Predicates
import Proving.USC.T08.Inadmissibility.Elements.Statute

namespace Proving.USC.T08.Inadmissibility.Elements

open Proving.USC.Common


theorem section1182a_intro {al : Alien} {c : ComplaintText}
    (hAlien : IsAlien al c) (hSeeks : SeeksVisaOrAdmission al c)
    (hGround : InadmissibilityGround al c) (hNoWaiver : ¬ ApplicableWaiverGranted al c) :
    Section1182a al c :=
  ⟨hAlien, hSeeks, hGround, hNoWaiver⟩


theorem knowingHire1324a_intro {p : Person} {al : Alien} {c : ComplaintText}
    (hCov : IsPersonOrEntity p c) (hAct : HiredRecruitedOrReferred p al c)
    (hInUS : ForEmploymentInUS p al c) (hUnauth : IsUnauthorizedAlien al c)
    (hKnow : ActedWithScienter p c) (hNoDef : ¬ GoodFaithVerificationDefense p c) :
    KnowingHire1324a p al c :=
  ⟨hCov, hAct, hInUS, hUnauth, hKnow, hNoDef⟩


theorem paperworkViolation1324a_intro {p : Person} {al : Alien} {c : ComplaintText}
    (hCov : IsPersonOrEntity p c) (hHire : HiredForEmployment p al c)
    (hNoComply : FailedToComplyWithVerification p c) :
    PaperworkViolation1324a p al c :=
  ⟨hCov, hHire, hNoComply⟩


theorem continuingEmployment1324a_intro {p : Person} {al : Alien} {c : ComplaintText}
    (hCov : IsPersonOrEntity p c) (hCont : ContinuedToEmploy p al c)
    (hUnauth : BecameUnauthorizedAlien al c) (hKnow : ActedWithScienter p c) :
    ContinuingEmployment1324a p al c :=
  ⟨hCov, hCont, hUnauth, hKnow⟩


theorem indemnityViolation1324a_intro {p : Person} {al : Alien} {c : ComplaintText}
    (hCov : IsPersonOrEntity p c) (hBond : RequiredIndemnityBond p al c) :
    IndemnityViolation1324a p al c :=
  ⟨hCov, hBond⟩

end Proving.USC.T08.Inadmissibility.Elements
