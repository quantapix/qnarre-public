


















import Proving.USC.Common.Types

namespace Proving.USC.T29.SelfOrgRep.Procedure

open Proving.USC.Common



opaque RepresentationPetition : Type



opaque BargainingUnit : Type


inductive State
  | PetitionFiled
  | CommerceQuestionFound
  | ElectionDirected
  | Certified
  | ElectionBarred
  deriving DecidableEq, Repr

end Proving.USC.T29.SelfOrgRep.Procedure
