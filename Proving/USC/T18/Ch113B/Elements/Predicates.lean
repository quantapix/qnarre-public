import Proving.USC.T18.Ch113B.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false










open Proving.USC.Common

namespace Proving.USC.T18.Ch113B.Elements



axiom InvolvesViolentActs (a : TerroristAct) (c : ComplaintText) : Prop



axiom InvolvesActsDangerousToHumanLife (a : TerroristAct) (c : ComplaintText) : Prop



axiom ViolatesCriminalLawsOfUnitedStatesOrState (a : TerroristAct) (c : ComplaintText) : Prop



axiom WouldBeCriminalViolationIfWithinUnitedStatesJurisdiction (a : TerroristAct) (c : ComplaintText) : Prop



axiom AppearsIntendedToIntimidateOrCoerceCivilianPopulation (a : TerroristAct) (c : ComplaintText) : Prop



axiom AppearsIntendedToInfluenceGovernmentPolicyByCoercion (a : TerroristAct) (c : ComplaintText) : Prop



axiom AppearsIntendedToAffectGovernmentConductByMassDestruction (a : TerroristAct) (c : ComplaintText) : Prop



axiom OccursPrimarilyOutsideUnitedStates (a : TerroristAct) (c : ComplaintText) : Prop



axiom TranscendsNationalBoundariesInMeansOrTargets (a : TerroristAct) (c : ComplaintText) : Prop



axiom OccursPrimarilyWithinUnitedStates (a : TerroristAct) (c : ComplaintText) : Prop



axiom IsNationalOfUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom CapableOfHoldingLegalOrBeneficialInterestInProperty (p : Person) (c : ComplaintText) : Prop



axiom OccursInCourseOfDeclaredWar (a : TerroristAct) (c : ComplaintText) : Prop



axiom OccursInCourseOfArmedConflictBetweenNations (a : TerroristAct) (c : ComplaintText) : Prop



axiom OccursInCourseOfArmedConflictBetweenMilitaryForces (a : TerroristAct) (c : ComplaintText) : Prop



axiom DesignatedForeignTerroristOrganization (o : Organization) (c : ComplaintText) : Prop



axiom DesignatedSpeciallyDesignatedGlobalTerrorist (o : Organization) (c : ComplaintText) : Prop



axiom CourtDeterminedNotMilitaryForce (o : Organization) (c : ComplaintText) : Prop



axiom CausesDeathOfNational (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom VictimOutsideUnitedStatesAtTime (v : Person) (c : ComplaintText) : Prop



axiom KillingIsMurder (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom KillingIsVoluntaryManslaughter (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom KillingIsInvoluntaryManslaughter (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom DefendantOutsideUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom AttemptsToKillNational (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom CommitsOvertActInFurtheranceOfConspiracy (p : Person) (ag : Agreement) (c : ComplaintText) : Prop



axiom EngagesInPhysicalViolence (p : Person) (c : ComplaintText) : Prop



axiom IntendsSeriousBodilyInjuryToNational (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom CausesSeriousBodilyInjuryToNational (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom AttorneyGeneralWrittenCertificationFiled (p : Person) (c : ComplaintText) : Prop



axiom CertifiedOffenseIntendedToCoerceIntimidateOrRetaliate (p : Person) (c : ComplaintText) : Prop



axiom ActsWithoutLawfulAuthority (p : Person) (c : ComplaintText) : Prop



axiom UsesWeapon (p : Person) (w : Weapon) (c : ComplaintText) : Prop



axiom ThreatensToUseWeapon (p : Person) (w : Weapon) (c : ComplaintText) : Prop



axiom AttemptsToUseWeapon (p : Person) (w : Weapon) (c : ComplaintText) : Prop



axiom IsDestructiveDevice (w : Weapon) (c : ComplaintText) : Prop



axiom IsChemicalWeapon (w : Weapon) (c : ComplaintText) : Prop



axiom IsBiologicalWeapon (w : Weapon) (c : ComplaintText) : Prop



axiom IsRadiationWeapon (w : Weapon) (c : ComplaintText) : Prop



axiom DirectedAtNationalOutsideUnitedStates (v : Person) (c : ComplaintText) : Prop



axiom DirectedAtPersonOrPropertyWithinUnitedStates (t : Target) (c : ComplaintText) : Prop



axiom MailOrFacilityOfInterstateCommerceUsedInFurtherance (c : ComplaintText) : Prop



axiom PropertyUsedInOrAffectingInterstateCommerce (t : Target) (c : ComplaintText) : Prop



axiom PerpetratorTravelsInInterstateCommerceInFurtherance (p : Person) (c : ComplaintText) : Prop



axiom OffenseAffectsInterstateCommerce (c : ComplaintText) : Prop



axiom DirectedAtUnitedStatesProperty (t : Target) (c : ComplaintText) : Prop



axiom DirectedAtForeignGovernmentPropertyWithinUnitedStates (t : Target) (c : ComplaintText) : Prop



axiom ConductOccursOutsideUnitedStates (c : ComplaintText) : Prop



axiom DeathResultsFromOffense (c : ComplaintText) : Prop



axiom ConductTranscendsNationalBoundaries (c : ComplaintText) : Prop



axiom KillsPersonWithinUnitedStates (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom KidnapsPersonWithinUnitedStates (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom MaimsPersonWithinUnitedStates (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom CommitsAssaultResultingInSeriousBodilyInjury (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom AssaultsWithDangerousWeapon (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom DestroysOrDamagesPropertyWithinUnitedStates (p : Person) (t : Target) (c : ComplaintText) : Prop



axiom AttemptsOrConspiresToDestroyPropertyWithinUnitedStates (p : Person) (t : Target) (c : ComplaintText) : Prop



axiom CreatesSubstantialRiskOfSeriousBodilyInjury (p : Person) (c : ComplaintText) : Prop



axiom InViolationOfStateOrFederalLaw (c : ComplaintText) : Prop



axiom ThreatensToCommitOffense (p : Person) (c : ComplaintText) : Prop



axiom AttemptsToCommitOffense (p : Person) (c : ComplaintText) : Prop



axiom VictimIsUnitedStatesGovernmentOrOfficial (v : Person) (c : ComplaintText) : Prop



axiom PropertyOwnedPossessedOrLeasedByUnitedStates (t : Target) (c : ComplaintText) : Prop



axiom OffenseCommittedInTerritorialSea (c : ComplaintText) : Prop



axiom OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction (c : ComplaintText) : Prop



axiom IsPrincipalCoConspiratorOrAccessory (p : Person) (c : ComplaintText) : Prop



axiom CircumstanceAppliesToAtLeastOneOffender (c : ComplaintText) : Prop



axiom CalculatedToInfluenceGovernmentOrRetaliate (a : TerroristAct) (c : ComplaintText) : Prop



axiom ViolatesEnumeratedTerrorismOffense (a : TerroristAct) (c : ComplaintText) : Prop



axiom IsPermanentResidentAlien (p : Person) (c : ComplaintText) : Prop



axiom IsJuridicalPersonOrganizedUnderUnitedStatesLaw (p : Person) (c : ComplaintText) : Prop



axiom CountryDesignatedAsSupportingInternationalTerrorism (ctry : Country) (c : ComplaintText) : Prop



axiom KnowsOrHasReasonableCauseToKnowCountryDesignated (p : Person) (ctry : Country) (c : ComplaintText) : Prop



axiom EngagesInFinancialTransactionWithGovernmentOfCountry (p : Person) (ctry : Country) (tx : Transaction) (c : ComplaintText) : Prop



axiom IsFinancialTransaction (tx : Transaction) (c : ComplaintText) : Prop



axiom ExemptedByTreasuryRegulation (p : Person) (tx : Transaction) (c : ComplaintText) : Prop



axiom RequestMadeByAttorneyGeneralOrAuthorizedDelegate (rq : AssistanceRequest) (c : ComplaintText) : Prop



axiom RequestSupportsEnforcementOfSection2332a (rq : AssistanceRequest) (c : ComplaintText) : Prop



axiom EmergencySituationInvolvingWeaponOfMassDestruction (rq : AssistanceRequest) (c : ComplaintText) : Prop



axiom UnlawfullyDeliversPlacesDischargesOrDetonatesDevice (p : Person) (w : Weapon) (t : Target) (c : ComplaintText) : Prop



axiom IsExplosive (w : Weapon) (c : ComplaintText) : Prop



axiom IsOtherLethalDevice (w : Weapon) (c : ComplaintText) : Prop



axiom IsPlaceOfPublicUse (t : Target) (c : ComplaintText) : Prop



axiom IsStateOrGovernmentFacility (t : Target) (c : ComplaintText) : Prop



axiom IsPublicTransportationSystem (t : Target) (c : ComplaintText) : Prop



axiom IsInfrastructureFacility (t : Target) (c : ComplaintText) : Prop



axiom IntendsToCauseDeathOrSeriousBodilyInjury (p : Person) (c : ComplaintText) : Prop



axiom IntendsExtensiveDestructionOfPlaceFacilityOrSystem (p : Person) (t : Target) (c : ComplaintText) : Prop



axiom DestructionLikelyToResultInMajorEconomicLoss (t : Target) (c : ComplaintText) : Prop



axiom OffenseTakesPlaceInUnitedStates (c : ComplaintText) : Prop



axiom CommittedAgainstAnotherStateOrItsGovernmentFacility (t : Target) (c : ComplaintText) : Prop



axiom CommittedToCompelAnotherStateOrUnitedStates (c : ComplaintText) : Prop



axiom CommittedOnBoardVesselOrAircraftOfAnotherState (c : ComplaintText) : Prop



axiom PerpetratorFoundOutsideUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom PerpetratorIsNationalOfAnotherStateOrStateless (p : Person) (c : ComplaintText) : Prop



axiom VictimIsNationalOfAnotherStateOrStateless (v : Person) (c : ComplaintText) : Prop



axiom OffenseTakesPlaceOutsideUnitedStates (c : ComplaintText) : Prop



axiom PerpetratorIsNationalOfUnitedStatesOrHabituallyResident (p : Person) (c : ComplaintText) : Prop



axiom PerpetratorFoundInUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom CommittedToCompelUnitedStates (c : ComplaintText) : Prop



axiom CommittedAgainstUnitedStatesStateOrGovernmentFacility (t : Target) (c : ComplaintText) : Prop



axiom CommittedOnBoardVesselOrAircraftOfUnitedStates (c : ComplaintText) : Prop



axiom ActivitiesOfArmedForcesDuringArmedConflict (c : ComplaintText) : Prop



axiom ActivitiesOfMilitaryForcesInOfficialDuties (c : ComplaintText) : Prop



axiom PurelyDomesticOffenseWithoutSubstantialCommerceEffect (c : ComplaintText) : Prop



axiom ProducesAcquiresTransfersPossessesOrUsesItem (p : Person) (w : Weapon) (c : ComplaintText) : Prop



axiom IsGuidedAntiAircraftRocketOrMissile (w : Weapon) (c : ComplaintText) : Prop



axiom IsLaunchOrGuidanceDeviceForCoveredMissile (w : Weapon) (c : ComplaintText) : Prop



axiom IsPartDesignedForAssemblingCoveredMissileOrDevice (w : Weapon) (c : ComplaintText) : Prop



axiom DeviceNeitherDesignedNorRedesignedAsWeapon (w : Weapon) (c : ComplaintText) : Prop



axiom ConductUnderUnitedStatesOrStateAuthority (p : Person) (c : ComplaintText) : Prop



axiom ConductPursuantToUnitedStatesOrStateContract (p : Person) (c : ComplaintText) : Prop



axiom OffenseOccursInOrAffectsInterstateCommerce (c : ComplaintText) : Prop



axiom OffenseOutsideUnitedStatesCommittedByUnitedStatesNational (p : Person) (c : ComplaintText) : Prop



axiom OffenseAgainstNationalOfUnitedStatesOutsideUnitedStates (v : Person) (c : ComplaintText) : Prop



axiom AidsAbetsOrConspiresWithPersonSubjectToJurisdiction (p : Person) (c : ComplaintText) : Prop



axiom UsesOrThreatensToUseItemInCourseOfViolation (p : Person) (w : Weapon) (c : ComplaintText) : Prop



axiom IsRadiationEndangeringDeviceOrObject (w : Weapon) (c : ComplaintText) : Prop



axiom ConductUnderUnitedStatesAuthority (p : Person) (c : ComplaintText) : Prop



axiom ConductPursuantToUnitedStatesContract (p : Person) (c : ComplaintText) : Prop



axiom ActsUnlawfully (p : Person) (c : ComplaintText) : Prop



axiom PossessesRadioactiveMaterialOrMakesOrPossessesDevice (p : Person) (w : Weapon) (c : ComplaintText) : Prop



axiom IntendsToCauseSubstantialDamageToPropertyOrEnvironment (p : Person) (c : ComplaintText) : Prop



axiom UsesRadioactiveMaterialOrDevice (p : Person) (w : Weapon) (c : ComplaintText) : Prop



axiom DamagesOrInterferesWithNuclearFacilityCausingRelease (p : Person) (t : Target) (c : ComplaintText) : Prop



axiom KnowsActLikelyToCauseDeathOrSeriousBodilyInjury (p : Person) (c : ComplaintText) : Prop



axiom KnowsActLikelyToCauseSubstantialDamage (p : Person) (c : ComplaintText) : Prop



axiom IntendsToCompelPersonOrganizationOrCountry (p : Person) (c : ComplaintText) : Prop



axiom ThreatensToCommitNuclearTerrorismOffense (p : Person) (c : ComplaintText) : Prop



axiom ThreatMayReasonablyBeBelieved (p : Person) (c : ComplaintText) : Prop



axiom DemandsPossessionOrAccessByThreatOrForce (p : Person) (c : ComplaintText) : Prop



axiom ConductTakesPlaceInUnitedStatesOrSpecialAircraftJurisdiction (c : ComplaintText) : Prop



axiom PerpetratorIsUnitedStatesNationalCorporationOrHabitualResident (p : Person) (c : ComplaintText) : Prop



axiom CommittedToCompelUnitedStatesOrThreatDirectedAtUnitedStates (c : ComplaintText) : Prop



axiom VictimIsUnitedStatesNationalOrLegalEntity (v : Person) (c : ComplaintText) : Prop



axiom InjuredInPersonPropertyOrBusiness (p : Person) (inj : Injury) (c : ComplaintText) : Prop



axiom IsEstateSurvivorOrHeirOfInjuredNational (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom BroughtInAppropriateDistrictCourt (c : ComplaintText) : Prop



axiom ActCommittedPlannedOrAuthorizedByDesignatedOrganization (a : TerroristAct) (o : Organization) (c : ComplaintText) : Prop



axiom OrganizationDesignatedAsOfDateOfAct (o : Organization) (a : TerroristAct) (c : ComplaintText) : Prop



axiom AidsAndAbetsByKnowinglyProvidingSubstantialAssistance (p : Person) (a : TerroristAct) (c : ComplaintText) : Prop



axiom ConspiresWithPersonWhoCommittedAct (p : Person) (a : TerroristAct) (c : ComplaintText) : Prop



axiom PriorCriminalJudgmentForUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom PriorForeignStateCriminalJudgmentEntitledToFullFaithAndCredit (p : Person) (c : ComplaintText) : Prop



axiom JudgmentObtainedAgainstTerroristParty (p : Person) (c : ComplaintText) : Prop



axiom AssetSeizedOrFrozenUnderKingpinAct (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Elements