import Proving.USC.Common.Types








namespace Proving.USC.T28.Procedure

open Proving.USC.Common




opaque CivilAction : Type




opaque Declaration : Type




inductive FilingState
  | Prepared
  | Commenced
  | JurisdictionAttached




inductive DeclarationState
  | Drafted
  | Executed
  | EffectiveAsSworn

end Proving.USC.T28.Procedure
