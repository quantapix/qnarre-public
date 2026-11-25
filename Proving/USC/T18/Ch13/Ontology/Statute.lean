














import Proving.USC.T18.Ch13.Ontology.Predicates

namespace Proving.USC.T18.Ch13.Ontology

open Proving.USC.Common




inductive LawEnforcementOfficerKind
  | unitedStates
  | districtOfColumbia
  | state
  | politicalSubdivisionOfState
  deriving DecidableEq, Repr


inductive CoveredStateKind
  | stateOfUS
  | districtOfColumbia
  | commonwealth
  | territory
  | possession
  | puertoRico
  deriving DecidableEq, Repr


inductive ReligiousRealPropertyKind
  | church
  | synagogue
  | mosque
  | religiousCemetery
  | otherReligiousRealProperty
  | fixturesWithinPlaceOfWorship
  | nonprofitReligiousAffiliatedRealProperty
  deriving DecidableEq, Repr


inductive FacilityKind
  | hospital
  | clinic
  | physiciansOffice
  | otherFacilityProvidingRHS
  | buildingOrStructure
  deriving DecidableEq, Repr





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  deriving Repr


def edge_facility_dependsOn_rhs : DefEdge :=
  { defined := "facility", dependsOn := "reproductive health services",
    citeDefine := "18 USC § 248(e)(1)" }


def edge_rhs_dependsOn_facility : DefEdge :=
  { defined := "reproductive health services", dependsOn := "facility",
    citeDefine := "18 USC § 248(e)(5)" }


def edge_physicalObstruction_dependsOn_facility : DefEdge :=
  { defined := "physical obstruction", dependsOn := "facility",
    citeDefine := "18 USC § 248(e)(4)" }



def edge_religiousRealProperty_dependsOn_placeOfWorship : DefEdge :=
  { defined := "religious real property", dependsOn := "place of religious worship",
    citeDefine := "18 USC § 247(f)" }


def edge_bodilyInjury_dependsOn_s1365 : DefEdge :=
  { defined := "bodily injury", dependsOn := "18 USC § 1365(h)(4)",
    citeDefine := "18 USC § 249(c)(1)" }


def edge_explosiveDevice_dependsOn_s232 : DefEdge :=
  { defined := "explosive or incendiary device", dependsOn := "18 USC § 232",
    citeDefine := "18 USC § 249(c)(2)" }


def edge_firearm_dependsOn_s921 : DefEdge :=
  { defined := "firearm", dependsOn := "18 USC § 921(a)",
    citeDefine := "18 USC § 249(c)(3)" }







structure FacilityMembership (f : Facility) (s : ReproductiveHealthServices)
    (c : ComplaintText) : Prop where
  providesRHS : IsReproductiveHealthServices s c
  isFacility  : IsFacility f c



structure ReproductiveHealthServicesMembership (s : ReproductiveHealthServices)
    (f : Facility) (c : ComplaintText) : Prop where
  atFacility : IsFacility f c
  isRHS      : IsReproductiveHealthServices s c




structure PhysicalObstructionMembership (a : Conduct) (f : Facility)
    (c : ComplaintText) : Prop where
  targetFacility : IsFacility f c
  obstructs      : IsPhysicalObstruction a c

end Proving.USC.T18.Ch13.Ontology
