







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Ontology

open Proving.USC.Common





opaque Conduct : Type





opaque Offense : Type



opaque Circumstance : Type



opaque PropertyObject : Type



opaque Facility : Type





opaque Locale : Type



opaque Injury : Type




opaque LawProvision : Type



opaque Indictment : Type



opaque Prosecution : Type




inductive ProhibitedConductClass where

  | killing

  | kidnapping

  | maiming


  | assaultDangerousWeaponOrSeriousBodilyInjury

  | destructionOrDamageOfProperty

  | attemptOrConspiracy

  | threat
  deriving DecidableEq, Repr




structure DefEdge where

  defined : String

  dependsOn : String

  citeDefine : String
  deriving Repr



structure DanglingRef where

  term : String

  usedAt : String


  definedAt : String
  deriving Repr

end Proving.USC.T18.Ch113B.Wmd.Part2.Ontology
