









import Proving.USC.T18.Ch2.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch2.Ontology

open Proving.USC.Common



axiom IsAircraft (a : Aircraft) (c : ComplaintText) : Prop



axiom IsSpaceVehicle (sv : SpaceVehicle) (c : ComplaintText) : Prop



axiom IsPart (p : Part) (c : ComplaintText) : Prop





axiom IsAviationQuality (p : Part) (c : ComplaintText) : Prop



axiom IsDestructiveSubstance (s : DestructiveSubstance) (c : ComplaintText) : Prop





axiom IsInFlight (a : Aircraft) (c : ComplaintText) : Prop





axiom IsInService (a : Aircraft) (c : ComplaintText) : Prop




axiom IsUsedForCommercialPurposes (u : CommercialUse) (c : ComplaintText) : Prop





axiom IsMotorVehicle (v : MotorVehicle) (c : ComplaintText) : Prop





axiom IsState (j : Jurisdiction) (c : ComplaintText) : Prop





axiom IsContinuingCriminalEnterprise (o : Offense) (c : ComplaintText) : Prop





axiom IsDrugConspiracyOffense (o : Offense) (c : ComplaintText) : Prop





axiom IsMajorQuantityDrugOffense (o : Offense) (c : ComplaintText) : Prop




axiom IsLaborDispute (d : LaborDispute) (c : ComplaintText) : Prop



axiom IsTrafficSignalPreemptionTransmitter (t : TrafficSignalPreemptionTransmitter) (c : ComplaintText) : Prop






axiom IsNonqualifyingUser (p : Person) (c : ComplaintText) : Prop



axiom IsLaserPointer (l : LaserPointer) (c : ComplaintText) : Prop



axiom IsRunwayExclusionZone (z : RunwayExclusionZone) (c : ComplaintText) : Prop




axiom IsUnmannedAircraft (u : UnmannedAircraft) (c : ComplaintText) : Prop



axiom IsWildfire (w : Wildfire) (c : ComplaintText) : Prop




axiom IsWildfireSuppression (s : WildfireSuppression) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch2.Ontology
