import Proving.USC.T18.Ch2Ch3.Ontology.Types
import Proving.USC.Common.Types












set_option autoImplicit false

namespace Proving.USC.T18.Ch2Ch3.Ontology

open Proving.USC.Common






axiom IsNationalOfUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom IsMajorDrugOffense (o : Offense) (c : ComplaintText) : Prop




axiom IsLaborDispute (d : LaborDispute) (c : ComplaintText) : Prop




axiom IsState (e : Entity) (c : ComplaintText) : Prop




axiom IsRunwayExclusionZone (z : RunwayExclusionZone) (c : ComplaintText) : Prop




axiom IsUnmannedAircraft (a : UnmannedAircraft) (c : ComplaintText) : Prop



axiom IsWildfire (w : Wildfire) (c : ComplaintText) : Prop




axiom IsWildfireSuppression (s : SuppressionEffort) (c : ComplaintText) : Prop




axiom IsWild (x : Creature) (c : ComplaintText) : Prop




axiom IsWildlife (x : Creature) (c : ComplaintText) : Prop




axiom IsWildlifeResources (x : NaturalResource) (c : ComplaintText) : Prop




axiom IsAnimalEnterprise (e : Entity) (c : ComplaintText) : Prop




axiom IsCourseOfConduct (x : Conduct) (c : ComplaintText) : Prop




axiom IsEconomicDamage (x : Damage) (c : ComplaintText) : Prop





axiom IsSeriousBodilyInjury (x : Injury) (c : ComplaintText) : Prop




axiom IsSubstantialBodilyInjury (x : Injury) (c : ComplaintText) : Prop






axiom IsContinuingCriminalEnterprise (o : Offense) (c : ComplaintText) : Prop




axiom IsConspiracyToDistributeControlledSubstances (o : Offense) (c : ComplaintText) : Prop




axiom IsMajorQuantityDrugOffense (o : Offense) (c : ComplaintText) : Prop



axiom IsStateOfUnitedStates (e : Entity) (c : ComplaintText) : Prop



axiom IsDistrictOfColumbia (e : Entity) (c : ComplaintText) : Prop



axiom IsInsularAreaOfUnitedStates (e : Entity) (c : ComplaintText) : Prop




axiom CenteredOnActiveRunwayInControlledAirspace (z : RunwayExclusionZone) (c : ComplaintText) : Prop




axiom WithinStatutoryRunwayGeometry (z : RunwayExclusionZone) (c : ComplaintText) : Prop



axiom ComposedOfTwoOrMoreActs (x : Conduct) (c : ComplaintText) : Prop



axiom EvidencesContinuityOfPurpose (x : Conduct) (c : ComplaintText) : Prop




axiom ConstitutesCompensableEconomicLoss (x : Damage) (c : ComplaintText) : Prop




axiom ConstitutesLawfulEconomicDisruption (x : Damage) (c : ComplaintText) : Prop





axiom IsCommercialOrAcademicAnimalEnterprise (e : Entity) (c : ComplaintText) : Prop




axiom IsAnimalVenueEnterprise (e : Entity) (c : ComplaintText) : Prop




axiom IsAgriculturalFairEvent (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch2Ch3.Ontology
