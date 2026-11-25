


























namespace Proving.TitleIX




opaque ComplaintText : Type



opaque Person : Type



opaque Recipient : Type




opaque Program : Type




opaque Action : Type






inductive ProtectedGround
  | sex
deriving DecidableEq, Repr














inductive Theory
  | intentional
  | disparateImpact
  | retaliation
  | deliberateIndifference
deriving DecidableEq, Repr




def JudiciallyEnforceableTheory : Theory → Prop
  | Theory.intentional            => True
  | Theory.disparateImpact        => False
  | Theory.retaliation            => True
  | Theory.deliberateIndifference => True



def AdministrativelyEnforceableTheory : Theory → Prop
  | _ => True

end Proving.TitleIX
