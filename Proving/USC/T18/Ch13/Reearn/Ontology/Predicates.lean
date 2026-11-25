










import Proving.USC.T18.Ch13.Reearn.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Ontology

open Proving.USC.Common








axiom IsState (j : Jurisdiction) (c : ComplaintText) : Prop



axiom IsStateOfTheUnitedStates (j : Jurisdiction) (c : ComplaintText) : Prop



axiom IsDistrictOfColumbia (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsCommonwealthTerritoryOrPossession (j : Jurisdiction) (c : ComplaintText) : Prop








axiom IsUnitedStatesAsJurisdiction (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsPoliticalSubdivisionOfState (j : Jurisdiction) (c : ComplaintText) : Prop



axiom IsOfficerOfJurisdiction (p : Person) (j : Jurisdiction) (c : ComplaintText) : Prop




axiom IsEmpoweredToInvestigateOrArrest (p : Person) (c : ComplaintText) : Prop



axiom IsLawEnforcementOfficer (p : Person) (c : ComplaintText) : Prop








axiom IsFederallyProtectedActivity (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom IsFederalElectoralParticipation (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom IsFederalBenefitOrProgramParticipation (a : ProtectedActivity) (c : ComplaintText) : Prop




axiom IsFederalEmploymentActivity (a : ProtectedActivity) (c : ComplaintText) : Prop




axiom IsFederalJuryService (a : ProtectedActivity) (c : ComplaintText) : Prop




axiom IsFederallyAssistedProgramParticipation (a : ProtectedActivity) (c : ComplaintText) : Prop



axiom IsPublicEducationalEnrollment (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom IsStateBenefitOrProgramParticipation (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom IsEmploymentOrLaborOrganizationActivity (a : ProtectedActivity) (c : ComplaintText) : Prop




axiom IsStateJuryService (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom IsInterstateTravelOrCommonCarrierUse (a : ProtectedActivity) (c : ComplaintText) : Prop




axiom IsPublicAccommodationEnjoyment (a : ProtectedActivity) (c : ComplaintText) : Prop







axiom IsPublicAccommodationEstablishment (e : Entity) (c : ComplaintText) : Prop





axiom IsOwnerOccupiedFiveRoomLodging (e : Entity) (c : ComplaintText) : Prop




axiom IsProtectedCharacteristic (ch : ProtectedCharacteristic) (c : ComplaintText) : Prop





axiom IsParticipatingLawfullyInSpeechOrPeacefulAssembly
    (a : ProtectedActivity) (c : ComplaintText) : Prop






axiom IsAidingAbettingOrIncitingRiotOrViolence
    (a : ProtectedActivity) (c : ComplaintText) : Prop





axiom IsPersonEngagedInCommerceBusiness (p : Person) (c : ComplaintText) : Prop




axiom IsRiotOrCivilDisorder (a : Conduct) (c : ComplaintText) : Prop







axiom IsReligiousRealProperty (pr : Property) (c : ComplaintText) : Prop






axiom IsPlaceOfReligiousWorship (pr : Property) (c : ComplaintText) : Prop



axiom IsReligiousCemetery (pr : Property) (c : ComplaintText) : Prop




axiom IsReligiousFixtureOrObject (pr : Property) (c : ComplaintText) : Prop



axiom IsOtherReligiousRealProperty (pr : Property) (c : ComplaintText) : Prop



axiom IsNonprofitReligiouslyAffiliatedOrganization (e : Entity) (c : ComplaintText) : Prop




axiom IsOwnedOrLeasedBy (pr : Property) (e : Entity) (c : ComplaintText) : Prop





axiom IsOffenseInOrAffectingInterstateOrForeignCommerce
    (o : Offense) (c : ComplaintText) : Prop




axiom IsPublicSafetyOfficer (p : Person) (c : ComplaintText) : Prop





axiom IsRaceColorOrEthnicCharacteristic (ch : ProtectedCharacteristic) (c : ComplaintText) : Prop







axiom IsFacility (f : Facility) (c : ComplaintText) : Prop




axiom IsHealthCareSiteProvidingServices (f : Facility) (c : ComplaintText) : Prop




axiom IsBuildingOrStructureHousingFacility (f : Facility) (c : ComplaintText) : Prop




axiom ProvidesReproductiveHealthServices (f : Facility) (s : Service) (c : ComplaintText) : Prop



axiom IsReproductiveHealthServices (s : Service) (c : ComplaintText) : Prop




axiom IsProvidedInHealthCareSetting (s : Service) (c : ComplaintText) : Prop





axiom IsServiceRelatingToHumanReproductiveSystem (s : Service) (c : ComplaintText) : Prop



axiom IsInterferenceWith (a : Conduct) (c : ComplaintText) : Prop



axiom RestrictsFreedomOfMovement (a : Conduct) (c : ComplaintText) : Prop



axiom IsIntimidation (a : Conduct) (c : ComplaintText) : Prop




axiom PlacesInReasonableApprehensionOfBodilyHarm (a : Conduct) (c : ComplaintText) : Prop



axiom IsPhysicalObstruction (a : Conduct) (c : ComplaintText) : Prop




axiom RendersImpassableIngressOrEgress (a : Conduct) (c : ComplaintText) : Prop





axiom RendersPassageUnreasonablyDifficultOrHazardous (a : Conduct) (c : ComplaintText) : Prop









axiom IsForceOrThreatOfForce (a : Conduct) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch13.Reearn.Ontology
