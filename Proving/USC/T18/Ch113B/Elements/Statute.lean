import Proving.USC.T18.Ch113B.Elements.Types
import Proving.USC.T18.Ch113B.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false














open Proving.USC.Common

namespace Proving.USC.T18.Ch113B.Elements




inductive ViolentOrDangerousAct2331 (a : TerroristAct) (c : ComplaintText) : Prop where
  | violent   (h : InvolvesViolentActs a c)
  | dangerous (h : InvolvesActsDangerousToHumanLife a c)



inductive CriminalLawViolation2331 (a : TerroristAct) (c : ComplaintText) : Prop where
  | violates     (h : ViolatesCriminalLawsOfUnitedStatesOrState a c)
  | wouldViolate (h : WouldBeCriminalViolationIfWithinUnitedStatesJurisdiction a c)


inductive TerroristPurpose2331 (a : TerroristAct) (c : ComplaintText) : Prop where
  | intimidatePopulation (h : AppearsIntendedToIntimidateOrCoerceCivilianPopulation a c)
  | influencePolicy      (h : AppearsIntendedToInfluenceGovernmentPolicyByCoercion a c)
  | affectConduct        (h : AppearsIntendedToAffectGovernmentConductByMassDestruction a c)



inductive InternationalLocus2331 (a : TerroristAct) (c : ComplaintText) : Prop where
  | primarilyOutside (h : OccursPrimarilyOutsideUnitedStates a c)
  | transcends       (h : TranscendsNationalBoundariesInMeansOrTargets a c)


structure InternationalTerrorism2331 (a : TerroristAct) (c : ComplaintText) : Prop where
  conduct  : ViolentOrDangerousAct2331 a c
  criminal : CriminalLawViolation2331 a c
  purpose  : TerroristPurpose2331 a c
  locus    : InternationalLocus2331 a c




structure DomesticTerrorism2331 (a : TerroristAct) (c : ComplaintText) : Prop where
  conduct  : InvolvesActsDangerousToHumanLife a c
  criminal : ViolatesCriminalLawsOfUnitedStatesOrState a c
  purpose  : TerroristPurpose2331 a c
  locus    : OccursPrimarilyWithinUnitedStates a c


inductive ActOfWar2331 (a : TerroristAct) (c : ComplaintText) : Prop where
  | declaredWar            (h : OccursInCourseOfDeclaredWar a c)
  | conflictBetweenNations (h : OccursInCourseOfArmedConflictBetweenNations a c)
  | conflictBetweenForces  (h : OccursInCourseOfArmedConflictBetweenMilitaryForces a c)



inductive NotMilitaryForce2331 (o : Organization) (c : ComplaintText) : Prop where
  | fto             (h : DesignatedForeignTerroristOrganization o c)
  | sdgt            (h : DesignatedSpeciallyDesignatedGlobalTerrorist o c)
  | courtDetermined (h : CourtDeterminedNotMilitaryForce o c)


abbrev IsActOfInternationalTerrorism := InternationalTerrorism2331

abbrev IsActOfDomesticTerrorism := DomesticTerrorism2331

abbrev IsActOfWar := ActOfWar2331

abbrev IsExcludedFromMilitaryForce := NotMilitaryForce2331

abbrev IsChapterPerson (p : Person) (c : ComplaintText) : Prop :=
  CapableOfHoldingLegalOrBeneficialInterestInProperty p c





structure Section2332Certification (p : Person) (c : ComplaintText) : Prop where
  written  : AttorneyGeneralWrittenCertificationFiled p c
  judgment : CertifiedOffenseIntendedToCoerceIntimidateOrRetaliate p c


inductive KillingGrade2332 (p v : Person) (c : ComplaintText) : Prop where
  | murder                  (h : KillingIsMurder p v c)
  | voluntaryManslaughter   (h : KillingIsVoluntaryManslaughter p v c)
  | involuntaryManslaughter (h : KillingIsInvoluntaryManslaughter p v c)


structure Section2332Killing (p v : Person) (c : ComplaintText) : Prop where
  victimIsNational : IsNationalOfUnitedStates v c
  kills            : CausesDeathOfNational p v c
  victimAbroad     : VictimOutsideUnitedStatesAtTime v c
  grade            : KillingGrade2332 p v c
  certification    : Section2332Certification p c


structure Section2332Attempt (p v : Person) (c : ComplaintText) : Prop where
  defendantAbroad  : DefendantOutsideUnitedStates p c
  victimIsNational : IsNationalOfUnitedStates v c
  attempt          : AttemptsToKillNational p v c
  murderObject     : KillingIsMurder p v c
  certification    : Section2332Certification p c



structure Section2332Conspiracy (p v : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  defendantAbroad  : DefendantOutsideUnitedStates p c
  victimIsNational : IsNationalOfUnitedStates v c
  agreement        : AgreementAmongTwoOrMore ag c
  murderObject     : KillingIsMurder p v c
  overtAct         : CommitsOvertActInFurtheranceOfConspiracy p ag c
  certification    : Section2332Certification p c


inductive SeriousInjuryRoute2332 (p v : Person) (c : ComplaintText) : Prop where
  | intent (h : IntendsSeriousBodilyInjuryToNational p v c)
  | result (h : CausesSeriousBodilyInjuryToNational p v c)


structure Section2332Violence (p v : Person) (c : ComplaintText) : Prop where
  defendantAbroad  : DefendantOutsideUnitedStates p c
  violence         : EngagesInPhysicalViolence p c
  victimIsNational : IsNationalOfUnitedStates v c
  injury           : SeriousInjuryRoute2332 p v c
  certification    : Section2332Certification p c


inductive Section2332Violation (p v : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  | killing    (h : Section2332Killing p v c)
  | attempt    (h : Section2332Attempt p v c)
  | conspiracy (h : Section2332Conspiracy p v ag c)
  | violence   (h : Section2332Violence p v c)




inductive WeaponOfMassDestruction2332a (w : Weapon) (c : ComplaintText) : Prop where
  | destructiveDevice (h : IsDestructiveDevice w c)
  | chemical          (h : IsChemicalWeapon w c)
  | biological        (h : IsBiologicalWeapon w c)
  | radiological      (h : IsRadiationWeapon w c)


abbrev IsWeaponOfMassDestruction := WeaponOfMassDestruction2332a


inductive ProhibitedWeaponUse2332a (p : Person) (w : Weapon) (ag : Agreement)
    (c : ComplaintText) : Prop where
  | uses      (h : UsesWeapon p w c)
  | threatens (h : ThreatensToUseWeapon p w c)
  | attempts  (h : AttemptsToUseWeapon p w c)
  | conspires (h : AgreementAmongTwoOrMore ag c)



inductive InterstateCircumstance2332a (p : Person) (t : Target) (c : ComplaintText) : Prop where
  | mail     (h : MailOrFacilityOfInterstateCommerceUsedInFurtherance c)
  | property (h : PropertyUsedInOrAffectingInterstateCommerce t c)
  | travel   (h : PerpetratorTravelsInInterstateCommerceInFurtherance p c)
  | affects  (h : OffenseAffectsInterstateCommerce c)


structure Section2332aAgainstNationalAbroad (p v : Person) (w : Weapon) (ag : Agreement)
    (c : ComplaintText) : Prop where
  noAuthority      : ActsWithoutLawfulAuthority p c
  weapon           : IsWeaponOfMassDestruction w c
  conduct          : ProhibitedWeaponUse2332a p w ag c
  victimIsNational : IsNationalOfUnitedStates v c
  target           : DirectedAtNationalOutsideUnitedStates v c



structure Section2332aWithinUnitedStates (p : Person) (w : Weapon) (t : Target)
    (ag : Agreement) (c : ComplaintText) : Prop where
  noAuthority : ActsWithoutLawfulAuthority p c
  weapon      : IsWeaponOfMassDestruction w c
  conduct     : ProhibitedWeaponUse2332a p w ag c
  target      : DirectedAtPersonOrPropertyWithinUnitedStates t c
  commerce    : InterstateCircumstance2332a p t c


structure Section2332aAgainstUnitedStatesProperty (p : Person) (w : Weapon) (t : Target)
    (ag : Agreement) (c : ComplaintText) : Prop where
  noAuthority : ActsWithoutLawfulAuthority p c
  weapon      : IsWeaponOfMassDestruction w c
  conduct     : ProhibitedWeaponUse2332a p w ag c
  target      : DirectedAtUnitedStatesProperty t c


structure Section2332aAgainstForeignGovernmentProperty (p : Person) (w : Weapon) (t : Target)
    (ag : Agreement) (c : ComplaintText) : Prop where
  noAuthority : ActsWithoutLawfulAuthority p c
  weapon      : IsWeaponOfMassDestruction w c
  conduct     : ProhibitedWeaponUse2332a p w ag c
  target      : DirectedAtForeignGovernmentPropertyWithinUnitedStates t c


structure Section2332aByNationalAbroad (p : Person) (w : Weapon) (ag : Agreement)
    (c : ComplaintText) : Prop where
  national    : IsNationalOfUnitedStates p c
  noAuthority : ActsWithoutLawfulAuthority p c
  weapon      : IsWeaponOfMassDestruction w c
  conduct     : ProhibitedWeaponUse2332a p w ag c
  abroad      : ConductOccursOutsideUnitedStates c


inductive Section2332aViolation (p v : Person) (w : Weapon) (t : Target) (ag : Agreement)
    (c : ComplaintText) : Prop where
  | nationalAbroad            (h : Section2332aAgainstNationalAbroad p v w ag c)
  | withinUnitedStates        (h : Section2332aWithinUnitedStates p w t ag c)
  | unitedStatesProperty      (h : Section2332aAgainstUnitedStatesProperty p w t ag c)
  | foreignGovernmentProperty (h : Section2332aAgainstForeignGovernmentProperty p w t ag c)
  | byNationalAbroad          (h : Section2332aByNationalAbroad p w ag c)


structure Section2332aDeathResults (p v : Person) (w : Weapon) (t : Target) (ag : Agreement)
    (c : ComplaintText) : Prop where
  violation : Section2332aViolation p v w t ag c
  death     : DeathResultsFromOffense c





inductive ViolentPredicateAct2332b (p v : Person) (c : ComplaintText) : Prop where
  | kills         (h : KillsPersonWithinUnitedStates p v c)
  | kidnaps       (h : KidnapsPersonWithinUnitedStates p v c)
  | maims         (h : MaimsPersonWithinUnitedStates p v c)
  | assaultInjury (h : CommitsAssaultResultingInSeriousBodilyInjury p v c)
  | assaultWeapon (h : AssaultsWithDangerousWeapon p v c)



inductive PropertyDestruction2332b (p : Person) (t : Target) (c : ComplaintText) : Prop where
  | completed (h : DestroysOrDamagesPropertyWithinUnitedStates p t c)
  | inchoate  (h : AttemptsOrConspiresToDestroyPropertyWithinUnitedStates p t c)


structure PropertyPredicateAct2332b (p : Person) (t : Target) (c : ComplaintText) : Prop where
  destruction : PropertyDestruction2332b p t c
  risk        : CreatesSubstantialRiskOfSeriousBodilyInjury p c


inductive PredicateAct2332b (p v : Person) (t : Target) (c : ComplaintText) : Prop where
  | violent  (h : ViolentPredicateAct2332b p v c)
  | property (h : PropertyPredicateAct2332b p t c)


inductive JurisdictionalCircumstance2332b (p v : Person) (t : Target)
    (c : ComplaintText) : Prop where
  | mail                 (h : MailOrFacilityOfInterstateCommerceUsedInFurtherance c)
  | commerce             (h : OffenseAffectsInterstateCommerce c)
  | victimGovernment     (h : VictimIsUnitedStatesGovernmentOrOfficial v c)
  | unitedStatesProperty (h : PropertyOwnedPossessedOrLeasedByUnitedStates t c)
  | territorialSea       (h : OffenseCommittedInTerritorialSea c)
  | maritimeJurisdiction (h : OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction c)


structure Section2332bOffense (p v : Person) (t : Target) (c : ComplaintText) : Prop where
  transcends   : ConductTranscendsNationalBoundaries c
  act          : PredicateAct2332b p v t c
  unlawful     : InViolationOfStateOrFederalLaw c
  circumstance : JurisdictionalCircumstance2332b p v t c


inductive Inchoate2332b (p : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  | threat     (h : ThreatensToCommitOffense p c)
  | attempt    (h : AttemptsToCommitOffense p c)
  | conspiracy (h : AgreementAmongTwoOrMore ag c)


structure Section2332bInchoateOffense (p v : Person) (t : Target) (ag : Agreement)
    (c : ComplaintText) : Prop where
  transcends   : ConductTranscendsNationalBoundaries c
  inchoate     : Inchoate2332b p ag c
  unlawful     : InViolationOfStateOrFederalLaw c
  circumstance : JurisdictionalCircumstance2332b p v t c


inductive Section2332bViolation (p v : Person) (t : Target) (ag : Agreement)
    (c : ComplaintText) : Prop where
  | completed (h : Section2332bOffense p v t c)
  | inchoate  (h : Section2332bInchoateOffense p v t ag c)



structure Section2332bDerivativeJurisdiction (p : Person) (c : ComplaintText) : Prop where
  role         : IsPrincipalCoConspiratorOrAccessory p c
  circumstance : CircumstanceAppliesToAtLeastOneOffender c


structure Section2332bDeathResults (p v : Person) (t : Target) (ag : Agreement)
    (c : ComplaintText) : Prop where
  violation : Section2332bViolation p v t ag c
  death     : DeathResultsFromOffense c


structure FederalCrimeOfTerrorism2332b (a : TerroristAct) (c : ComplaintText) : Prop where
  calculated : CalculatedToInfluenceGovernmentOrRetaliate a c
  enumerated : ViolatesEnumeratedTerrorismOffense a c


abbrev IsFederalCrimeOfTerrorism := FederalCrimeOfTerrorism2332b





inductive UnitedStatesPerson2332d (p : Person) (c : ComplaintText) : Prop where
  | citizenOrNational (h : IsNationalOfUnitedStates p c)
  | permanentResident (h : IsPermanentResidentAlien p c)
  | juridical         (h : IsJuridicalPersonOrganizedUnderUnitedStatesLaw p c)
  | inUnitedStates    (h : IsPersonInUS p c)


abbrev IsUnitedStatesPerson := UnitedStatesPerson2332d



structure Section2332dFinancialTransaction (p : Person) (ctry : Country) (tx : Transaction)
    (c : ComplaintText) : Prop where
  usPerson    : IsUnitedStatesPerson p c
  designated  : CountryDesignatedAsSupportingInternationalTerrorism ctry c
  scienter    : KnowsOrHasReasonableCauseToKnowCountryDesignated p ctry c
  isFinancial : IsFinancialTransaction tx c
  conduct     : EngagesInFinancialTransactionWithGovernmentOfCountry p ctry tx c
  notExempt   : ¬ ExemptedByTreasuryRegulation p tx c





structure Section2332eAssistanceRequest (rq : AssistanceRequest) (c : ComplaintText) : Prop where
  requester : RequestMadeByAttorneyGeneralOrAuthorizedDelegate rq c
  purpose   : RequestSupportsEnforcementOfSection2332a rq c
  emergency : EmergencySituationInvolvingWeaponOfMassDestruction rq c




inductive ExplosiveOrLethalDevice2332f (w : Weapon) (c : ComplaintText) : Prop where
  | explosive   (h : IsExplosive w c)
  | otherLethal (h : IsOtherLethalDevice w c)


abbrev IsExplosiveOrOtherLethalDevice := ExplosiveOrLethalDevice2332f


inductive BombingTarget2332f (t : Target) (c : ComplaintText) : Prop where
  | publicUse          (h : IsPlaceOfPublicUse t c)
  | governmentFacility (h : IsStateOrGovernmentFacility t c)
  | transportation     (h : IsPublicTransportationSystem t c)
  | infrastructure     (h : IsInfrastructureFacility t c)


abbrev IsCoveredBombingTarget := BombingTarget2332f



structure ExtensiveDestructionIntent2332f (p : Person) (t : Target) (c : ComplaintText) : Prop where
  intent    : IntendsExtensiveDestructionOfPlaceFacilityOrSystem p t c
  majorLoss : DestructionLikelyToResultInMajorEconomicLoss t c


inductive BombingIntent2332f (p : Person) (t : Target) (c : ComplaintText) : Prop where
  | deathOrInjury (h : IntendsToCauseDeathOrSeriousBodilyInjury p c)
  | destruction   (h : ExtensiveDestructionIntent2332f p t c)


inductive DomesticRoute2332f (p v : Person) (t : Target) (c : ComplaintText) : Prop where
  | againstAnotherState (h : CommittedAgainstAnotherStateOrItsGovernmentFacility t c)
  | compelState         (h : CommittedToCompelAnotherStateOrUnitedStates c)
  | vesselOrAircraft    (h : CommittedOnBoardVesselOrAircraftOfAnotherState c)
  | perpetratorAbroad   (h : PerpetratorFoundOutsideUnitedStates p c)
  | perpetratorForeign  (h : PerpetratorIsNationalOfAnotherStateOrStateless p c)
  | victimForeign       (h : VictimIsNationalOfAnotherStateOrStateless v c)


structure DomesticJurisdiction2332f (p v : Person) (t : Target) (c : ComplaintText) : Prop where
  locus : OffenseTakesPlaceInUnitedStates c
  route : DomesticRoute2332f p v t c


inductive ForeignRoute2332f (p v : Person) (t : Target) (c : ComplaintText) : Prop where
  | perpetratorNational (h : PerpetratorIsNationalOfUnitedStatesOrHabituallyResident p c)
  | victimNational      (h : IsNationalOfUnitedStates v c)
  | perpetratorFound    (h : PerpetratorFoundInUnitedStates p c)
  | compelUnitedStates  (h : CommittedToCompelUnitedStates c)
  | againstUnitedStates (h : CommittedAgainstUnitedStatesStateOrGovernmentFacility t c)
  | vesselOrAircraft    (h : CommittedOnBoardVesselOrAircraftOfUnitedStates c)


structure ForeignJurisdiction2332f (p v : Person) (t : Target) (c : ComplaintText) : Prop where
  locus : OffenseTakesPlaceOutsideUnitedStates c
  route : ForeignRoute2332f p v t c


inductive Jurisdiction2332f (p v : Person) (t : Target) (c : ComplaintText) : Prop where
  | domestic (h : DomesticJurisdiction2332f p v t c)
  | foreign  (h : ForeignJurisdiction2332f p v t c)


structure NotExcluded2332f (c : ComplaintText) : Prop where
  notArmedForces    : ¬ ActivitiesOfArmedForcesDuringArmedConflict c
  notMilitaryDuty   : ¬ ActivitiesOfMilitaryForcesInOfficialDuties c
  notPurelyDomestic : ¬ PurelyDomesticOffenseWithoutSubstantialCommerceEffect c


structure Section2332fBombing (p v : Person) (w : Weapon) (t : Target)
    (c : ComplaintText) : Prop where
  conduct      : UnlawfullyDeliversPlacesDischargesOrDetonatesDevice p w t c
  device       : IsExplosiveOrOtherLethalDevice w c
  target       : IsCoveredBombingTarget t c
  intent       : BombingIntent2332f p t c
  jurisdiction : Jurisdiction2332f p v t c
  notExcluded  : NotExcluded2332f c


inductive Inchoate2332f (p : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  | attempt    (h : AttemptsToCommitOffense p c)
  | conspiracy (h : AgreementAmongTwoOrMore ag c)


structure Section2332fInchoateBombing (p v : Person) (w : Weapon) (t : Target) (ag : Agreement)
    (c : ComplaintText) : Prop where
  inchoate     : Inchoate2332f p ag c
  device       : IsExplosiveOrOtherLethalDevice w c
  target       : IsCoveredBombingTarget t c
  intent       : BombingIntent2332f p t c
  jurisdiction : Jurisdiction2332f p v t c
  notExcluded  : NotExcluded2332f c


inductive Section2332fViolation (p v : Person) (w : Weapon) (t : Target) (ag : Agreement)
    (c : ComplaintText) : Prop where
  | completed (h : Section2332fBombing p v w t c)
  | inchoate  (h : Section2332fInchoateBombing p v w t ag c)





inductive CoveredMissileSystem2332g (w : Weapon) (c : ComplaintText) : Prop where
  | missile (h : IsGuidedAntiAircraftRocketOrMissile w c)
            (hn : ¬ DeviceNeitherDesignedNorRedesignedAsWeapon w c)
  | launchDevice (h : IsLaunchOrGuidanceDeviceForCoveredMissile w c)
  | part         (h : IsPartDesignedForAssemblingCoveredMissileOrDevice w c)


inductive Jurisdiction2332gh (p v : Person) (t : Target) (c : ComplaintText) : Prop where
  | commerce              (h : OffenseOccursInOrAffectsInterstateCommerce c)
  | abroadByNational      (h : OffenseOutsideUnitedStatesCommittedByUnitedStatesNational p c)
  | againstNationalAbroad (h : OffenseAgainstNationalOfUnitedStatesOutsideUnitedStates v c)
  | unitedStatesProperty  (h : DirectedAtUnitedStatesProperty t c)
  | aidsAbets             (h : AidsAbetsOrConspiresWithPersonSubjectToJurisdiction p c)



structure Section2332gMissileOffense (p v : Person) (w : Weapon) (t : Target)
    (c : ComplaintText) : Prop where
  scienter               : ActedWithScienter p c
  conduct                : ProducesAcquiresTransfersPossessesOrUsesItem p w c
  item                   : CoveredMissileSystem2332g w c
  notGovernmentAuthority : ¬ ConductUnderUnitedStatesOrStateAuthority p c
  notGovernmentContract  : ¬ ConductPursuantToUnitedStatesOrStateContract p c
  jurisdiction           : Jurisdiction2332gh p v t c


structure Section2332gAggravatedUse (p v : Person) (w : Weapon) (t : Target)
    (c : ComplaintText) : Prop where
  violation : Section2332gMissileOffense p v w t c
  use       : UsesOrThreatensToUseItemInCourseOfViolation p w c


structure Section2332gDeathResults (p v : Person) (w : Weapon) (t : Target)
    (c : ComplaintText) : Prop where
  violation : Section2332gMissileOffense p v w t c
  death     : DeathResultsFromOffense c


inductive RadiologicalDispersalDevice2332h (w : Weapon) (c : ComplaintText) : Prop where
  | radiationWeapon    (h : IsRadiationWeapon w c)
  | endangeringDevice  (h : IsRadiationEndangeringDeviceOrObject w c)



structure Section2332hRadiologicalOffense (p v : Person) (w : Weapon) (t : Target)
    (c : ComplaintText) : Prop where
  scienter              : ActedWithScienter p c
  conduct               : ProducesAcquiresTransfersPossessesOrUsesItem p w c
  item                  : RadiologicalDispersalDevice2332h w c
  notUnitedStatesAuthority : ¬ ConductUnderUnitedStatesAuthority p c
  notUnitedStatesContract  : ¬ ConductPursuantToUnitedStatesContract p c
  jurisdiction          : Jurisdiction2332gh p v t c


structure Section2332hAggravatedUse (p v : Person) (w : Weapon) (t : Target)
    (c : ComplaintText) : Prop where
  violation : Section2332hRadiologicalOffense p v w t c
  use       : UsesOrThreatensToUseItemInCourseOfViolation p w c


structure Section2332hDeathResults (p v : Person) (w : Weapon) (t : Target)
    (c : ComplaintText) : Prop where
  violation : Section2332hRadiologicalOffense p v w t c
  death     : DeathResultsFromOffense c




inductive PossessionIntent2332i (p : Person) (c : ComplaintText) : Prop where
  | deathOrInjury     (h : IntendsToCauseDeathOrSeriousBodilyInjury p c)
  | substantialDamage (h : IntendsToCauseSubstantialDamageToPropertyOrEnvironment p c)


structure PossessionRoute2332i (p : Person) (w : Weapon) (c : ComplaintText) : Prop where
  conduct : PossessesRadioactiveMaterialOrMakesOrPossessesDevice p w c
  intent  : PossessionIntent2332i p c


inductive UseConduct2332i (p : Person) (w : Weapon) (t : Target) (c : ComplaintText) : Prop where
  | material (h : UsesRadioactiveMaterialOrDevice p w c)
  | facility (h : DamagesOrInterferesWithNuclearFacilityCausingRelease p t c)



inductive UseIntent2332i (p : Person) (c : ComplaintText) : Prop where
  | intendsDeath     (h : IntendsToCauseDeathOrSeriousBodilyInjury p c)
  | knowsLikelyDeath (h : KnowsActLikelyToCauseDeathOrSeriousBodilyInjury p c)
  | intendsDamage    (h : IntendsToCauseSubstantialDamageToPropertyOrEnvironment p c)
  | knowsLikelyDamage (h : KnowsActLikelyToCauseSubstantialDamage p c)
  | compels          (h : IntendsToCompelPersonOrganizationOrCountry p c)


structure UseRoute2332i (p : Person) (w : Weapon) (t : Target) (c : ComplaintText) : Prop where
  conduct : UseConduct2332i p w t c
  intent  : UseIntent2332i p c


inductive NuclearAct2332i (p : Person) (w : Weapon) (t : Target) (c : ComplaintText) : Prop where
  | possession (h : PossessionRoute2332i p w c)
  | use        (h : UseRoute2332i p w t c)


inductive OutsideRoute2332i (p : Person) (c : ComplaintText) : Prop where
  | perpetrator      (h : PerpetratorIsUnitedStatesNationalCorporationOrHabitualResident p c)
  | vesselOrAircraft (h : CommittedOnBoardVesselOrAircraftOfUnitedStates c)
  | compels          (h : CommittedToCompelUnitedStatesOrThreatDirectedAtUnitedStates c)


structure OutsideByOffender2332i (p : Person) (c : ComplaintText) : Prop where
  locus : OffenseTakesPlaceOutsideUnitedStates c
  route : OutsideRoute2332i p c


inductive UnitedStatesNexus2332i (v : Person) (t : Target) (c : ComplaintText) : Prop where
  | victim   (h : VictimIsUnitedStatesNationalOrLegalEntity v c)
  | facility (h : CommittedAgainstUnitedStatesStateOrGovernmentFacility t c)


structure OutsideAgainstUnitedStates2332i (v : Person) (t : Target) (c : ComplaintText) : Prop where
  locus : OffenseTakesPlaceOutsideUnitedStates c
  nexus : UnitedStatesNexus2332i v t c


inductive Jurisdiction2332i (p v : Person) (t : Target) (c : ComplaintText) : Prop where
  | inUnitedStates             (h : ConductTakesPlaceInUnitedStatesOrSpecialAircraftJurisdiction c)
  | outsideByOffender          (h : OutsideByOffender2332i p c)
  | outsideAgainstUnitedStates (h : OutsideAgainstUnitedStates2332i v t c)
  | perpetratorFound           (h : PerpetratorFoundInUnitedStates p c)


structure NotExcluded2332i (c : ComplaintText) : Prop where
  notArmedForces  : ¬ ActivitiesOfArmedForcesDuringArmedConflict c
  notMilitaryDuty : ¬ ActivitiesOfMilitaryForcesInOfficialDuties c


structure Section2332iNuclearOffense (p v : Person) (w : Weapon) (t : Target)
    (c : ComplaintText) : Prop where
  scienter     : ActedWithScienter p c
  unlawful     : ActsUnlawfully p c
  act          : NuclearAct2332i p w t c
  jurisdiction : Jurisdiction2332i p v t c
  notExcluded  : NotExcluded2332i c


structure ThreatRoute2332i (p : Person) (c : ComplaintText) : Prop where
  threat     : ThreatensToCommitNuclearTerrorismOffense p c
  believable : ThreatMayReasonablyBeBelieved p c



inductive ThreatOrDemand2332i (p : Person) (c : ComplaintText) : Prop where
  | threat (h : ThreatRoute2332i p c)
  | demand (h : DemandsPossessionOrAccessByThreatOrForce p c)


structure Section2332iThreat (p v : Person) (t : Target) (c : ComplaintText) : Prop where
  conduct      : ThreatOrDemand2332i p c
  jurisdiction : Jurisdiction2332i p v t c
  notExcluded  : NotExcluded2332i c


inductive Inchoate2332i (p : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  | attempt    (h : AttemptsToCommitOffense p c)
  | conspiracy (h : AgreementAmongTwoOrMore ag c)


structure Section2332iInchoate (p v : Person) (t : Target) (ag : Agreement)
    (c : ComplaintText) : Prop where
  inchoate     : Inchoate2332i p ag c
  jurisdiction : Jurisdiction2332i p v t c
  notExcluded  : NotExcluded2332i c


inductive Section2332iViolation (p v : Person) (w : Weapon) (t : Target) (ag : Agreement)
    (c : ComplaintText) : Prop where
  | substantive (h : Section2332iNuclearOffense p v w t c)
  | threat      (h : Section2332iThreat p v t c)
  | inchoate    (h : Section2332iInchoate p v t ag c)




inductive Plaintiff2333 (p v : Person) (c : ComplaintText) : Prop where
  | national       (h : IsNationalOfUnitedStates p c)
  | representative (h : IsEstateSurvivorOrHeirOfInjuredNational p v c)
                   (hv : IsNationalOfUnitedStates v c)









structure Section2333PrimaryClaim (p v : Person) (a : TerroristAct) (inj : Injury)
    (c : ComplaintText) : Prop where
  plaintiff   : Plaintiff2333 p v c
  injury      : InjuredInPersonPropertyOrBusiness p inj c
  terrorism   : IsActOfInternationalTerrorism a c
  causation   : ProximateCause p c
  notActOfWar : ¬ IsActOfWar a c
  timely      : WithinLimitations p c
  forum       : BroughtInAppropriateDistrictCourt c


inductive SecondaryTheory2333 (p : Person) (a : TerroristAct) (ag : Agreement)
    (c : ComplaintText) : Prop where
  | aidsAbets (h : AidsAndAbetsByKnowinglyProvidingSubstantialAssistance p a c)
  | conspires (h : ConspiresWithPersonWhoCommittedAct p a c)
              (hag : AgreementAmongTwoOrMore ag c)



structure Section2333SecondaryLiability (p v : Person) (a : TerroristAct) (o : Organization)
    (inj : Injury) (ag : Agreement) (c : ComplaintText) : Prop where
  claim       : Section2333PrimaryClaim p v a inj c
  designated  : DesignatedForeignTerroristOrganization o c
  attribution : ActCommittedPlannedOrAuthorizedByDesignatedOrganization a o c
  timing      : OrganizationDesignatedAsOfDateOfAct o a c
  theory      : SecondaryTheory2333 p a ag c


inductive ValidAntiterrorismActClaim (p v : Person) (a : TerroristAct) (o : Organization)
    (inj : Injury) (ag : Agreement) (c : ComplaintText) : Prop where
  | primary   (h : Section2333PrimaryClaim p v a inj c)
  | secondary (h : Section2333SecondaryLiability p v a o inj ag c)



structure Section2333bEstoppel (p : Person) (c : ComplaintText) : Prop where
  judgment : PriorCriminalJudgmentForUnitedStates p c


structure Section2333cEstoppel (p : Person) (c : ComplaintText) : Prop where
  judgment : PriorForeignStateCriminalJudgmentEntitledToFullFaithAndCredit p c


structure Section2333eBlockedAsset (p : Person) (c : ComplaintText) : Prop where
  judgment : JudgmentObtainedAgainstTerroristParty p c
  asset    : AssetSeizedOrFrozenUnderKingpinAct c

end Proving.USC.T18.Ch113B.Elements
