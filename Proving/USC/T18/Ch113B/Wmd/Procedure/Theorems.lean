









import Proving.USC.T18.Ch113B.Wmd.Procedure.Types
import Proving.USC.T18.Ch113B.Wmd.Procedure.Predicates
import Proving.USC.T18.Ch113B.Wmd.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Procedure

open Proving.USC.Common




theorem section2332aCommerceHook_intro {d : Person} {c : ComplaintText}
    (h : MailOrInterstateFacilityUsedInFurtherance d c) :
    Section2332aCommerceHook d c :=
  .mailOrFacility h


theorem section2332aCommerceHook_intro_propertyInCommerce
    {d : Person} {c : ComplaintText}
    (h : PropertyUsedInOrAffectingInterstateCommerce d c) :
    Section2332aCommerceHook d c :=
  .propertyInCommerce h


theorem section2332aCommerceHook_intro_perpetratorTravel
    {d : Person} {c : ComplaintText}
    (h : PerpetratorTraveledInInterstateCommerce d c) :
    Section2332aCommerceHook d c :=
  .perpetratorTravel h


theorem section2332aCommerceHook_intro_offenseAffectsCommerce
    {d : Person} {c : ComplaintText}
    (h : OffenseAffectedInterstateCommerce d c) :
    Section2332aCommerceHook d c :=
  .offenseAffectsCommerce h



theorem section2332aJurisdictionalBasis_intro {d : Person} {c : ComplaintText}
    (h : VictimIsUnitedStatesNationalAbroad d c) :
    Section2332aJurisdictionalBasis d c :=
  .nationalAbroad h


theorem section2332aJurisdictionalBasis_intro_withinUnitedStates
    {d : Person} {c : ComplaintText}
    (hTarget : TargetWithinUnitedStates d c)
    (hHook : Section2332aCommerceHook d c) :
    Section2332aJurisdictionalBasis d c :=
  .withinUnitedStates hTarget hHook


theorem section2332aJurisdictionalBasis_intro_unitedStatesProperty
    {d : Person} {c : ComplaintText}
    (h : TargetIsUnitedStatesOwnedOrUsedProperty d c) :
    Section2332aJurisdictionalBasis d c :=
  .unitedStatesProperty h


theorem section2332aJurisdictionalBasis_intro_foreignGovernmentProperty
    {d : Person} {c : ComplaintText}
    (h : TargetIsForeignGovernmentPropertyWithinUnitedStates d c) :
    Section2332aJurisdictionalBasis d c :=
  .foreignGovernmentProperty h


theorem section2332aNationalAbroadBasis_intro {d : Person} {c : ComplaintText}
    (hNational : DefendantIsNationalOfUnitedStates d c)
    (hAbroad : ConductOccurredOutsideUnitedStates d c) :
    Section2332aNationalAbroadBasis d c :=
  ⟨hNational, hAbroad⟩


theorem section2332aProsecutionBasis_intro {d : Person} {c : ComplaintText}
    (h : Section2332aJurisdictionalBasis d c) :
    Section2332aProsecutionBasis d c :=
  .subsectionA h


theorem section2332aProsecutionBasis_intro_subsectionB
    {d : Person} {c : ComplaintText}
    (h : Section2332aNationalAbroadBasis d c) :
    Section2332aProsecutionBasis d c :=
  .subsectionB h


theorem section2332aChargeable_intro {d : Person} {c : ComplaintText}
    (hAuthority : ActedWithoutLawfulAuthority d c)
    (hBasis : Section2332aProsecutionBasis d c) :
    Section2332aChargeable d c :=
  ⟨hAuthority, hBasis⟩


theorem section2332aCapitalExposure_intro {d : Person} {c : ComplaintText}
    (hChargeable : Section2332aChargeable d c)
    (hDeath : DeathResultedFromOffense d c) :
    Section2332aCapitalExposure d c :=
  ⟨hChargeable, hDeath⟩




theorem section2332bCircumstance_intro {d : Person} {c : ComplaintText}
    (h : MailOrInterstateFacilityUsedInFurtherance d c) :
    Section2332bCircumstance d c :=
  .mailOrFacility h


theorem section2332bCircumstance_intro_commerceObstruction
    {d : Person} {c : ComplaintText}
    (h : OffenseObstructedDelayedOrAffectedInterstateCommerce d c) :
    Section2332bCircumstance d c :=
  .commerceObstruction h


theorem section2332bCircumstance_intro_federalVictim
    {d : Person} {c : ComplaintText}
    (h : VictimIsUnitedStatesGovernmentOrFederalOfficial d c) :
    Section2332bCircumstance d c :=
  .federalVictim h


theorem section2332bCircumstance_intro_federalProperty
    {d : Person} {c : ComplaintText}
    (h : PropertyOwnedPossessedOrLeasedToUnitedStates d c) :
    Section2332bCircumstance d c :=
  .federalProperty h


theorem section2332bCircumstance_intro_territorialSea
    {d : Person} {c : ComplaintText}
    (h : OffenseCommittedInTerritorialSea d c) :
    Section2332bCircumstance d c :=
  .territorialSea h


theorem section2332bCircumstance_intro_specialMaritimeAndTerritorialJurisdiction
    {d : Person} {c : ComplaintText}
    (h : OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction d c) :
    Section2332bCircumstance d c :=
  .specialMaritimeAndTerritorialJurisdiction h


theorem section2332bOffenseConduct_intro {d : Person} {c : ComplaintText}
    (hTranscends : ConductTranscendedNationalBoundaries d c)
    (hCircumstance : Section2332bCircumstance d c)
    (hViolation : ConductViolatedStateOrFederalLaw d c) :
    Section2332bOffenseConduct d c :=
  ⟨hTranscends, hCircumstance, hViolation⟩


theorem section2332bJurisdictionOverDefendant_intro
    {d : Person} {c : ComplaintText}
    (hRole : DefendantIsPrincipalCoconspiratorOrAccessoryAfterTheFact d c)
    (hCircumstance : CircumstanceAppliesToAtLeastOneOffender d c) :
    Section2332bJurisdictionOverDefendant d c :=
  ⟨hRole, hCircumstance⟩


theorem section2332bExtraterritorialJurisdiction_intro
    {d : Person} {c : ComplaintText}
    (h : Section2332bOffenseConduct d c) :
    Section2332bExtraterritorialJurisdiction d c :=
  .offenseUnderSubsectionA h



theorem section2332bExtraterritorialJurisdiction_intro_accessoryAfterTheFact
    {d : Person} {c : ComplaintText}
    (h : ConductWasAccessoryAfterTheFactUnderSection3 d c) :
    Section2332bExtraterritorialJurisdiction d c :=
  .accessoryAfterTheFact h


theorem section2332bStateLawAdoption_intro {d : Person} {c : ComplaintText}
    (hBased : OffenseBasedOnAdoptionOfStateLaw d c)
    (hElementsOnly : OnlyStateLawElementsApplied d c) :
    Section2332bStateLawAdoption d c :=
  ⟨hBased, hElementsOnly⟩


theorem section2332bProsecutionBurden_intro
    {d : Person} {i : ChargingInstrument} {c : ComplaintText}
    (hAlleged : JurisdictionalBaseAllegedInIndictment i c)
    (hJurisdiction : Section2332bJurisdictionOverDefendant d c)
    (hConduct : Section2332bOffenseConduct d c) :
    Section2332bProsecutionBurden d i c :=
  ⟨hAlleged, hJurisdiction, hConduct⟩









theorem section2332bProsecutionBurden_knowledge_not_required
    {d : Person} {i : ChargingInstrument} {c : ComplaintText}
    (h : Section2332bProsecutionBurden d i c)
    (_hNoKnowledge : ¬ DefendantKnewJurisdictionalBase d c) :
    Section2332bProsecutionBurden d i c :=
  h


theorem section2332bConformingSentence_intro
    {d : Person} {i : ChargingInstrument} {c : ComplaintText}
    (hConvicted : Section2332bProsecutionBurden d i c)
    (hWithin : SentenceWithinStatutoryMaximum (convictedConductClass d c)
      (termOfImprisonmentYearsImposed d c))
    (hNoProbation : ¬ ProbationImposed d c)
    (hNotConcurrent : ¬ TermRunsConcurrentlyWithAnotherTerm d c) :
    Section2332bConformingSentence d i c :=
  ⟨hConvicted, hWithin, hNoProbation, hNotConcurrent⟩


theorem federalCrimeOfTerrorism_intro {d : Person} {c : ComplaintText}
    (hMotive : CalculatedToInfluenceGovernmentConduct d c)
    (hViolation : ViolatesEnumeratedTerrorismOffense d c) :
    FederalCrimeOfTerrorism d c :=
  ⟨hMotive, hViolation⟩


theorem attorneyGeneralPrimaryInvestigativeResponsibility_intro
    {d : Person} {c : ComplaintText}
    (h : FederalCrimeOfTerrorism d c) :
    AttorneyGeneralPrimaryInvestigativeResponsibility d c :=
  .federalCrimeOfTerrorism h


theorem attorneyGeneralPrimaryInvestigativeResponsibility_intro_enumeratedSection
    {d : Person} {c : ComplaintText}
    (h : ViolatesSection2332bEnumeratedInvestigativeOffense d c) :
    AttorneyGeneralPrimaryInvestigativeResponsibility d c :=
  .enumeratedSection h


theorem treasuryAssistanceDuty_intro {d : Person} {c : ComplaintText}
    (hResponsible : AttorneyGeneralPrimaryInvestigativeResponsibility d c)
    (hRequested : AttorneyGeneralRequestedTreasuryAssistance d c) :
    TreasuryAssistanceDuty d c :=
  ⟨hResponsible, hRequested⟩





theorem attorneyGeneralPrimacy_preserves_secretServiceAuthority
    {d : Person} {c : ComplaintText}
    (hAG : AttorneyGeneralPrimaryInvestigativeResponsibility d c)
    (hSS : SecretServiceAuthorityUnderSection3056Applies d c) :
    AttorneyGeneralPrimaryInvestigativeResponsibility d c ∧
      SecretServiceAuthorityUnderSection3056Applies d c :=
  ⟨hAG, hSS⟩





theorem section2332aChargeReachable_intro
    {d : Person} {i : ChargingInstrument} {c : ComplaintText}
    (hChargeable : Section2332aChargeable d c) :
    Section2332aChargeReachable d i c :=
  Reachable.step (t := stepChargeable2332a d c) .chargeable2332a
    Reachable.start hChargeable



theorem section2332bSentenceReachable_intro
    {d : Person} {i : ChargingInstrument} {c : ComplaintText}
    (hConduct : Section2332bOffenseConduct d c)
    (hResponsibility : AttorneyGeneralPrimaryInvestigativeResponsibility d c)
    (hJurisdiction : Section2332bJurisdictionOverDefendant d c)
    (hBurden : Section2332bProsecutionBurden d i c)
    (hSentence : Section2332bConformingSentence d i c) :
    Section2332bSentenceReachable d i c :=
  Reachable.step (t := stepSentencing2332b d i c) .sentencing2332b
    (Reachable.step (t := stepConviction2332b d i c) .conviction2332b
      (Reachable.step (t := stepCharge2332b d c) .charge2332b
        (Reachable.step (t := stepInvestigation2332b d c) .investigation2332b
          (Reachable.step (t := stepJurisdiction2332b d c) .jurisdiction2332b
            Reachable.start hConduct)
          hResponsibility)
        hJurisdiction)
      hBurden)
    hSentence




theorem section2332bCap_maiming_at_limit :
    SentenceWithinStatutoryMaximum .maiming 35 := by decide


theorem section2332bCap_maiming_over_limit :
    ¬ SentenceWithinStatutoryMaximum .maiming 36 := by decide



theorem section2332bCap_assault_over_limit :
    ¬ SentenceWithinStatutoryMaximum .assaultDangerousWeaponOrSeriousBodilyInjury 31 := by
  decide


theorem section2332bCap_destruction_over_limit :
    ¬ SentenceWithinStatutoryMaximum .destructionOfProperty 26 := by decide


theorem section2332bCap_threat_at_limit :
    SentenceWithinStatutoryMaximum .threat 10 := by decide



theorem section2332bCap_attempt_inherits :
    SentenceWithinStatutoryMaximum (.attemptOrConspiracy .maiming) 35 := by decide


theorem section2332bCap_attempt_over_limit :
    ¬ SentenceWithinStatutoryMaximum (.attemptOrConspiracy .threat) 11 := by decide



theorem section2332bCap_killing_unbounded (n : Nat) :
    SentenceWithinStatutoryMaximum .killingOrDeathResulting n := rfl


theorem section2332bCap_kidnapping_unbounded (n : Nat) :
    SentenceWithinStatutoryMaximum .kidnapping n := rfl

end Proving.USC.T18.Ch113B.Wmd.Procedure
