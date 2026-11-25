







import Proving.USC.T42.PublicAccommodations.Prohibition.Procedure.Types
import Proving.USC.T42.PublicAccommodations.Prohibition.Procedure.Predicates
import Proving.USC.T42.PublicAccommodations.Prohibition.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Prohibition.Procedure

open Proving.USC.Common


theorem interferenceTransition_intro {p : Person} {c : ComplaintText}
    (hSecured : RightSecuredToPerson p c)
    (hInterfered : InterferenceActOccurred p c) :
    InterferenceTransition p c :=
  ⟨hSecured, hInterfered⟩



theorem timelyEnforcement_intro {p : Person} {c : ComplaintText}
    (hSecured : RightSecuredToPerson p c)
    (hExercised : RightExercised p c)
    (hInterfered : InterferenceActOccurred p c)
    (hWindow : WithinEnforcementWindow p c) :
    TimelyEnforcement p c :=
  ⟨hSecured, hExercised, hInterfered, hWindow⟩



theorem stateMandatedEnforcement_intro {p : Person} {c : ComplaintText}
    (hState : StateRequiredDiscrimination p c)
    (hTimely : TimelyEnforcement p c) :
    StateMandatedEnforcement p c :=
  ⟨hState, hTimely⟩

end Proving.USC.T42.PublicAccommodations.Prohibition.Procedure
