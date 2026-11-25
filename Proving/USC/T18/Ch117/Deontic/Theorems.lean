import Proving.USC.T18.Ch117.Deontic.Types
import Proving.USC.T18.Ch117.Deontic.Predicates
import Proving.USC.T18.Ch117.Deontic.Statute
import Proving.USC.Common.Types










namespace Proving.USC.T18.Ch117.Deontic

open Proving.USC.Common



theorem prohibition2421a_violated_intro {p c}
    (hAddr : IsAnyPerson p c) (hNexus : InInterstateOrForeignCommerce p c)
    (hIntent : IntentProstitutionOrChargeableActivity p c)
    (hAct : KnowinglyTransportsForVice2421a p c) :
    ProhibitionViolated2421a p c :=
  ⟨⟨hAddr, hNexus, hIntent⟩, hAct⟩

theorem prohibition2422a_violated_intro {p c}
    (hAddr : IsAnyPerson p c) (hNexus : InInterstateOrForeignCommerce p c)
    (hIntent : IntentProstitutionOrChargeableActivity p c)
    (hAct : KnowinglyEnticesTravelForVice2422a p c) :
    ProhibitionViolated2422a p c :=
  ⟨⟨hAddr, hNexus, hIntent⟩, hAct⟩

theorem prohibition2422b_violated_intro {p c}
    (hAddr : IsAnyPerson p c) (hNexus : InInterstateOrForeignCommerce p c)
    (hMinor : IndividualIsMinor c)
    (hIntent : IntentProstitutionOrChargeableActivity p c)
    (hAct : KnowinglyEnticesMinorForVice2422b p c) :
    ProhibitionViolated2422b p c :=
  ⟨⟨hAddr, hNexus, hMinor, hIntent⟩, hAct⟩

theorem prohibition2423a_violated_intro {p c}
    (hAddr : IsAnyPerson p c) (hNexus : InInterstateOrForeignCommerce p c)
    (hMinor : IndividualIsMinor c)
    (hIntent : IntentProstitutionOrChargeableActivity p c)
    (hAct : KnowinglyTransportsMinorForVice2423a p c) :
    ProhibitionViolated2423a p c :=
  ⟨⟨hAddr, hNexus, hMinor, hIntent⟩, hAct⟩

theorem prohibition2423b_violated_intro {p c}
    (hAddr : IsAnyPerson p c) (hNexus : InInterstateOrForeignCommerce p c)
    (hIntent : IntentIllicitSexualConduct p c)
    (hAct : TravelsWithIllicitSexualIntent2423b p c) :
    ProhibitionViolated2423b p c :=
  ⟨⟨hAddr, hNexus, hIntent⟩, hAct⟩

theorem prohibition2423c_violated_intro {p c}
    (hAddr : IsUSCitizenOrLPR p c) (hAbroad : TraveledOrResidesAbroad p c)
    (hAct : EngagesInIllicitSexualConduct2423c p c) :
    ProhibitionViolated2423c p c :=
  ⟨⟨hAddr, hAbroad⟩, hAct⟩

theorem prohibition2423d_violated_intro {p c}
    (hAddr : IsUSCitizenOrLPR p c) (hOrg : ActsThroughCommerceAffectingOrg p c)
    (hIntent : IntentIllicitSexualConduct p c)
    (hAct : CommitsIllicitConductThroughOrg2423d p c) :
    ProhibitionViolated2423d p c :=
  ⟨⟨hAddr, hOrg, hIntent⟩, hAct⟩

theorem prohibition2423e_violated_intro {p c}
    (hAddr : IsAnyPerson p c) (hNexus : InInterstateOrForeignCommerce p c)
    (hGain : ForCommercialAdvantageOrGain p c)
    (hKnow : KnowsTravelerIllicitIntent p c)
    (hAct : FacilitatesViceTravel2423e p c) :
    ProhibitionViolated2423e p c :=
  ⟨⟨hAddr, hNexus, hGain, hKnow⟩, hAct⟩

theorem prohibition2423f_violated_intro {p c}
    (hAddr : IsAnyPerson p c) (hTarget : TargetsChapter117Offense c)
    (hAct : AttemptsOrConspiresChapter117_2423f p c) :
    ProhibitionViolated2423f p c :=
  ⟨⟨hAddr, hTarget⟩, hAct⟩

theorem prohibition2424aFalse_violated_intro {p c}
    (hAddr : IsHarborerOfAlienForProstitution p c) (hFiling : StatementBeingFiled p c)
    (hAct : KnowinglyFalsifiesAlienStatement2424aFalse p c) :
    ProhibitionViolated2424aFalse p c :=
  ⟨⟨hAddr, hFiling⟩, hAct⟩



theorem obligation2424aFile_breached_intro {p c}
    (hAddr : IsHarborerOfAlienForProstitution p c)
    (hCommenced : HarboringAlienForProstitutionCommenced p c)
    (hFail : ¬ FilesAlienStatement2424aFile p c) :
    ObligationBreached2424aFile p c :=
  ⟨⟨hAddr, hCommenced⟩, hFail⟩

theorem obligation2421b1_breached_intro {p c}
    (hAddr : IsAttorneyGeneral p c) (hReq : StateAGRequestedCrossDesignation c)
    (hNotUndermine : GrantWouldNotUndermineJustice c)
    (hFail : ¬ GrantsCrossDesignation2421b1 p c) :
    ObligationBreached2421b1 p c :=
  ⟨⟨hAddr, hReq, hNotUndermine⟩, hFail⟩

theorem obligation2421b2_breached_intro {p c}
    (hAddr : IsAttorneyGeneral p c) (hDenied : RequestWasDenied c)
    (hFail : ¬ SubmitsDenialReasonTimely2421b2 p c) :
    ObligationBreached2421b2 p c :=
  ⟨⟨hAddr, hDenied⟩, hFail⟩

end Proving.USC.T18.Ch117.Deontic
