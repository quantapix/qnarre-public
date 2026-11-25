import Proving.USC.T18.Ch2Ch3.Ontology.Types
import Proving.USC.T18.Ch2Ch3.Ontology.Predicates
import Proving.USC.Common.Types











set_option autoImplicit false

namespace Proving.USC.T18.Ch2Ch3.Ontology

open Proving.USC.Common







structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  dangling   : Bool := false



def edge_majorDrugOffense_cce : DefEdge :=
  { defined := "major drug offense", dependsOn := "continuing criminal enterprise",
    citeDefine := "18 USC § 36(a)(1)", dangling := true }
def edge_majorDrugOffense_conspiracy : DefEdge :=
  { defined := "major drug offense", dependsOn := "conspiracy to distribute controlled substances",
    citeDefine := "18 USC § 36(a)(2)", dangling := true }
def edge_majorDrugOffense_majorQuantity : DefEdge :=
  { defined := "major drug offense", dependsOn := "major-quantity drug offense",
    citeDefine := "18 USC § 36(a)(3)", dangling := true }



def edge_national_ina : DefEdge :=
  { defined := "national of the United States", dependsOn := "INA § 101(a)(22)",
    citeDefine := "18 USC § 32(b)", dangling := true }



def edge_laborDispute_norrisLaGuardia : DefEdge :=
  { defined := "labor dispute", dependsOn := "29 USC § 113(c)",
    citeDefine := "18 USC § 37(c)", dangling := true }



def edge_runwayZone_activeRunway : DefEdge :=
  { defined := "runway exclusion zone", dependsOn := "active runway / class B,C,D airspace",
    citeDefine := "18 USC § 39B(b)(2)", dangling := true }


def edge_unmannedAircraft_t49 : DefEdge :=
  { defined := "unmanned aircraft", dependsOn := "49 USC § 44801",
    citeDefine := "18 USC § 40A(c)(1)", dangling := true }


def edge_wildfire_t42 : DefEdge :=
  { defined := "wildfire", dependsOn := "42 USC § 1856m",
    citeDefine := "18 USC § 40A(c)(2)", dangling := true }


def edge_wildfireSuppression_wildfire : DefEdge :=
  { defined := "wildfire suppression", dependsOn := "wildfire",
    citeDefine := "18 USC § 40A(c)(3)" }


def edge_wildlife_wild : DefEdge :=
  { defined := "wildlife", dependsOn := "wild", citeDefine := "18 USC § 42(a)(2)" }


def edge_wildlifeResources_wild : DefEdge :=
  { defined := "wildlife resources", dependsOn := "wild", citeDefine := "18 USC § 42(a)(2)" }



def edge_courseOfConduct_act : DefEdge :=
  { defined := "course of conduct", dependsOn := "act", citeDefine := "18 USC § 43(d)(2)",
    dangling := true }



def edge_economicDamage_animalEnterprise : DefEdge :=
  { defined := "economic damage", dependsOn := "animal enterprise",
    citeDefine := "18 USC § 43(d)(3)" }


def definitionalEdges : List DefEdge :=
  [ edge_majorDrugOffense_cce, edge_majorDrugOffense_conspiracy,
    edge_majorDrugOffense_majorQuantity, edge_national_ina,
    edge_laborDispute_norrisLaGuardia, edge_runwayZone_activeRunway,
    edge_unmannedAircraft_t49, edge_wildfire_t42,
    edge_wildfireSuppression_wildfire, edge_wildlife_wild,
    edge_wildlifeResources_wild, edge_courseOfConduct_act,
    edge_economicDamage_animalEnterprise ]





inductive MajorDrugOffenseDef (o : Offense) (c : ComplaintText) : Prop where
  | cce         : IsContinuingCriminalEnterprise o c → MajorDrugOffenseDef o c
  | conspiracy  : IsConspiracyToDistributeControlledSubstances o c → MajorDrugOffenseDef o c
  | majorQuant  : IsMajorQuantityDrugOffense o c → MajorDrugOffenseDef o c


inductive StateDef (e : Entity) (c : ComplaintText) : Prop where
  | state    : IsStateOfUnitedStates e c → StateDef e c
  | dc       : IsDistrictOfColumbia e c → StateDef e c
  | insular  : IsInsularAreaOfUnitedStates e c → StateDef e c


inductive AnimalEnterpriseDef (e : Entity) (c : ComplaintText) : Prop where
  | commercialAcademic : IsCommercialOrAcademicAnimalEnterprise e c → AnimalEnterpriseDef e c
  | venue              : IsAnimalVenueEnterprise e c → AnimalEnterpriseDef e c
  | fair               : IsAgriculturalFairEvent e c → AnimalEnterpriseDef e c





structure RunwayExclusionZoneDef (z : RunwayExclusionZone) (c : ComplaintText) : Prop where
  centered  : CenteredOnActiveRunwayInControlledAirspace z c
  geometry  : WithinStatutoryRunwayGeometry z c



structure CourseOfConductDef (x : Conduct) (c : ComplaintText) : Prop where
  twoOrMoreActs : ComposedOfTwoOrMoreActs x c
  continuity    : EvidencesContinuityOfPurpose x c



structure EconomicDamageDef (x : Damage) (c : ComplaintText) : Prop where
  compensable      : ConstitutesCompensableEconomicLoss x c
  notLawfulDisrupt : ¬ ConstitutesLawfulEconomicDisruption x c



structure WildlifeDef (x : Creature) (c : ComplaintText) : Prop where
  wild      : IsWild x c
  wildlife  : IsWildlife x c



structure WildfireSuppressionDef (s : SuppressionEffort) (w : Wildfire) (c : ComplaintText) : Prop where
  suppression : IsWildfireSuppression s c
  target      : IsWildfire w c

end Proving.USC.T18.Ch2Ch3.Ontology
