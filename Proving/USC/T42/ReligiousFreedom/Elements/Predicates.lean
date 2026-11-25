









import Proving.USC.Common.Types
import Proving.USC.T42.ReligiousFreedom.Elements.Types

namespace Proving.USC.T42.ReligiousFreedom.Elements

open Proving.USC.Common










axiom IsProtectedNativePerson (p : Person) (c : ComplaintText) : Prop





axiom ExercisesTraditionalReligion (p : Person) (c : ComplaintText) : Prop










axiom IsIndianTribeMember (p : Person) (c : ComplaintText) : Prop



axiom IsPeyoteUsePossessionTransport (a : PeyoteAct) (c : ComplaintText) : Prop



axiom IsBonaFideCeremonialPurpose (a : PeyoteAct) (c : ComplaintText) : Prop





axiom InConnectionWithTraditionalIndianReligion (a : PeyoteAct) (c : ComplaintText) : Prop






axiom PenalizedOrDiscriminatedForPeyote (p : Person) (a : PeyoteAct) (c : ComplaintText) : Prop








axiom WithinPeyoteRegulatoryCarveout (a : PeyoteAct) (c : ComplaintText) : Prop











axiom IsAdoptionFosterPlacementActor (p : Person) (c : ComplaintText) : Prop




axiom DeniedOpportunityToParent (p : Person) (d : PlacementDecision) (c : ComplaintText) : Prop




axiom DelayedOrDeniedPlacement (p : Person) (d : PlacementDecision) (c : ComplaintText) : Prop




axiom OnBasisOfRaceColorNationalOrigin (p : Person) (d : PlacementDecision) (c : ComplaintText) : Prop







axiom WithinICWASavingsCarveout (d : PlacementDecision) (c : ComplaintText) : Prop

end Proving.USC.T42.ReligiousFreedom.Elements
