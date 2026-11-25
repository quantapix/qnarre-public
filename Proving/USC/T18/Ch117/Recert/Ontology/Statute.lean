









import Proving.USC.Common.Types
import Proving.USC.T18.Ch117.Recert.Ontology.Types
import Proving.USC.T18.Ch117.Recert.Ontology.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Ontology

open Proving.USC.Common






structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  external   : Bool
  deriving Repr



def edge_isc_dependsOn_sexualAct : DefEdge :=
  { defined := "illicit sexual conduct", dependsOn := "sexual act",
    citeDefine := "18 USC § 2423(g)(1)", external := true }

def edge_isc_dependsOn_minorUnder18 : DefEdge :=
  { defined := "illicit sexual conduct", dependsOn := "person under 18 years of age",
    citeDefine := "18 USC § 2423(g)(1)", external := false }

def edge_isc_dependsOn_chapter109A : DefEdge :=
  { defined := "illicit sexual conduct", dependsOn := "violation of chapter 109A",
    citeDefine := "18 USC § 2423(g)(1)", external := true }

def edge_isc_dependsOn_smtj : DefEdge :=
  { defined := "illicit sexual conduct",
    dependsOn := "special maritime and territorial jurisdiction of the United States",
    citeDefine := "18 USC § 2423(g)(1)", external := true }

def edge_isc_dependsOn_commercialSexAct : DefEdge :=
  { defined := "illicit sexual conduct", dependsOn := "commercial sex act",
    citeDefine := "18 USC § 2423(g)(2)", external := true }

def edge_isc_dependsOn_childPornography : DefEdge :=
  { defined := "illicit sexual conduct", dependsOn := "child pornography",
    citeDefine := "18 USC § 2423(g)(3)", external := true }



def edge_intent_dependsOn_prostitution : DefEdge :=
  { defined := "intent", dependsOn := "prostitution",
    citeDefine := "18 USC § 2423(h)", external := true }

def edge_intent_dependsOn_chargeableSexualActivity : DefEdge :=
  { defined := "intent",
    dependsOn := "sexual activity for which any person can be charged with a criminal offense",
    citeDefine := "18 USC § 2423(h)", external := true }

def edge_intent_dependsOn_illicitSexualConduct : DefEdge :=
  { defined := "intent", dependsOn := "illicit sexual conduct",
    citeDefine := "18 USC § 2423(h)", external := false }

def edge_intent_dependsOn_travel : DefEdge :=
  { defined := "intent", dependsOn := "transportation or travel",
    citeDefine := "18 USC § 2423(h)", external := false }



def edge_ics_dependsOn_communicationsAct : DefEdge :=
  { defined := "interactive computer service",
    dependsOn := "47 U.S.C. § 230(f) definition",
    citeDefine := "18 USC § 2421A(a)", external := true }



def edge_s2421Aa_usesIcs : DefEdge :=
  { defined := "18 USC § 2421A(a)", dependsOn := "interactive computer service",
    citeDefine := "18 USC § 2421A(a)", external := false }

def edge_s2421Aa_usesCommerceFacility : DefEdge :=
  { defined := "18 USC § 2421A(a)",
    dependsOn := "facility or means of interstate or foreign commerce",
    citeDefine := "18 USC § 2421A(a)", external := true }

def edge_s2421Aa_usesProstitution : DefEdge :=
  { defined := "18 USC § 2421A(a)", dependsOn := "prostitution of another person",
    citeDefine := "18 USC § 2421A(a)", external := true }

def edge_s2421Aa_usesInchoate : DefEdge :=
  { defined := "18 USC § 2421A(a)", dependsOn := "conspires or attempts",
    citeDefine := "18 USC § 2421A(a)", external := false }

def edge_s2421Ab_usesFiveOrMore : DefEdge :=
  { defined := "18 USC § 2421A(b)", dependsOn := "prostitution of 5 or more persons",
    citeDefine := "18 USC § 2421A(b)(1)", external := false }

def edge_s2421Ab_usesRecklessDisregard : DefEdge :=
  { defined := "18 USC § 2421A(b)", dependsOn := "reckless disregard",
    citeDefine := "18 USC § 2421A(b)(2)", external := true }



def edge_s2421Ab_usesSexTrafficking : DefEdge :=
  { defined := "18 USC § 2421A(b)", dependsOn := "sex trafficking (18 USC § 1591(a))",
    citeDefine := "18 USC § 2421A(b)(2)", external := true }

def edge_s2421Ac_usesInjury : DefEdge :=
  { defined := "18 USC § 2421A(c)",
    dependsOn := "person injured by reason of a violation of § 2421A(b)",
    citeDefine := "18 USC § 2421A(c)", external := false }

def edge_s2421Ac_usesDistrictCourt : DefEdge :=
  { defined := "18 USC § 2421A(c)",
    dependsOn := "appropriate United States district court",
    citeDefine := "18 USC § 2421A(c)", external := true }



def edge_s2421Ad_usesRestitution : DefEdge :=
  { defined := "18 USC § 2421A(d)",
    dependsOn := "restitution (18 USC §§ 3663, 3663A, 2327(b))",
    citeDefine := "18 USC § 2421A(d)", external := true }

def edge_s2421Ae_usesTargetedJurisdiction : DefEdge :=
  { defined := "18 USC § 2421A(e)", dependsOn := "targeted jurisdiction",
    citeDefine := "18 USC § 2421A(e)", external := false }

def edge_s2423a_usesMinor : DefEdge :=
  { defined := "18 USC § 2423(a)",
    dependsOn := "individual who has not attained the age of 18 years",
    citeDefine := "18 USC § 2423(a)", external := false }

def edge_s2423a_usesIntent : DefEdge :=
  { defined := "18 USC § 2423(a)", dependsOn := "intent",
    citeDefine := "18 USC § 2423(h)", external := false }

def edge_s2423a_usesLocus : DefEdge :=
  { defined := "18 USC § 2423(a)",
    dependsOn := "commonwealth, territory or possession of the United States",
    citeDefine := "18 USC § 2423(a)", external := true }

def edge_s2423b_usesCitizenship : DefEdge :=
  { defined := "18 USC § 2423(b)",
    dependsOn := "United States citizen / alien admitted for permanent residence",
    citeDefine := "18 USC § 2423(b)", external := true }

def edge_s2423b_usesIllicitSexualConduct : DefEdge :=
  { defined := "18 USC § 2423(b)", dependsOn := "illicit sexual conduct",
    citeDefine := "18 USC § 2423(g)", external := false }

def edge_s2423c_usesForeignResidence : DefEdge :=
  { defined := "18 USC § 2423(c)",
    dependsOn := "resides, either temporarily or permanently, in a foreign country",
    citeDefine := "18 USC § 2423(c)", external := false }

def edge_s2423d_usesOrganization : DefEdge :=
  { defined := "18 USC § 2423(d)",
    dependsOn := "organization that affects interstate or foreign commerce",
    citeDefine := "18 USC § 2423(d)(1)", external := true }

def edge_s2423d_usesAffiliationRole : DefEdge :=
  { defined := "18 USC § 2423(d)", dependsOn := "officer, director, employee, or agent",
    citeDefine := "18 USC § 2423(d)(1)", external := true }

def edge_s2423d_usesInstrumentality : DefEdge :=
  { defined := "18 USC § 2423(d)",
    dependsOn := "mails or any means or instrumentality of interstate or foreign commerce",
    citeDefine := "18 USC § 2423(d)(2)", external := true }

def edge_s2423e_usesFinancialGain : DefEdge :=
  { defined := "18 USC § 2423(e)",
    dependsOn := "commercial advantage or private financial gain",
    citeDefine := "18 USC § 2423(e)", external := true }

def edge_s2423f_usesSubstantiveOffense : DefEdge :=
  { defined := "18 USC § 2423(f)",
    dependsOn := "subsection (a), (b), (c), (d), or (e) offense",
    citeDefine := "18 USC § 2423(f)", external := false }

def edge_s2423i_usesCommercialSexAct : DefEdge :=
  { defined := "18 USC § 2423(i)", dependsOn := "commercial sex act",
    citeDefine := "18 USC § 2423(g)(2)", external := true }


def defEdges : List DefEdge :=
  [ edge_isc_dependsOn_sexualAct, edge_isc_dependsOn_minorUnder18,
    edge_isc_dependsOn_chapter109A, edge_isc_dependsOn_smtj,
    edge_isc_dependsOn_commercialSexAct, edge_isc_dependsOn_childPornography,
    edge_intent_dependsOn_prostitution,
    edge_intent_dependsOn_chargeableSexualActivity,
    edge_intent_dependsOn_illicitSexualConduct, edge_intent_dependsOn_travel,
    edge_ics_dependsOn_communicationsAct,
    edge_s2421Aa_usesIcs, edge_s2421Aa_usesCommerceFacility,
    edge_s2421Aa_usesProstitution, edge_s2421Aa_usesInchoate,
    edge_s2421Ab_usesFiveOrMore, edge_s2421Ab_usesRecklessDisregard,
    edge_s2421Ab_usesSexTrafficking, edge_s2421Ac_usesInjury,
    edge_s2421Ac_usesDistrictCourt, edge_s2421Ad_usesRestitution,
    edge_s2421Ae_usesTargetedJurisdiction,
    edge_s2423a_usesMinor, edge_s2423a_usesIntent, edge_s2423a_usesLocus,
    edge_s2423b_usesCitizenship, edge_s2423b_usesIllicitSexualConduct,
    edge_s2423c_usesForeignResidence, edge_s2423d_usesOrganization,
    edge_s2423d_usesAffiliationRole, edge_s2423d_usesInstrumentality,
    edge_s2423e_usesFinancialGain, edge_s2423f_usesSubstantiveOffense,
    edge_s2423i_usesCommercialSexAct ]






structure ServiceOperatorMembership
    (p : Person) (s : InteractiveComputerService) (f : CommerceFacility)
    (c : ComplaintText) : Prop where
  service  : IsInteractiveComputerService s c
  facility : IsFacilityOrMeansOfInterstateCommerce f c
  operator : IsOwnerManagerOrOperator p s c



structure ProstitutionPromotionMembership
    (a : ProstitutionActivity) (subject : Person) (c : ComplaintText) : Prop where
  promotion : IsPromotionOrFacilitationOfProstitution a c
  ofAnother : IsProstitutionOfAnotherPerson a subject c



inductive AggravatingCircumstance
    (p : Person) (a : ProstitutionActivity) (c : ComplaintText) : Prop where
  | fiveOrMorePersons (h : IsFiveOrMorePersonsPromoted a c)
  | recklessDisregardOfSexTrafficking
      (t : SexTraffickingViolation)
      (hTraffic : IsSexTraffickingViolation t c)
      (hReckless : IsRecklessDisregardOfContribution p t c)



structure CivilClaimantMembership
    (p : Person) (j : Jurisdiction) (c : ComplaintText) : Prop where
  injured : IsPersonInjuredByReasonOf p c
  forum   : IsAppropriateUnitedStatesDistrictCourt j c



structure RestitutionScopeMembership
    (r : RestitutionOrder) (o : SubstantiveOffense) (c : ComplaintText) : Prop where
  predicateOffense : IsSubstantiveOffenseInScope o c
  scope            : IsRestitutionConsistentWithSection2327b r c




structure LegalityDefenseMembership
    (a : ProstitutionActivity) (j : Jurisdiction) (c : ComplaintText) : Prop where
  targeted : IsTargetedJurisdiction j a c
  legality : IsProstitutionLegalInJurisdiction j c





structure InchoateOffenseMembership
    (p : Person) (o : SubstantiveOffense) (c : ComplaintText) : Prop where
  substantive : IsSubstantiveOffenseInScope o c
  inchoate    : IsAttemptOrConspiracyToViolate p o c






inductive Section2423aLocus (t : TravelOrTransportation) (c : ComplaintText) : Prop where
  | interstateOrForeign (h : IsInterstateOrForeignCommerceTransport t c)
  | commonwealthTerritoryOrPossession
      (j : Jurisdiction) (h : IsCommonwealthTerritoryOrPossession j c)




structure TransportedMinorMembership
    (p : Person) (subject : Person) (t : TravelOrTransportation) (i : Intent)
    (moment : Time) (c : ComplaintText) : Prop where
  minor   : IsMinorUnder18 subject c
  knowing : IsKnowingTransportation p t subject c
  locus   : Section2423aLocus t c
  intent  : IsIntentUnderSection2423 i c
  timing  : IsAtTimeOfTransportationOrTravel i t moment c



inductive CoveredTravelerStatus (p : Person) (c : ComplaintText) : Prop where
  | citizen (h : IsUnitedStatesCitizen p c)
  | lawfulPermanentResident (h : IsAlienAdmittedForPermanentResidence p c)




inductive CoveredTravelMembership
    (t : TravelOrTransportation) (c : ComplaintText) : Prop where
  | interstate (h : IsTravelInInterstateCommerce t c)
  | intoTheUnitedStates (h : IsTravelIntoTheUnitedStates t c)
  | foreign (h : IsTravelInForeignCommerce t c)




structure ForeignResidenceMembership
    (p : Person) (j : Jurisdiction) (icc : IllicitSexualConduct) (other : Person)
    (c : ComplaintText) : Prop where
  status        : CoveredTravelerStatus p c
  foreignCountry : IsForeignCountry j c
  residence     : IsResidenceInForeignCountry p j c
  conduct       : IsEngagementInIllicitSexualConduct p icc other c





structure OrganizationalAffiliationMembership
    (p : Person) (o : Entity) (icc : IllicitSexualConduct) (c : ComplaintText) : Prop where
  status          : CoveredTravelerStatus p c
  role            : IsOfficerDirectorEmployeeOrAgent p o c
  organization    : IsOrganizationAffectingCommerce o c
  instrumentality : IsUseOfMailsOrInstrumentality p o c
  furtherance     : IsActInFurtheranceThroughAffiliation p o icc c




structure TravelFacilitatorMembership
    (p : Person) (traveler : Person) (t : TravelOrTransportation) (i : Intent)
    (c : ComplaintText) : Prop where
  purpose       : IsForCommercialAdvantageOrPrivateFinancialGain p c
  conduct       : IsArrangingInducingProcuringOrFacilitatingTravel p t c
  travel        : CoveredTravelMembership t c
  knowledge     : IsKnowledgeOfTravelersIntent p traveler i c
  travelerIntent : IsIntentUnderSection2423 i c




inductive IllicitSexualConductMembership
    (icc : IllicitSexualConduct) (c : ComplaintText) : Prop where
  | sexualActWithMinor
      (a : SexualAct) (victim : Person)
      (hAct : IsSexualActUnderSection2246 a c)
      (hMinor : IsMinorUnder18 victim c)
      (hChapter109A : IsChapter109AViolationIfInSMTJ a c)
      (hMember : IsIllicitSexualConduct icc c)
  | commercialSexActWithMinor
      (a : CommercialSexAct) (victim : Person)
      (hAct : IsCommercialSexActUnderSection1591 a c)
      (hMinor : IsMinorUnder18 victim c)
      (hMember : IsIllicitSexualConduct icc c)
  | productionOfChildPornography
      (cp : ChildPornography)
      (hProduction : IsProductionOfChildPornography cp c)
      (hMember : IsIllicitSexualConduct icc c)



inductive IntentMembership
    (i : Intent) (t : TravelOrTransportation) (moment : Time)
    (c : ComplaintText) : Prop where
  | toProstitution
      (hObject : IsIntentionToEngageInProstitution i c)
      (hTiming : IsAtTimeOfTransportationOrTravel i t moment c)
      (hMember : IsIntentUnderSection2423 i c)
  | toChargeableSexualActivity
      (a : SexualActivityChargeableAsOffense)
      (hActivity : IsSexualActivityChargeableAsCriminalOffense a c)
      (hObject : IsIntentionToEngageInChargeableSexualActivity i c)
      (hTiming : IsAtTimeOfTransportationOrTravel i t moment c)
      (hMember : IsIntentUnderSection2423 i c)
  | toIllicitSexualConduct
      (hObject : IsIntentionToEngageInIllicitSexualConduct i c)
      (hTiming : IsAtTimeOfTransportationOrTravel i t moment c)
      (hMember : IsIntentUnderSection2423 i c)




structure ReasonableBeliefDefenseMembership
    (p : Person) (subject : Person) (a : CommercialSexAct)
    (c : ComplaintText) : Prop where
  commercialSexAct : IsCommercialSexActUnderSection1591 a c
  belief           : IsReasonableBeliefOfMajority p subject c

end Proving.USC.T18.Ch117.Recert.Ontology
