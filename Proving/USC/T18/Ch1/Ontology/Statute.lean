















import Proving.USC.Common.Types
import Proving.USC.T18.Ch1.Ontology.Types
import Proving.USC.T18.Ch1.Ontology.Predicates

namespace Proving.USC.T18.Ch1.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String

  dangling   : Bool


def edge_vessel_dependsOn_unitedStates : DefEdge :=
  { defined := "vessel of the United States", dependsOn := "United States",
    citeDefine := "18 USC § 9", dangling := false }



def edge_smtj_dependsOn_vessel : DefEdge :=
  { defined := "special maritime and territorial jurisdiction of the United States",
    dependsOn := "vessel of the United States", citeDefine := "18 USC § 7",
    dangling := false }


def edge_agency_dependsOn_department : DefEdge :=
  { defined := "agency", dependsOn := "department", citeDefine := "18 USC § 6",
    dangling := false }


def edge_assimilation_dependsOn_smtj : DefEdge :=
  { defined := "assimilated State offense (§ 13(a))",
    dependsOn := "special maritime and territorial jurisdiction of the United States",
    citeDefine := "18 USC § 13", dangling := false }



def edge_principal_dependsOn_offense : DefEdge :=
  { defined := "principal", dependsOn := "offense against the United States",
    citeDefine := "18 USC § 2", dangling := true }


def edge_accessory_dependsOn_offense : DefEdge :=
  { defined := "accessory after the fact",
    dependsOn := "offense against the United States", citeDefine := "18 USC § 3",
    dangling := true }


def edge_misprision_dependsOn_felony : DefEdge :=
  { defined := "misprision of felony",
    dependsOn := "felony cognizable by a court of the United States",
    citeDefine := "18 USC § 4", dangling := true }



def edge_department_dependsOn_execDepts : DefEdge :=
  { defined := "department", dependsOn := "executive departments (5 U.S.C. § 1)",
    citeDefine := "18 USC § 6", dangling := true }



def edge_smtj_dependsOn_national : DefEdge :=
  { defined := "special maritime and territorial jurisdiction of the United States",
    dependsOn := "national of the United States (8 U.S.C. § 1101)",
    citeDefine := "18 USC § 7", dangling := true }



def edge_postalService_dependsOn_usps39 : DefEdge :=
  { defined := "Postal Service",
    dependsOn := "United States Postal Service (Title 39)",
    citeDefine := "18 USC § 12", dangling := true }


def defEdges : List DefEdge :=
  [ edge_vessel_dependsOn_unitedStates, edge_smtj_dependsOn_vessel,
    edge_agency_dependsOn_department, edge_assimilation_dependsOn_smtj,
    edge_principal_dependsOn_offense, edge_accessory_dependsOn_offense,
    edge_misprision_dependsOn_felony, edge_department_dependsOn_execDepts,
    edge_smtj_dependsOn_national, edge_postalService_dependsOn_usps39 ]




inductive PrincipalRoute
  | commissionOrAiding
  | willfullyCausingAct
  deriving DecidableEq, Repr



inductive SMTJCase
  | highSeasOrUSVessel
  | usRegisteredGreatLakesVessel
  | usReservedOrAcquiredLands
  | guanoIsland
  | usAircraftOverHighSeas
  | usSpaceVehicle
  | outsideAnyNationUSNational
  | foreignVesselScheduledVoyage
  | usMissionPremisesOrResidence
  deriving DecidableEq, Repr


inductive VesselOfUSOwnership
  | belongsToUS
  | belongsToUSCitizen
  | belongsToUSOrStateCorporation
  deriving DecidableEq, Repr


inductive PostalServiceMember
  | theService
  | officerOrEmployee
  deriving DecidableEq, Repr


inductive AgencyKind
  | department
  | independentEstablishment
  | commission
  | administration
  | authority
  | board
  | bureau
  | proprietaryCorporation
  deriving DecidableEq, Repr


inductive ForeignGovernmentKind
  | government
  | faction
  | bodyOfInsurgents
  deriving DecidableEq, Repr




inductive ObligationOrSecurityKind
  | bond
  | certificateOfIndebtedness
  | federalReserveNote
  | treasuryNote
  | checkOrDraft
  | stamp
  | canceledUSStamp
  deriving DecidableEq, Repr





structure PrincipalMembership (p : Person) (c : ComplaintText) where
  route  : PrincipalRoute
  member : IsPrincipal p c


structure SMTJMembership (pl : Place) (c : ComplaintText) where
  case   : SMTJCase
  member : IsSpecialMaritimeTerritorialJurisdiction pl c



structure VesselOfUSMembership (v : Vessel) (c : ComplaintText) where
  ownership : VesselOfUSOwnership
  member    : IsVesselOfUnitedStates v c



structure PostalServiceMembership (e : Entity) (c : ComplaintText) where
  kind   : PostalServiceMember
  member : IsPostalService e c



structure MinorDef (p : Person) (c : ComplaintText) where
  age     : Nat
  under18 : age < 18
  member  : IsMinor p c

end Proving.USC.T18.Ch1.Ontology
