






import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Deontic

open Proving.USC.Common





inductive Modality : Type where
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr



opaque Passport : Type


opaque PassportApplication : Type





opaque ImmigrationDocument : Type





opaque ImmigrationFiling : Type



opaque IdentificationDocument : Type



opaque Attestation : Type






opaque PermitPrintingArticle : Type

end Proving.USC.T18.Ch75.Reslice.Deontic
