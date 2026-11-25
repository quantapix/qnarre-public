











import Proving.USC.Common.Types
import Proving.USC.T29.MiscProvisions.Elements.Types
import Proving.USC.T29.MiscProvisions.Elements.Predicates

namespace Proving.USC.T29.MiscProvisions.Elements

open Proving.USC.Common




structure Section163 (p : Person) (a : ConcertedAction) (c : ComplaintText) : Prop where
  exercises : ExercisesRightToStrike p a c
  preserved : RightToStrikePreserved a c




structure Section164b (u : UnionSecurityArrangement) (c : ComplaintText) : Prop where
  stateProhibits : StateLawProhibitsUnionSecurity u c



structure Section168 (b : BoardAction) (c : ComplaintText) : Prop where
  notInvalidated : BoardActionNotInvalidated b c





structure Section169 (p : Person) (u : UnionSecurityArrangement) (c : ComplaintText) : Prop where
  objection      : HoldsBonaFideReligiousObjection p c
  demand         : DemandsUnionSupportAsCondition p u c
  substitution   : CharitableSubstitutionSatisfied p u c

end Proving.USC.T29.MiscProvisions.Elements
