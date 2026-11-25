










import Proving.USC.T18.Ch3.Ontology.Types

namespace Proving.USC.T18.Ch3.Ontology

open Proving.USC.Common






axiom IsWild (x : Creature) (c : ComplaintText) : Prop




axiom IsWildlife (x : Creature) (c : ComplaintText) : Prop




axiom IsWildlifeResource (x : Creature) (c : ComplaintText) : Prop






axiom IsAnimalEnterprise (e : Entity) (c : ComplaintText) : Prop





axiom IsCommercialOrAcademicEnterprise (e : Entity) (c : ComplaintText) : Prop




axiom IsAnimalDisplayEnterprise (e : Entity) (c : ComplaintText) : Prop




axiom IsAgriculturalFairEvent (e : Entity) (c : ComplaintText) : Prop





axiom IsCourseOfConduct (x : Conduct) (c : ComplaintText) : Prop





axiom IsEconomicDamage (x : EconomicHarm) (c : ComplaintText) : Prop







axiom IsSeriousBodilyInjury (x : BodilyInjury) (c : ComplaintText) : Prop



axiom InjuryPosesSubstantialRiskOfDeath (x : BodilyInjury) (c : ComplaintText) : Prop



axiom InjuryIsExtremePhysicalPain (x : BodilyInjury) (c : ComplaintText) : Prop



axiom InjuryIsProtractedDisfigurement (x : BodilyInjury) (c : ComplaintText) : Prop




axiom InjuryIsProtractedLossOfFunction (x : BodilyInjury) (c : ComplaintText) : Prop







axiom IsSubstantialBodilyInjury (x : BodilyInjury) (c : ComplaintText) : Prop






axiom IsAircraft (x : Conveyance) (c : ComplaintText) : Prop





axiom IsMotorVehicle (x : Conveyance) (c : ComplaintText) : Prop








axiom IsAnimalCrushing (x : Conduct) (c : ComplaintText) : Prop




axiom IsAnimalCrushVideo (v : CrushVideo) (c : ComplaintText) : Prop



axiom VideoDepictsAnimalCrushing (v : CrushVideo) (c : ComplaintText) : Prop




axiom VideoIsObscene (v : CrushVideo) (c : ComplaintText) : Prop




axiom IsEuthanizingAnAnimal (m : EuthanasiaMethod) (c : ComplaintText) : Prop




axiom MethodProducesRapidPainlessDeath (m : EuthanasiaMethod) (c : ComplaintText) : Prop




axiom MethodUsesPainlessAnesthesia (m : EuthanasiaMethod) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch3.Ontology
