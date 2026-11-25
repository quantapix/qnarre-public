












import Proving.USC.T18.Ch13.Ontology.Types

namespace Proving.USC.T18.Ch13.Ontology

open Proving.USC.Common





axiom IsLawEnforcementOfficer (o : LawEnforcementOfficer) (c : ComplaintText) : Prop





axiom IsCoveredState (s : CoveredState) (c : ComplaintText) : Prop






axiom IsReligiousRealProperty (r : ReligiousRealProperty) (c : ComplaintText) : Prop





axiom IsFacility (f : Facility) (c : ComplaintText) : Prop






axiom IsReproductiveHealthServices (s : ReproductiveHealthServices) (c : ComplaintText) : Prop




axiom IsInterferenceWithFreedomOfMovement (a : Conduct) (c : ComplaintText) : Prop




axiom IsIntimidation (a : Conduct) (c : ComplaintText) : Prop





axiom IsPhysicalObstruction (a : Conduct) (c : ComplaintText) : Prop




axiom IsBodilyInjury (b : BodilyInjury) (c : ComplaintText) : Prop




axiom IsExplosiveOrIncendiaryDevice (d : ExplosiveOrIncendiaryDevice) (c : ComplaintText) : Prop




axiom IsFirearm (f : Firearm) (c : ComplaintText) : Prop




axiom IsGenderIdentity (g : GenderIdentity) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch13.Ontology
