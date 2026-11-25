






import Proving.USC.T18.Ch13.Reslice.Ontology.Types
import Proving.USC.T18.Ch13.Reslice.Ontology.Predicates
import Proving.USC.T18.Ch13.Reslice.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reslice.Ontology

open Proving.USC.Common




theorem stateMembership_intro
    {j : Jurisdiction} {c : ComplaintText} (h : IsStateOfTheUnitedStates j c)
    : StateMembership j c :=
  StateMembership.stateOfTheUnitedStates h

theorem stateMembership_intro_districtOfColumbia
    {j : Jurisdiction} {c : ComplaintText} (h : IsDistrictOfColumbia j c)
    : StateMembership j c :=
  StateMembership.districtOfColumbia h

theorem stateMembership_intro_commonwealthTerritoryOrPossession
    {j : Jurisdiction} {c : ComplaintText} (h : IsCommonwealthTerritoryOrPossession j c)
    : StateMembership j c :=
  StateMembership.commonwealthTerritoryOrPossession h



theorem lawEnforcementOfficerMembership_intro
    {p : Person} {j : Jurisdiction} {c : ComplaintText}
    (hOfficer : IsOfficerOfCoveredGovernment p j c)
    (hState : StateMembership j c)
    (hEmpowered : IsEmpoweredToInvestigateOrArrest p c)
    : LawEnforcementOfficerMembership p j c :=
  ⟨hOfficer, hState, hEmpowered⟩

theorem lawfulOfficerConductExclusion_intro
    {p : Person} {j : Jurisdiction} {act : Conduct} {c : ComplaintText}
    (hOfficer : LawEnforcementOfficerMembership p j c)
    (hLawful : IsLawfullyCarryingOutOfficialDuties p act c)
    : LawfulOfficerConductExclusion p j act c :=
  ⟨hOfficer, hLawful⟩



theorem federalBenefitOrActivityMembership_intro
    {a : ProtectedActivity} {c : ComplaintText} (h : IsVotingOrElectionParticipation a c)
    : FederalBenefitOrActivityMembership a c :=
  FederalBenefitOrActivityMembership.votingOrElection h

theorem federalBenefitOrActivityMembership_intro_federallyProvidedBenefit
    {a : ProtectedActivity} {c : ComplaintText} (h : IsFederallyProvidedBenefitOrService a c)
    : FederalBenefitOrActivityMembership a c :=
  FederalBenefitOrActivityMembership.federallyProvidedBenefit h

theorem federalBenefitOrActivityMembership_intro_federalEmployment
    {a : ProtectedActivity} {c : ComplaintText} (h : IsFederalEmploymentOrPerquisite a c)
    : FederalBenefitOrActivityMembership a c :=
  FederalBenefitOrActivityMembership.federalEmployment h

theorem federalBenefitOrActivityMembership_intro_federalJuryService
    {a : ProtectedActivity} {c : ComplaintText} (h : IsFederalJuryService a c)
    : FederalBenefitOrActivityMembership a c :=
  FederalBenefitOrActivityMembership.federalJuryService h

theorem federalBenefitOrActivityMembership_intro_federallyAssistedProgram
    {a : ProtectedActivity} {c : ComplaintText} (h : IsFederallyAssistedProgramOrActivity a c)
    : FederalBenefitOrActivityMembership a c :=
  FederalBenefitOrActivityMembership.federallyAssistedProgram h



theorem stateOrPrivateBenefitOrActivityMembership_intro
    {a : ProtectedActivity} {c : ComplaintText} (h : IsPublicSchoolOrCollegeAttendance a c)
    : StateOrPrivateBenefitOrActivityMembership a c :=
  StateOrPrivateBenefitOrActivityMembership.publicSchoolOrCollege h

theorem stateOrPrivateBenefitOrActivityMembership_intro_stateProvidedBenefit
    {a : ProtectedActivity} {c : ComplaintText} (h : IsStateProvidedBenefitOrService a c)
    : StateOrPrivateBenefitOrActivityMembership a c :=
  StateOrPrivateBenefitOrActivityMembership.stateProvidedBenefit h

theorem stateOrPrivateBenefitOrActivityMembership_intro_employmentOrLaborOrganization
    {a : ProtectedActivity} {c : ComplaintText}
    (h : IsPrivateOrStateEmploymentOrLaborOrganizationUse a c)
    : StateOrPrivateBenefitOrActivityMembership a c :=
  StateOrPrivateBenefitOrActivityMembership.employmentOrLaborOrganization h

theorem stateOrPrivateBenefitOrActivityMembership_intro_stateJuryService
    {a : ProtectedActivity} {c : ComplaintText} (h : IsStateJuryService a c)
    : StateOrPrivateBenefitOrActivityMembership a c :=
  StateOrPrivateBenefitOrActivityMembership.stateJuryService h

theorem stateOrPrivateBenefitOrActivityMembership_intro_interstateTravel
    {a : ProtectedActivity} {c : ComplaintText} (h : IsInterstateTravelOrCommonCarrierUse a c)
    : StateOrPrivateBenefitOrActivityMembership a c :=
  StateOrPrivateBenefitOrActivityMembership.interstateTravelOrCommonCarrier h

theorem stateOrPrivateBenefitOrActivityMembership_intro_publicAccommodation
    {a : ProtectedActivity} {c : ComplaintText} (est : Establishment)
    (h : IsEnjoymentOfPublicAccommodation a est c)
    : StateOrPrivateBenefitOrActivityMembership a c :=
  StateOrPrivateBenefitOrActivityMembership.publicAccommodation est h



theorem federallyProtectedActivityMembership_intro
    {a : ProtectedActivity} {c : ComplaintText} (h : FederalBenefitOrActivityMembership a c)
    : FederallyProtectedActivityMembership a c :=
  FederallyProtectedActivityMembership.federal h

theorem federallyProtectedActivityMembership_intro_stateOrPrivate
    {a : ProtectedActivity} {c : ComplaintText}
    (h : StateOrPrivateBenefitOrActivityMembership a c)
    : FederallyProtectedActivityMembership a c :=
  FederallyProtectedActivityMembership.stateOrPrivate h



theorem publicAccommodationMembership_intro
    {est : Establishment} {c : ComplaintText}
    (h : IsLodgingEstablishmentForTransientGuests est c)
    : PublicAccommodationMembership est c :=
  PublicAccommodationMembership.lodgingForTransientGuests h

theorem publicAccommodationMembership_intro_foodOrBeverage
    {est : Establishment} {c : ComplaintText}
    (h : IsFoodOrBeverageEstablishmentServingPublic est c)
    : PublicAccommodationMembership est c :=
  PublicAccommodationMembership.foodOrBeverage h

theorem publicAccommodationMembership_intro_gasolineStation
    {est : Establishment} {c : ComplaintText} (h : IsGasolineStation est c)
    : PublicAccommodationMembership est c :=
  PublicAccommodationMembership.gasolineStation h

theorem publicAccommodationMembership_intro_exhibitionOrEntertainment
    {est : Establishment} {c : ComplaintText}
    (h : IsPlaceOfExhibitionOrEntertainmentServingPublic est c)
    : PublicAccommodationMembership est c :=
  PublicAccommodationMembership.exhibitionOrEntertainment h

theorem publicAccommodationMembership_intro_coLocatedServingPatrons
    {est : Establishment} {c : ComplaintText}
    (hServes : ServesThePublic est c)
    (hLocated : IsPhysicallyCoLocatedWithCoveredEstablishment est c)
    (hHoldsOut : HoldsItselfOutAsServingPatrons est c)
    : PublicAccommodationMembership est c :=
  PublicAccommodationMembership.coLocatedServingPatrons hServes hLocated hHoldsOut




theorem hasAtMostFiveRoomsForRentOrHire_intro
    {est : Establishment} {c : ComplaintText} (h : roomsForRentOrHire est c ≤ 5)
    : HasAtMostFiveRoomsForRentOrHire est c := h

theorem ownerOccupiedSmallLodgingExemption_intro
    {est : Establishment} {p : Person} {c : ComplaintText}
    (hLodging : IsLodgingEstablishmentForTransientGuests est c)
    (hProprietor : IsProprietorOrEmployeeOfEstablishment p est c)
    (hRooms : HasAtMostFiveRoomsForRentOrHire est c)
    (hResidence : IsActuallyOccupiedByProprietorAsResidence est c)
    : OwnerOccupiedSmallLodgingExemption est p c :=
  ⟨hLodging, hProprietor, hRooms, hResidence⟩



theorem riotIncidentCommerceVictimMembership_intro
    {p : Person} {act : Conduct} {c : ComplaintText}
    (hBusiness : IsPersonEngagedInBusinessInOrAffectingCommerce p c)
    (hRiot : IsDuringOrIncidentToRiotOrCivilDisorder act c)
    : RiotIncidentCommerceVictimMembership p act c :=
  ⟨hBusiness, hRiot⟩

theorem nondiscriminatoryParticipationMembership_intro
    {p : Person} {a : ProtectedActivity} {c : ComplaintText}
    (hActivity : FederallyProtectedActivityMembership a c)
    (hParticipates : IsParticipatingInActivity p a c)
    (hNoDiscrimination : ¬ IsDiscriminationOnProtectedGroundInParticipation p a c)
    : NondiscriminatoryParticipationMembership p a c :=
  ⟨hActivity, hParticipates, hNoDiscrimination⟩

theorem affordingParticipationMembership_intro
    {p : Person} {a : ProtectedActivity} {c : ComplaintText}
    (hActivity : FederallyProtectedActivityMembership a c)
    (hAffords : IsAffordingOpportunityOrProtectionToParticipate p a c)
    : AffordingParticipationMembership p a c :=
  ⟨hActivity, hAffords⟩

theorem lawfulAidingOfParticipationMembership_intro
    {p : Person} {a : ProtectedActivity} {c : ComplaintText}
    (hCitizen : IsCitizen p c)
    (hActivity : FederallyProtectedActivityMembership a c)
    (hAids : IsLawfullyAidingOrEncouragingParticipation p a c)
    : LawfulAidingOfParticipationMembership p a c :=
  ⟨hCitizen, hActivity, hAids⟩

theorem lawfulSpeechOrAssemblyMembership_intro
    {act : Conduct} {c : ComplaintText}
    (hSpeech : IsSpeechOrPeacefulAssemblyOpposingDenial act c)
    (hNotIncitement : ¬ IsAidingAbettingOrIncitingRiotOrViolence act c)
    : LawfulSpeechOrAssemblyMembership act c :=
  ⟨hSpeech, hNotIncitement⟩



theorem religiousRealPropertyMembership_intro
    {rp : RealProperty} {c : ComplaintText} (h : IsPlaceOfReligiousWorship rp c)
    : ReligiousRealPropertyMembership rp c :=
  ReligiousRealPropertyMembership.placeOfWorship h

theorem religiousRealPropertyMembership_intro_religiousCemetery
    {rp : RealProperty} {c : ComplaintText} (h : IsReligiousCemetery rp c)
    : ReligiousRealPropertyMembership rp c :=
  ReligiousRealPropertyMembership.religiousCemetery h

theorem religiousRealPropertyMembership_intro_otherReligiousRealProperty
    {rp : RealProperty} {c : ComplaintText} (h : IsOtherReligiousRealProperty rp c)
    : ReligiousRealPropertyMembership rp c :=
  ReligiousRealPropertyMembership.otherReligiousRealProperty h

theorem religiousRealPropertyMembership_intro_fixtureWithinPlaceOfWorship
    {rp : RealProperty} {c : ComplaintText} (house : RealProperty)
    (hHouse : IsPlaceOfReligiousWorship house c)
    (h : IsReligiousFixtureWithinPlaceOfWorship rp house c)
    : ReligiousRealPropertyMembership rp c :=
  ReligiousRealPropertyMembership.fixtureWithinPlaceOfWorship house hHouse h

theorem religiousRealPropertyMembership_intro_ownedByReligiousNonprofit
    {rp : RealProperty} {c : ComplaintText} (org : Entity)
    (hOrg : IsNonprofitReligiouslyAffiliatedOrganization org c)
    (h : IsPropertyOwnedOrLeasedByOrganization rp org c)
    : ReligiousRealPropertyMembership rp c :=
  ReligiousRealPropertyMembership.ownedByReligiousNonprofit org hOrg h

theorem religiouslyCharacterizedPropertyMembership_intro
    {rp : RealProperty} {c : ComplaintText}
    (hProperty : ReligiousRealPropertyMembership rp c)
    (hCharacter : HasReligiousCharacter rp c)
    : ReligiouslyCharacterizedPropertyMembership rp c :=
  ⟨hProperty, hCharacter⟩



theorem section247CircumstanceMembership_intro
    {act : Conduct} {c : ComplaintText}
    (h : IsInOrAffectingInterstateOrForeignCommerce act c)
    : Section247CircumstanceMembership act c :=
  ⟨h⟩


theorem withinSection247LimitationsPeriod_intro
    {act : Conduct} {c : ComplaintText}
    (h : yearsFromOffenseToChargingInstrument act c ≤ 7)
    : WithinSection247LimitationsPeriod act c := h

theorem prosecutableNoncapitalSection247Offense_intro
    {act : Conduct} {c : ComplaintText}
    (hNoncapital : IsNoncapitalOffenseUnderSection247 act c)
    (hTimely : WithinSection247LimitationsPeriod act c)
    : ProsecutableNoncapitalSection247Offense act c :=
  ⟨hNoncapital, hTimely⟩



theorem facilityMembership_intro
    {f : Facility} {c : ComplaintText} (h : ProvidesReproductiveHealthServices f c)
    : FacilityMembership f c :=
  FacilityMembership.providesReproductiveHealthServices h

theorem facilityMembership_intro_buildingHousingFacility
    {f : Facility} {c : ComplaintText} (h : IsBuildingOrStructureHousingFacility f c)
    : FacilityMembership f c :=
  FacilityMembership.buildingHousingFacility h

theorem interfereWithMembership_intro
    {act : Conduct} {p : Person} {c : ComplaintText}
    (h : RestrictsFreedomOfMovement act p c)
    : InterfereWithMembership act p c :=
  ⟨h⟩

theorem intimidateMembership_intro
    {act : Conduct} {p : Person} {c : ComplaintText}
    (h : PlacesInReasonableApprehensionOfBodilyHarm act p c)
    : IntimidateMembership act p c :=
  ⟨h⟩

theorem physicalObstructionMembership_intro
    {act : Conduct} {c : ComplaintText} (h : RendersIngressOrEgressImpassable act c)
    : PhysicalObstructionMembership act c :=
  PhysicalObstructionMembership.rendersImpassable h

theorem physicalObstructionMembership_intro_unreasonablyDifficultOrHazardous
    {act : Conduct} {c : ComplaintText}
    (h : RendersPassageUnreasonablyDifficultOrHazardous act c)
    : PhysicalObstructionMembership act c :=
  PhysicalObstructionMembership.rendersUnreasonablyDifficultOrHazardous h

theorem reproductiveHealthServicesMembership_intro
    {s : HealthService} {f : Facility} {c : ComplaintText}
    (hProvided : ProvidedInHealthCareFacility s f c)
    (hSubject : RelatesToHumanReproductiveSystem s c)
    : ReproductiveHealthServicesMembership s f c :=
  ⟨hProvided, hSubject⟩

theorem nonviolentPhysicalObstructionMembership_intro
    {act : Conduct} {c : ComplaintText}
    (hObstruction : PhysicalObstructionMembership act c)
    (hNonviolent : ¬ InvolvesForceOrThreatOfForce act c)
    : NonviolentPhysicalObstructionMembership act c :=
  ⟨hObstruction, hNonviolent⟩



theorem aggrievedClaimantMembership_intro
    {c : ComplaintText} (p : Person) (f : Facility)
    (hFacility : FacilityMembership f c)
    (h : IsProviderOrRecipientOfServicesAtFacility p f c)
    : AggrievedClaimantMembership c :=
  AggrievedClaimantMembership.serviceParticipantAtFacility p f hFacility h

theorem aggrievedClaimantMembership_intro_worshipper
    {c : ComplaintText} (p : Person) (rp : RealProperty)
    (hPlace : IsPlaceOfReligiousWorship rp c)
    (h : IsExercisingReligiousFreedomAtPlaceOfWorship p rp c)
    : AggrievedClaimantMembership c :=
  AggrievedClaimantMembership.worshipperAtPlaceOfWorship p rp hPlace h

theorem aggrievedClaimantMembership_intro_entityOwner
    {c : ComplaintText} (org : Entity) (rp : RealProperty)
    (hPlace : IsPlaceOfReligiousWorship rp c)
    (h : IsEntityOwningOrOperatingPlaceOfWorship org rp c)
    : AggrievedClaimantMembership c :=
  AggrievedClaimantMembership.entityOwningPlaceOfWorship org rp hPlace h

theorem protectedExpressiveConductExclusion_intro
    {act : Conduct} {c : ComplaintText}
    (hExpressive : IsExpressiveConduct act c)
    (hProtected : IsProtectedByFirstAmendment act c)
    : ProtectedExpressiveConductExclusion act c :=
  ⟨hExpressive, hProtected⟩

theorem parentalGuardianExemption_intro
    {p : Person} {m : Person} {act : Conduct} {c : ComplaintText}
    (hParent : IsParentOrLegalGuardianOf p m c)
    (hMinor : IsMinor m c)
    (hDirected : IsDirectedExclusivelyAt act m c)
    : ParentalGuardianExemption p m act c :=
  ⟨hParent, hMinor, hDirected⟩

end Proving.USC.T18.Ch13.Reslice.Ontology
