









import Proving.USC.T18.Ch113B.Wmd.Ontology.Types
import Proving.USC.T18.Ch113B.Wmd.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Ontology

open Proving.USC.Common





inductive WeaponOfMassDestruction (w : Weapon) (c : ComplaintText) : Prop where

  | destructiveDevice  (h : IsDestructiveDevice w c) : WeaponOfMassDestruction w c

  | toxicChemical      (h : IsToxicChemicalWeapon w c) : WeaponOfMassDestruction w c

  | biological         (h : InvolvesBiologicalAgentToxinOrVector w c) : WeaponOfMassDestruction w c

  | radiological       (h : IsRadiologicalWeapon w c) : WeaponOfMassDestruction w c





inductive PropertyUnder2332a (x : Property) (c : ComplaintText) : Prop where

  | real      (h : IsRealProperty x c) : PropertyUnder2332a x c

  | personal  (h : IsPersonalProperty x c) : PropertyUnder2332a x c

  | otherwise (h : IsPropertyOtherwiseIncluded x c) : PropertyUnder2332a x c




structure ConductTranscendingNationalBoundaries (x : Conduct) (c : ComplaintText) : Prop where

  outside : OccursOutsideTheUnitedStates x c

  within  : OccursWithinTheUnitedStates x c




structure TerritorialSeaOfTheUnitedStates (z : MaritimeZone) (c : ComplaintText) : Prop where

  seawardExtent : ExtendsSeawardWithinTwelveNauticalMiles z c

  fromBaselines : MeasuredFromUnitedStatesBaselines z c



inductive EnumeratedTerrorismProvisionViolation (o : Offense) (c : ComplaintText) : Prop where

  | title18       (h : ViolatesEnumeratedTitle18Provision o c)
      : EnumeratedTerrorismProvisionViolation o c

  | atomicEnergy  (h : ViolatesEnumeratedAtomicEnergyActProvision o c)
      : EnumeratedTerrorismProvisionViolation o c

  | title49       (h : ViolatesEnumeratedTitle49Provision o c)
      : EnumeratedTerrorismProvisionViolation o c

  | narcoTerrorism (h : ViolatesNarcoTerrorismProvision o c)
      : EnumeratedTerrorismProvisionViolation o c





structure FederalCrimeOfTerrorism (o : Offense) (c : ComplaintText) : Prop where


  motive     : CalculatedToInfluenceOrRetaliateAgainstGovernmentConduct o c

  enumerated : EnumeratedTerrorismProvisionViolation o c



inductive CircumstanceUnder2332b (cir : Circumstance) (c : ComplaintText) : Prop where

  | mailOrFacility     (h : MailOrFacilityOfCommerceUsedInFurtherance cir c)
      : CircumstanceUnder2332b cir c

  | commerceEffect     (h : OffenseObstructsDelaysOrAffectsCommerce cir c)
      : CircumstanceUnder2332b cir c

  | federalVictim      (h : VictimIsUnitedStatesGovernmentOrOfficial cir c)
      : CircumstanceUnder2332b cir c

  | federalProperty    (h : PropertyOwnedPossessedOrLeasedByUnitedStates cir c)
      : CircumstanceUnder2332b cir c

  | territorialSea     (h : CommittedInTerritorialSeaOfTheUnitedStates cir c)
      : CircumstanceUnder2332b cir c


  | specialJurisdiction (h : CommittedWithinSpecialMaritimeAndTerritorialJurisdiction cir c)
      : CircumstanceUnder2332b cir c





structure JurisdictionalCircumstanceAttribution
    (cir : Circumstance) (c : ComplaintText) : Prop where

  enumerated : CircumstanceUnder2332b cir c

  attributed : AppliesToAtLeastOneOffender cir c





structure DefEdge where

  defined    : String

  dependsOn  : String


  citeDefine : String


structure DanglingTerm where

  term    : String

  usedAt  : String

  definedAt : String





def edge_wmd_dependsOn_destructiveDevice : DefEdge :=
  { defined := "weapon of mass destruction", dependsOn := "destructive device",
    citeDefine := "18 USC § 2332a(c)(2)(A)" }




def edge_wmd_dependsOn_seriousBodilyInjury : DefEdge :=
  { defined := "weapon of mass destruction", dependsOn := "serious bodily injury",
    citeDefine := "18 USC § 2332a(c)(2)(B)" }


def edge_wmd_dependsOn_biologicalAgent : DefEdge :=
  { defined := "weapon of mass destruction",
    dependsOn := "biological agent, toxin, or vector",
    citeDefine := "18 USC § 2332a(c)(2)(C)" }


def edge_national_dependsOn_ina : DefEdge :=
  { defined := "national of the United States",
    dependsOn := "national of the United States (8 USC § 1101(a)(22))",
    citeDefine := "18 USC § 2332a(c)(1)" }


def edge_property_dependsOn_realProperty : DefEdge :=
  { defined := "property", dependsOn := "real property",
    citeDefine := "18 USC § 2332a(c)(3)" }


def edge_property_dependsOn_personalProperty : DefEdge :=
  { defined := "property", dependsOn := "personal property",
    citeDefine := "18 USC § 2332a(c)(3)" }


def edge_s2332a_uses_wmd : DefEdge :=
  { defined := "18 USC § 2332a(a) offense", dependsOn := "weapon of mass destruction",
    citeDefine := "18 USC § 2332a(a)" }



def edge_s2332a_uses_national : DefEdge :=
  { defined := "18 USC § 2332a(a) offense",
    dependsOn := "national of the United States", citeDefine := "18 USC § 2332a(a)(1)" }


def edge_s2332a_uses_property : DefEdge :=
  { defined := "18 USC § 2332a(a) offense", dependsOn := "property",
    citeDefine := "18 USC § 2332a(a)(2)" }




def edge_transcending_dependsOn_unitedStates : DefEdge :=
  { defined := "conduct transcending national boundaries",
    dependsOn := "United States", citeDefine := "18 USC § 2332b(g)(1)" }


def edge_facility_dependsOn_s1958 : DefEdge :=
  { defined := "facility of interstate or foreign commerce",
    dependsOn := "facility of interstate or foreign commerce (18 USC § 1958(b)(2))",
    citeDefine := "18 USC § 2332b(g)(2)" }



def edge_sbi_dependsOn_s1365 : DefEdge :=
  { defined := "serious bodily injury",
    dependsOn := "serious bodily injury (18 USC § 1365(g)(3))",
    citeDefine := "18 USC § 2332b(g)(3)" }



def edge_territorialSea_dependsOn_baselines : DefEdge :=
  { defined := "territorial sea of the United States",
    dependsOn := "baselines of the United States", citeDefine := "18 USC § 2332b(g)(4)" }



def edge_fcot_dependsOn_title18List : DefEdge :=
  { defined := "Federal crime of terrorism",
    dependsOn := "enumerated title 18 offense provisions",
    citeDefine := "18 USC § 2332b(g)(5)(B)(i)" }


def edge_fcot_dependsOn_aeaList : DefEdge :=
  { defined := "Federal crime of terrorism",
    dependsOn := "Atomic Energy Act §§ 92, 236 (42 USC 2122, 2284)",
    citeDefine := "18 USC § 2332b(g)(5)(B)(ii)" }


def edge_fcot_dependsOn_title49List : DefEdge :=
  { defined := "Federal crime of terrorism",
    dependsOn := "enumerated title 49 provisions",
    citeDefine := "18 USC § 2332b(g)(5)(B)(iii)" }


def edge_fcot_dependsOn_narcoTerrorism : DefEdge :=
  { defined := "Federal crime of terrorism",
    dependsOn := "Controlled Substances Import and Export Act § 1010A",
    citeDefine := "18 USC § 2332b(g)(5)(B)(iv)" }



def edge_circumstance_dependsOn_facility : DefEdge :=
  { defined := "circumstance referred to in subsection (a)",
    dependsOn := "facility of interstate or foreign commerce",
    citeDefine := "18 USC § 2332b(b)(1)(A)" }




def edge_circumstance_dependsOn_territorialSea : DefEdge :=
  { defined := "circumstance referred to in subsection (a)",
    dependsOn := "territorial sea of the United States",
    citeDefine := "18 USC § 2332b(b)(1)(E)" }



def edge_circumstance_dependsOn_smtj : DefEdge :=
  { defined := "circumstance referred to in subsection (a)",
    dependsOn := "special maritime and territorial jurisdiction of the United States",
    citeDefine := "18 USC § 2332b(b)(1)(F)" }


def edge_jurisdiction_dependsOn_accessory : DefEdge :=
  { defined := "jurisdiction under section 2332b",
    dependsOn := "accessory after the fact", citeDefine := "18 USC § 2332b(b)(2)" }



def edge_s2332b_uses_transcending : DefEdge :=
  { defined := "18 USC § 2332b(a) offense",
    dependsOn := "conduct transcending national boundaries",
    citeDefine := "18 USC § 2332b(a)(1)" }


def edge_s2332b_uses_circumstance : DefEdge :=
  { defined := "18 USC § 2332b(a) offense",
    dependsOn := "circumstance referred to in subsection (a)",
    citeDefine := "18 USC § 2332b(a)(1)" }



def edge_s2332b_uses_seriousBodilyInjury : DefEdge :=
  { defined := "18 USC § 2332b(a) offense", dependsOn := "serious bodily injury",
    citeDefine := "18 USC § 2332b(a)(1)(A)" }


def defEdges : List DefEdge :=
  [ edge_wmd_dependsOn_destructiveDevice
  , edge_wmd_dependsOn_seriousBodilyInjury
  , edge_wmd_dependsOn_biologicalAgent
  , edge_national_dependsOn_ina
  , edge_property_dependsOn_realProperty
  , edge_property_dependsOn_personalProperty
  , edge_s2332a_uses_wmd
  , edge_s2332a_uses_national
  , edge_s2332a_uses_property
  , edge_transcending_dependsOn_unitedStates
  , edge_facility_dependsOn_s1958
  , edge_sbi_dependsOn_s1365
  , edge_territorialSea_dependsOn_baselines
  , edge_fcot_dependsOn_title18List
  , edge_fcot_dependsOn_aeaList
  , edge_fcot_dependsOn_title49List
  , edge_fcot_dependsOn_narcoTerrorism
  , edge_circumstance_dependsOn_facility
  , edge_circumstance_dependsOn_territorialSea
  , edge_circumstance_dependsOn_smtj
  , edge_jurisdiction_dependsOn_accessory
  , edge_s2332b_uses_transcending
  , edge_s2332b_uses_circumstance
  , edge_s2332b_uses_seriousBodilyInjury ]



def danglingTerms : List DanglingTerm :=
  [ { term := "destructive device", usedAt := "18 USC § 2332a(c)(2)(A)",
      definedAt := "18 USC § 921" }
  , { term := "biological agent, toxin, or vector", usedAt := "18 USC § 2332a(c)(2)(C)",
      definedAt := "18 USC § 178" }
  , { term := "serious bodily injury", usedAt := "18 USC § 2332a(c)(2)(B)",
      definedAt := "" }
  , { term := "national of the United States", usedAt := "18 USC § 2332a(c)(1)",
      definedAt := "8 USC § 1101(a)(22)" }
  , { term := "facility of interstate or foreign commerce",
      usedAt := "18 USC § 2332b(g)(2)", definedAt := "18 USC § 1958(b)(2)" }
  , { term := "serious bodily injury", usedAt := "18 USC § 2332b(g)(3)",
      definedAt := "18 USC § 1365(g)(3)" }
  , { term := "lawful authority", usedAt := "18 USC § 2332a(a)", definedAt := "" }
  , { term := "United States", usedAt := "18 USC § 2332a(a); § 2332b(g)(1)",
      definedAt := "" }
  , { term := "interstate or foreign commerce",
      usedAt := "18 USC § 2332a(a)(2); § 2332b(b)(1)(B)", definedAt := "" }
  , { term := "foreign government", usedAt := "18 USC § 2332a(a)(4)",
      definedAt := "" }
  , { term := "department or agency of the United States",
      usedAt := "18 USC § 2332a(a)(3); § 2332b(b)(1)(D)", definedAt := "" }
  , { term := "State", usedAt := "18 USC § 2332b(a)(1)", definedAt := "" }
  , { term := "special maritime and territorial jurisdiction of the United States",
      usedAt := "18 USC § 2332b(b)(1)(F)", definedAt := "18 USC § 7" }
  , { term := "accessory after the fact", usedAt := "18 USC § 2332b(b)(2), (e)(2)",
      definedAt := "18 USC § 3" }
  , { term := "baselines of the United States", usedAt := "18 USC § 2332b(g)(4)",
      definedAt := "" }
  , { term := "structure, conveyance, or other real or personal property",
      usedAt := "18 USC § 2332b(a)(1)(B)", definedAt := "" }
  , { term := "dangerous weapon", usedAt := "18 USC § 2332b(a)(1)(A)",
      definedAt := "" }
  , { term := "uniformed services", usedAt := "18 USC § 2332b(b)(1)(C)",
      definedAt := "" } ]

end Proving.USC.T18.Ch113B.Wmd.Ontology
