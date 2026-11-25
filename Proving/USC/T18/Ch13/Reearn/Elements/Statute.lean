import Proving.USC.T18.Ch13.Reearn.Elements.Types
import Proving.USC.T18.Ch13.Reearn.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false









namespace Proving.USC.T18.Ch13.Reearn.Elements

open Proving.USC.Common




inductive FederalActivity245b1 (a : Activity) (c : ComplaintText) : Prop where
  | voting (h : VotingOrElectionActivity a c)
  | federalBenefit (h : FederalBenefitOrProgramParticipation a c)
  | federalEmployment (h : FederalEmploymentActivity a c)
  | federalJury (h : FederalJuryService a c)
  | federallyAssisted (h : FederallyAssistedProgramParticipation a c)



structure PublicAccommodationRoute245 (d : Person) (a : Activity) (c : ComplaintText) : Prop where
  accommodation : PublicAccommodationEnjoyment a c
  notSmallLodgingProprietor : ¬ SmallLodgingProprietorExempt d c


inductive StateOrPrivateActivity245b2 (d : Person) (a : Activity) (c : ComplaintText) : Prop where
  | publicSchool (h : PublicSchoolOrCollegeAttendance a c)
  | stateBenefit (h : StateBenefitOrProgramParticipation a c)
  | employmentOrLabor (h : EmploymentOrLaborOrganizationActivity a c)
  | stateJury (h : StateJuryService a c)
  | interstateTravel (h : InterstateTravelOrCommonCarrierUse a c)
  | publicAccommodation (h : PublicAccommodationRoute245 d a c)



inductive EnumeratedActivity245 (d : Person) (a : Activity) (c : ComplaintText) : Prop where
  | federal (h : FederalActivity245b1 a c)
  | stateOrPrivate (h : StateOrPrivateActivity245b2 d a c)



inductive ActivityNexus245 (d : Person) (v : Person) (a : Activity) (c : ComplaintText) : Prop where
  | becauseOfPastOrPresentParticipation (h : VictimEngagedInProtectedActivity v a c)
  | toIntimidateFromParticipation (h : IntentToIntimidateFromProtectedActivity d v a c)


structure Section245b1 (d : Person) (v : Person) (a : Activity) (c : ComplaintText) : Prop where
  activity : FederalActivity245b1 a c
  nexus : ActivityNexus245 d v a c




structure Section245b2 (d : Person) (v : Person) (a : Activity) (c : ComplaintText) : Prop where
  activity : StateOrPrivateActivity245b2 d a c
  engaged : VictimEngagedInProtectedActivity v a c
  discriminatoryGround : IntentToDiscriminate d c



structure Section245b3 (d : Person) (v : Person) (e : Entity) (c : ComplaintText) : Prop where
  riotOrCivilDisorder : DuringOrIncidentToRiotOrCivilDisorder c
  victimsBusiness : VictimEngagedInBusiness v e c
  commerce : EngagedInInterstateCommerce e c


structure Participation245b4a (d : Person) (v : Person) (a : Activity) (c : ComplaintText) : Prop where
  activity : EnumeratedActivity245 d a c
  participation : ParticipatedWithoutDiscrimination v a c
  notSmallLodgingProprietor : ¬ SmallLodgingProprietorExempt d c



inductive Participation245b4 (d : Person) (v : Person) (a : Activity) (c : ComplaintText) : Prop where
  | participatingWithoutDiscrimination (h : Participation245b4a d v a c)
  | affordingOpportunityOrProtection (h : AffordedOpportunityOrProtectionToParticipate v a c)


structure Section245b4 (d : Person) (v : Person) (a : Activity) (c : ComplaintText) : Prop where
  participation : Participation245b4 d v a c
  nexus : ActivityNexus245 d v a c



structure ProtectedSpeechOpposingDenial245 (v : Person) (c : ComplaintText) : Prop where
  speechOrAssembly : ParticipatedInSpeechOrPeacefulAssemblyOpposingDenial v c
  notIncitement : ¬ AidedAbettedOrIncitedRiotOrViolence v c



inductive CitizenConduct245b5 (v : Person) (a : Activity) (c : ComplaintText) : Prop where
  | aidingOrEncouraging (h : LawfullyAidedOrEncouragedParticipation v a c)
  | opposingSpeechOrAssembly (h : ProtectedSpeechOpposingDenial245 v c)


structure Section245b5 (d : Person) (v : Person) (a : Activity) (c : ComplaintText) : Prop where
  citizen : IsCitizen v c
  conduct : CitizenConduct245b5 v a c
  nexus : ActivityNexus245 d v a c


inductive ProtectedActivityTheory245b
    (d : Person) (v : Person) (a : Activity) (e : Entity) (c : ComplaintText) : Prop where
  | federalActivity (h : Section245b1 d v a c)
  | discriminatoryDenial (h : Section245b2 d v a c)
  | riotAgainstCommerce (h : Section245b3 d v e c)
  | participationWithoutDiscrimination (h : Section245b4 d v a c)
  | citizenSupport (h : Section245b5 d v a c)





structure Section245b
    (d : Person) (v : Person) (a : Activity) (e : Entity) (c : ComplaintText) : Prop where
  forceOrThreat : UsedForceOrThreatOfForce d c
  interference : InjuredIntimidatedOrInterfered d v c
  willful : ActedWithScienter d c
  theory : ProtectedActivityTheory245b d v a e c
  certification : AttorneyGeneralCertification c
  notLawfullyActingOfficer : ¬ LawfullyActingLawEnforcementOfficer d c




structure Section247a1 (d : Person) (rp : ReligiousProperty) (c : ComplaintText) : Prop where
  religiousProperty : IsReligiousRealProperty rp c
  damage : DefacedDamagedOrDestroyedProperty d rp c
  intentional : ActedWithScienter d c
  religiousCharacterMotive : BecauseOfReligiousCharacterOfProperty d rp c
  commerceCircumstance : OffenseInOrAffectingInterstateCommerce c
  certification : AttorneyGeneralCertification c


structure Section247a2 (d : Person) (v : Person) (c : ComplaintText) : Prop where
  forceOrThreat : UsedForceOrThreatOfForce d c
  obstruction : ObstructedFreeExerciseOfReligion d v c
  intentional : ActedWithScienter d c
  commerceCircumstance : OffenseInOrAffectingInterstateCommerce c
  certification : AttorneyGeneralCertification c




structure Section247c (d : Person) (rp : ReligiousProperty) (c : ComplaintText) : Prop where
  religiousProperty : IsReligiousRealProperty rp c
  damage : DefacedDamagedOrDestroyedProperty d rp c
  intentional : ActedWithScienter d c
  raceColorOrEthnicityMotive : BecauseOfRaceColorOrEthnicityOfAssociatedIndividual d rp c
  certification : AttorneyGeneralCertification c


inductive Section247Violation
    (d : Person) (v : Person) (rp : ReligiousProperty) (c : ComplaintText) : Prop where
  | religiousCharacterDamage (h : Section247a1 d rp c)
  | freeExerciseObstruction (h : Section247a2 d v c)
  | raceOrEthnicityDamage (h : Section247c d rp c)



abbrev WithinSevenYearLimitation247 (d : Person) (c : ComplaintText) : Prop :=
  daysFromOffenseToCharge d c ≤ 2557



structure TimelyNoncapitalProsecution247
    (d : Person) (v : Person) (rp : ReligiousProperty) (c : ComplaintText) : Prop where
  violation : Section247Violation d v rp c
  timely : WithinSevenYearLimitation247 d c





inductive ProhibitedMeans248 (d : Person) (c : ComplaintText) : Prop where
  | forceOrThreat (h : UsedForceOrThreatOfForce d c)
  | physicalObstruction (h : UsedPhysicalObstruction d c)




inductive ReproductiveServicesNexus248 (d : Person) (v : Person) (c : ComplaintText) : Prop where
  | isOrHasBeenObtainingOrProviding (h : ObtainedOrProvidedReproductiveHealthServices v c)
  | toIntimidateFromServices (h : IntentToIntimidateFromReproductiveHealthServices d v c)



structure Section248a1 (d : Person) (v : Person) (c : ComplaintText) : Prop where
  means : ProhibitedMeans248 d c
  interference : InjuredIntimidatedOrInterfered d v c
  intentional : ActedWithScienter d c
  nexus : ReproductiveServicesNexus248 d v c
  notParentalCarveOut : ¬ ParentOrGuardianActingExclusivelyTowardMinor d v c
  notProtectedExpression : ¬ ProtectedFirstAmendmentExpressiveConduct d c


structure Section248a2
    (d : Person) (v : Person) (pw : PlaceOfWorship) (c : ComplaintText) : Prop where
  means : ProhibitedMeans248 d c
  interference : InjuredIntimidatedOrInterfered d v c
  intentional : ActedWithScienter d c
  worship : LawfullyExercisingReligiousFreedomAtPlaceOfWorship v pw c
  notParentalCarveOut : ¬ ParentOrGuardianActingExclusivelyTowardMinor d v c
  notProtectedExpression : ¬ ProtectedFirstAmendmentExpressiveConduct d c


inductive TargetedProperty248
    (d : Person) (f : Facility) (pw : PlaceOfWorship) (c : ComplaintText) : Prop where
  | reproductiveHealthFacility
      (hDamage : DamagedOrDestroyedFacilityProperty d f c)
      (hProvides : FacilityProvidesReproductiveHealthServices f c)
  | placeOfWorship
      (hDamage : DamagedOrDestroyedWorshipProperty d pw c)
      (hWorship : IsPlaceOfReligiousWorship pw c)


structure Section248a3
    (d : Person) (f : Facility) (pw : PlaceOfWorship) (c : ComplaintText) : Prop where
  target : TargetedProperty248 d f pw c
  intentional : ActedWithScienter d c
  notProtectedExpression : ¬ ProtectedFirstAmendmentExpressiveConduct d c


inductive Section248Violation
    (d : Person) (v : Person) (f : Facility) (pw : PlaceOfWorship) (c : ComplaintText) : Prop where
  | reproductiveHealthServices (h : Section248a1 d v c)
  | religiousFreedom (h : Section248a2 d v pw c)
  | propertyDamage (h : Section248a3 d f pw c)


inductive PrivateStanding248
    (pl : Person) (f : Facility) (pw : PlaceOfWorship) (c : ComplaintText) : Prop where
  | servicesParticipant (h : InvolvedInProvidingOrObtainingServices pl f c)
  | worshipperOrOwner (h : WorshipperOrOwnerOfPlaceOfWorship pl pw c)



structure ValidSection248CivilClaim
    (pl : Person) (d : Person) (v : Person) (f : Facility) (pw : PlaceOfWorship)
    (c : ComplaintText) : Prop where
  violation : Section248Violation d v f pw c
  aggrieved : IsPersonAggrieved pl c
  causation : ProximateCause pl c
  standing : PrivateStanding248 pl f pw c


structure AttorneyGeneralAction248
    (d : Person) (v : Person) (f : Facility) (pw : PlaceOfWorship) (c : ComplaintText) : Prop where
  violation : Section248Violation d v f pw c
  reasonableCause : ReasonableCauseToBelievePersonsInjured c



structure StateAttorneyGeneralAction248
    (d : Person) (v : Person) (f : Facility) (pw : PlaceOfWorship) (c : ComplaintText) : Prop where
  violation : Section248Violation d v f pw c
  reasonableCause : ReasonableCauseToBelievePersonsInjured c
  residents : NaturalPersonsResidingInStateInjured c

end Proving.USC.T18.Ch13.Reearn.Elements
