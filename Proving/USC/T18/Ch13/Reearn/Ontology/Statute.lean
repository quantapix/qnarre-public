
















import Proving.USC.T18.Ch13.Reearn.Ontology.Types
import Proving.USC.T18.Ch13.Reearn.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Ontology

open Proving.USC.Common








structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  deriving Repr



structure DanglingTerm where
  term      : String
  usedAt    : String
  deriving Repr


def edge_leo_dependsOn_unitedStates : DefEdge :=
  { defined := "law enforcement officer", dependsOn := "the United States",
    citeDefine := "18 USC § 245(c)" }
def edge_leo_dependsOn_state : DefEdge :=
  { defined := "law enforcement officer", dependsOn := "State",
    citeDefine := "18 USC § 245(c)" }
def edge_leo_dependsOn_politicalSubdivision : DefEdge :=
  { defined := "law enforcement officer", dependsOn := "political subdivision of a State",
    citeDefine := "18 USC § 245(c)" }
def edge_politicalSubdivision_dependsOn_state : DefEdge :=
  { defined := "political subdivision of a State", dependsOn := "State",
    citeDefine := "18 USC § 245(c)" }


def edge_lawfulSpeech_dependsOn_riot : DefEdge :=
  { defined := "participating lawfully in speech or peaceful assembly",
    dependsOn := "riot", citeDefine := "18 USC § 245(b)" }


def edge_fpa_dependsOn_federalElection : DefEdge :=
  { defined := "federally protected activity", dependsOn := "federal electoral participation",
    citeDefine := "18 USC § 245(b)(1)(A)" }
def edge_fpa_dependsOn_federalBenefit : DefEdge :=
  { defined := "federally protected activity", dependsOn := "federal benefit or program",
    citeDefine := "18 USC § 245(b)(1)(B)" }
def edge_fpa_dependsOn_federalEmployment : DefEdge :=
  { defined := "federally protected activity", dependsOn := "federal employment",
    citeDefine := "18 USC § 245(b)(1)(C)" }
def edge_fpa_dependsOn_federalJuryService : DefEdge :=
  { defined := "federally protected activity", dependsOn := "federal jury service",
    citeDefine := "18 USC § 245(b)(1)(D)" }
def edge_fpa_dependsOn_federallyAssistedProgram : DefEdge :=
  { defined := "federally protected activity",
    dependsOn := "program or activity receiving Federal financial assistance",
    citeDefine := "18 USC § 245(b)(1)(E)" }
def edge_fpa_dependsOn_publicEducation : DefEdge :=
  { defined := "federally protected activity", dependsOn := "public school or public college",
    citeDefine := "18 USC § 245(b)(2)(A)" }
def edge_fpa_dependsOn_stateBenefit : DefEdge :=
  { defined := "federally protected activity", dependsOn := "State benefit or program",
    citeDefine := "18 USC § 245(b)(2)(B)" }
def edge_fpa_dependsOn_employmentOrLabor : DefEdge :=
  { defined := "federally protected activity",
    dependsOn := "employment or labor organization activity",
    citeDefine := "18 USC § 245(b)(2)(C)" }
def edge_fpa_dependsOn_stateJuryService : DefEdge :=
  { defined := "federally protected activity", dependsOn := "State jury service",
    citeDefine := "18 USC § 245(b)(2)(D)" }
def edge_fpa_dependsOn_interstateTravel : DefEdge :=
  { defined := "federally protected activity",
    dependsOn := "facility of interstate commerce or common carrier",
    citeDefine := "18 USC § 245(b)(2)(E)" }
def edge_fpa_dependsOn_publicAccommodation : DefEdge :=
  { defined := "federally protected activity", dependsOn := "public accommodation establishment",
    citeDefine := "18 USC § 245(b)(2)(F)" }
def edge_publicAccommodation_dependsOn_fiveRoomLodging : DefEdge :=
  { defined := "public accommodation establishment",
    dependsOn := "owner-occupied lodging of not more than five rooms",
    citeDefine := "18 USC § 245(b)" }
def edge_s245b2_dependsOn_protectedCharacteristic : DefEdge :=
  { defined := "18 USC § 245(b)(2) (using section)", dependsOn := "race, color, religion or national origin",
    citeDefine := "18 USC § 245(b)(2)" }
def edge_s245b3_dependsOn_riotOrCivilDisorder : DefEdge :=
  { defined := "18 USC § 245(b)(3) (using section)", dependsOn := "riot or civil disorder",
    citeDefine := "18 USC § 245(b)(3)" }
def edge_s245b3_dependsOn_commerceBusiness : DefEdge :=
  { defined := "18 USC § 245(b)(3) (using section)",
    dependsOn := "person engaged in a business in commerce or affecting commerce",
    citeDefine := "18 USC § 245(b)(3)" }
def edge_s245b_dependsOn_forceOrThreat : DefEdge :=
  { defined := "18 USC § 245(b) (using section)", dependsOn := "force or threat of force",
    citeDefine := "18 USC § 245(b)" }
def edge_s245b4_dependsOn_fpa : DefEdge :=
  { defined := "18 USC § 245(b)(4) (using section)", dependsOn := "federally protected activity",
    citeDefine := "18 USC § 245(b)(4)(A)" }
def edge_s245b5_dependsOn_lawfulSpeech : DefEdge :=
  { defined := "18 USC § 245(b)(5) (using section)",
    dependsOn := "participating lawfully in speech or peaceful assembly",
    citeDefine := "18 USC § 245(b)(5)" }


def edge_rrp_dependsOn_placeOfWorship : DefEdge :=
  { defined := "religious real property", dependsOn := "place of religious worship",
    citeDefine := "18 USC § 247(f)" }
def edge_rrp_dependsOn_religiousCemetery : DefEdge :=
  { defined := "religious real property", dependsOn := "religious cemetery",
    citeDefine := "18 USC § 247(f)" }
def edge_rrp_dependsOn_fixtureOrObject : DefEdge :=
  { defined := "religious real property", dependsOn := "fixtures or religious objects",
    citeDefine := "18 USC § 247(f)" }
def edge_rrp_dependsOn_nonprofitOrg : DefEdge :=
  { defined := "religious real property",
    dependsOn := "nonprofit, religiously affiliated organization",
    citeDefine := "18 USC § 247(f)" }
def edge_s247a1_dependsOn_rrp : DefEdge :=
  { defined := "18 USC § 247(a)(1) (using section)", dependsOn := "religious real property",
    citeDefine := "18 USC § 247(a)(1)" }
def edge_s247a_dependsOn_circumstances : DefEdge :=
  { defined := "18 USC § 247(a) (using section)",
    dependsOn := "the circumstances referred to in subsection (b)",
    citeDefine := "18 USC § 247(a)" }
def edge_circumstances_dependsOn_commerce : DefEdge :=
  { defined := "the circumstances referred to in subsection (b)",
    dependsOn := "in or affecting interstate or foreign commerce",
    citeDefine := "18 USC § 247(b)" }
def edge_s247c_dependsOn_ethnicCharacteristic : DefEdge :=
  { defined := "18 USC § 247(c) (using section)",
    dependsOn := "race, color, or ethnic characteristics", citeDefine := "18 USC § 247(c)" }
def edge_s247d_dependsOn_publicSafetyOfficer : DefEdge :=
  { defined := "18 USC § 247(d) (using section)", dependsOn := "public safety officer",
    citeDefine := "18 USC § 247(d)(2)" }


def edge_facility_dependsOn_reproductiveHealthServices : DefEdge :=
  { defined := "facility", dependsOn := "reproductive health services",
    citeDefine := "18 USC § 248(e)(1)" }
def edge_reproductiveHealthServices_dependsOn_facility : DefEdge :=
  { defined := "reproductive health services", dependsOn := "facility",
    citeDefine := "18 USC § 248(e)(5)" }
def edge_physicalObstruction_dependsOn_facility : DefEdge :=
  { defined := "physical obstruction", dependsOn := "facility",
    citeDefine := "18 USC § 248(e)(4)" }
def edge_physicalObstruction_dependsOn_placeOfWorship : DefEdge :=
  { defined := "physical obstruction", dependsOn := "place of religious worship",
    citeDefine := "18 USC § 248(e)(4)" }
def edge_s248a1_dependsOn_reproductiveHealthServices : DefEdge :=
  { defined := "18 USC § 248(a)(1) (using section)", dependsOn := "reproductive health services",
    citeDefine := "18 USC § 248(a)(1)" }
def edge_s248a1_dependsOn_intimidate : DefEdge :=
  { defined := "18 USC § 248(a)(1) (using section)", dependsOn := "intimidate",
    citeDefine := "18 USC § 248(a)(1)" }
def edge_s248a1_dependsOn_interfereWith : DefEdge :=
  { defined := "18 USC § 248(a)(1) (using section)", dependsOn := "interfere with",
    citeDefine := "18 USC § 248(a)(1)" }
def edge_s248a1_dependsOn_physicalObstruction : DefEdge :=
  { defined := "18 USC § 248(a)(1) (using section)", dependsOn := "physical obstruction",
    citeDefine := "18 USC § 248(a)(1)" }
def edge_s248a2_dependsOn_placeOfWorship : DefEdge :=
  { defined := "18 USC § 248(a)(2) (using section)", dependsOn := "place of religious worship",
    citeDefine := "18 USC § 248(a)(2)" }
def edge_s248a3_dependsOn_facility : DefEdge :=
  { defined := "18 USC § 248(a)(3) (using section)", dependsOn := "facility",
    citeDefine := "18 USC § 248(a)(3)" }
def edge_s248e4_dependsOn_state : DefEdge :=
  { defined := "18 USC § 248 (using section)", dependsOn := "State",
    citeDefine := "18 USC § 248(e)(6)" }


def defEdges : List DefEdge :=
  [ edge_leo_dependsOn_unitedStates, edge_leo_dependsOn_state,
    edge_leo_dependsOn_politicalSubdivision, edge_politicalSubdivision_dependsOn_state,
    edge_lawfulSpeech_dependsOn_riot,
    edge_fpa_dependsOn_federalElection, edge_fpa_dependsOn_federalBenefit,
    edge_fpa_dependsOn_federalEmployment, edge_fpa_dependsOn_federalJuryService,
    edge_fpa_dependsOn_federallyAssistedProgram, edge_fpa_dependsOn_publicEducation,
    edge_fpa_dependsOn_stateBenefit, edge_fpa_dependsOn_employmentOrLabor,
    edge_fpa_dependsOn_stateJuryService, edge_fpa_dependsOn_interstateTravel,
    edge_fpa_dependsOn_publicAccommodation, edge_publicAccommodation_dependsOn_fiveRoomLodging,
    edge_s245b2_dependsOn_protectedCharacteristic, edge_s245b3_dependsOn_riotOrCivilDisorder,
    edge_s245b3_dependsOn_commerceBusiness, edge_s245b_dependsOn_forceOrThreat,
    edge_s245b4_dependsOn_fpa, edge_s245b5_dependsOn_lawfulSpeech,
    edge_rrp_dependsOn_placeOfWorship, edge_rrp_dependsOn_religiousCemetery,
    edge_rrp_dependsOn_fixtureOrObject, edge_rrp_dependsOn_nonprofitOrg,
    edge_s247a1_dependsOn_rrp, edge_s247a_dependsOn_circumstances,
    edge_circumstances_dependsOn_commerce, edge_s247c_dependsOn_ethnicCharacteristic,
    edge_s247d_dependsOn_publicSafetyOfficer,
    edge_facility_dependsOn_reproductiveHealthServices,
    edge_reproductiveHealthServices_dependsOn_facility,
    edge_physicalObstruction_dependsOn_facility,
    edge_physicalObstruction_dependsOn_placeOfWorship,
    edge_s248a1_dependsOn_reproductiveHealthServices, edge_s248a1_dependsOn_intimidate,
    edge_s248a1_dependsOn_interfereWith, edge_s248a1_dependsOn_physicalObstruction,
    edge_s248a2_dependsOn_placeOfWorship, edge_s248a3_dependsOn_facility,
    edge_s248e4_dependsOn_state ]



def danglingTerms : List DanglingTerm :=
  [ { term := "force or threat of force", usedAt := "18 USC § 245(b); § 247(a)(2); § 248(a)(1)" },
    { term := "riot or civil disorder", usedAt := "18 USC § 245(b)(3)" },
    { term := "riot", usedAt := "18 USC § 245(b)" },
    { term := "place of religious worship", usedAt := "18 USC § 247(f); § 248(a)(2), (a)(3), (e)(4)" },
    { term := "public safety officer", usedAt := "18 USC § 247(d)(2), (d)(3)" },
    { term := "religious character", usedAt := "18 USC § 247(a)(1)" },
    { term := "bodily injury", usedAt := "18 USC § 245(b); § 247(d)(2), (d)(3); § 248(b)" },
    { term := "dangerous weapon", usedAt := "18 USC § 245(b); § 247(d)(3)" },
    { term := "minor", usedAt := "18 USC § 248(a)" },
    { term := "expressive conduct", usedAt := "18 USC § 248(d)(1)" } ]








inductive StateMembership (j : Jurisdiction) (c : ComplaintText) : Prop where
  | stateOfTheUnitedStates
      (limb : IsStateOfTheUnitedStates j c) (term : IsState j c)
  | districtOfColumbia
      (limb : IsDistrictOfColumbia j c) (term : IsState j c)
  | commonwealthTerritoryOrPossession
      (limb : IsCommonwealthTerritoryOrPossession j c) (term : IsState j c)
  | otherIncludedJurisdiction
      (term : IsState j c)





inductive LawEnforcementJurisdiction (j : Jurisdiction) (c : ComplaintText) : Prop where
  | unitedStates (limb : IsUnitedStatesAsJurisdiction j c)
  | state (limb : IsState j c)
  | politicalSubdivision (limb : IsPoliticalSubdivisionOfState j c)




structure LawEnforcementOfficerMembership
    (p : Person) (j : Jurisdiction) (c : ComplaintText) : Prop where
  jurisdiction : LawEnforcementJurisdiction j c
  officer      : IsOfficerOfJurisdiction p j c
  empowered    : IsEmpoweredToInvestigateOrArrest p c
  term         : IsLawEnforcementOfficer p c



inductive FederallyProtectedActivityMembership
    (a : ProtectedActivity) (c : ComplaintText) : Prop where
  | federalElection
      (limb : IsFederalElectoralParticipation a c) (term : IsFederallyProtectedActivity a c)
  | federalBenefitOrProgram
      (limb : IsFederalBenefitOrProgramParticipation a c) (term : IsFederallyProtectedActivity a c)
  | federalEmployment
      (limb : IsFederalEmploymentActivity a c) (term : IsFederallyProtectedActivity a c)
  | federalJuryService
      (limb : IsFederalJuryService a c) (term : IsFederallyProtectedActivity a c)
  | federallyAssistedProgram
      (limb : IsFederallyAssistedProgramParticipation a c) (term : IsFederallyProtectedActivity a c)
  | publicEducation
      (limb : IsPublicEducationalEnrollment a c) (term : IsFederallyProtectedActivity a c)
  | stateBenefitOrProgram
      (limb : IsStateBenefitOrProgramParticipation a c) (term : IsFederallyProtectedActivity a c)
  | employmentOrLaborOrganization
      (limb : IsEmploymentOrLaborOrganizationActivity a c) (term : IsFederallyProtectedActivity a c)
  | stateJuryService
      (limb : IsStateJuryService a c) (term : IsFederallyProtectedActivity a c)
  | interstateTravelOrCommonCarrier
      (limb : IsInterstateTravelOrCommonCarrierUse a c) (term : IsFederallyProtectedActivity a c)
  | publicAccommodation
      (limb : IsPublicAccommodationEnjoyment a c) (term : IsFederallyProtectedActivity a c)






structure ProtectedSpeechOrAssemblyMembership
    (a : ProtectedActivity) (c : ComplaintText) : Prop where
  term       : IsParticipatingLawfullyInSpeechOrPeacefulAssembly a c
  notExcluded : ¬ IsAidingAbettingOrIncitingRiotOrViolence a c




structure PublicAccommodationReach (e : Entity) (c : ComplaintText) : Prop where
  establishment              : IsPublicAccommodationEstablishment e c
  notSmallOwnerOccupiedLodging : ¬ IsOwnerOccupiedFiveRoomLodging e c



inductive ReligiousRealPropertyMembership (pr : Property) (c : ComplaintText) : Prop where
  | placeOfReligiousWorship
      (limb : IsPlaceOfReligiousWorship pr c) (term : IsReligiousRealProperty pr c)
  | religiousCemetery
      (limb : IsReligiousCemetery pr c) (term : IsReligiousRealProperty pr c)
  | otherReligiousRealProperty
      (limb : IsOtherReligiousRealProperty pr c) (term : IsReligiousRealProperty pr c)
  | fixtureOrReligiousObject
      (limb : IsReligiousFixtureOrObject pr c) (term : IsReligiousRealProperty pr c)
  | nonprofitOwnedOrLeased
      (org : Entity)
      (hOrg : IsNonprofitReligiouslyAffiliatedOrganization org c)
      (hOwn : IsOwnedOrLeasedBy pr org c)
      (term : IsReligiousRealProperty pr c)



structure Section247Circumstances (o : Offense) (c : ComplaintText) : Prop where
  commerceNexus : IsOffenseInOrAffectingInterstateOrForeignCommerce o c



inductive FacilityMembership (f : Facility) (c : ComplaintText) : Prop where
  | serviceProvidingSite
      (limb : IsHealthCareSiteProvidingServices f c) (term : IsFacility f c)
  | housingBuildingOrStructure
      (limb : IsBuildingOrStructureHousingFacility f c) (term : IsFacility f c)







structure FacilityServiceLink (f : Facility) (s : Service) (c : ComplaintText) : Prop where
  facility : IsFacility f c
  services : IsReproductiveHealthServices s c
  provides : ProvidesReproductiveHealthServices f s c



inductive ReproductiveHealthServicesMembership (s : Service) (c : ComplaintText) : Prop where
  | providedInFacilitySetting
      (limb : IsProvidedInHealthCareSetting s c) (term : IsReproductiveHealthServices s c)
  | reproductiveSystemService
      (limb : IsServiceRelatingToHumanReproductiveSystem s c)
      (term : IsReproductiveHealthServices s c)



structure InterferenceMembership (a : Conduct) (c : ComplaintText) : Prop where
  definiens : RestrictsFreedomOfMovement a c
  term      : IsInterferenceWith a c



structure IntimidationMembership (a : Conduct) (c : ComplaintText) : Prop where
  definiens : PlacesInReasonableApprehensionOfBodilyHarm a c
  term      : IsIntimidation a c



inductive PhysicalObstructionMembership (a : Conduct) (c : ComplaintText) : Prop where
  | renderingImpassable
      (limb : RendersImpassableIngressOrEgress a c) (term : IsPhysicalObstruction a c)
  | renderingPassageUnreasonablyDifficult
      (limb : RendersPassageUnreasonablyDifficultOrHazardous a c)
      (term : IsPhysicalObstruction a c)


inductive ObstructionLocusMembership
    (f : Facility) (pr : Property) (c : ComplaintText) : Prop where
  | reproductiveHealthFacility (limb : IsFacility f c)
  | placeOfReligiousWorship (limb : IsPlaceOfReligiousWorship pr c)

end Proving.USC.T18.Ch13.Reearn.Ontology
