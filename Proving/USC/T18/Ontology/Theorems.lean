




import Proving.USC.T18.Ontology.Statute

namespace Proving.USC.T18.Ontology
open Proving.USC.Common

theorem section1962cTermsInhabited_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hPer : IsPerson p c)
    (hEnt : IsEnterprise e c)
    (hPat : IsPatternOfRacketeering c)
    : Section1962cTermsInhabited p e c :=
  ⟨hPer, hEnt, hPat⟩

end Proving.USC.T18.Ontology
