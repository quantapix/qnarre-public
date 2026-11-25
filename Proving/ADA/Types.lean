



















































namespace Proving.ADA




opaque ComplaintText : Type





opaque Person : Type





opaque CoveredEntity : Type





opaque Program : Type




opaque Action : Type







inductive ProtectedGround
  | disability
deriving DecidableEq, Repr





inductive Title
  | employment
  | publicServices
  | publicAccommodations
deriving DecidableEq, Repr













inductive Theory
  | disparateTreatment
  | reasonableAccommodation
  | retaliation
deriving DecidableEq, Repr






def JudiciallyEnforceableTheory : Theory → Prop
  | _ => True

end Proving.ADA
