















import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.Procedure

open Proving.USC.Common




opaque Property : Type




opaque CivilInvestigativeDemand : Type



opaque Proceeding : Type




inductive Stage

  | Accrued

  | Filed

  | Served

  | Restrained

  | Convicted

  | ForfeitureOrdered

  | NoticePublished

  | PetitionFiled

  | PetitionAdjudicated

  | TitleCleared

  | TimeBarred
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch96.Procedure
