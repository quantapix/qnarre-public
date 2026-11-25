




































namespace Proving.Rehab504




opaque ComplaintText : Type



opaque Person : Type




opaque Recipient : Type




opaque Program : Type




opaque Action : Type






inductive ProtectedGround
  | disability
deriving DecidableEq, Repr














inductive Theory
  | intentional
  | failureToAccommodate
  | disparateImpact
  | retaliation
deriving DecidableEq, Repr




def JudiciallyEnforceableTheory : Theory → Prop
  | Theory.intentional          => True
  | Theory.failureToAccommodate => True
  | Theory.disparateImpact      => False
  | Theory.retaliation          => True



def AdministrativelyEnforceableTheory : Theory → Prop
  | _ => True

end Proving.Rehab504
