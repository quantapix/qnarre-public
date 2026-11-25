











import Proving.USC.T18.Ch13.Reslice.Ontology.Types
import Proving.USC.T18.Ch13.Reslice.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reslice.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  deriving Repr



def edge_lawEnforcementOfficer_dependsOn_state : DefEdge :=
  { defined := "law enforcement officer", dependsOn := "State",
    citeDefine := "18 USC § 245(c)" }



def edge_protectedActivity_dependsOn_publicAccommodation : DefEdge :=
  { defined := "benefits or activities described in subparagraphs (2)(A) through (2)(F)",
    dependsOn := "establishment which serves the public",
    citeDefine := "18 USC § 245(b)(2)(F)" }



def edge_nondiscriminatoryParticipation_dependsOn_protectedActivity : DefEdge :=
  { defined := "participating, without discrimination …, in any of the benefits or activities described",
    dependsOn := "benefits or activities described in subparagraphs (1)(A) through (2)(F)",
    citeDefine := "18 USC § 245(b)(4)(A)" }



def edge_affordingParticipation_dependsOn_protectedActivity : DefEdge :=
  { defined := "affording another person or class of persons opportunity or protection to so participate",
    dependsOn := "benefits or activities described in subparagraphs (1)(A) through (2)(F)",
    citeDefine := "18 USC § 245(b)(4)(B)" }



def edge_aidingParticipation_dependsOn_protectedActivity : DefEdge :=
  { defined := "lawfully aiding or encouraging other persons to participate",
    dependsOn := "benefits or activities described in subparagraphs (1)(A) through (2)(F)",
    citeDefine := "18 USC § 245(b)(5)" }



def edge_lawfulSpeechOrAssembly_dependsOn_incitement : DefEdge :=
  { defined := "participating lawfully in speech or peaceful assembly",
    dependsOn := "aiding, abetting, or inciting … to riot",
    citeDefine := "18 USC § 245(b)" }



def edge_publicAccommodation_dependsOn_smallLodgingCarveOut : DefEdge :=
  { defined := "establishment which provides lodging to transient guests",
    dependsOn := "building which contains not more than five rooms for rent or hire",
    citeDefine := "18 USC § 245(b)" }



def edge_religiousRealProperty_dependsOn_placeOfWorship : DefEdge :=
  { defined := "religious real property", dependsOn := "place of religious worship",
    citeDefine := "18 USC § 247(f)" }



def edge_religiousRealProperty_dependsOn_religiousNonprofit : DefEdge :=
  { defined := "religious real property",
    dependsOn := "nonprofit, religiously affiliated organization",
    citeDefine := "18 USC § 247(f)" }



def edge_section247Circumstances_dependsOn_commerce : DefEdge :=
  { defined := "the circumstances referred to in subsection (a)",
    dependsOn := "in or affects interstate or foreign commerce",
    citeDefine := "18 USC § 247(b)" }


def edge_prosecutableSection247Offense_dependsOn_noncapital : DefEdge :=
  { defined := "noncapital offense under this section prosecutable",
    dependsOn := "noncapital offense under this section",
    citeDefine := "18 USC § 247(g)" }


def edge_facility_dependsOn_reproductiveHealthServices : DefEdge :=
  { defined := "facility", dependsOn := "reproductive health services",
    citeDefine := "18 USC § 248(e)(1)" }




def edge_reproductiveHealthServices_dependsOn_facility : DefEdge :=
  { defined := "reproductive health services",
    dependsOn := "hospital, clinic, physician's office, or other facility",
    citeDefine := "18 USC § 248(e)(5)" }


def edge_physicalObstruction_dependsOn_facility : DefEdge :=
  { defined := "physical obstruction", dependsOn := "facility",
    citeDefine := "18 USC § 248(e)(4)" }



def edge_physicalObstruction_dependsOn_placeOfWorship : DefEdge :=
  { defined := "physical obstruction", dependsOn := "place of religious worship",
    citeDefine := "18 USC § 248(e)(4)" }



def edge_intimidate_dependsOn_bodilyHarm : DefEdge :=
  { defined := "intimidate", dependsOn := "bodily harm",
    citeDefine := "18 USC § 248(e)(3)" }


def edge_nonviolentPhysicalObstruction_dependsOn_physicalObstruction : DefEdge :=
  { defined := "nonviolent physical obstruction", dependsOn := "physical obstruction",
    citeDefine := "18 USC § 248(b)" }


def edge_personAggrieved_dependsOn_facility : DefEdge :=
  { defined := "person aggrieved", dependsOn := "facility",
    citeDefine := "18 USC § 248(c)(1)(A)" }



def edge_personAggrieved_dependsOn_placeOfWorship : DefEdge :=
  { defined := "person aggrieved", dependsOn := "place of religious worship",
    citeDefine := "18 USC § 248(c)(1)(A)" }


def definitionalDag : List DefEdge :=
  [ edge_lawEnforcementOfficer_dependsOn_state,
    edge_protectedActivity_dependsOn_publicAccommodation,
    edge_nondiscriminatoryParticipation_dependsOn_protectedActivity,
    edge_affordingParticipation_dependsOn_protectedActivity,
    edge_aidingParticipation_dependsOn_protectedActivity,
    edge_lawfulSpeechOrAssembly_dependsOn_incitement,
    edge_publicAccommodation_dependsOn_smallLodgingCarveOut,
    edge_religiousRealProperty_dependsOn_placeOfWorship,
    edge_religiousRealProperty_dependsOn_religiousNonprofit,
    edge_section247Circumstances_dependsOn_commerce,
    edge_prosecutableSection247Offense_dependsOn_noncapital,
    edge_facility_dependsOn_reproductiveHealthServices,
    edge_reproductiveHealthServices_dependsOn_facility,
    edge_physicalObstruction_dependsOn_facility,
    edge_physicalObstruction_dependsOn_placeOfWorship,
    edge_intimidate_dependsOn_bodilyHarm,
    edge_nonviolentPhysicalObstruction_dependsOn_physicalObstruction,
    edge_personAggrieved_dependsOn_facility,
    edge_personAggrieved_dependsOn_placeOfWorship ]







inductive StateMembership (j : Jurisdiction) (c : ComplaintText) : Prop where
  | stateOfTheUnitedStates (h : IsStateOfTheUnitedStates j c)
  | districtOfColumbia (h : IsDistrictOfColumbia j c)
  | commonwealthTerritoryOrPossession (h : IsCommonwealthTerritoryOrPossession j c)









structure LawEnforcementOfficerMembership
    (p : Person) (j : Jurisdiction) (c : ComplaintText) : Prop where
  officerOfCoveredGovernment : IsOfficerOfCoveredGovernment p j c
  coveredJurisdiction        : StateMembership j c
  empoweredToInvestigateOrArrest : IsEmpoweredToInvestigateOrArrest p c




structure LawfulOfficerConductExclusion
    (p : Person) (j : Jurisdiction) (act : Conduct) (c : ComplaintText) : Prop where
  officer : LawEnforcementOfficerMembership p j c
  lawful  : IsLawfullyCarryingOutOfficialDuties p act c





inductive FederalBenefitOrActivityMembership
    (a : ProtectedActivity) (c : ComplaintText) : Prop where
  | votingOrElection (h : IsVotingOrElectionParticipation a c)
  | federallyProvidedBenefit (h : IsFederallyProvidedBenefitOrService a c)
  | federalEmployment (h : IsFederalEmploymentOrPerquisite a c)
  | federalJuryService (h : IsFederalJuryService a c)
  | federallyAssistedProgram (h : IsFederallyAssistedProgramOrActivity a c)




inductive StateOrPrivateBenefitOrActivityMembership
    (a : ProtectedActivity) (c : ComplaintText) : Prop where
  | publicSchoolOrCollege (h : IsPublicSchoolOrCollegeAttendance a c)
  | stateProvidedBenefit (h : IsStateProvidedBenefitOrService a c)
  | employmentOrLaborOrganization (h : IsPrivateOrStateEmploymentOrLaborOrganizationUse a c)
  | stateJuryService (h : IsStateJuryService a c)
  | interstateTravelOrCommonCarrier (h : IsInterstateTravelOrCommonCarrierUse a c)
  | publicAccommodation (est : Establishment) (h : IsEnjoymentOfPublicAccommodation a est c)




inductive FederallyProtectedActivityMembership
    (a : ProtectedActivity) (c : ComplaintText) : Prop where
  | federal (h : FederalBenefitOrActivityMembership a c)
  | stateOrPrivate (h : StateOrPrivateBenefitOrActivityMembership a c)








inductive PublicAccommodationMembership
    (est : Establishment) (c : ComplaintText) : Prop where
  | lodgingForTransientGuests (h : IsLodgingEstablishmentForTransientGuests est c)
  | foodOrBeverage (h : IsFoodOrBeverageEstablishmentServingPublic est c)
  | gasolineStation (h : IsGasolineStation est c)
  | exhibitionOrEntertainment (h : IsPlaceOfExhibitionOrEntertainmentServingPublic est c)
  | coLocatedServingPatrons
      (hServes : ServesThePublic est c)
      (hLocated : IsPhysicallyCoLocatedWithCoveredEstablishment est c)
      (hHoldsOut : HoldsItselfOutAsServingPatrons est c)




def HasAtMostFiveRoomsForRentOrHire (est : Establishment) (c : ComplaintText) : Prop :=
  roomsForRentOrHire est c ≤ 5




structure OwnerOccupiedSmallLodgingExemption
    (est : Establishment) (p : Person) (c : ComplaintText) : Prop where
  providesLodging  : IsLodgingEstablishmentForTransientGuests est c
  proprietorOrAgent : IsProprietorOrEmployeeOfEstablishment p est c
  atMostFiveRooms  : HasAtMostFiveRoomsForRentOrHire est c
  occupiedAsResidence : IsActuallyOccupiedByProprietorAsResidence est c






structure RiotIncidentCommerceVictimMembership
    (p : Person) (act : Conduct) (c : ComplaintText) : Prop where
  businessInCommerce : IsPersonEngagedInBusinessInOrAffectingCommerce p c
  duringOrIncidentToRiot : IsDuringOrIncidentToRiotOrCivilDisorder act c






structure NondiscriminatoryParticipationMembership
    (p : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop where
  enumeratedActivity : FederallyProtectedActivityMembership a c
  participation      : IsParticipatingInActivity p a c
  withoutDiscrimination : ¬ IsDiscriminationOnProtectedGroundInParticipation p a c




structure AffordingParticipationMembership
    (p : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop where
  enumeratedActivity : FederallyProtectedActivityMembership a c
  affords            : IsAffordingOpportunityOrProtectionToParticipate p a c




structure LawfulAidingOfParticipationMembership
    (p : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop where
  citizen : IsCitizen p c
  enumeratedActivity : FederallyProtectedActivityMembership a c
  aidsOrEncourages : IsLawfullyAidingOrEncouragingParticipation p a c






structure LawfulSpeechOrAssemblyMembership (act : Conduct) (c : ComplaintText) : Prop where
  speechOrPeacefulAssembly : IsSpeechOrPeacefulAssemblyOpposingDenial act c
  notIncitement : ¬ IsAidingAbettingOrIncitingRiotOrViolence act c









inductive ReligiousRealPropertyMembership
    (rp : RealProperty) (c : ComplaintText) : Prop where
  | placeOfWorship (h : IsPlaceOfReligiousWorship rp c)
  | religiousCemetery (h : IsReligiousCemetery rp c)
  | otherReligiousRealProperty (h : IsOtherReligiousRealProperty rp c)
  | fixtureWithinPlaceOfWorship
      (house : RealProperty)
      (hHouse : IsPlaceOfReligiousWorship house c)
      (h : IsReligiousFixtureWithinPlaceOfWorship rp house c)
  | ownedByReligiousNonprofit
      (org : Entity)
      (hOrg : IsNonprofitReligiouslyAffiliatedOrganization org c)
      (h : IsPropertyOwnedOrLeasedByOrganization rp org c)



structure ReligiouslyCharacterizedPropertyMembership
    (rp : RealProperty) (c : ComplaintText) : Prop where
  religiousRealProperty : ReligiousRealPropertyMembership rp c
  religiousCharacter    : HasReligiousCharacter rp c






structure Section247CircumstanceMembership (act : Conduct) (c : ComplaintText) : Prop where
  interstateOrForeignCommerce : IsInOrAffectingInterstateOrForeignCommerce act c




def WithinSection247LimitationsPeriod (act : Conduct) (c : ComplaintText) : Prop :=
  yearsFromOffenseToChargingInstrument act c ≤ 7



structure ProsecutableNoncapitalSection247Offense
    (act : Conduct) (c : ComplaintText) : Prop where
  noncapital : IsNoncapitalOffenseUnderSection247 act c
  timely     : WithinSection247LimitationsPeriod act c






inductive FacilityMembership (f : Facility) (c : ComplaintText) : Prop where
  | providesReproductiveHealthServices (h : ProvidesReproductiveHealthServices f c)
  | buildingHousingFacility (h : IsBuildingOrStructureHousingFacility f c)



structure InterfereWithMembership
    (act : Conduct) (p : Person) (c : ComplaintText) : Prop where
  restrictsFreedomOfMovement : RestrictsFreedomOfMovement act p c



structure IntimidateMembership
    (act : Conduct) (p : Person) (c : ComplaintText) : Prop where
  reasonableApprehension : PlacesInReasonableApprehensionOfBodilyHarm act p c




inductive PhysicalObstructionMembership (act : Conduct) (c : ComplaintText) : Prop where
  | rendersImpassable (h : RendersIngressOrEgressImpassable act c)
  | rendersUnreasonablyDifficultOrHazardous
      (h : RendersPassageUnreasonablyDifficultOrHazardous act c)





structure ReproductiveHealthServicesMembership
    (s : HealthService) (f : Facility) (c : ComplaintText) : Prop where
  providedInFacility : ProvidedInHealthCareFacility s f c
  reproductiveSubjectMatter : RelatesToHumanReproductiveSystem s c





structure NonviolentPhysicalObstructionMembership
    (act : Conduct) (c : ComplaintText) : Prop where
  obstruction : PhysicalObstructionMembership act c
  nonviolent  : ¬ InvolvesForceOrThreatOfForce act c








inductive AggrievedClaimantMembership (c : ComplaintText) : Prop where
  | serviceParticipantAtFacility
      (p : Person) (f : Facility)
      (hFacility : FacilityMembership f c)
      (h : IsProviderOrRecipientOfServicesAtFacility p f c)
  | worshipperAtPlaceOfWorship
      (p : Person) (rp : RealProperty)
      (hPlace : IsPlaceOfReligiousWorship rp c)
      (h : IsExercisingReligiousFreedomAtPlaceOfWorship p rp c)
  | entityOwningPlaceOfWorship
      (org : Entity) (rp : RealProperty)
      (hPlace : IsPlaceOfReligiousWorship rp c)
      (h : IsEntityOwningOrOperatingPlaceOfWorship org rp c)





structure ProtectedExpressiveConductExclusion
    (act : Conduct) (c : ComplaintText) : Prop where
  expressive : IsExpressiveConduct act c
  firstAmendmentProtected : IsProtectedByFirstAmendment act c




structure ParentalGuardianExemption
    (p : Person) (m : Person) (act : Conduct) (c : ComplaintText) : Prop where
  parentOrGuardian : IsParentOrLegalGuardianOf p m c
  minorChild : IsMinor m c
  directedExclusivelyAtMinor : IsDirectedExclusivelyAt act m c

end Proving.USC.T18.Ch13.Reslice.Ontology
