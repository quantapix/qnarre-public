







import Proving.USC.T18.Ch13.Reslice.Ontology.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reslice.Ontology

open Proving.USC.Common





axiom IsStateOfTheUnitedStates (j : Jurisdiction) (c : ComplaintText) : Prop



axiom IsDistrictOfColumbia (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsCommonwealthTerritoryOrPossession (j : Jurisdiction) (c : ComplaintText) : Prop







axiom IsOfficerOfCoveredGovernment (p : Person) (j : Jurisdiction) (c : ComplaintText) : Prop





axiom IsEmpoweredToInvestigateOrArrest (p : Person) (c : ComplaintText) : Prop





axiom IsLawfullyCarryingOutOfficialDuties (p : Person) (act : Conduct) (c : ComplaintText) : Prop







axiom IsVotingOrElectionParticipation (a : ProtectedActivity) (c : ComplaintText) : Prop




axiom IsFederallyProvidedBenefitOrService (a : ProtectedActivity) (c : ComplaintText) : Prop




axiom IsFederalEmploymentOrPerquisite (a : ProtectedActivity) (c : ComplaintText) : Prop




axiom IsFederalJuryService (a : ProtectedActivity) (c : ComplaintText) : Prop




axiom IsFederallyAssistedProgramOrActivity (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom IsPublicSchoolOrCollegeAttendance (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom IsStateProvidedBenefitOrService (a : ProtectedActivity) (c : ComplaintText) : Prop






axiom IsPrivateOrStateEmploymentOrLaborOrganizationUse (a : ProtectedActivity) (c : ComplaintText) : Prop




axiom IsStateJuryService (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom IsInterstateTravelOrCommonCarrierUse (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom IsEnjoymentOfPublicAccommodation
    (a : ProtectedActivity) (est : Establishment) (c : ComplaintText) : Prop






axiom IsLodgingEstablishmentForTransientGuests (est : Establishment) (c : ComplaintText) : Prop






axiom IsFoodOrBeverageEstablishmentServingPublic (est : Establishment) (c : ComplaintText) : Prop



axiom IsGasolineStation (est : Establishment) (c : ComplaintText) : Prop





axiom IsPlaceOfExhibitionOrEntertainmentServingPublic (est : Establishment) (c : ComplaintText) : Prop




axiom ServesThePublic (est : Establishment) (c : ComplaintText) : Prop





axiom IsPhysicallyCoLocatedWithCoveredEstablishment (est : Establishment) (c : ComplaintText) : Prop




axiom HoldsItselfOutAsServingPatrons (est : Establishment) (c : ComplaintText) : Prop







axiom roomsForRentOrHire (est : Establishment) (c : ComplaintText) : Nat




axiom IsProprietorOrEmployeeOfEstablishment
    (p : Person) (est : Establishment) (c : ComplaintText) : Prop




axiom IsActuallyOccupiedByProprietorAsResidence (est : Establishment) (c : ComplaintText) : Prop








axiom IsPersonEngagedInBusinessInOrAffectingCommerce (p : Person) (c : ComplaintText) : Prop




axiom IsDuringOrIncidentToRiotOrCivilDisorder (act : Conduct) (c : ComplaintText) : Prop





axiom IsParticipatingInActivity
    (p : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom IsDiscriminationOnProtectedGroundInParticipation
    (p : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop




axiom IsAffordingOpportunityOrProtectionToParticipate
    (p : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop




axiom IsCitizen (p : Person) (c : ComplaintText) : Prop





axiom IsLawfullyAidingOrEncouragingParticipation
    (p : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop




axiom IsSpeechOrPeacefulAssemblyOpposingDenial (act : Conduct) (c : ComplaintText) : Prop








axiom IsAidingAbettingOrIncitingRiotOrViolence (act : Conduct) (c : ComplaintText) : Prop







axiom IsPlaceOfReligiousWorship (rp : RealProperty) (c : ComplaintText) : Prop



axiom IsReligiousCemetery (rp : RealProperty) (c : ComplaintText) : Prop




axiom IsOtherReligiousRealProperty (rp : RealProperty) (c : ComplaintText) : Prop




axiom IsReligiousFixtureWithinPlaceOfWorship
    (rp : RealProperty) (house : RealProperty) (c : ComplaintText) : Prop



axiom IsPropertyOwnedOrLeasedByOrganization
    (rp : RealProperty) (org : Entity) (c : ComplaintText) : Prop



axiom IsNonprofitReligiouslyAffiliatedOrganization (org : Entity) (c : ComplaintText) : Prop





axiom HasReligiousCharacter (rp : RealProperty) (c : ComplaintText) : Prop







axiom IsInOrAffectingInterstateOrForeignCommerce (act : Conduct) (c : ComplaintText) : Prop




axiom IsNoncapitalOffenseUnderSection247 (act : Conduct) (c : ComplaintText) : Prop





axiom yearsFromOffenseToChargingInstrument (act : Conduct) (c : ComplaintText) : Nat






axiom ProvidesReproductiveHealthServices (f : Facility) (c : ComplaintText) : Prop





axiom IsBuildingOrStructureHousingFacility (f : Facility) (c : ComplaintText) : Prop






axiom RestrictsFreedomOfMovement (act : Conduct) (p : Person) (c : ComplaintText) : Prop





axiom PlacesInReasonableApprehensionOfBodilyHarm
    (act : Conduct) (p : Person) (c : ComplaintText) : Prop




axiom RendersIngressOrEgressImpassable (act : Conduct) (c : ComplaintText) : Prop




axiom RendersPassageUnreasonablyDifficultOrHazardous (act : Conduct) (c : ComplaintText) : Prop






axiom ProvidedInHealthCareFacility
    (s : HealthService) (f : Facility) (c : ComplaintText) : Prop





axiom RelatesToHumanReproductiveSystem (s : HealthService) (c : ComplaintText) : Prop







axiom InvolvesForceOrThreatOfForce (act : Conduct) (c : ComplaintText) : Prop





axiom IsProviderOrRecipientOfServicesAtFacility
    (p : Person) (f : Facility) (c : ComplaintText) : Prop





axiom IsExercisingReligiousFreedomAtPlaceOfWorship
    (p : Person) (rp : RealProperty) (c : ComplaintText) : Prop




axiom IsEntityOwningOrOperatingPlaceOfWorship
    (org : Entity) (rp : RealProperty) (c : ComplaintText) : Prop




axiom IsExpressiveConduct (act : Conduct) (c : ComplaintText) : Prop




axiom IsProtectedByFirstAmendment (act : Conduct) (c : ComplaintText) : Prop



axiom IsParentOrLegalGuardianOf (p : Person) (m : Person) (c : ComplaintText) : Prop



axiom IsMinor (m : Person) (c : ComplaintText) : Prop




axiom IsDirectedExclusivelyAt (act : Conduct) (m : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch13.Reslice.Ontology
