

























namespace Proving.TitleVII




opaque ComplaintText : Type



opaque Person : Type




opaque Respondent : Type



opaque Charge : Type





inductive Enforcer
  | commission
  | attorneyGeneral
deriving DecidableEq, Repr





inductive RespondentClass
  | private_
  | government
deriving DecidableEq, Repr







def ProperEnforcerFor : RespondentClass → Enforcer
  | RespondentClass.private_   => Enforcer.commission
  | RespondentClass.government => Enforcer.attorneyGeneral

end Proving.TitleVII
