







import Proving.USC.T29.MiscProvisions.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T29.MiscProvisions.Ontology

open Proving.USC.Common


theorem supervisorMembership_intro {s c}
    (hSup : IsSupervisor s c) : SupervisorMembership s c :=
  ⟨hSup⟩


theorem religiousObjectorMembership_intro {p b c}
    (hObj : IsReligiousObjectorEmployee p c) (hBody : IsBonaFideReligiousBody b c)
    : ReligiousObjectorMembership p b c :=
  ⟨hObj, hBody⟩


theorem duesSubstitution_intro {p f c}
    (hObj : IsReligiousObjectorEmployee p c) (hFund : IsCharitableFund f c)
    : DuesSubstitution p f c :=
  ⟨hObj, hFund⟩

end Proving.USC.T29.MiscProvisions.Ontology
