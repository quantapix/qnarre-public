



































namespace Proving.AgeAct




opaque ComplaintText : Type



opaque Person : Type



opaque Recipient : Type



opaque Program : Type



opaque Action : Type






inductive ProtectedGround
  | age
deriving DecidableEq, Repr










inductive Theory
  | intentional
  | disparateImpact
  | retaliation
deriving DecidableEq, Repr




def JudiciallyEnforceableTheory : Theory → Prop
  | Theory.intentional     => True
  | Theory.disparateImpact => False
  | Theory.retaliation     => True



def AdministrativelyEnforceableTheory : Theory → Prop
  | _ => True

end Proving.AgeAct
