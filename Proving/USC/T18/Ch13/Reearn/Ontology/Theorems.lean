












import Proving.USC.T18.Ch13.Reearn.Ontology.Types
import Proving.USC.T18.Ch13.Reearn.Ontology.Predicates
import Proving.USC.T18.Ch13.Reearn.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Ontology

open Proving.USC.Common



theorem stateMembership_intro {j : Jurisdiction} {c : ComplaintText}
    (limb : IsStateOfTheUnitedStates j c) (term : IsState j c) :
    StateMembership j c :=
  .stateOfTheUnitedStates limb term



theorem lawEnforcementJurisdiction_intro {j : Jurisdiction} {c : ComplaintText}
    (limb : IsUnitedStatesAsJurisdiction j c) :
    LawEnforcementJurisdiction j c :=
  .unitedStates limb




theorem lawEnforcementOfficerMembership_intro
    {p : Person} {j : Jurisdiction} {c : ComplaintText}
    (jurisdiction : LawEnforcementJurisdiction j c)
    (officer : IsOfficerOfJurisdiction p j c)
    (empowered : IsEmpoweredToInvestigateOrArrest p c)
    (term : IsLawEnforcementOfficer p c) :
    LawEnforcementOfficerMembership p j c :=
  ⟨jurisdiction, officer, empowered, term⟩



theorem federallyProtectedActivityMembership_intro
    {a : ProtectedActivity} {c : ComplaintText}
    (limb : IsFederalElectoralParticipation a c)
    (term : IsFederallyProtectedActivity a c) :
    FederallyProtectedActivityMembership a c :=
  .federalElection limb term




theorem protectedSpeechOrAssemblyMembership_intro
    {a : ProtectedActivity} {c : ComplaintText}
    (term : IsParticipatingLawfullyInSpeechOrPeacefulAssembly a c)
    (notExcluded : ¬ IsAidingAbettingOrIncitingRiotOrViolence a c) :
    ProtectedSpeechOrAssemblyMembership a c :=
  ⟨term, notExcluded⟩




theorem publicAccommodationReach_intro {e : Entity} {c : ComplaintText}
    (establishment : IsPublicAccommodationEstablishment e c)
    (notSmallOwnerOccupiedLodging : ¬ IsOwnerOccupiedFiveRoomLodging e c) :
    PublicAccommodationReach e c :=
  ⟨establishment, notSmallOwnerOccupiedLodging⟩



theorem religiousRealPropertyMembership_intro {pr : Property} {c : ComplaintText}
    (limb : IsPlaceOfReligiousWorship pr c) (term : IsReligiousRealProperty pr c) :
    ReligiousRealPropertyMembership pr c :=
  .placeOfReligiousWorship limb term



theorem section247Circumstances_intro {o : Offense} {c : ComplaintText}
    (commerceNexus : IsOffenseInOrAffectingInterstateOrForeignCommerce o c) :
    Section247Circumstances o c :=
  ⟨commerceNexus⟩



theorem facilityMembership_intro {f : Facility} {c : ComplaintText}
    (limb : IsHealthCareSiteProvidingServices f c) (term : IsFacility f c) :
    FacilityMembership f c :=
  .serviceProvidingSite limb term



theorem facilityServiceLink_intro {f : Facility} {s : Service} {c : ComplaintText}
    (facility : IsFacility f c)
    (services : IsReproductiveHealthServices s c)
    (provides : ProvidesReproductiveHealthServices f s c) :
    FacilityServiceLink f s c :=
  ⟨facility, services, provides⟩



theorem reproductiveHealthServicesMembership_intro {s : Service} {c : ComplaintText}
    (limb : IsProvidedInHealthCareSetting s c) (term : IsReproductiveHealthServices s c) :
    ReproductiveHealthServicesMembership s c :=
  .providedInFacilitySetting limb term



theorem interferenceMembership_intro {a : Conduct} {c : ComplaintText}
    (definiens : RestrictsFreedomOfMovement a c) (term : IsInterferenceWith a c) :
    InterferenceMembership a c :=
  ⟨definiens, term⟩



theorem intimidationMembership_intro {a : Conduct} {c : ComplaintText}
    (definiens : PlacesInReasonableApprehensionOfBodilyHarm a c)
    (term : IsIntimidation a c) :
    IntimidationMembership a c :=
  ⟨definiens, term⟩



theorem physicalObstructionMembership_intro {a : Conduct} {c : ComplaintText}
    (limb : RendersImpassableIngressOrEgress a c) (term : IsPhysicalObstruction a c) :
    PhysicalObstructionMembership a c :=
  .renderingImpassable limb term



theorem obstructionLocusMembership_intro
    {f : Facility} {pr : Property} {c : ComplaintText}
    (limb : IsFacility f c) :
    ObstructionLocusMembership f pr c :=
  .reproductiveHealthFacility limb

end Proving.USC.T18.Ch13.Reearn.Ontology
