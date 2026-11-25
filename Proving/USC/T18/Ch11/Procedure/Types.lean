import Proving.USC.Common.Types












namespace Proving.USC.T18.Ch11.Procedure
open Proving.USC.Common



inductive State

  | ServiceOngoing

  | ServiceTerminated

  | RestrictedActMade

  | OffenseEstablished

  | CivilActionFiled

  | InjunctionEntered

  | Convicted

  | TransactionVoided

  | Barred


opaque CoveredPosition : Type



opaque ParticularMatter : Type


opaque EnforcementAction : Type

end Proving.USC.T18.Ch11.Procedure
