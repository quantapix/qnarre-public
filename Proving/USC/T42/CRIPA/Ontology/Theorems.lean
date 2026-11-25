






import Proving.USC.Common.Types
import Proving.USC.T42.CRIPA.Ontology.Types
import Proving.USC.T42.CRIPA.Ontology.Predicates
import Proving.USC.T42.CRIPA.Ontology.Statute

namespace Proving.USC.T42.CRIPA.Ontology

open Proving.USC.Common (ComplaintText)



theorem agActionObjects_intro
    {i : Institution} {p : InstitutionalizedPerson}
    {x : Conditions} {pat : PatternOrPractice} {c : ComplaintText}
    (hInst : IsInstitution i c)
    (hPers : IsInstitutionalizedPerson p c)
    (hCond : IsEgregiousOrFlagrantConditions x c)
    (hPat  : IsPatternOrPracticeOfResistance pat c)
    : AGActionObjects i p x pat c :=
  { isInstitution := hInst, isInstitutionalized := hPers,
    isConditions := hCond, isPattern := hPat }


theorem prisonerSuit_intro
    {p : Prisoner} {c : ComplaintText}
    (hPrisoner : IsPrisoner p c)
    : PrisonerSuit p c :=
  { isPrisoner := hPrisoner }

end Proving.USC.T42.CRIPA.Ontology
