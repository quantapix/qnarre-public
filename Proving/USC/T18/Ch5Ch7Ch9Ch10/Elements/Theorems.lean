








import Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements.Statute

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements

open Proving.USC.Common


theorem section81_intro {p c}
    (hJur : WithinSpecialMaritimeTerritorialJurisdiction c)
    (hMens : ActedWillfullyAndMaliciously p c)
    (hBurn : SetFireToCoveredProperty p c) :
    Section81 p c :=
  ⟨hJur, hMens, hBurn⟩

theorem section81Aggravated_intro {p c}
    (hBase : Section81 p c)
    (hAgg : DwellingOrLifePlacedInJeopardy c) :
    Section81Aggravated p c :=
  ⟨hBase, hAgg⟩


theorem section111_intro {p c}
    (hConduct : ForciblyAssaultedOrImpededOfficer p c)
    (hVictim : VictimIsSection1114Officer c)
    (hDuties : ActedWhileOrOnAccountOfOfficialDuties c) :
    Section111 p c :=
  ⟨hConduct, hVictim, hDuties⟩


theorem section112_intro {p c}
    (hConduct : CommittedViolentAttackOnProtectedPerson p c)
    (hVictim : VictimIsProtectedForeignPerson c) :
    Section112 p c :=
  ⟨hConduct, hVictim⟩


theorem section113_intro {p c}
    (hJur : WithinSpecialMaritimeTerritorialJurisdiction c)
    (hAssault : CommittedAssault p c) :
    Section113 p c :=
  ⟨hJur, hAssault⟩


theorem section114_intro {p c}
    (hJur : WithinSpecialMaritimeTerritorialJurisdiction c)
    (hIntent : ActedWithIntentToMaim p c)
    (hAct : CommittedMaimingAct p c) :
    Section114 p c :=
  ⟨hJur, hIntent, hAct⟩


theorem section115_intro {p c}
    (hConduct : CommittedOrThreatenedViolenceAgainstTarget p c)
    (hVictim : VictimIsUnitedStatesOfficialOrFamilyMember c)
    (hIntent : ActedWithIntentToImpedeOrRetaliate p c) :
    Section115 p c :=
  ⟨hConduct, hVictim, hIntent⟩


theorem section116_intro {p c}
    (hSci : ActedWithScienter p c)
    (hConduct : PerformedFemaleGenitalMutilation p c)
    (hMinor : VictimIsUnderEighteen c)
    (hComm : AffectsInterstateOrForeignCommerce c)
    (hNoExc : NoLicensedMedicalOperationException c) :
    Section116 p c :=
  ⟨hSci, hConduct, hMinor, hComm, hNoExc⟩


theorem section117_intro {p c}
    (hJur : WithinSmtjOrIndianCountry c)
    (hAssault : CommittedDomesticAssault p c)
    (hRecid : HasTwoPriorQualifyingConvictions p c) :
    Section117 p c :=
  ⟨hJur, hAssault, hRecid⟩


theorem section118_intro {p c}
    (hSci : ActedWithScienter p c)
    (hConduct : ObstructedProtectiveFunctionAgent p c) :
    Section118 p c :=
  ⟨hSci, hConduct⟩


theorem section119_intro {p c}
    (hConduct : PubliclyReleasedRestrictedPersonalInfo p c)
    (hVictim : VictimIsCoveredPerson c)
    (hIntent : ActedWithIntentToThreatenOrIncite p c) :
    Section119 p c :=
  ⟨hConduct, hVictim, hIntent⟩


theorem section152_intro {p c}
    (hSci : ActedKnowinglyAndFraudulently p c)
    (hConduct : CommittedProhibitedBankruptcyAct p c)
    (hCase : InConnectionWithTitle11Case c) :
    Section152 p c :=
  ⟨hSci, hConduct, hCase⟩


theorem section153_intro {p c}
    (hFid : IsEstateFiduciaryWithAccess p c)
    (hSci : ActedKnowinglyAndFraudulently p c)
    (hConduct : EmbezzledEstateProperty p c) :
    Section153 p c :=
  ⟨hFid, hSci, hConduct⟩


theorem section154_intro {p c}
    (hOfficer : IsCourtOfficerOfEstate p c)
    (hSci : ActedWithScienter p c)
    (hConduct : CommittedAdverseInterestAct p c) :
    Section154 p c :=
  ⟨hOfficer, hSci, hConduct⟩


theorem section155_intro {p c}
    (hParty : IsPartyInInterest p c)
    (hSci : ActedKnowinglyAndFraudulently p c)
    (hConduct : EnteredFraudulentFeeAgreement p c)
    (hCase : InConnectionWithTitle11Case c) :
    Section155 p c :=
  ⟨hParty, hSci, hConduct, hCase⟩


theorem section156_intro {p c}
    (hPrep : IsBankruptcyPetitionPreparer p c)
    (hDisregard : DisregardedBankruptcyRequirements p c)
    (hDismiss : CaseDismissedForPreparerMisconduct c) :
    Section156 p c :=
  ⟨hPrep, hDisregard, hDismiss⟩


theorem section157_intro {p c}
    (hScheme : DevisedSchemeToDefraud p c)
    (hFurther : CommittedActInFurtheranceOfScheme p c) :
    Section157 p c :=
  ⟨hScheme, hFurther⟩


theorem section175_intro_forUseAsWeapon {p m c}
    (hSci : ActedWithScienter p c)
    (hAct : DevelopedBiologicalAgentForUseAsWeapon p m c) :
    Section175 p m c :=
  Section175.forUseAsWeapon hSci hAct

theorem section175_intro_unjustifiedPossession {p m c}
    (hSci : ActedWithScienter p c)
    (hAct : PossessedUnjustifiedBiologicalAgent p m c) :
    Section175 p m c :=
  Section175.unjustifiedPossession hSci hAct


theorem section175b_intro {p m c}
    (hRestricted : IsRestrictedPerson p c)
    (hSelect : IsSelectBiologicalAgent m c)
    (hSci : ActedWithScienter p c)
    (hConduct : ShippedOrPossessedSelectAgent p m c)
    (hComm : AffectsInterstateOrForeignCommerce c) :
    Section175b p m c :=
  ⟨hRestricted, hSelect, hSci, hConduct, hComm⟩


theorem section175c_intro {p c}
    (hSci : ActedWithScienter p c)
    (hConduct : HandledVariolaVirus p c)
    (hVariola : MaterialIsVariolaVirus c)
    (hNoHhs : NotAuthorizedBySecretaryHHS c)
    (hJur : FederalJurisdictionalNexus c) :
    Section175c p c :=
  ⟨hSci, hConduct, hVariola, hNoHhs, hJur⟩


theorem section176_intro {m c}
    (hForfeit : PropertySubjectToForfeiture m c)
    (hNoDef : NoPeacefulPurposeJustification m c) :
    Section176 m c :=
  ⟨hForfeit, hNoDef⟩


theorem section177_intro {m c}
    (hEnjoin : ConductSubjectToInjunction c)
    (hNoDef : NoPeacefulPurposeJustification m c) :
    Section177 m c :=
  ⟨hEnjoin, hNoDef⟩

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements
