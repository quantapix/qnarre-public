import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false














namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic






inductive Modality where
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition



structure Norm where
  modality : Modality
  cite : String







opaque Official : Type





opaque PublicOfficer : Type




opaque Case11 : Type



opaque EstateProperty : Type



opaque BioMaterial : Type

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Deontic
