







import Proving.USC.T18.Core.Ontology.Types
import Proving.USC.T18.Core.Ontology.Predicates
import Proving.USC.T18.Core.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Core.Ontology

open Proving.USC.Common



theorem patternMembership_intro {pat a c}
    (hAct : IsRacketeeringActivity a c) (hPat : IsPatternOfRacketeering pat c)
    : PatternMembership pat a c := ⟨hAct, hPat⟩


theorem racketeeringPredicate_viaPattern_intro {pat d c}
    (hPat : IsPatternOfRacketeering pat c)
    : RacketeeringPredicate pat d c := .viaPattern hPat


theorem racketeeringPredicate_viaUnlawfulDebt_intro {pat d c}
    (hDebt : IsUnlawfulDebt d c)
    : RacketeeringPredicate pat d c := .viaUnlawfulDebt hDebt



theorem section1962ViolationMembership_intro {v p e pat d c}
    (hPerson : IsPerson p c) (hEnt : IsEnterprise e c)
    (hPred : RacketeeringPredicate pat d c) (hViol : IsSection1962Violation v c)
    : Section1962ViolationMembership v p e pat d c :=
  ⟨hPerson, hEnt, hPred, hViol⟩

end Proving.USC.T18.Core.Ontology
