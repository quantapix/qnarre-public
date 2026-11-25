








import Proving.USC.T42.PublicAccommodations.Prohibition.Elements.Predicates

namespace Proving.USC.T42.PublicAccommodations.Prohibition.Elements

open Proving.USC.Common




structure Section2000a1 (p : Person) (est : Establishment) (c : ComplaintText) : Prop where
  person          : IsPersonInUS p c
  discrimination  : SufferedDiscriminationOrSegregation p est c
  protectedGround : OnProtectedGround p c
  atPlace         : AtEstablishmentOrPlace est c
  stateRequired   : RequiredByStateLaw c







structure Section2000a2_Deprive (p : Person) (r : SecuredRight) (c : ComplaintText) : Prop where
  person  : IsPersonInUS p c
  secured : RightSecuredBy2000a r c
  conduct : WithheldOrDeprivedRight p r c



structure Section2000a2_Coerce (p : Person) (r : SecuredRight) (c : ComplaintText) : Prop where
  person  : IsPersonInUS p c
  secured : RightSecuredBy2000a r c
  conduct : IntimidatedThreatenedCoerced p c
  purpose : PurposeOfInterfering p r c



structure Section2000a2_Punish (p : Person) (r : SecuredRight) (c : ComplaintText) : Prop where
  person  : IsPersonInUS p c
  secured : RightSecuredBy2000a r c
  conduct : PunishedForExercising p r c



inductive ProhibitedInterference (p : Person) (r : SecuredRight) (c : ComplaintText) : Prop where
  | deprive (h : Section2000a2_Deprive p r c) : ProhibitedInterference p r c
  | coerce  (h : Section2000a2_Coerce  p r c) : ProhibitedInterference p r c
  | punish  (h : Section2000a2_Punish  p r c) : ProhibitedInterference p r c

end Proving.USC.T42.PublicAccommodations.Prohibition.Elements
