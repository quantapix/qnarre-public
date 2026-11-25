import Proving.USC.T42.TitleVII.Elements.Predicates









namespace Proving.USC.T42.TitleVII.Elements

open Proving.USC.Common




structure Coverage (r : Respondent) (p : Person) (c : ComplaintText) : Prop where
  respondent    : IsCoveredRespondent r c
  commerce      : AffectsCommerce r c
  employee      : IsCoveredEmployee p c
  notExempt     : NotStatutorilyExempt r c
  personInUS    : IsPersonInUS p c



structure Exhaustion (p : Person) (ch : Charge) (c : ComplaintText) : Prop where
  timelyCharge  : TimelyChargeFiled p ch c
  rightToSue    : RightToSueAndTimelySuit p c


structure DisparateTreatment
    (r : Respondent) (p : Person) (g : ProtectedGround) (pr : Practice) (c : ComplaintText) : Prop where
  protectedGround : IsProtectedGround g c
  adverseAction   : AdverseEmploymentAction r p pr c
  causation       : BecauseOfProtectedGround r p g c
  intent          : IntentToDiscriminate p c
  notBFOQ         : NotBonaFideOccupationalQualification r pr c
  notSeniority    : NotBonaFideSenioritySystem r pr c


structure DisparateImpact
    (r : Respondent) (g : ProtectedGround) (pr : Practice) (c : ComplaintText) : Prop where
  protectedGround : IsProtectedGround g c
  impact          : PracticeCausesDisparateImpact r pr g c
  notJobRelated   : NotJobRelatedBusinessNecessity r pr c


structure MixedMotive
    (r : Respondent) (p : Person) (g : ProtectedGround) (c : ComplaintText) : Prop where
  protectedGround : IsProtectedGround g c
  motivating      : WasMotivatingFactor r p g c


structure Retaliation
    (r : Respondent) (p : Person) (pr : Practice) (c : ComplaintText) : Prop where
  protectedActivity : EngagedInProtectedActivity p c
  adverseAction     : AdverseEmploymentAction r p pr c
  causation         : RetaliatoryCausation r p c
  proxCause         : ProximateCause p c




inductive ValidTitleVIIClaim
    (r : Respondent) (p : Person) (g : ProtectedGround) (pr : Practice)
    (ch : Charge) (c : ComplaintText) : Prop where
  | treatment (cov : Coverage r p c) (ex : Exhaustion p ch c)
      (dt : DisparateTreatment r p g pr c) : ValidTitleVIIClaim r p g pr ch c
  | impact (cov : Coverage r p c) (ex : Exhaustion p ch c)
      (di : DisparateImpact r g pr c) : ValidTitleVIIClaim r p g pr ch c
  | mixedMotive (cov : Coverage r p c) (ex : Exhaustion p ch c)
      (mm : MixedMotive r p g c) : ValidTitleVIIClaim r p g pr ch c
  | retaliation (cov : Coverage r p c) (ex : Exhaustion p ch c)
      (ret : Retaliation r p pr c) : ValidTitleVIIClaim r p g pr ch c

end Proving.USC.T42.TitleVII.Elements
