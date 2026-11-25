import Proving.USC.T18.Ch113B.Elements.Types
import Proving.USC.T18.Ch113B.Elements.Predicates
import Proving.USC.T18.Ch113B.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false












open Proving.USC.Common

namespace Proving.USC.T18.Ch113B.Elements



theorem internationalTerrorism2331_intro {a : TerroristAct} {c : ComplaintText}
    (hConduct : ViolentOrDangerousAct2331 a c) (hCriminal : CriminalLawViolation2331 a c)
    (hPurpose : TerroristPurpose2331 a c) (hLocus : InternationalLocus2331 a c) :
    InternationalTerrorism2331 a c :=
  ⟨hConduct, hCriminal, hPurpose, hLocus⟩

theorem domesticTerrorism2331_intro {a : TerroristAct} {c : ComplaintText}
    (hConduct : InvolvesActsDangerousToHumanLife a c)
    (hCriminal : ViolatesCriminalLawsOfUnitedStatesOrState a c)
    (hPurpose : TerroristPurpose2331 a c)
    (hLocus : OccursPrimarilyWithinUnitedStates a c) :
    DomesticTerrorism2331 a c :=
  ⟨hConduct, hCriminal, hPurpose, hLocus⟩



theorem section2332Certification_intro {p : Person} {c : ComplaintText}
    (hWritten : AttorneyGeneralWrittenCertificationFiled p c)
    (hJudgment : CertifiedOffenseIntendedToCoerceIntimidateOrRetaliate p c) :
    Section2332Certification p c :=
  ⟨hWritten, hJudgment⟩

theorem section2332Killing_intro {p v : Person} {c : ComplaintText}
    (hNational : IsNationalOfUnitedStates v c) (hKills : CausesDeathOfNational p v c)
    (hAbroad : VictimOutsideUnitedStatesAtTime v c) (hGrade : KillingGrade2332 p v c)
    (hCert : Section2332Certification p c) :
    Section2332Killing p v c :=
  ⟨hNational, hKills, hAbroad, hGrade, hCert⟩

theorem section2332Attempt_intro {p v : Person} {c : ComplaintText}
    (hAbroad : DefendantOutsideUnitedStates p c) (hNational : IsNationalOfUnitedStates v c)
    (hAttempt : AttemptsToKillNational p v c) (hMurder : KillingIsMurder p v c)
    (hCert : Section2332Certification p c) :
    Section2332Attempt p v c :=
  ⟨hAbroad, hNational, hAttempt, hMurder, hCert⟩

theorem section2332Conspiracy_intro {p v : Person} {ag : Agreement} {c : ComplaintText}
    (hAbroad : DefendantOutsideUnitedStates p c) (hNational : IsNationalOfUnitedStates v c)
    (hAgree : AgreementAmongTwoOrMore ag c) (hMurder : KillingIsMurder p v c)
    (hOvert : CommitsOvertActInFurtheranceOfConspiracy p ag c)
    (hCert : Section2332Certification p c) :
    Section2332Conspiracy p v ag c :=
  ⟨hAbroad, hNational, hAgree, hMurder, hOvert, hCert⟩

theorem section2332Violence_intro {p v : Person} {c : ComplaintText}
    (hAbroad : DefendantOutsideUnitedStates p c) (hViolence : EngagesInPhysicalViolence p c)
    (hNational : IsNationalOfUnitedStates v c) (hInjury : SeriousInjuryRoute2332 p v c)
    (hCert : Section2332Certification p c) :
    Section2332Violence p v c :=
  ⟨hAbroad, hViolence, hNational, hInjury, hCert⟩

theorem section2332Violation_killing_intro {p v : Person} {ag : Agreement} {c : ComplaintText}
    (h : Section2332Killing p v c) : Section2332Violation p v ag c := .killing h

theorem section2332Violation_attempt_intro {p v : Person} {ag : Agreement} {c : ComplaintText}
    (h : Section2332Attempt p v c) : Section2332Violation p v ag c := .attempt h

theorem section2332Violation_conspiracy_intro {p v : Person} {ag : Agreement} {c : ComplaintText}
    (h : Section2332Conspiracy p v ag c) : Section2332Violation p v ag c := .conspiracy h

theorem section2332Violation_violence_intro {p v : Person} {ag : Agreement} {c : ComplaintText}
    (h : Section2332Violence p v c) : Section2332Violation p v ag c := .violence h



theorem section2332aAgainstNationalAbroad_intro {p v : Person} {w : Weapon} {ag : Agreement}
    {c : ComplaintText}
    (hNoAuth : ActsWithoutLawfulAuthority p c) (hWmd : IsWeaponOfMassDestruction w c)
    (hConduct : ProhibitedWeaponUse2332a p w ag c) (hNational : IsNationalOfUnitedStates v c)
    (hTarget : DirectedAtNationalOutsideUnitedStates v c) :
    Section2332aAgainstNationalAbroad p v w ag c :=
  ⟨hNoAuth, hWmd, hConduct, hNational, hTarget⟩

theorem section2332aWithinUnitedStates_intro {p : Person} {w : Weapon} {t : Target}
    {ag : Agreement} {c : ComplaintText}
    (hNoAuth : ActsWithoutLawfulAuthority p c) (hWmd : IsWeaponOfMassDestruction w c)
    (hConduct : ProhibitedWeaponUse2332a p w ag c)
    (hTarget : DirectedAtPersonOrPropertyWithinUnitedStates t c)
    (hCommerce : InterstateCircumstance2332a p t c) :
    Section2332aWithinUnitedStates p w t ag c :=
  ⟨hNoAuth, hWmd, hConduct, hTarget, hCommerce⟩

theorem section2332aAgainstUnitedStatesProperty_intro {p : Person} {w : Weapon} {t : Target}
    {ag : Agreement} {c : ComplaintText}
    (hNoAuth : ActsWithoutLawfulAuthority p c) (hWmd : IsWeaponOfMassDestruction w c)
    (hConduct : ProhibitedWeaponUse2332a p w ag c) (hTarget : DirectedAtUnitedStatesProperty t c) :
    Section2332aAgainstUnitedStatesProperty p w t ag c :=
  ⟨hNoAuth, hWmd, hConduct, hTarget⟩

theorem section2332aAgainstForeignGovernmentProperty_intro {p : Person} {w : Weapon} {t : Target}
    {ag : Agreement} {c : ComplaintText}
    (hNoAuth : ActsWithoutLawfulAuthority p c) (hWmd : IsWeaponOfMassDestruction w c)
    (hConduct : ProhibitedWeaponUse2332a p w ag c)
    (hTarget : DirectedAtForeignGovernmentPropertyWithinUnitedStates t c) :
    Section2332aAgainstForeignGovernmentProperty p w t ag c :=
  ⟨hNoAuth, hWmd, hConduct, hTarget⟩

theorem section2332aByNationalAbroad_intro {p : Person} {w : Weapon} {ag : Agreement}
    {c : ComplaintText}
    (hNational : IsNationalOfUnitedStates p c) (hNoAuth : ActsWithoutLawfulAuthority p c)
    (hWmd : IsWeaponOfMassDestruction w c) (hConduct : ProhibitedWeaponUse2332a p w ag c)
    (hAbroad : ConductOccursOutsideUnitedStates c) :
    Section2332aByNationalAbroad p w ag c :=
  ⟨hNational, hNoAuth, hWmd, hConduct, hAbroad⟩

theorem section2332aViolation_nationalAbroad_intro {p v : Person} {w : Weapon} {t : Target}
    {ag : Agreement} {c : ComplaintText} (h : Section2332aAgainstNationalAbroad p v w ag c) :
    Section2332aViolation p v w t ag c := .nationalAbroad h

theorem section2332aViolation_withinUnitedStates_intro {p v : Person} {w : Weapon} {t : Target}
    {ag : Agreement} {c : ComplaintText} (h : Section2332aWithinUnitedStates p w t ag c) :
    Section2332aViolation p v w t ag c := .withinUnitedStates h

theorem section2332aViolation_unitedStatesProperty_intro {p v : Person} {w : Weapon} {t : Target}
    {ag : Agreement} {c : ComplaintText} (h : Section2332aAgainstUnitedStatesProperty p w t ag c) :
    Section2332aViolation p v w t ag c := .unitedStatesProperty h

theorem section2332aViolation_foreignGovernmentProperty_intro {p v : Person} {w : Weapon}
    {t : Target} {ag : Agreement} {c : ComplaintText}
    (h : Section2332aAgainstForeignGovernmentProperty p w t ag c) :
    Section2332aViolation p v w t ag c := .foreignGovernmentProperty h

theorem section2332aViolation_byNationalAbroad_intro {p v : Person} {w : Weapon} {t : Target}
    {ag : Agreement} {c : ComplaintText} (h : Section2332aByNationalAbroad p w ag c) :
    Section2332aViolation p v w t ag c := .byNationalAbroad h

theorem section2332aDeathResults_intro {p v : Person} {w : Weapon} {t : Target} {ag : Agreement}
    {c : ComplaintText} (hViolation : Section2332aViolation p v w t ag c)
    (hDeath : DeathResultsFromOffense c) :
    Section2332aDeathResults p v w t ag c :=
  ⟨hViolation, hDeath⟩



theorem propertyPredicateAct2332b_intro {p : Person} {t : Target} {c : ComplaintText}
    (hDestruction : PropertyDestruction2332b p t c)
    (hRisk : CreatesSubstantialRiskOfSeriousBodilyInjury p c) :
    PropertyPredicateAct2332b p t c :=
  ⟨hDestruction, hRisk⟩

theorem section2332bOffense_intro {p v : Person} {t : Target} {c : ComplaintText}
    (hTranscends : ConductTranscendsNationalBoundaries c) (hAct : PredicateAct2332b p v t c)
    (hUnlawful : InViolationOfStateOrFederalLaw c)
    (hCircumstance : JurisdictionalCircumstance2332b p v t c) :
    Section2332bOffense p v t c :=
  ⟨hTranscends, hAct, hUnlawful, hCircumstance⟩

theorem section2332bInchoateOffense_intro {p v : Person} {t : Target} {ag : Agreement}
    {c : ComplaintText}
    (hTranscends : ConductTranscendsNationalBoundaries c) (hInchoate : Inchoate2332b p ag c)
    (hUnlawful : InViolationOfStateOrFederalLaw c)
    (hCircumstance : JurisdictionalCircumstance2332b p v t c) :
    Section2332bInchoateOffense p v t ag c :=
  ⟨hTranscends, hInchoate, hUnlawful, hCircumstance⟩

theorem section2332bViolation_completed_intro {p v : Person} {t : Target} {ag : Agreement}
    {c : ComplaintText} (h : Section2332bOffense p v t c) :
    Section2332bViolation p v t ag c := .completed h

theorem section2332bViolation_inchoate_intro {p v : Person} {t : Target} {ag : Agreement}
    {c : ComplaintText} (h : Section2332bInchoateOffense p v t ag c) :
    Section2332bViolation p v t ag c := .inchoate h

theorem section2332bDerivativeJurisdiction_intro {p : Person} {c : ComplaintText}
    (hRole : IsPrincipalCoConspiratorOrAccessory p c)
    (hCircumstance : CircumstanceAppliesToAtLeastOneOffender c) :
    Section2332bDerivativeJurisdiction p c :=
  ⟨hRole, hCircumstance⟩

theorem section2332bDeathResults_intro {p v : Person} {t : Target} {ag : Agreement}
    {c : ComplaintText} (hViolation : Section2332bViolation p v t ag c)
    (hDeath : DeathResultsFromOffense c) :
    Section2332bDeathResults p v t ag c :=
  ⟨hViolation, hDeath⟩

theorem federalCrimeOfTerrorism2332b_intro {a : TerroristAct} {c : ComplaintText}
    (hCalculated : CalculatedToInfluenceGovernmentOrRetaliate a c)
    (hEnumerated : ViolatesEnumeratedTerrorismOffense a c) :
    FederalCrimeOfTerrorism2332b a c :=
  ⟨hCalculated, hEnumerated⟩



theorem section2332dFinancialTransaction_intro {p : Person} {ctry : Country} {tx : Transaction}
    {c : ComplaintText}
    (hUsPerson : IsUnitedStatesPerson p c)
    (hDesignated : CountryDesignatedAsSupportingInternationalTerrorism ctry c)
    (hScienter : KnowsOrHasReasonableCauseToKnowCountryDesignated p ctry c)
    (hFinancial : IsFinancialTransaction tx c)
    (hConduct : EngagesInFinancialTransactionWithGovernmentOfCountry p ctry tx c)
    (hNotExempt : ¬ ExemptedByTreasuryRegulation p tx c) :
    Section2332dFinancialTransaction p ctry tx c :=
  ⟨hUsPerson, hDesignated, hScienter, hFinancial, hConduct, hNotExempt⟩



theorem section2332eAssistanceRequest_intro {rq : AssistanceRequest} {c : ComplaintText}
    (hRequester : RequestMadeByAttorneyGeneralOrAuthorizedDelegate rq c)
    (hPurpose : RequestSupportsEnforcementOfSection2332a rq c)
    (hEmergency : EmergencySituationInvolvingWeaponOfMassDestruction rq c) :
    Section2332eAssistanceRequest rq c :=
  ⟨hRequester, hPurpose, hEmergency⟩



theorem extensiveDestructionIntent2332f_intro {p : Person} {t : Target} {c : ComplaintText}
    (hIntent : IntendsExtensiveDestructionOfPlaceFacilityOrSystem p t c)
    (hLoss : DestructionLikelyToResultInMajorEconomicLoss t c) :
    ExtensiveDestructionIntent2332f p t c :=
  ⟨hIntent, hLoss⟩

theorem domesticJurisdiction2332f_intro {p v : Person} {t : Target} {c : ComplaintText}
    (hLocus : OffenseTakesPlaceInUnitedStates c) (hRoute : DomesticRoute2332f p v t c) :
    DomesticJurisdiction2332f p v t c :=
  ⟨hLocus, hRoute⟩

theorem foreignJurisdiction2332f_intro {p v : Person} {t : Target} {c : ComplaintText}
    (hLocus : OffenseTakesPlaceOutsideUnitedStates c) (hRoute : ForeignRoute2332f p v t c) :
    ForeignJurisdiction2332f p v t c :=
  ⟨hLocus, hRoute⟩

theorem notExcluded2332f_intro {c : ComplaintText}
    (hArmedForces : ¬ ActivitiesOfArmedForcesDuringArmedConflict c)
    (hMilitaryDuty : ¬ ActivitiesOfMilitaryForcesInOfficialDuties c)
    (hDomestic : ¬ PurelyDomesticOffenseWithoutSubstantialCommerceEffect c) :
    NotExcluded2332f c :=
  ⟨hArmedForces, hMilitaryDuty, hDomestic⟩

theorem section2332fBombing_intro {p v : Person} {w : Weapon} {t : Target} {c : ComplaintText}
    (hConduct : UnlawfullyDeliversPlacesDischargesOrDetonatesDevice p w t c)
    (hDevice : IsExplosiveOrOtherLethalDevice w c) (hTarget : IsCoveredBombingTarget t c)
    (hIntent : BombingIntent2332f p t c) (hJurisdiction : Jurisdiction2332f p v t c)
    (hNotExcluded : NotExcluded2332f c) :
    Section2332fBombing p v w t c :=
  ⟨hConduct, hDevice, hTarget, hIntent, hJurisdiction, hNotExcluded⟩

theorem section2332fInchoateBombing_intro {p v : Person} {w : Weapon} {t : Target}
    {ag : Agreement} {c : ComplaintText}
    (hInchoate : Inchoate2332f p ag c) (hDevice : IsExplosiveOrOtherLethalDevice w c)
    (hTarget : IsCoveredBombingTarget t c) (hIntent : BombingIntent2332f p t c)
    (hJurisdiction : Jurisdiction2332f p v t c) (hNotExcluded : NotExcluded2332f c) :
    Section2332fInchoateBombing p v w t ag c :=
  ⟨hInchoate, hDevice, hTarget, hIntent, hJurisdiction, hNotExcluded⟩

theorem section2332fViolation_completed_intro {p v : Person} {w : Weapon} {t : Target}
    {ag : Agreement} {c : ComplaintText} (h : Section2332fBombing p v w t c) :
    Section2332fViolation p v w t ag c := .completed h

theorem section2332fViolation_inchoate_intro {p v : Person} {w : Weapon} {t : Target}
    {ag : Agreement} {c : ComplaintText} (h : Section2332fInchoateBombing p v w t ag c) :
    Section2332fViolation p v w t ag c := .inchoate h



theorem section2332gMissileOffense_intro {p v : Person} {w : Weapon} {t : Target}
    {c : ComplaintText}
    (hScienter : ActedWithScienter p c)
    (hConduct : ProducesAcquiresTransfersPossessesOrUsesItem p w c)
    (hItem : CoveredMissileSystem2332g w c)
    (hNotAuthority : ¬ ConductUnderUnitedStatesOrStateAuthority p c)
    (hNotContract : ¬ ConductPursuantToUnitedStatesOrStateContract p c)
    (hJurisdiction : Jurisdiction2332gh p v t c) :
    Section2332gMissileOffense p v w t c :=
  ⟨hScienter, hConduct, hItem, hNotAuthority, hNotContract, hJurisdiction⟩

theorem section2332gAggravatedUse_intro {p v : Person} {w : Weapon} {t : Target}
    {c : ComplaintText} (hViolation : Section2332gMissileOffense p v w t c)
    (hUse : UsesOrThreatensToUseItemInCourseOfViolation p w c) :
    Section2332gAggravatedUse p v w t c :=
  ⟨hViolation, hUse⟩

theorem section2332gDeathResults_intro {p v : Person} {w : Weapon} {t : Target}
    {c : ComplaintText} (hViolation : Section2332gMissileOffense p v w t c)
    (hDeath : DeathResultsFromOffense c) :
    Section2332gDeathResults p v w t c :=
  ⟨hViolation, hDeath⟩

theorem section2332hRadiologicalOffense_intro {p v : Person} {w : Weapon} {t : Target}
    {c : ComplaintText}
    (hScienter : ActedWithScienter p c)
    (hConduct : ProducesAcquiresTransfersPossessesOrUsesItem p w c)
    (hItem : RadiologicalDispersalDevice2332h w c)
    (hNotAuthority : ¬ ConductUnderUnitedStatesAuthority p c)
    (hNotContract : ¬ ConductPursuantToUnitedStatesContract p c)
    (hJurisdiction : Jurisdiction2332gh p v t c) :
    Section2332hRadiologicalOffense p v w t c :=
  ⟨hScienter, hConduct, hItem, hNotAuthority, hNotContract, hJurisdiction⟩

theorem section2332hAggravatedUse_intro {p v : Person} {w : Weapon} {t : Target}
    {c : ComplaintText} (hViolation : Section2332hRadiologicalOffense p v w t c)
    (hUse : UsesOrThreatensToUseItemInCourseOfViolation p w c) :
    Section2332hAggravatedUse p v w t c :=
  ⟨hViolation, hUse⟩

theorem section2332hDeathResults_intro {p v : Person} {w : Weapon} {t : Target}
    {c : ComplaintText} (hViolation : Section2332hRadiologicalOffense p v w t c)
    (hDeath : DeathResultsFromOffense c) :
    Section2332hDeathResults p v w t c :=
  ⟨hViolation, hDeath⟩



theorem possessionRoute2332i_intro {p : Person} {w : Weapon} {c : ComplaintText}
    (hConduct : PossessesRadioactiveMaterialOrMakesOrPossessesDevice p w c)
    (hIntent : PossessionIntent2332i p c) :
    PossessionRoute2332i p w c :=
  ⟨hConduct, hIntent⟩

theorem useRoute2332i_intro {p : Person} {w : Weapon} {t : Target} {c : ComplaintText}
    (hConduct : UseConduct2332i p w t c) (hIntent : UseIntent2332i p c) :
    UseRoute2332i p w t c :=
  ⟨hConduct, hIntent⟩

theorem outsideByOffender2332i_intro {p : Person} {c : ComplaintText}
    (hLocus : OffenseTakesPlaceOutsideUnitedStates c) (hRoute : OutsideRoute2332i p c) :
    OutsideByOffender2332i p c :=
  ⟨hLocus, hRoute⟩

theorem outsideAgainstUnitedStates2332i_intro {v : Person} {t : Target} {c : ComplaintText}
    (hLocus : OffenseTakesPlaceOutsideUnitedStates c) (hNexus : UnitedStatesNexus2332i v t c) :
    OutsideAgainstUnitedStates2332i v t c :=
  ⟨hLocus, hNexus⟩

theorem notExcluded2332i_intro {c : ComplaintText}
    (hArmedForces : ¬ ActivitiesOfArmedForcesDuringArmedConflict c)
    (hMilitaryDuty : ¬ ActivitiesOfMilitaryForcesInOfficialDuties c) :
    NotExcluded2332i c :=
  ⟨hArmedForces, hMilitaryDuty⟩

theorem section2332iNuclearOffense_intro {p v : Person} {w : Weapon} {t : Target}
    {c : ComplaintText}
    (hScienter : ActedWithScienter p c) (hUnlawful : ActsUnlawfully p c)
    (hAct : NuclearAct2332i p w t c) (hJurisdiction : Jurisdiction2332i p v t c)
    (hNotExcluded : NotExcluded2332i c) :
    Section2332iNuclearOffense p v w t c :=
  ⟨hScienter, hUnlawful, hAct, hJurisdiction, hNotExcluded⟩

theorem threatRoute2332i_intro {p : Person} {c : ComplaintText}
    (hThreat : ThreatensToCommitNuclearTerrorismOffense p c)
    (hBelievable : ThreatMayReasonablyBeBelieved p c) :
    ThreatRoute2332i p c :=
  ⟨hThreat, hBelievable⟩

theorem section2332iThreat_intro {p v : Person} {t : Target} {c : ComplaintText}
    (hConduct : ThreatOrDemand2332i p c) (hJurisdiction : Jurisdiction2332i p v t c)
    (hNotExcluded : NotExcluded2332i c) :
    Section2332iThreat p v t c :=
  ⟨hConduct, hJurisdiction, hNotExcluded⟩

theorem section2332iInchoate_intro {p v : Person} {t : Target} {ag : Agreement}
    {c : ComplaintText}
    (hInchoate : Inchoate2332i p ag c) (hJurisdiction : Jurisdiction2332i p v t c)
    (hNotExcluded : NotExcluded2332i c) :
    Section2332iInchoate p v t ag c :=
  ⟨hInchoate, hJurisdiction, hNotExcluded⟩

theorem section2332iViolation_substantive_intro {p v : Person} {w : Weapon} {t : Target}
    {ag : Agreement} {c : ComplaintText} (h : Section2332iNuclearOffense p v w t c) :
    Section2332iViolation p v w t ag c := .substantive h

theorem section2332iViolation_threat_intro {p v : Person} {w : Weapon} {t : Target}
    {ag : Agreement} {c : ComplaintText} (h : Section2332iThreat p v t c) :
    Section2332iViolation p v w t ag c := .threat h

theorem section2332iViolation_inchoate_intro {p v : Person} {w : Weapon} {t : Target}
    {ag : Agreement} {c : ComplaintText} (h : Section2332iInchoate p v t ag c) :
    Section2332iViolation p v w t ag c := .inchoate h



theorem section2333PrimaryClaim_intro {p v : Person} {a : TerroristAct} {inj : Injury}
    {c : ComplaintText}
    (hPlaintiff : Plaintiff2333 p v c) (hInjury : InjuredInPersonPropertyOrBusiness p inj c)
    (hTerrorism : IsActOfInternationalTerrorism a c) (hCausation : ProximateCause p c)
    (hNotWar : ¬ IsActOfWar a c) (hTimely : WithinLimitations p c)
    (hForum : BroughtInAppropriateDistrictCourt c) :
    Section2333PrimaryClaim p v a inj c :=
  ⟨hPlaintiff, hInjury, hTerrorism, hCausation, hNotWar, hTimely, hForum⟩

theorem section2333SecondaryLiability_intro {p v : Person} {a : TerroristAct} {o : Organization}
    {inj : Injury} {ag : Agreement} {c : ComplaintText}
    (hClaim : Section2333PrimaryClaim p v a inj c)
    (hDesignated : DesignatedForeignTerroristOrganization o c)
    (hAttribution : ActCommittedPlannedOrAuthorizedByDesignatedOrganization a o c)
    (hTiming : OrganizationDesignatedAsOfDateOfAct o a c)
    (hTheory : SecondaryTheory2333 p a ag c) :
    Section2333SecondaryLiability p v a o inj ag c :=
  ⟨hClaim, hDesignated, hAttribution, hTiming, hTheory⟩

theorem validAntiterrorismActClaim_primary_intro {p v : Person} {a : TerroristAct}
    {o : Organization} {inj : Injury} {ag : Agreement} {c : ComplaintText}
    (h : Section2333PrimaryClaim p v a inj c) :
    ValidAntiterrorismActClaim p v a o inj ag c := .primary h

theorem validAntiterrorismActClaim_secondary_intro {p v : Person} {a : TerroristAct}
    {o : Organization} {inj : Injury} {ag : Agreement} {c : ComplaintText}
    (h : Section2333SecondaryLiability p v a o inj ag c) :
    ValidAntiterrorismActClaim p v a o inj ag c := .secondary h

theorem section2333bEstoppel_intro {p : Person} {c : ComplaintText}
    (hJudgment : PriorCriminalJudgmentForUnitedStates p c) :
    Section2333bEstoppel p c :=
  ⟨hJudgment⟩

theorem section2333cEstoppel_intro {p : Person} {c : ComplaintText}
    (hJudgment : PriorForeignStateCriminalJudgmentEntitledToFullFaithAndCredit p c) :
    Section2333cEstoppel p c :=
  ⟨hJudgment⟩

theorem section2333eBlockedAsset_intro {p : Person} {c : ComplaintText}
    (hJudgment : JudgmentObtainedAgainstTerroristParty p c)
    (hAsset : AssetSeizedOrFrozenUnderKingpinAct c) :
    Section2333eBlockedAsset p c :=
  ⟨hJudgment, hAsset⟩

end Proving.USC.T18.Ch113B.Elements
