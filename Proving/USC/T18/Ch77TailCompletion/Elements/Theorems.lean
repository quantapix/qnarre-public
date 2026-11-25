





import Proving.USC.T18.Ch77TailCompletion.Elements.Statute

namespace Proving.USC.T18.Ch77TailCompletion.Elements

open Proving.USC.Common


theorem section1583Kidnap_intro {p v c}
    (hConduct : KidnapsOrCarriesAway p v c) (hIntent : IntentToHoldOrSellAsSlave p c) :
    Section1583Kidnap p v c := ⟨hConduct, hIntent⟩

theorem section1583Entice_intro {p v c}
    (hConduct : EnticesToVesselOrPlace p v c)
    (hIntent : IntentToMakeHeldOrSentAbroadAsSlave p c) :
    Section1583Entice p v c := ⟨hConduct, hIntent⟩


theorem section1584_intro {p v c}
    (hScienter : ActedWithScienter p c) (hAct : Section1584Act p v c) :
    Section1584 p v c := ⟨hScienter, hAct⟩


theorem section1593Restitution_intro {d v c}
    (hOffense : OffenseUnderChapter d c) (hVictim : IsChapterVictim v c)
    (hLosses : LossesAttributableToOffense v c) :
    Section1593Restitution d v c := ⟨hOffense, hVictim, hLosses⟩


theorem section1593A_intro {p e c}
    (hBenefits : KnowinglyBenefitsFromVenture p c) (hVenture : VentureViolatedChapter e c)
    (hScienter : KnewOrRecklessDisregardOfVentureViolation p c) :
    Section1593A p e c := ⟨hBenefits, hVenture, hScienter⟩


theorem section1594Attempt_intro {p c}
    (hIntent : IntentToCommitChapterOffense p c) (hStep : SubstantialStepTaken p c)
    (hTarget : TargetsCoveredChapterOffense c) :
    Section1594Attempt p c := ⟨hIntent, hStep, hTarget⟩

theorem section1594Conspiracy_intro {p ag c}
    (hAgreement : AgreementAmongTwoOrMore ag c) (hIntent : IntentToCommitChapterOffense p c)
    (hTarget : TargetsCoveredChapterOffense c) :
    Section1594Conspiracy p ag c := ⟨hAgreement, hIntent, hTarget⟩


theorem chapter77CivilStanding_intro {v c}
    (hVictim : IsChapterVictim v c) (hInjury : InjuredByViolation v c)
    (hCausation : ProximateCause v c) (hLimitations : WithinLimitationsPeriod1595 v c)
    (hFederal : FederalJurisdictionalNexus c) :
    Chapter77CivilStanding v c := ⟨hVictim, hInjury, hCausation, hLimitations, hFederal⟩

theorem section1595Beneficiary_intro {p e c}
    (hBenefits : KnowinglyBenefitsFromVenture p c) (hVenture : VentureViolatedChapter e c)
    (hScienter : KnewOrShouldHaveKnownOfViolation p c) :
    Section1595Beneficiary p e c := ⟨hBenefits, hVenture, hScienter⟩

theorem validChapter77CivilClaim_intro {v p e c}
    (hStanding : Chapter77CivilStanding v c) (hLiability : Section1595Liability p e c) :
    ValidChapter77CivilClaim v p e c := ⟨hStanding, hLiability⟩

theorem section1595dParensPatriae_intro {p c}
    (hStateAG : IsStateAttorneyGeneral p c) (hBelief : ReasonToBelieveResidentsAffected p c)
    (hTarget : TargetsSection1591Violation c) (hFederal : FederalJurisdictionalNexus c) :
    Section1595dParensPatriae p c := ⟨hStateAG, hBelief, hTarget, hFederal⟩


theorem section1595AInjunction_intro {p c}
    (hAG : IsAttorneyGeneral p c) (hConduct : PersonEngagedOrAboutToEngageInViolation p c)
    (hCovered : ConductConstitutesCoveredViolation c)
    (hInjury : ThreatenedContinuingOrSubstantialInjury c) :
    Section1595AInjunction p c := ⟨hAG, hConduct, hCovered, hInjury⟩


theorem section1596Jurisdiction_intro {p c}
    (hOffense : IsCoveredTraffickingOffense c) (hNexus : Section1596Nexus p c)
    (hNotBarred : ¬ ForeignProsecutionBarApplies p c) :
    Section1596Jurisdiction p c := ⟨hOffense, hNexus, hNotBarred⟩


theorem section1597_intro {p doc c}
    (hScienter : ActedWithScienter p c) (hConduct : TampersWithImmigrationDocument p doc c)
    (hObject : IsAnothersImmigrationDocument doc c) (hPurpose : Section1597Purpose p c) :
    Section1597 p doc c := ⟨hScienter, hConduct, hObject, hPurpose⟩

end Proving.USC.T18.Ch77TailCompletion.Elements
