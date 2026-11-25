
























import Proving.TitleVII.Types

namespace Proving.TitleVII.FederalSector

open Proving.TitleVII






opaque FederalEmployee : Type



opaque AgencyHead : Type




opaque PersonnelAction : Type






inductive ProtectedGround
  | race
  | color
  | religion
  | sex
  | nationalOrigin
deriving DecidableEq, Repr

end Proving.TitleVII.FederalSector
