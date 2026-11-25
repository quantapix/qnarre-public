












import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Ontology.Types
import Proving.USC.T18.Ch113B.Ontology.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Ontology

open Proving.USC.Common






structure InternationalTerrorismDefinition (a : Activity) (c : ComplaintText) : Prop where
  criminalDangerousActs : InvolvesViolentActsOrActsDangerousToHumanLife a c
  appearsIntended :
    AppearsIntendedToIntimidateOrCoerceCivilianPopulation a c ∨
    AppearsIntendedToInfluenceGovernmentPolicy a c ∨
    AppearsIntendedToAffectGovernmentConduct a c
  transnationalLocus :
    OccursPrimarilyOutsideTerritorialJurisdictionOfUS a c ∨
    TranscendsNationalBoundaries a c




structure DomesticTerrorismDefinition (a : Activity) (c : ComplaintText) : Prop where
  dangerousActs : InvolvesActsDangerousToHumanLife a c
  appearsIntended :
    AppearsIntendedToIntimidateOrCoerceCivilianPopulation a c ∨
    AppearsIntendedToInfluenceGovernmentPolicy a c ∨
    AppearsIntendedToAffectGovernmentConduct a c
  domesticLocus : OccursPrimarilyWithinTerritorialJurisdictionOfUS a c



structure PersonDefinition (p : Person) (c : ComplaintText) : Prop where
  capability : CapableOfHoldingLegalOrBeneficialInterestInProperty p c


inductive ActOfWarDefinition (x : Act) (c : ComplaintText) : Prop where
  | declaredWar (h : OccursInCourseOfDeclaredWar x c) : ActOfWarDefinition x c
  | betweenNations (h : OccursInCourseOfArmedConflictBetweenNations x c) : ActOfWarDefinition x c
  | betweenMilitaryForces (h : OccursInCourseOfArmedConflictBetweenMilitaryForces x c) :
      ActOfWarDefinition x c



inductive ExcludedFromMilitaryForce (m : MilitaryForce) (c : ComplaintText) : Prop where
  | designatedFTO (h : IsDesignatedForeignTerroristOrganization m c) :
      ExcludedFromMilitaryForce m c
  | designatedSDGT (h : IsSpeciallyDesignatedGlobalTerrorist m c) :
      ExcludedFromMilitaryForce m c
  | courtDetermination (h : DeterminedByCourtNotToBeMilitaryForce m c) :
      ExcludedFromMilitaryForce m c




structure MilitaryForceDefinition (m : MilitaryForce) (c : ComplaintText) : Prop where
  residual : IsMilitaryForce m c
  notExcluded : ¬ ExcludedFromMilitaryForce m c


inductive WeaponOfMassDestructionDefinition (w : Weapon) (c : ComplaintText) : Prop where
  | destructiveDevice (h : IsDestructiveDevice w c) : WeaponOfMassDestructionDefinition w c
  | chemical (h : IsToxicOrPoisonousChemicalWeapon w c) : WeaponOfMassDestructionDefinition w c
  | biological (h : IsBiologicalAgentWeapon w c) : WeaponOfMassDestructionDefinition w c
  | radiological (h : IsRadiationReleasingWeapon w c) : WeaponOfMassDestructionDefinition w c



structure FederalCrimeOfTerrorismDefinition (o : Offense) (c : ComplaintText) : Prop where
  terrorismPurpose : IsCalculatedToInfluenceOrRetaliateAgainstGovernment o c
  enumeratedOffense : IsEnumeratedTerrorismPredicateOffense o c


inductive UnitedStatesPersonDefinition (p : Person) (c : ComplaintText) : Prop where
  | citizenOrNational (h : IsUnitedStatesCitizenOrNational p c) : UnitedStatesPersonDefinition p c
  | permanentResident (h : IsPermanentResidentAlien p c) : UnitedStatesPersonDefinition p c
  | juridicalPerson (h : IsJuridicalPersonOrganizedUnderUnitedStatesLaw p c) :
      UnitedStatesPersonDefinition p c
  | presentInUS (h : IsPersonInUS p c) : UnitedStatesPersonDefinition p c




structure ArmedConflictDefinition (ac : ArmedConflict) (c : ComplaintText) : Prop where
  residual : IsArmedConflict ac c
  notInternalDisturbance : ¬ IsInternalDisturbanceOrTension ac c


inductive DeviceDefinition (d : Device) (c : ComplaintText) : Prop where
  | nuclearExplosive (h : IsNuclearExplosiveDevice d c) : DeviceDefinition d c
  | dispersalOrEmitting (h : IsRadioactiveDispersalOrRadiationEmittingDevice d c) :
      DeviceDefinition d c


inductive NuclearFacilityDefinition (f : Facility) (c : ComplaintText) : Prop where
  | reactor (h : IsNuclearReactor f c) : NuclearFacilityDefinition f c
  | plantOrConveyance (h : IsRadioactiveMaterialPlantOrConveyance f c) :
      NuclearFacilityDefinition f c
  | handlingFacility (h : IsNuclearMaterialHandlingFacility f c) : NuclearFacilityDefinition f c



inductive RadioactiveMaterialDefinition (m : Material) (c : ComplaintText) : Prop where
  | nuclearMaterial (h : IsNuclearMaterial m c) : RadioactiveMaterialDefinition m c
  | otherRadioactiveSubstance (h : ContainsSpontaneouslyDisintegratingNuclides m c) :
      RadioactiveMaterialDefinition m c




inductive BombingDeviceDefinition (d : Device) (c : ComplaintText) : Prop where
  | explosive (h : IsExplosive d c) : BombingDeviceDefinition d c
  | otherLethalDevice (h : IsOtherLethalDevice d c) : BombingDeviceDefinition d c




structure BlockedAssetInclusion (a : Asset) (p : Person) (c : ComplaintText) : Prop where
  ofTerroristParty : IsAssetOfTerroristParty a p c
  partyIsTerroristParty : IsTerroristParty p c
  seizedOrFrozen : SeizedOrFrozenUnderKingpinAct a c





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



structure ExternalIncorporation where
  term     : String
  citeIn   : String
  citeFrom : String



structure DanglingTerm where
  term   : String
  usedAt : String
  note   : String




def edge_militaryForce_dependsOn_person : DefEdge :=
  { defined := "military force", dependsOn := "person", citeDefine := "18 USC § 2331(6)" }



def edge_actOfWar_dependsOn_militaryForce : DefEdge :=
  { defined := "act of war", dependsOn := "military force", citeDefine := "18 USC § 2331(4)(C)" }



def edge_weaponOfMassDestruction_dependsOn_seriousBodilyInjury : DefEdge :=
  { defined := "weapon of mass destruction", dependsOn := "serious bodily injury",
    citeDefine := "18 USC § 2332a(c)(2)(B)" }


def edge_unitedStatesPerson_dependsOn_national : DefEdge :=
  { defined := "United States person", dependsOn := "national of the United States",
    citeDefine := "18 USC § 2332d(b)(2)(A)" }


def edge_unitedStatesPerson_dependsOn_person : DefEdge :=
  { defined := "United States person", dependsOn := "person",
    citeDefine := "18 USC § 2332d(b)(2)(D)" }


def edge_stateOrGovernmentFacility_dependsOn_state : DefEdge :=
  { defined := "state or government facility", dependsOn := "state",
    citeDefine := "18 USC § 2332f(e)(3)" }


def edge_intergovernmentalOrganization_dependsOn_internationalOrganization : DefEdge :=
  { defined := "intergovernmental organization", dependsOn := "international organization",
    citeDefine := "18 USC § 2332f(e)(4)" }



def edge_explosive_dependsOn_seriousBodilyInjury : DefEdge :=
  { defined := "explosive", dependsOn := "serious bodily injury",
    citeDefine := "18 USC § 2332f(e)(8)" }


def edge_otherLethalDevice_dependsOn_seriousBodilyInjury : DefEdge :=
  { defined := "other lethal device", dependsOn := "serious bodily injury",
    citeDefine := "18 USC § 2332f(e)(9)" }


def edge_militaryForcesOfAState_dependsOn_state : DefEdge :=
  { defined := "military forces of a state", dependsOn := "state",
    citeDefine := "18 USC § 2332f(e)(10)" }


def edge_armedConflict2332i_dependsOn_armedConflict2332f : DefEdge :=
  { defined := "armed conflict (§ 2332i)", dependsOn := "armed conflict (§ 2332f)",
    citeDefine := "18 USC § 2332i(e)(1)" }


def edge_stateOrGovernmentFacility2332i_dependsOn_2332f : DefEdge :=
  { defined := "state or government facility (§ 2332i)",
    dependsOn := "state or government facility (§ 2332f)",
    citeDefine := "18 USC § 2332i(e)(11)" }


def edge_device_dependsOn_radioactiveMaterial : DefEdge :=
  { defined := "device", dependsOn := "radioactive material",
    citeDefine := "18 USC § 2332i(e)(2)(B)" }


def edge_device_dependsOn_seriousBodilyInjury : DefEdge :=
  { defined := "device", dependsOn := "serious bodily injury",
    citeDefine := "18 USC § 2332i(e)(2)(B)" }


def edge_nuclearFacility_dependsOn_radioactiveMaterial : DefEdge :=
  { defined := "nuclear facility", dependsOn := "radioactive material",
    citeDefine := "18 USC § 2332i(e)(6)(B)" }


def edge_nuclearFacility_dependsOn_nuclearMaterial : DefEdge :=
  { defined := "nuclear facility", dependsOn := "nuclear material",
    citeDefine := "18 USC § 2332i(e)(6)(C)" }


def edge_radioactiveMaterial_dependsOn_nuclearMaterial : DefEdge :=
  { defined := "radioactive material", dependsOn := "nuclear material",
    citeDefine := "18 USC § 2332i(e)(8)" }


def edge_radioactiveMaterial_dependsOn_seriousBodilyInjury : DefEdge :=
  { defined := "radioactive material", dependsOn := "serious bodily injury",
    citeDefine := "18 USC § 2332i(e)(8)" }



def edge_blockedAsset_dependsOn_terroristParty : DefEdge :=
  { defined := "blocked asset", dependsOn := "terrorist party",
    citeDefine := "18 USC § 2333(e)" }


def definitionalDag : List DefEdge :=
  [ edge_militaryForce_dependsOn_person,
    edge_actOfWar_dependsOn_militaryForce,
    edge_weaponOfMassDestruction_dependsOn_seriousBodilyInjury,
    edge_unitedStatesPerson_dependsOn_national,
    edge_unitedStatesPerson_dependsOn_person,
    edge_stateOrGovernmentFacility_dependsOn_state,
    edge_intergovernmentalOrganization_dependsOn_internationalOrganization,
    edge_explosive_dependsOn_seriousBodilyInjury,
    edge_otherLethalDevice_dependsOn_seriousBodilyInjury,
    edge_militaryForcesOfAState_dependsOn_state,
    edge_armedConflict2332i_dependsOn_armedConflict2332f,
    edge_stateOrGovernmentFacility2332i_dependsOn_2332f,
    edge_device_dependsOn_radioactiveMaterial,
    edge_device_dependsOn_seriousBodilyInjury,
    edge_nuclearFacility_dependsOn_radioactiveMaterial,
    edge_nuclearFacility_dependsOn_nuclearMaterial,
    edge_radioactiveMaterial_dependsOn_nuclearMaterial,
    edge_radioactiveMaterial_dependsOn_seriousBodilyInjury,
    edge_blockedAsset_dependsOn_terroristParty ]




def usingEdges : List DefEdge :=
  [ { defined := "§ 2332(a)", dependsOn := "national of the United States",
      citeDefine := "18 USC § 2331(2)" },
    { defined := "§ 2332a(a)", dependsOn := "weapon of mass destruction",
      citeDefine := "18 USC § 2332a(c)(2)" },
    { defined := "§ 2332a(a)", dependsOn := "property", citeDefine := "18 USC § 2332a(c)(3)" },
    { defined := "§ 2332a(b)", dependsOn := "national of the United States",
      citeDefine := "18 USC § 2332a(c)(1)" },
    { defined := "§ 2332b(a)", dependsOn := "conduct transcending national boundaries",
      citeDefine := "18 USC § 2332b(g)(1)" },
    { defined := "§ 2332b(a)", dependsOn := "serious bodily injury",
      citeDefine := "18 USC § 2332b(g)(3)" },
    { defined := "§ 2332b(b)(1)(A)", dependsOn := "facility of interstate or foreign commerce",
      citeDefine := "18 USC § 2332b(g)(2)" },
    { defined := "§ 2332b(b)(1)(E)", dependsOn := "territorial sea of the United States",
      citeDefine := "18 USC § 2332b(g)(4)" },
    { defined := "§ 2332b(f)", dependsOn := "Federal crime of terrorism",
      citeDefine := "18 USC § 2332b(g)(5)" },
    { defined := "§ 2332d(a)", dependsOn := "United States person",
      citeDefine := "18 USC § 2332d(b)(2)" },
    { defined := "§ 2332d(a)", dependsOn := "financial transaction",
      citeDefine := "18 USC § 2332d(b)(1)" },
    { defined := "§ 2332e", dependsOn := "weapon of mass destruction",
      citeDefine := "18 USC § 2332a(c)(2)" },
    { defined := "§ 2332f(a)(1)", dependsOn := "place of public use",
      citeDefine := "18 USC § 2332f(e)(6)" },
    { defined := "§ 2332f(a)(1)", dependsOn := "state or government facility",
      citeDefine := "18 USC § 2332f(e)(3)" },
    { defined := "§ 2332f(a)(1)", dependsOn := "public transportation system",
      citeDefine := "18 USC § 2332f(e)(7)" },
    { defined := "§ 2332f(a)(1)", dependsOn := "infrastructure facility",
      citeDefine := "18 USC § 2332f(e)(5)" },
    { defined := "§ 2332f(a)(1)", dependsOn := "explosive", citeDefine := "18 USC § 2332f(e)(8)" },
    { defined := "§ 2332f(a)(1)", dependsOn := "other lethal device",
      citeDefine := "18 USC § 2332f(e)(9)" },
    { defined := "§ 2332f(a)(1)(A)", dependsOn := "serious bodily injury",
      citeDefine := "18 USC § 2332f(e)(1)" },
    { defined := "§ 2332f(b)", dependsOn := "state", citeDefine := "18 USC § 2332f(e)(12)" },
    { defined := "§ 2332f(b)", dependsOn := "national of the United States",
      citeDefine := "18 USC § 2332f(e)(2)" },
    { defined := "§ 2332f(d)(1)", dependsOn := "armed conflict",
      citeDefine := "18 USC § 2332f(e)(11)" },
    { defined := "§ 2332f(d)(2)", dependsOn := "military forces of a state",
      citeDefine := "18 USC § 2332f(e)(10)" },
    { defined := "§ 2332g(a)", dependsOn := "aircraft", citeDefine := "18 USC § 2332g(d)" },
    { defined := "§ 2332i(a)(1)(A)", dependsOn := "radioactive material",
      citeDefine := "18 USC § 2332i(e)(8)" },
    { defined := "§ 2332i(a)(1)(A)", dependsOn := "device", citeDefine := "18 USC § 2332i(e)(2)" },
    { defined := "§ 2332i(a)(1)(B)", dependsOn := "nuclear facility",
      citeDefine := "18 USC § 2332i(e)(6)" },
    { defined := "§ 2332i(a)(1)(B)(iii)", dependsOn := "international organization",
      citeDefine := "18 USC § 2332i(e)(3)" },
    { defined := "§ 2332i(b)(2)(A)", dependsOn := "United States corporation or legal entity",
      citeDefine := "18 USC § 2332i(e)(12)" },
    { defined := "§ 2332i(b)(2)(B)", dependsOn := "vessel of the United States",
      citeDefine := "18 USC § 2332i(e)(14)" },
    { defined := "§ 2332i(b)(3)", dependsOn := "state or government facility",
      citeDefine := "18 USC § 2332i(e)(11)" },
    { defined := "§ 2332i(d)(1)", dependsOn := "armed conflict",
      citeDefine := "18 USC § 2332i(e)(1)" },
    { defined := "§ 2332i(d)(2)", dependsOn := "military forces of a state",
      citeDefine := "18 USC § 2332i(e)(4)" },
    { defined := "§ 2333(a)", dependsOn := "national of the United States",
      citeDefine := "18 USC § 2331(2)" },
    { defined := "§ 2333(a)", dependsOn := "international terrorism",
      citeDefine := "18 USC § 2331(1)" },
    { defined := "§ 2333(d)(2)", dependsOn := "person", citeDefine := "18 USC § 2333(d)(1)" },
    { defined := "§ 2333(e)", dependsOn := "blocked asset", citeDefine := "18 USC § 2333(e)" } ]




def externalIncorporations : List ExternalIncorporation :=
  [ { term := "national of the United States", citeIn := "18 USC § 2331(2)",
      citeFrom := "INA § 101(a)(22) (8 U.S.C. 1101(a)(22))" },
    { term := "foreign terrorist organization", citeIn := "18 USC § 2331(6)(A)(i)",
      citeFrom := "INA § 219 (8 U.S.C. 1189)" },
    { term := "specially designated global terrorist", citeIn := "18 USC § 2331(6)(A)(ii)",
      citeFrom := "31 C.F.R. 594.310" },
    { term := "destructive device", citeIn := "18 USC § 2332a(c)(2)(A)",
      citeFrom := "18 USC § 921" },
    { term := "biological agent, toxin, vector", citeIn := "18 USC § 2332a(c)(2)(C)",
      citeFrom := "18 USC § 178" },
    { term := "facility of interstate or foreign commerce", citeIn := "18 USC § 2332b(g)(2)",
      citeFrom := "18 USC § 1958(b)(2)" },
    { term := "serious bodily injury", citeIn := "18 USC § 2332b(g)(3)",
      citeFrom := "18 USC § 1365(g)(3) (editorially flagged)" },
    { term := "financial transaction", citeIn := "18 USC § 2332d(b)(1)",
      citeFrom := "18 USC § 1956(c)(4)" },
    { term := "serious bodily injury", citeIn := "18 USC § 2332f(e)(1)",
      citeFrom := "18 USC § 1365(g)(3) (editorially flagged)" },
    { term := "international organization", citeIn := "18 USC § 2332f(e)(4)",
      citeFrom := "18 USC § 1116(b)(5)" },
    { term := "explosive", citeIn := "18 USC § 2332f(e)(8)", citeFrom := "18 USC § 844(j)" },
    { term := "toxic chemicals, biological agents, toxins", citeIn := "18 USC § 2332f(e)(9)",
      citeFrom := "18 USC § 178" },
    { term := "aircraft", citeIn := "18 USC § 2332g(d)",
      citeFrom := "49 U.S.C. § 40102(a)(6)" },
    { term := "international organization", citeIn := "18 USC § 2332i(e)(3)",
      citeFrom := "18 USC § 831(f)(3) (editorially flagged)" },
    { term := "nuclear material", citeIn := "18 USC § 2332i(e)(7)",
      citeFrom := "18 USC § 831(f)(1) (editorially flagged)" },
    { term := "serious bodily injury", citeIn := "18 USC § 2332i(e)(9)",
      citeFrom := "18 USC § 831(f)(4) (editorially flagged)" },
    { term := "vessel", citeIn := "18 USC § 2332i(e)(13)",
      citeFrom := "33 U.S.C. § 1502(19) (editorially flagged)" },
    { term := "vessel of the United States", citeIn := "18 USC § 2332i(e)(14)",
      citeFrom := "46 U.S.C. § 70502" },
    { term := "person", citeIn := "18 USC § 2333(d)(1)", citeFrom := "1 U.S.C. § 1" },
    { term := "blocked asset", citeIn := "18 USC § 2333(e)",
      citeFrom := "Terrorism Risk Insurance Act of 2002 § 201 (28 U.S.C. 1610 note)" } ]





def danglingTerms : List DanglingTerm :=
  [ { term := "murder", usedAt := "18 USC § 2332(a)(1), (b)",
      note := "resolved by cross-reference to 18 USC § 1111(a), outside this chapter" },
    { term := "voluntary/involuntary manslaughter", usedAt := "18 USC § 2332(a)(2), (a)(3)",
      note := "resolved by cross-reference to 18 USC § 1112(a), outside this chapter" },
    { term := "lawful authority", usedAt := "18 USC § 2332a(a), (b)",
      note := "no definition anywhere in the chapter" },
    { term := "emergency situation involving a weapon of mass destruction",
      usedAt := "18 USC § 2332e", note := "no definition anywhere in the chapter" },
    { term := "device or other object", usedAt := "18 USC § 2332h(a)(1)(B)",
      note := "§ 2332h carries no definitions subsection; § 2332i(e)(2) defines 'device' only for § 2332i" },
    { term := "radiation or radioactivity", usedAt := "18 USC § 2332h(a)(1)",
      note := "§ 2332h carries no definitions subsection" },
    { term := "serious bodily injury", usedAt := "18 USC § 2332(c), § 2332a(c)(2)(B)",
      note := "used in these sections with no local definition; §§ 2332b/f/i define it only for themselves, and from two different sources" },
    { term := "terrorist party", usedAt := "18 USC § 2333(e)",
      note := "definition lives in TRIA § 201; nothing in this chapter supplies it" },
    { term := "act of international terrorism", usedAt := "18 USC § 2333(a), (d)(2)",
      note := "compositional on § 2331(1); the chapter never defines the 'act of' operator" } ]

end Proving.USC.T18.Ch113B.Ontology
