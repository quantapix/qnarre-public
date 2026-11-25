import Proving.USC.T18.Ch13.Reearn.Elements.Types
import Proving.USC.T18.Ch13.Reearn.Elements.Predicates
import Proving.USC.T18.Ch13.Reearn.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false









namespace Proving.USC.T18.Ch13.Reearn.Elements

open Proving.USC.Common



theorem federalActivity245b1_intro_voting {a : Activity} {c : ComplaintText}
    (h : VotingOrElectionActivity a c) : FederalActivity245b1 a c :=
  .voting h

theorem federalActivity245b1_intro_federalBenefit {a : Activity} {c : ComplaintText}
    (h : FederalBenefitOrProgramParticipation a c) : FederalActivity245b1 a c :=
  .federalBenefit h

theorem federalActivity245b1_intro_federalEmployment {a : Activity} {c : ComplaintText}
    (h : FederalEmploymentActivity a c) : FederalActivity245b1 a c :=
  .federalEmployment h

theorem federalActivity245b1_intro_federalJury {a : Activity} {c : ComplaintText}
    (h : FederalJuryService a c) : FederalActivity245b1 a c :=
  .federalJury h

theorem federalActivity245b1_intro_federallyAssisted {a : Activity} {c : ComplaintText}
    (h : FederallyAssistedProgramParticipation a c) : FederalActivity245b1 a c :=
  .federallyAssisted h

theorem publicAccommodationRoute245_intro {d : Person} {a : Activity} {c : ComplaintText}
    (hAcc : PublicAccommodationEnjoyment a c)
    (hNotExempt : ¬ SmallLodgingProprietorExempt d c) :
    PublicAccommodationRoute245 d a c :=
  ⟨hAcc, hNotExempt⟩

theorem stateOrPrivateActivity245b2_intro_publicSchool
    {d : Person} {a : Activity} {c : ComplaintText}
    (h : PublicSchoolOrCollegeAttendance a c) : StateOrPrivateActivity245b2 d a c :=
  .publicSchool h

theorem stateOrPrivateActivity245b2_intro_stateBenefit
    {d : Person} {a : Activity} {c : ComplaintText}
    (h : StateBenefitOrProgramParticipation a c) : StateOrPrivateActivity245b2 d a c :=
  .stateBenefit h

theorem stateOrPrivateActivity245b2_intro_employmentOrLabor
    {d : Person} {a : Activity} {c : ComplaintText}
    (h : EmploymentOrLaborOrganizationActivity a c) : StateOrPrivateActivity245b2 d a c :=
  .employmentOrLabor h

theorem stateOrPrivateActivity245b2_intro_stateJury
    {d : Person} {a : Activity} {c : ComplaintText}
    (h : StateJuryService a c) : StateOrPrivateActivity245b2 d a c :=
  .stateJury h

theorem stateOrPrivateActivity245b2_intro_interstateTravel
    {d : Person} {a : Activity} {c : ComplaintText}
    (h : InterstateTravelOrCommonCarrierUse a c) : StateOrPrivateActivity245b2 d a c :=
  .interstateTravel h

theorem stateOrPrivateActivity245b2_intro_publicAccommodation
    {d : Person} {a : Activity} {c : ComplaintText}
    (h : PublicAccommodationRoute245 d a c) : StateOrPrivateActivity245b2 d a c :=
  .publicAccommodation h

theorem enumeratedActivity245_intro_federal {d : Person} {a : Activity} {c : ComplaintText}
    (h : FederalActivity245b1 a c) : EnumeratedActivity245 d a c :=
  .federal h

theorem enumeratedActivity245_intro_stateOrPrivate {d : Person} {a : Activity} {c : ComplaintText}
    (h : StateOrPrivateActivity245b2 d a c) : EnumeratedActivity245 d a c :=
  .stateOrPrivate h

theorem activityNexus245_intro_becauseOfPastOrPresentParticipation
    {d v : Person} {a : Activity} {c : ComplaintText}
    (h : VictimEngagedInProtectedActivity v a c) : ActivityNexus245 d v a c :=
  .becauseOfPastOrPresentParticipation h

theorem activityNexus245_intro_toIntimidateFromParticipation
    {d v : Person} {a : Activity} {c : ComplaintText}
    (h : IntentToIntimidateFromProtectedActivity d v a c) : ActivityNexus245 d v a c :=
  .toIntimidateFromParticipation h

theorem section245b1_intro {d v : Person} {a : Activity} {c : ComplaintText}
    (hActivity : FederalActivity245b1 a c) (hNexus : ActivityNexus245 d v a c) :
    Section245b1 d v a c :=
  ⟨hActivity, hNexus⟩

theorem section245b2_intro {d v : Person} {a : Activity} {c : ComplaintText}
    (hActivity : StateOrPrivateActivity245b2 d a c)
    (hEngaged : VictimEngagedInProtectedActivity v a c)
    (hGround : IntentToDiscriminate d c) :
    Section245b2 d v a c :=
  ⟨hActivity, hEngaged, hGround⟩

theorem section245b3_intro {d v : Person} {e : Entity} {c : ComplaintText}
    (hRiot : DuringOrIncidentToRiotOrCivilDisorder c)
    (hBusiness : VictimEngagedInBusiness v e c)
    (hCommerce : EngagedInInterstateCommerce e c) :
    Section245b3 d v e c :=
  ⟨hRiot, hBusiness, hCommerce⟩

theorem participation245b4a_intro {d v : Person} {a : Activity} {c : ComplaintText}
    (hActivity : EnumeratedActivity245 d a c)
    (hParticipation : ParticipatedWithoutDiscrimination v a c)
    (hNotExempt : ¬ SmallLodgingProprietorExempt d c) :
    Participation245b4a d v a c :=
  ⟨hActivity, hParticipation, hNotExempt⟩

theorem participation245b4_intro_participatingWithoutDiscrimination
    {d v : Person} {a : Activity} {c : ComplaintText}
    (h : Participation245b4a d v a c) : Participation245b4 d v a c :=
  .participatingWithoutDiscrimination h

theorem participation245b4_intro_affordingOpportunityOrProtection
    {d v : Person} {a : Activity} {c : ComplaintText}
    (h : AffordedOpportunityOrProtectionToParticipate v a c) : Participation245b4 d v a c :=
  .affordingOpportunityOrProtection h

theorem section245b4_intro {d v : Person} {a : Activity} {c : ComplaintText}
    (hParticipation : Participation245b4 d v a c) (hNexus : ActivityNexus245 d v a c) :
    Section245b4 d v a c :=
  ⟨hParticipation, hNexus⟩

theorem protectedSpeechOpposingDenial245_intro {v : Person} {c : ComplaintText}
    (hSpeech : ParticipatedInSpeechOrPeacefulAssemblyOpposingDenial v c)
    (hNotIncitement : ¬ AidedAbettedOrIncitedRiotOrViolence v c) :
    ProtectedSpeechOpposingDenial245 v c :=
  ⟨hSpeech, hNotIncitement⟩

theorem citizenConduct245b5_intro_aidingOrEncouraging
    {v : Person} {a : Activity} {c : ComplaintText}
    (h : LawfullyAidedOrEncouragedParticipation v a c) : CitizenConduct245b5 v a c :=
  .aidingOrEncouraging h

theorem citizenConduct245b5_intro_opposingSpeechOrAssembly
    {v : Person} {a : Activity} {c : ComplaintText}
    (h : ProtectedSpeechOpposingDenial245 v c) : CitizenConduct245b5 v a c :=
  .opposingSpeechOrAssembly h

theorem section245b5_intro {d v : Person} {a : Activity} {c : ComplaintText}
    (hCitizen : IsCitizen v c) (hConduct : CitizenConduct245b5 v a c)
    (hNexus : ActivityNexus245 d v a c) :
    Section245b5 d v a c :=
  ⟨hCitizen, hConduct, hNexus⟩

theorem protectedActivityTheory245b_intro_federalActivity
    {d v : Person} {a : Activity} {e : Entity} {c : ComplaintText}
    (h : Section245b1 d v a c) : ProtectedActivityTheory245b d v a e c :=
  .federalActivity h

theorem protectedActivityTheory245b_intro_discriminatoryDenial
    {d v : Person} {a : Activity} {e : Entity} {c : ComplaintText}
    (h : Section245b2 d v a c) : ProtectedActivityTheory245b d v a e c :=
  .discriminatoryDenial h

theorem protectedActivityTheory245b_intro_riotAgainstCommerce
    {d v : Person} {a : Activity} {e : Entity} {c : ComplaintText}
    (h : Section245b3 d v e c) : ProtectedActivityTheory245b d v a e c :=
  .riotAgainstCommerce h

theorem protectedActivityTheory245b_intro_participationWithoutDiscrimination
    {d v : Person} {a : Activity} {e : Entity} {c : ComplaintText}
    (h : Section245b4 d v a c) : ProtectedActivityTheory245b d v a e c :=
  .participationWithoutDiscrimination h

theorem protectedActivityTheory245b_intro_citizenSupport
    {d v : Person} {a : Activity} {e : Entity} {c : ComplaintText}
    (h : Section245b5 d v a c) : ProtectedActivityTheory245b d v a e c :=
  .citizenSupport h

theorem section245b_intro {d v : Person} {a : Activity} {e : Entity} {c : ComplaintText}
    (hForce : UsedForceOrThreatOfForce d c)
    (hInterference : InjuredIntimidatedOrInterfered d v c)
    (hWillful : ActedWithScienter d c)
    (hTheory : ProtectedActivityTheory245b d v a e c)
    (hCertification : AttorneyGeneralCertification c)
    (hNotOfficer : ¬ LawfullyActingLawEnforcementOfficer d c) :
    Section245b d v a e c :=
  ⟨hForce, hInterference, hWillful, hTheory, hCertification, hNotOfficer⟩



theorem section247a1_intro {d : Person} {rp : ReligiousProperty} {c : ComplaintText}
    (hProperty : IsReligiousRealProperty rp c)
    (hDamage : DefacedDamagedOrDestroyedProperty d rp c)
    (hIntent : ActedWithScienter d c)
    (hMotive : BecauseOfReligiousCharacterOfProperty d rp c)
    (hCommerce : OffenseInOrAffectingInterstateCommerce c)
    (hCertification : AttorneyGeneralCertification c) :
    Section247a1 d rp c :=
  ⟨hProperty, hDamage, hIntent, hMotive, hCommerce, hCertification⟩

theorem section247a2_intro {d v : Person} {c : ComplaintText}
    (hForce : UsedForceOrThreatOfForce d c)
    (hObstruction : ObstructedFreeExerciseOfReligion d v c)
    (hIntent : ActedWithScienter d c)
    (hCommerce : OffenseInOrAffectingInterstateCommerce c)
    (hCertification : AttorneyGeneralCertification c) :
    Section247a2 d v c :=
  ⟨hForce, hObstruction, hIntent, hCommerce, hCertification⟩

theorem section247c_intro {d : Person} {rp : ReligiousProperty} {c : ComplaintText}
    (hProperty : IsReligiousRealProperty rp c)
    (hDamage : DefacedDamagedOrDestroyedProperty d rp c)
    (hIntent : ActedWithScienter d c)
    (hMotive : BecauseOfRaceColorOrEthnicityOfAssociatedIndividual d rp c)
    (hCertification : AttorneyGeneralCertification c) :
    Section247c d rp c :=
  ⟨hProperty, hDamage, hIntent, hMotive, hCertification⟩

theorem section247Violation_intro_religiousCharacterDamage
    {d v : Person} {rp : ReligiousProperty} {c : ComplaintText}
    (h : Section247a1 d rp c) : Section247Violation d v rp c :=
  .religiousCharacterDamage h

theorem section247Violation_intro_freeExerciseObstruction
    {d v : Person} {rp : ReligiousProperty} {c : ComplaintText}
    (h : Section247a2 d v c) : Section247Violation d v rp c :=
  .freeExerciseObstruction h

theorem section247Violation_intro_raceOrEthnicityDamage
    {d v : Person} {rp : ReligiousProperty} {c : ComplaintText}
    (h : Section247c d rp c) : Section247Violation d v rp c :=
  .raceOrEthnicityDamage h

theorem timelyNoncapitalProsecution247_intro
    {d v : Person} {rp : ReligiousProperty} {c : ComplaintText}
    (hViolation : Section247Violation d v rp c)
    (hTimely : WithinSevenYearLimitation247 d c) :
    TimelyNoncapitalProsecution247 d v rp c :=
  ⟨hViolation, hTimely⟩



theorem prohibitedMeans248_intro_forceOrThreat {d : Person} {c : ComplaintText}
    (h : UsedForceOrThreatOfForce d c) : ProhibitedMeans248 d c :=
  .forceOrThreat h

theorem prohibitedMeans248_intro_physicalObstruction {d : Person} {c : ComplaintText}
    (h : UsedPhysicalObstruction d c) : ProhibitedMeans248 d c :=
  .physicalObstruction h

theorem reproductiveServicesNexus248_intro_isOrHasBeenObtainingOrProviding
    {d v : Person} {c : ComplaintText}
    (h : ObtainedOrProvidedReproductiveHealthServices v c) :
    ReproductiveServicesNexus248 d v c :=
  .isOrHasBeenObtainingOrProviding h

theorem reproductiveServicesNexus248_intro_toIntimidateFromServices
    {d v : Person} {c : ComplaintText}
    (h : IntentToIntimidateFromReproductiveHealthServices d v c) :
    ReproductiveServicesNexus248 d v c :=
  .toIntimidateFromServices h

theorem section248a1_intro {d v : Person} {c : ComplaintText}
    (hMeans : ProhibitedMeans248 d c)
    (hInterference : InjuredIntimidatedOrInterfered d v c)
    (hIntent : ActedWithScienter d c)
    (hNexus : ReproductiveServicesNexus248 d v c)
    (hNotParental : ¬ ParentOrGuardianActingExclusivelyTowardMinor d v c)
    (hNotExpression : ¬ ProtectedFirstAmendmentExpressiveConduct d c) :
    Section248a1 d v c :=
  ⟨hMeans, hInterference, hIntent, hNexus, hNotParental, hNotExpression⟩

theorem section248a2_intro {d v : Person} {pw : PlaceOfWorship} {c : ComplaintText}
    (hMeans : ProhibitedMeans248 d c)
    (hInterference : InjuredIntimidatedOrInterfered d v c)
    (hIntent : ActedWithScienter d c)
    (hWorship : LawfullyExercisingReligiousFreedomAtPlaceOfWorship v pw c)
    (hNotParental : ¬ ParentOrGuardianActingExclusivelyTowardMinor d v c)
    (hNotExpression : ¬ ProtectedFirstAmendmentExpressiveConduct d c) :
    Section248a2 d v pw c :=
  ⟨hMeans, hInterference, hIntent, hWorship, hNotParental, hNotExpression⟩

theorem targetedProperty248_intro_reproductiveHealthFacility
    {d : Person} {f : Facility} {pw : PlaceOfWorship} {c : ComplaintText}
    (hDamage : DamagedOrDestroyedFacilityProperty d f c)
    (hProvides : FacilityProvidesReproductiveHealthServices f c) :
    TargetedProperty248 d f pw c :=
  .reproductiveHealthFacility hDamage hProvides

theorem targetedProperty248_intro_placeOfWorship
    {d : Person} {f : Facility} {pw : PlaceOfWorship} {c : ComplaintText}
    (hDamage : DamagedOrDestroyedWorshipProperty d pw c)
    (hWorship : IsPlaceOfReligiousWorship pw c) :
    TargetedProperty248 d f pw c :=
  .placeOfWorship hDamage hWorship

theorem section248a3_intro {d : Person} {f : Facility} {pw : PlaceOfWorship} {c : ComplaintText}
    (hTarget : TargetedProperty248 d f pw c)
    (hIntent : ActedWithScienter d c)
    (hNotExpression : ¬ ProtectedFirstAmendmentExpressiveConduct d c) :
    Section248a3 d f pw c :=
  ⟨hTarget, hIntent, hNotExpression⟩

theorem section248Violation_intro_reproductiveHealthServices
    {d v : Person} {f : Facility} {pw : PlaceOfWorship} {c : ComplaintText}
    (h : Section248a1 d v c) : Section248Violation d v f pw c :=
  .reproductiveHealthServices h

theorem section248Violation_intro_religiousFreedom
    {d v : Person} {f : Facility} {pw : PlaceOfWorship} {c : ComplaintText}
    (h : Section248a2 d v pw c) : Section248Violation d v f pw c :=
  .religiousFreedom h

theorem section248Violation_intro_propertyDamage
    {d v : Person} {f : Facility} {pw : PlaceOfWorship} {c : ComplaintText}
    (h : Section248a3 d f pw c) : Section248Violation d v f pw c :=
  .propertyDamage h

theorem privateStanding248_intro_servicesParticipant
    {pl : Person} {f : Facility} {pw : PlaceOfWorship} {c : ComplaintText}
    (h : InvolvedInProvidingOrObtainingServices pl f c) : PrivateStanding248 pl f pw c :=
  .servicesParticipant h

theorem privateStanding248_intro_worshipperOrOwner
    {pl : Person} {f : Facility} {pw : PlaceOfWorship} {c : ComplaintText}
    (h : WorshipperOrOwnerOfPlaceOfWorship pl pw c) : PrivateStanding248 pl f pw c :=
  .worshipperOrOwner h

theorem validSection248CivilClaim_intro
    {pl d v : Person} {f : Facility} {pw : PlaceOfWorship} {c : ComplaintText}
    (hViolation : Section248Violation d v f pw c)
    (hAggrieved : IsPersonAggrieved pl c)
    (hCausation : ProximateCause pl c)
    (hStanding : PrivateStanding248 pl f pw c) :
    ValidSection248CivilClaim pl d v f pw c :=
  ⟨hViolation, hAggrieved, hCausation, hStanding⟩

theorem attorneyGeneralAction248_intro
    {d v : Person} {f : Facility} {pw : PlaceOfWorship} {c : ComplaintText}
    (hViolation : Section248Violation d v f pw c)
    (hCause : ReasonableCauseToBelievePersonsInjured c) :
    AttorneyGeneralAction248 d v f pw c :=
  ⟨hViolation, hCause⟩

theorem stateAttorneyGeneralAction248_intro
    {d v : Person} {f : Facility} {pw : PlaceOfWorship} {c : ComplaintText}
    (hViolation : Section248Violation d v f pw c)
    (hCause : ReasonableCauseToBelievePersonsInjured c)
    (hResidents : NaturalPersonsResidingInStateInjured c) :
    StateAttorneyGeneralAction248 d v f pw c :=
  ⟨hViolation, hCause, hResidents⟩

end Proving.USC.T18.Ch13.Reearn.Elements
