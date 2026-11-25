











import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Deontic

open Proving.USC.Common




inductive Modality where
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr




opaque Device : Type




opaque Facility : Type






opaque Proceeding : Type



opaque Transaction : Type



opaque Country : Type




opaque Organization : Type



opaque TerroristAct : Type




opaque Official : Type






inductive Norm113B where

  | proh2332A
  | proh2332B
  | proh2332C
  | proh2332D

  | proh2332aA
  | proh2332aB
  | dfn2332aC

  | proh2332bA1
  | proh2332bA2
  | powr2332bB2
  | proh2332bC2Probation
  | proh2332bC2Concurrent
  | perm2332bD1
  | dfn2332bD2
  | powr2332bE
  | obl2332bF1
  | obl2332bF2
  | dfn2332bG

  | proh2332d
  | powr2332dRegulations
  | dfn2332dB

  | powr2332e
  | powr2332eDelegated

  | proh2332fA1
  | proh2332fA2
  | powr2332fB
  | dfn2332fE

  | proh2332gA1
  | powr2332gB
  | obl2332gC1
  | dfn2332gD

  | proh2332hA1
  | powr2332hB
  | obl2332hC1

  | proh2332iA1
  | proh2332iA2
  | proh2332iA3
  | powr2332iB
  | obl2332iC
  | dfn2332iE

  | dfn2331

  | perm2333A
  | obl2333A
  | proh2333B
  | proh2333C
  | perm2333D
  | dfn2333D1
  | dfn2333E
  deriving DecidableEq, Repr


def Norm113B.modality : Norm113B → Modality
  | .proh2332A | .proh2332B | .proh2332C | .proh2332D
  | .proh2332aA | .proh2332aB
  | .proh2332bA1 | .proh2332bA2
  | .proh2332bC2Probation | .proh2332bC2Concurrent
  | .proh2332d
  | .proh2332fA1 | .proh2332fA2
  | .proh2332gA1 | .proh2332hA1
  | .proh2332iA1 | .proh2332iA2 | .proh2332iA3
  | .proh2333B | .proh2333C => .prohibition
  | .obl2332bF1 | .obl2332bF2 | .obl2332gC1 | .obl2332hC1 | .obl2332iC
  | .obl2333A => .obligation
  | .perm2332bD1 | .perm2333A | .perm2333D => .permission
  | .powr2332bB2 | .powr2332bE | .powr2332dRegulations
  | .powr2332e | .powr2332eDelegated
  | .powr2332fB | .powr2332gB | .powr2332hB | .powr2332iB => .power
  | .dfn2331 | .dfn2332aC | .dfn2332bD2 | .dfn2332bG | .dfn2332dB
  | .dfn2332fE | .dfn2332gD | .dfn2332iE | .dfn2333D1 | .dfn2333E => .definition

end Proving.USC.T18.Ch113B.Deontic
