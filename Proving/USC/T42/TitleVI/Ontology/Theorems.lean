






import Proving.USC.T42.TitleVI.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Ontology

open Proving.USC.Common

theorem coveredProgram_intro {x c}
    (hProgram : IsProgramOrActivity x c)
    : CoveredProgram x c :=
  ⟨hProgram⟩

theorem protectedSubject_intro {p g c}
    (hPerson : IsPersonInUS p c) (hGround : IsProtectedGround g c)
    : ProtectedSubject p g c :=
  ⟨hPerson, hGround⟩

theorem enforcementSetting_intro {a r c}
    (hAgency : IsFederalAgency a c) (hRecipient : IsRecipient r c)
    : EnforcementSetting a r c :=
  ⟨hAgency, hRecipient⟩

theorem remediesAgainstState_intro {s c}
    (hState : IsStateDefendant s c)
    : RemediesAgainstState s c :=
  ⟨hState⟩

end Proving.USC.T42.TitleVI.Ontology
