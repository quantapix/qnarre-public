







import Proving.USC.T18.Ch13.Elements.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Ch13.Elements

open Proving.USC.Common


theorem section241Conspiracy_intro {ag victim c}
    (hAgree : AgreementAmongTwoOrMore ag c)
    (hObject : ConspiracyToInjureOppressThreatenIntimidate ag c)
    (hVictim : IsPersonInUS victim c)
    (hRight : RightSecuredByConstitutionOrLaws c)
    (hAim : AimedAtFederalRightExercise c) :
    Section241Conspiracy ag victim c :=
  ⟨hAgree, hObject, hVictim, hRight, hAim⟩

theorem section241Disguise_intro {p victim c}
    (hDisguise : GoInDisguiseToHinderRight p c)
    (hRight : RightSecuredByConstitutionOrLaws c)
    (hVictim : IsPersonInUS victim c) :
    Section241Disguise p victim c :=
  ⟨hDisguise, hRight, hVictim⟩


theorem section242_intro {p victim c}
    (hColor : ActsUnderColorOfStateLaw p c)
    (hWillful : ActedWithScienter p c)
    (hVictim : IsPersonInUS victim c)
    (hWrong : Section242Wrong p victim c) :
    Section242 p victim c :=
  ⟨hColor, hWillful, hVictim, hWrong⟩


theorem section243_intro {p victim c}
    (hOfficer : IsOfficerChargedWithJurorSelection p c)
    (hExcl : ExcludesOrFailsToSummonCitizen p victim c)
    (hQual : CitizenPossessesJurorQualifications victim c)
    (hGround : OnProtectedGround victim c) :
    Section243 p victim c :=
  ⟨hOfficer, hExcl, hQual, hGround⟩


theorem section244_intro {p victim c}
    (hProp : IsProprietorOfPublicEntertainmentPlace p c)
    (hLocus : LocatedInFederalEnclaveJurisdiction c)
    (hDiscrim : CausesDiscriminationAgainstUniformedPerson p victim c)
    (hUniform : BecauseOfArmedForcesUniform c) :
    Section244 p victim c :=
  ⟨hProp, hLocus, hDiscrim, hUniform⟩


theorem section245_intro {p victim c}
    (hForce : ByForceOrThreatOfForce p c)
    (hAct : InjuresIntimidatesOrInterferes p victim c)
    (hWillful : ActedWithScienter p c)
    (hActivity : FederallyProtectedActivity c)
    (hCert : AttorneyGeneralCertification c)
    (hNotLEO : ¬ LawfullyActingLawEnforcementOfficer p c) :
    Section245 p victim c :=
  ⟨hForce, hAct, hWillful, hActivity, hCert, hNotLEO⟩


theorem section246_intro {p victim c}
    (hDeprive : DeprivesOfReliefBenefit p victim c)
    (hFunded : BenefitFundedByReliefAppropriation c)
    (hGround : OnProhibitedGround246 victim c) :
    Section246 p victim c :=
  ⟨hDeprive, hFunded, hGround⟩


theorem section247DamageReligiousCharacter_intro {p rp c}
    (hAct : IntentionallyDamagesReligiousProperty p rp c)
    (hMotive : BecauseOfReligiousCharacter rp c)
    (hCommerce : FederalJurisdictionalNexus c) :
    Section247DamageReligiousCharacter p rp c :=
  ⟨hAct, hMotive, hCommerce⟩

theorem section247Obstruction_intro {p victim c}
    (hAct : IntentionallyObstructsFreeExerciseByForce p victim c)
    (hCommerce : FederalJurisdictionalNexus c) :
    Section247Obstruction p victim c :=
  ⟨hAct, hCommerce⟩

theorem section247DamageRacial_intro {p rp c}
    (hAct : IntentionallyDamagesReligiousProperty p rp c)
    (hMotive : BecauseOfRaceColorEthnicityOfAssociated rp c) :
    Section247DamageRacial p rp c :=
  ⟨hAct, hMotive⟩


theorem section247WithinLimitations_intro {c} (n : Nat)
    (hCount : ChargeFiledYearsAfterOffense n c) (hle : n ≤ 7) :
    Section247WithinLimitations c :=
  ⟨n, hCount, hle⟩

theorem prosecutableSection247_intro {p rp victim c}
    (hOffense : Section247Offense p rp victim c)
    (hCert : AttorneyGeneralCertification c)
    (hTimely : Section247WithinLimitations c) :
    ProsecutableSection247 p rp victim c :=
  ⟨hOffense, hCert, hTimely⟩


theorem section248CivilClaim_intro {p victim c}
    (hConduct : ProhibitedConductSection248 p victim c)
    (hIntent : ActedWithScienter p c)
    (hStanding : IsPersonAggrievedByProhibitedConduct victim c)
    (hRight : HasPrivateRightOfAction victim c) :
    Section248CivilClaim p victim c :=
  ⟨hConduct, hIntent, hStanding, hRight⟩



theorem section249WithinLimitations_ofCount {c} (n : Nat)
    (hCount : ChargeFiledYearsAfterOffense n c) (hle : n ≤ 7) :
    Section249WithinLimitations c :=
  Or.inr ⟨n, hCount, hle⟩


theorem section249WithinLimitations_ofDeath {c}
    (hDeath : OffenseResultedInDeath c) :
    Section249WithinLimitations c :=
  Or.inl hDeath

theorem prosecutableSection249_intro {p victim c}
    (hOffense : Section249Offense p victim c)
    (hCert : AttorneyGeneralCertification c)
    (hTimely : Section249WithinLimitations c) :
    ProsecutableSection249 p victim c :=
  ⟨hOffense, hCert, hTimely⟩


theorem section250_intro {p c}
    (hPredicate : CommitsUnderlyingCivilRightsOffense p c)
    (hMisconduct : EngagesInSexualMisconductDuringOffense p c) :
    Section250 p c :=
  ⟨hPredicate, hMisconduct⟩

end Proving.USC.T18.Ch13.Elements
