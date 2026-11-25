









import Proving.USC.Common.Types
import Proving.USC.T18.Ch117.Recert.Ontology.Types
import Proving.USC.T18.Ch117.Recert.Ontology.Predicates
import Proving.USC.T18.Ch117.Recert.Ontology.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Ontology

open Proving.USC.Common




theorem serviceOperatorMembership_intro
    {p : Person} {s : InteractiveComputerService} {f : CommerceFacility}
    {c : ComplaintText}
    (hService : IsInteractiveComputerService s c)
    (hFacility : IsFacilityOrMeansOfInterstateCommerce f c)
    (hOperator : IsOwnerManagerOrOperator p s c)
    : ServiceOperatorMembership p s f c :=
  ⟨hService, hFacility, hOperator⟩


theorem prostitutionPromotionMembership_intro
    {a : ProstitutionActivity} {subject : Person} {c : ComplaintText}
    (hPromotion : IsPromotionOrFacilitationOfProstitution a c)
    (hOfAnother : IsProstitutionOfAnotherPerson a subject c)
    : ProstitutionPromotionMembership a subject c :=
  ⟨hPromotion, hOfAnother⟩


theorem aggravatingCircumstance_intro_fiveOrMorePersons
    {p : Person} {a : ProstitutionActivity} {c : ComplaintText}
    (h : IsFiveOrMorePersonsPromoted a c)
    : AggravatingCircumstance p a c :=
  .fiveOrMorePersons h



theorem aggravatingCircumstance_intro_recklessDisregardOfSexTrafficking
    {p : Person} {a : ProstitutionActivity} {c : ComplaintText}
    (t : SexTraffickingViolation)
    (hTraffic : IsSexTraffickingViolation t c)
    (hReckless : IsRecklessDisregardOfContribution p t c)
    : AggravatingCircumstance p a c :=
  .recklessDisregardOfSexTrafficking t hTraffic hReckless


theorem civilClaimantMembership_intro
    {p : Person} {j : Jurisdiction} {c : ComplaintText}
    (hInjured : IsPersonInjuredByReasonOf p c)
    (hForum : IsAppropriateUnitedStatesDistrictCourt j c)
    : CivilClaimantMembership p j c :=
  ⟨hInjured, hForum⟩


theorem restitutionScopeMembership_intro
    {r : RestitutionOrder} {o : SubstantiveOffense} {c : ComplaintText}
    (hOffense : IsSubstantiveOffenseInScope o c)
    (hScope : IsRestitutionConsistentWithSection2327b r c)
    : RestitutionScopeMembership r o c :=
  ⟨hOffense, hScope⟩


theorem legalityDefenseMembership_intro
    {a : ProstitutionActivity} {j : Jurisdiction} {c : ComplaintText}
    (hTargeted : IsTargetedJurisdiction j a c)
    (hLegality : IsProstitutionLegalInJurisdiction j c)
    : LegalityDefenseMembership a j c :=
  ⟨hTargeted, hLegality⟩




theorem inchoateOffenseMembership_intro
    {p : Person} {o : SubstantiveOffense} {c : ComplaintText}
    (hSubstantive : IsSubstantiveOffenseInScope o c)
    (hInchoate : IsAttemptOrConspiracyToViolate p o c)
    : InchoateOffenseMembership p o c :=
  ⟨hSubstantive, hInchoate⟩




theorem section2423aLocus_intro_interstateOrForeign
    {t : TravelOrTransportation} {c : ComplaintText}
    (h : IsInterstateOrForeignCommerceTransport t c)
    : Section2423aLocus t c :=
  .interstateOrForeign h


theorem section2423aLocus_intro_commonwealthTerritoryOrPossession
    {t : TravelOrTransportation} {c : ComplaintText}
    (j : Jurisdiction) (h : IsCommonwealthTerritoryOrPossession j c)
    : Section2423aLocus t c :=
  .commonwealthTerritoryOrPossession j h


theorem transportedMinorMembership_intro
    {p : Person} {subject : Person} {t : TravelOrTransportation} {i : Intent}
    {moment : Time} {c : ComplaintText}
    (hMinor : IsMinorUnder18 subject c)
    (hKnowing : IsKnowingTransportation p t subject c)
    (hLocus : Section2423aLocus t c)
    (hIntent : IsIntentUnderSection2423 i c)
    (hTiming : IsAtTimeOfTransportationOrTravel i t moment c)
    : TransportedMinorMembership p subject t i moment c :=
  ⟨hMinor, hKnowing, hLocus, hIntent, hTiming⟩


theorem coveredTravelerStatus_intro_citizen
    {p : Person} {c : ComplaintText}
    (h : IsUnitedStatesCitizen p c)
    : CoveredTravelerStatus p c :=
  .citizen h



theorem coveredTravelerStatus_intro_lawfulPermanentResident
    {p : Person} {c : ComplaintText}
    (h : IsAlienAdmittedForPermanentResidence p c)
    : CoveredTravelerStatus p c :=
  .lawfulPermanentResident h


theorem coveredTravelMembership_intro_interstate
    {t : TravelOrTransportation} {c : ComplaintText}
    (h : IsTravelInInterstateCommerce t c)
    : CoveredTravelMembership t c :=
  .interstate h


theorem coveredTravelMembership_intro_intoTheUnitedStates
    {t : TravelOrTransportation} {c : ComplaintText}
    (h : IsTravelIntoTheUnitedStates t c)
    : CoveredTravelMembership t c :=
  .intoTheUnitedStates h


theorem coveredTravelMembership_intro_foreign
    {t : TravelOrTransportation} {c : ComplaintText}
    (h : IsTravelInForeignCommerce t c)
    : CoveredTravelMembership t c :=
  .foreign h


theorem foreignResidenceMembership_intro
    {p : Person} {j : Jurisdiction} {icc : IllicitSexualConduct}
    {other : Person} {c : ComplaintText}
    (hStatus : CoveredTravelerStatus p c)
    (hForeignCountry : IsForeignCountry j c)
    (hResidence : IsResidenceInForeignCountry p j c)
    (hConduct : IsEngagementInIllicitSexualConduct p icc other c)
    : ForeignResidenceMembership p j icc other c :=
  ⟨hStatus, hForeignCountry, hResidence, hConduct⟩


theorem organizationalAffiliationMembership_intro
    {p : Person} {o : Entity} {icc : IllicitSexualConduct} {c : ComplaintText}
    (hStatus : CoveredTravelerStatus p c)
    (hRole : IsOfficerDirectorEmployeeOrAgent p o c)
    (hOrganization : IsOrganizationAffectingCommerce o c)
    (hInstrumentality : IsUseOfMailsOrInstrumentality p o c)
    (hFurtherance : IsActInFurtheranceThroughAffiliation p o icc c)
    : OrganizationalAffiliationMembership p o icc c :=
  ⟨hStatus, hRole, hOrganization, hInstrumentality, hFurtherance⟩


theorem travelFacilitatorMembership_intro
    {p : Person} {traveler : Person} {t : TravelOrTransportation} {i : Intent}
    {c : ComplaintText}
    (hPurpose : IsForCommercialAdvantageOrPrivateFinancialGain p c)
    (hConduct : IsArrangingInducingProcuringOrFacilitatingTravel p t c)
    (hTravel : CoveredTravelMembership t c)
    (hKnowledge : IsKnowledgeOfTravelersIntent p traveler i c)
    (hIntent : IsIntentUnderSection2423 i c)
    : TravelFacilitatorMembership p traveler t i c :=
  ⟨hPurpose, hConduct, hTravel, hKnowledge, hIntent⟩



theorem illicitSexualConductMembership_intro_sexualActWithMinor
    {icc : IllicitSexualConduct} {c : ComplaintText}
    (a : SexualAct) (victim : Person)
    (hAct : IsSexualActUnderSection2246 a c)
    (hMinor : IsMinorUnder18 victim c)
    (hChapter109A : IsChapter109AViolationIfInSMTJ a c)
    (hMember : IsIllicitSexualConduct icc c)
    : IllicitSexualConductMembership icc c :=
  .sexualActWithMinor a victim hAct hMinor hChapter109A hMember



theorem illicitSexualConductMembership_intro_commercialSexActWithMinor
    {icc : IllicitSexualConduct} {c : ComplaintText}
    (a : CommercialSexAct) (victim : Person)
    (hAct : IsCommercialSexActUnderSection1591 a c)
    (hMinor : IsMinorUnder18 victim c)
    (hMember : IsIllicitSexualConduct icc c)
    : IllicitSexualConductMembership icc c :=
  .commercialSexActWithMinor a victim hAct hMinor hMember



theorem illicitSexualConductMembership_intro_productionOfChildPornography
    {icc : IllicitSexualConduct} {c : ComplaintText}
    (cp : ChildPornography)
    (hProduction : IsProductionOfChildPornography cp c)
    (hMember : IsIllicitSexualConduct icc c)
    : IllicitSexualConductMembership icc c :=
  .productionOfChildPornography cp hProduction hMember


theorem intentMembership_intro_toProstitution
    {i : Intent} {t : TravelOrTransportation} {moment : Time} {c : ComplaintText}
    (hObject : IsIntentionToEngageInProstitution i c)
    (hTiming : IsAtTimeOfTransportationOrTravel i t moment c)
    (hMember : IsIntentUnderSection2423 i c)
    : IntentMembership i t moment c :=
  .toProstitution hObject hTiming hMember



theorem intentMembership_intro_toChargeableSexualActivity
    {i : Intent} {t : TravelOrTransportation} {moment : Time} {c : ComplaintText}
    (a : SexualActivityChargeableAsOffense)
    (hActivity : IsSexualActivityChargeableAsCriminalOffense a c)
    (hObject : IsIntentionToEngageInChargeableSexualActivity i c)
    (hTiming : IsAtTimeOfTransportationOrTravel i t moment c)
    (hMember : IsIntentUnderSection2423 i c)
    : IntentMembership i t moment c :=
  .toChargeableSexualActivity a hActivity hObject hTiming hMember


theorem intentMembership_intro_toIllicitSexualConduct
    {i : Intent} {t : TravelOrTransportation} {moment : Time} {c : ComplaintText}
    (hObject : IsIntentionToEngageInIllicitSexualConduct i c)
    (hTiming : IsAtTimeOfTransportationOrTravel i t moment c)
    (hMember : IsIntentUnderSection2423 i c)
    : IntentMembership i t moment c :=
  .toIllicitSexualConduct hObject hTiming hMember


theorem reasonableBeliefDefenseMembership_intro
    {p : Person} {subject : Person} {a : CommercialSexAct} {c : ComplaintText}
    (hCommercial : IsCommercialSexActUnderSection1591 a c)
    (hBelief : IsReasonableBeliefOfMajority p subject c)
    : ReasonableBeliefDefenseMembership p subject a c :=
  ⟨hCommercial, hBelief⟩

end Proving.USC.T18.Ch117.Recert.Ontology
