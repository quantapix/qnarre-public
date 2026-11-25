
















import Proving.USC.Common.Types

namespace Proving.USC.T18.Obstruction.Procedure

open Proving.USC.Common (Person ComplaintText Time)




opaque OfficialProceeding : Type




opaque Prosecution : Type



opaque District : Type





inductive State
  | ConductOccurred
  | ProsecutionCommenced
  | VenueEstablished
  | Adjudicated
  deriving DecidableEq, Repr

end Proving.USC.T18.Obstruction.Procedure
