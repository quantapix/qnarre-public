








import Proving.USC.Common.Types
import Proving.USC.T42.ReligiousFreedom.Elements.Types
import Proving.USC.T42.ReligiousFreedom.Elements.Predicates

namespace Proving.USC.T42.ReligiousFreedom.Elements

open Proving.USC.Common





structure Section1996 (p : Person) (c : ComplaintText) : Prop where
  protectedPerson : IsProtectedNativePerson p c
  exercises       : ExercisesTraditionalReligion p c




structure Section1996a (p : Person) (a : PeyoteAct) (c : ComplaintText) : Prop where
  indian          : IsIndianTribeMember p c
  peyoteAct       : IsPeyoteUsePossessionTransport a c
  ceremonial      : IsBonaFideCeremonialPurpose a c
  inReligion      : InConnectionWithTraditionalIndianReligion a c
  adverseAction   : PenalizedOrDiscriminatedForPeyote p a c
  notCarvedOut    : ¬ WithinPeyoteRegulatoryCarveout a c



inductive InterethnicViolationTheory
    (p : Person) (d : PlacementDecision) (c : ComplaintText) : Prop where

  | deniedOpportunity (h : DeniedOpportunityToParent p d c)

  | delayedOrDenied   (h : DelayedOrDeniedPlacement p d c)





structure Section1996b (p : Person) (d : PlacementDecision) (c : ComplaintText) : Prop where
  actor        : IsAdoptionFosterPlacementActor p c
  prohibited   : InterethnicViolationTheory p d c
  onBasisOf    : OnBasisOfRaceColorNationalOrigin p d c
  notICWA      : ¬ WithinICWASavingsCarveout d c

end Proving.USC.T42.ReligiousFreedom.Elements
