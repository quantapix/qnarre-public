










import Proving.USC.T18.Ch113B.Wmd.Part3.Ontology.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String





structure IncorporatedDef where
  defined    : String
  citeDefine : String
  sourceCite : String
  dangling   : Bool



structure UseEdge where
  usingSection : String
  usesTerm     : String
  citeUse      : String



structure DanglingTerm where
  term   : String
  usedAt : String
  reason : String





def edge_wmd_dependsOn_destructiveDevice : DefEdge :=
  { defined := "weapon of mass destruction", dependsOn := "destructive device",
    citeDefine := "18 USC § 2332a(c)(2)(A)" }



def edge_wmd_dependsOn_toxicChemical : DefEdge :=
  { defined := "weapon of mass destruction",
    dependsOn := "toxic or poisonous chemicals, or their precursors",
    citeDefine := "18 USC § 2332a(c)(2)(B)" }



def edge_wmd_dependsOn_seriousBodilyInjury : DefEdge :=
  { defined := "weapon of mass destruction", dependsOn := "serious bodily injury",
    citeDefine := "18 USC § 2332a(c)(2)(B)" }



def edge_wmd_dependsOn_biologicalMaterial : DefEdge :=
  { defined := "weapon of mass destruction",
    dependsOn := "biological agent, toxin, or vector",
    citeDefine := "18 USC § 2332a(c)(2)(C)" }


def edge_property_dependsOn_realProperty : DefEdge :=
  { defined := "property", dependsOn := "real property",
    citeDefine := "18 USC § 2332a(c)(3)" }


def edge_property_dependsOn_personalProperty : DefEdge :=
  { defined := "property", dependsOn := "personal property",
    citeDefine := "18 USC § 2332a(c)(3)" }



def edge_transcending_dependsOn_unitedStates : DefEdge :=
  { defined := "conduct transcending national boundaries",
    dependsOn := "United States", citeDefine := "18 USC § 2332b(g)(1)" }



def edge_territorialSea_dependsOn_baselines : DefEdge :=
  { defined := "territorial sea of the United States",
    dependsOn := "baselines of the United States",
    citeDefine := "18 USC § 2332b(g)(4)" }





def edge_federalCrimeOfTerrorism_dependsOn_s2332a : DefEdge :=
  { defined := "Federal crime of terrorism",
    dependsOn := "use of weapons of mass destruction (18 USC § 2332a)",
    citeDefine := "18 USC § 2332b(g)(5)(B)(i)" }



def edge_federalCrimeOfTerrorism_dependsOn_s2332b : DefEdge :=
  { defined := "Federal crime of terrorism",
    dependsOn := "acts of terrorism transcending national boundaries (18 USC § 2332b)",
    citeDefine := "18 USC § 2332b(g)(5)(B)(i)" }



def edge_circumstances_dependsOn_commerceFacility : DefEdge :=
  { defined := "the circumstances referred to in subsection (a)",
    dependsOn := "facility of interstate or foreign commerce",
    citeDefine := "18 USC § 2332b(b)(1)(A)" }



def edge_circumstances_dependsOn_territorialSea : DefEdge :=
  { defined := "the circumstances referred to in subsection (a)",
    dependsOn := "territorial sea of the United States",
    citeDefine := "18 USC § 2332b(b)(1)(E)" }


def definitionalEdges : List DefEdge :=
  [ edge_wmd_dependsOn_destructiveDevice,
    edge_wmd_dependsOn_toxicChemical,
    edge_wmd_dependsOn_seriousBodilyInjury,
    edge_wmd_dependsOn_biologicalMaterial,
    edge_property_dependsOn_realProperty,
    edge_property_dependsOn_personalProperty,
    edge_transcending_dependsOn_unitedStates,
    edge_territorialSea_dependsOn_baselines,
    edge_federalCrimeOfTerrorism_dependsOn_s2332a,
    edge_federalCrimeOfTerrorism_dependsOn_s2332b,
    edge_circumstances_dependsOn_commerceFacility,
    edge_circumstances_dependsOn_territorialSea ]




def incorp_nationalOfTheUnitedStates : IncorporatedDef :=
  { defined := "national of the United States", citeDefine := "18 USC § 2332a(c)(1)",
    sourceCite := "8 USC § 1101(a)(22)", dangling := true }


def incorp_destructiveDevice : IncorporatedDef :=
  { defined := "destructive device", citeDefine := "18 USC § 2332a(c)(2)(A)",
    sourceCite := "18 USC § 921", dangling := true }


def incorp_biologicalAgentToxinOrVector : IncorporatedDef :=
  { defined := "biological agent, toxin, or vector",
    citeDefine := "18 USC § 2332a(c)(2)(C)", sourceCite := "18 USC § 178",
    dangling := true }


def incorp_facilityOfInterstateOrForeignCommerce : IncorporatedDef :=
  { defined := "facility of interstate or foreign commerce",
    citeDefine := "18 USC § 2332b(g)(2)", sourceCite := "18 USC § 1958(b)(2)",
    dangling := true }




def incorp_seriousBodilyInjury : IncorporatedDef :=
  { defined := "serious bodily injury", citeDefine := "18 USC § 2332b(g)(3)",
    sourceCite := "18 USC § 1365(g)(3) [editorial footnote 1]", dangling := true }


def incorporatedDefs : List IncorporatedDef :=
  [ incorp_nationalOfTheUnitedStates, incorp_destructiveDevice,
    incorp_biologicalAgentToxinOrVector,
    incorp_facilityOfInterstateOrForeignCommerce, incorp_seriousBodilyInjury ]




def use_s2332a_a_wmd : UseEdge :=
  { usingSection := "18 USC § 2332a(a)", usesTerm := "weapon of mass destruction",
    citeUse := "18 USC § 2332a(a)" }


def use_s2332a_a1_national : UseEdge :=
  { usingSection := "18 USC § 2332a(a)(1)",
    usesTerm := "national of the United States", citeUse := "18 USC § 2332a(a)(1)" }


def use_s2332a_a2_property : UseEdge :=
  { usingSection := "18 USC § 2332a(a)(2)", usesTerm := "property",
    citeUse := "18 USC § 2332a(a)(2)" }


def use_s2332a_b_national : UseEdge :=
  { usingSection := "18 USC § 2332a(b)",
    usesTerm := "national of the United States", citeUse := "18 USC § 2332a(b)" }


def use_s2332b_a1_transcending : UseEdge :=
  { usingSection := "18 USC § 2332b(a)(1)",
    usesTerm := "conduct transcending national boundaries",
    citeUse := "18 USC § 2332b(a)(1)" }


def use_s2332b_a1_circumstances : UseEdge :=
  { usingSection := "18 USC § 2332b(a)(1)",
    usesTerm := "the circumstances referred to in subsection (a)",
    citeUse := "18 USC § 2332b(a)(1)" }


def use_s2332b_a1A_seriousBodilyInjury : UseEdge :=
  { usingSection := "18 USC § 2332b(a)(1)(A)", usesTerm := "serious bodily injury",
    citeUse := "18 USC § 2332b(a)(1)(A)" }



def use_s2332b_f_federalCrimeOfTerrorism : UseEdge :=
  { usingSection := "18 USC § 2332b(f)", usesTerm := "Federal crime of terrorism",
    citeUse := "18 USC § 2332b(f)" }


def useEdges : List UseEdge :=
  [ use_s2332a_a_wmd, use_s2332a_a1_national, use_s2332a_a2_property,
    use_s2332a_b_national, use_s2332b_a1_transcending,
    use_s2332b_a1_circumstances, use_s2332b_a1A_seriousBodilyInjury,
    use_s2332b_f_federalCrimeOfTerrorism ]





def dangling_unitedStates : DanglingTerm :=
  { term := "United States", usedAt := "18 USC § 2332a(a)(2); 18 USC § 2332b(g)(1)",
    reason := "locative term used throughout; no definitional clause in this slice" }



def dangling_person : DanglingTerm :=
  { term := "person", usedAt := "18 USC § 2332a(a); 18 USC § 2332b(a)(1)(A)",
    reason := "no definitional clause in this slice" }



def dangling_lawfulAuthority : DanglingTerm :=
  { term := "lawful authority", usedAt := "18 USC § 2332a(a); 18 USC § 2332a(b)",
    reason := "qualifier on the operative verbs; no definitional clause in this slice" }



def dangling_specialMaritimeJurisdiction : DanglingTerm :=
  { term := "special maritime and territorial jurisdiction of the United States",
    usedAt := "18 USC § 2332b(b)(1)(F)",
    reason := "no definitional clause in this slice" }




def dangling_interstateOrForeignCommerce : DanglingTerm :=
  { term := "interstate or foreign commerce",
    usedAt := "18 USC § 2332a(a)(2)(A); 18 USC § 2332b(b)(1)(B)",
    reason := "only 'facility of' it is defined (§ 2332b(g)(2)); the commerce term is not" }



def dangling_state : DanglingTerm :=
  { term := "State", usedAt := "18 USC § 2332b(a)(1)",
    reason := "no definitional clause in this slice" }




def dangling_structureOrConveyance : DanglingTerm :=
  { term := "structure, conveyance",
    usedAt := "18 USC § 2332b(a)(1)(B); 18 USC § 2332b(b)(1)(D)",
    reason := "§ 2332a(c)(3) defines 'property' for § 2332a only; these terms are undefined" }


def dangling_uniformedServices : DanglingTerm :=
  { term := "uniformed services", usedAt := "18 USC § 2332b(b)(1)(C)",
    reason := "no definitional clause in this slice" }



def dangling_government : DanglingTerm :=
  { term := "government", usedAt := "18 USC § 2332b(g)(5)(A)",
    reason := "purpose condition names it; no definitional clause in this slice" }


def danglingTerms : List DanglingTerm :=
  [ dangling_unitedStates, dangling_person, dangling_lawfulAuthority,
    dangling_specialMaritimeJurisdiction, dangling_interstateOrForeignCommerce,
    dangling_state, dangling_structureOrConveyance, dangling_uniformedServices,
    dangling_government ]







structure ChemicalWeaponMembership
    (w : Weapon) (ch : ToxicChemical) (c : ComplaintText) : Prop where
  chemical  : IsToxicOrPoisonousChemicalOrPrecursor ch c
  design    : DesignedOrIntendedToCauseDeathOrSeriousBodilyInjury w c
  mechanism : ActsByReleaseDisseminationOrImpactOfToxicChemicals w ch c
  member    : IsChemicalWeapon w c




structure BiologicalWeaponMembership
    (w : Weapon) (b : BiologicalMaterial) (c : ComplaintText) : Prop where
  material : IsBiologicalAgentToxinOrVector b c
  involves : InvolvesBiologicalMaterial w b c
  member   : IsBiologicalWeapon w c


structure RadiologicalWeaponMembership (w : Weapon) (c : ComplaintText) : Prop where
  design : DesignedToReleaseDangerousRadiation w c
  member : IsRadiologicalWeapon w c




structure ConductTranscendingNationalBoundariesMembership
    (cd : Conduct) (c : ComplaintText) : Prop where
  outside : ConductOccursOutsideTheUnitedStates cd c
  inside  : ConductOccursWithinTheUnitedStates cd c
  member  : IsConductTranscendingNationalBoundaries cd c




structure TerritorialSeaMembership (wz : Waters) (c : ComplaintText) : Prop where
  withinTwelveNauticalMiles : nauticalMilesSeawardFromBaseline wz c ≤ 12
  baseline : BaselineDeterminedInAccordanceWithInternationalLaw wz c
  member   : IsTerritorialSeaOfTheUnitedStates wz c







inductive EnumeratedTerrorismPredicate (o : Offense) (c : ComplaintText) : Prop where

  | title18 (h : ViolatesEnumeratedTitle18TerrorismOffense o c)

  | atomicEnergyAct (h : ViolatesEnumeratedAtomicEnergyActOffense o c)

  | title49 (h : ViolatesEnumeratedTitle49Offense o c)

  | narcoTerrorism (h : ViolatesNarcoTerrorismOffense o c)




structure FederalCrimeOfTerrorismMembership
    (o : Offense) (c : ComplaintText) : Prop where
  calculated : CalculatedToInfluenceOrRetaliateAgainstGovernmentConduct o c
  predicate  : EnumeratedTerrorismPredicate o c
  member     : IsFederalCrimeOfTerrorism o c




inductive WeaponOfMassDestructionMembership
    (w : Weapon) (c : ComplaintText) : Prop where

  | destructiveDevice (hCase : IsDestructiveDevice w c)
      (member : IsWeaponOfMassDestruction w c)

  | chemical {ch : ToxicChemical} (hCase : ChemicalWeaponMembership w ch c)
      (member : IsWeaponOfMassDestruction w c)

  | biological {b : BiologicalMaterial} (hCase : BiologicalWeaponMembership w b c)
      (member : IsWeaponOfMassDestruction w c)

  | radiological (hCase : RadiologicalWeaponMembership w c)
      (member : IsWeaponOfMassDestruction w c)




inductive PropertyInclusion (pr : Property) (c : ComplaintText) : Prop where

  | real (hCase : IsRealProperty pr c) (member : IsProperty pr c)

  | personal (hCase : IsPersonalProperty pr c) (member : IsProperty pr c)




inductive JurisdictionalCircumstance (o : Offense) (c : ComplaintText) : Prop where

  | mail (hCase : MailUsedInFurtherance o c)

  | commerceFacility {f : Facility}
      (hFacility : IsFacilityOfInterstateOrForeignCommerce f c)
      (hCase : CommerceFacilityUsedInFurtherance o f c)

  | affectsCommerce (hCase : OffenseObstructsDelaysOrAffectsInterstateCommerce o c)

  | federalVictim {p : Person} (hCase : VictimIsUnitedStatesGovernmentOrOfficer o p c)

  | federalProperty {pr : Property} (hProperty : IsProperty pr c)
      (hCase : PropertyOwnedPossessedOrLeasedByUnitedStates pr c)

  | territorialSea {wz : Waters} (hSea : IsTerritorialSeaOfTheUnitedStates wz c)
      (hCase : CommittedInTerritorialSeaOfTheUnitedStates o wz c)

  | specialMaritimeJurisdiction {pl : Place}
      (hCase : CommittedWithinSpecialMaritimeAndTerritorialJurisdiction o pl c)

end Proving.USC.T18.Ch113B.Wmd.Part3.Ontology
