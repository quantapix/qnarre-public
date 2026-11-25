
























import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Prohibition.Ontology

open Proving.USC.Common





opaque Establishment : Type





opaque StateLawInstrument : Type




opaque DiscriminatoryTreatment : Type



inductive ProtectedGround
  | race
  | color
  | religion
  | nationalOrigin
  deriving DecidableEq, Repr





opaque SecuredRight : Type



opaque InterferingAct : Type

end Proving.USC.T42.PublicAccommodations.Prohibition.Ontology
