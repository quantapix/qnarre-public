


















import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Scienter

open Proving.USC.Common






inductive StatutoryPurpose


  | ToCommitAnotherFelony


  | ToCommitMurder

  | ToDoBodilyHarm


  | ToTortureMaimOrDisfigure


  | ToImpedeOrIntimidateOfficial


  | ToRetaliateForOfficialDuties


  | ToViolateForeignOfficialProtection


  | ToPerformFGM


  | ToThreatenIntimidateOrIncite


  | ToDefraud


  | ToExecuteOrConcealScheme

  | ToDefeatTitle11


  | ToFixFeesFromEstate

  | ForUseAsWeapon



  | ForPeacefulPurpose
  deriving DecidableEq, Repr




instance instDecidableAtLeast (a b : MentalState) : Decidable (a.atLeast b) :=
  inferInstanceAs (Decidable (b.rank ≤ a.rank))

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Scienter
