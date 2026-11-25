









import Proving.USC.T18.Ch2.Ontology.Types
import Proving.USC.T18.Ch2.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch2.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String





def edge_motorVehicle_dependsOn_commercialUse : DefEdge :=
  { defined := "motor vehicle", dependsOn := "used for commercial purposes",
    citeDefine := "18 USC § 31(a)(6)" }



def edge_inService_dependsOn_inFlight : DefEdge :=
  { defined := "in service", dependsOn := "in flight",
    citeDefine := "18 USC § 31(a)(5)" }


def edge_inService_dependsOn_aircraft : DefEdge :=
  { defined := "in service", dependsOn := "aircraft",
    citeDefine := "18 USC § 31(a)(5)" }


def edge_inFlight_dependsOn_aircraft : DefEdge :=
  { defined := "in flight", dependsOn := "aircraft",
    citeDefine := "18 USC § 31(a)(4)" }


def edge_aviationQuality_dependsOn_part : DefEdge :=
  { defined := "aviation quality", dependsOn := "part",
    citeDefine := "18 USC § 31(a)(2)" }



def edge_aviationQuality_dependsOn_aircraft : DefEdge :=
  { defined := "aviation quality", dependsOn := "aircraft",
    citeDefine := "18 USC § 31(a)(2)" }



def edge_aviationQuality_dependsOn_spaceVehicle : DefEdge :=
  { defined := "aviation quality", dependsOn := "space vehicle",
    citeDefine := "18 USC § 31(a)(2)" }



def edge_nonqualifyingUser_dependsOn_transmitter : DefEdge :=
  { defined := "nonqualifying user",
    dependsOn := "traffic signal preemption transmitter",
    citeDefine := "18 USC § 39(b)(2)" }


def edge_wildfireSuppression_dependsOn_wildfire : DefEdge :=
  { defined := "wildfire suppression", dependsOn := "wildfire",
    citeDefine := "18 USC § 40A(c)(3)" }



def definitionalDAG : List DefEdge :=
  [ edge_motorVehicle_dependsOn_commercialUse,
    edge_inService_dependsOn_inFlight,
    edge_inService_dependsOn_aircraft,
    edge_inFlight_dependsOn_aircraft,
    edge_aviationQuality_dependsOn_part,
    edge_aviationQuality_dependsOn_aircraft,
    edge_aviationQuality_dependsOn_spaceVehicle,
    edge_nonqualifyingUser_dependsOn_transmitter,
    edge_wildfireSuppression_dependsOn_wildfire ]





structure MotorVehicleMembership (v : MotorVehicle) (u : CommercialUse)
    (c : ComplaintText) : Prop where
  base       : IsMotorVehicle v c
  commercial : IsUsedForCommercialPurposes u c




structure InServiceMembership (a : Aircraft) (c : ComplaintText) : Prop where
  inService : IsInService a c
  inFlight  : IsInFlight a c



structure AviationQualityMembership (p : Part) (c : ComplaintText) : Prop where
  isPart         : IsPart p c
  aviationQuality : IsAviationQuality p c




structure NonqualifyingUserMembership (p : Person)
    (t : TrafficSignalPreemptionTransmitter) (c : ComplaintText) : Prop where
  nonQualUser : IsNonqualifyingUser p c
  transmitter : IsTrafficSignalPreemptionTransmitter t c



structure WildfireSuppressionMembership (s : WildfireSuppression) (w : Wildfire)
    (c : ComplaintText) : Prop where
  suppression : IsWildfireSuppression s c
  wildfire    : IsWildfire w c






inductive MajorDrugOffenseDef (o : Offense) (c : ComplaintText) : Prop where
  | cce          (h : IsContinuingCriminalEnterprise o c) : MajorDrugOffenseDef o c
  | conspiracy   (h : IsDrugConspiracyOffense o c)        : MajorDrugOffenseDef o c
  | majorQuantity (h : IsMajorQuantityDrugOffense o c)    : MajorDrugOffenseDef o c

end Proving.USC.T18.Ch2.Ontology
