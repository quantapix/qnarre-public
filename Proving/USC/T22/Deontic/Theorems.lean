







import Proving.USC.T22.Deontic.Statute

namespace Proving.USC.T22.Deontic
open Proving.USC.Common



theorem definition7102_intro {t : DefinedTerm} {c : ComplaintText}
    (h : TermIsDefined t c) : Definition7102 t c :=
  ⟨h⟩




theorem deonticallyInert7102 : DeonticallyInert7102 := rfl

end Proving.USC.T22.Deontic
