import Proving.USC.Common.Types














namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Deontic




inductive Modality
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr





inductive Provision
  | s81
  | s111 | s112 | s113 | s114 | s115
  | s116 | s117 | s118 | s119
  | s151
  | s152 | s153 | s154 | s155 | s156 | s157
  | s158
  | s175 | s175a | s175b | s175c
  | s176 | s177
  | s178
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Deontic
