






import Proving.USC.Common.Types
import Proving.USC.T29.MiscProvisions.Elements.Types
import Proving.USC.T29.MiscProvisions.Elements.Predicates
import Proving.USC.T29.MiscProvisions.Elements.Statute

namespace Proving.USC.T29.MiscProvisions.Elements

open Proving.USC.Common


theorem section163_intro {p a c}
    (hExercises : ExercisesRightToStrike p a c)
    (hPreserved : RightToStrikePreserved a c) : Section163 p a c :=
  ⟨hExercises, hPreserved⟩


theorem section164b_intro {u c}
    (hStateProhibits : StateLawProhibitsUnionSecurity u c) : Section164b u c :=
  ⟨hStateProhibits⟩


theorem section168_intro {b c}
    (hNotInvalidated : BoardActionNotInvalidated b c) : Section168 b c :=
  ⟨hNotInvalidated⟩


theorem section169_intro {p u c}
    (hObjection : HoldsBonaFideReligiousObjection p c)
    (hDemand : DemandsUnionSupportAsCondition p u c)
    (hSubstitution : CharitableSubstitutionSatisfied p u c) : Section169 p u c :=
  ⟨hObjection, hDemand, hSubstitution⟩

end Proving.USC.T29.MiscProvisions.Elements
