




















































import Proving.USC.Common.Predicates

namespace Proving.USC.Reconciled.T42

open Proving.USC.Common


















opaque Program : Type
opaque Agency  : Type

axiom SufferedCoveredAdverseAction (p : Person) (pr : Program) (c : ComplaintText) : Prop
axiom OnProtectedGround (p : Person) (c : ComplaintText) : Prop
axiom SovereignImmunityAbrogated (p : Person) (c : ComplaintText) : Prop
axiom ViolationAfterEffectiveDate (p : Person) (c : ComplaintText) : Prop
axiom ValidAgencyEnforcementAction (a : Agency) (pr : Program) (c : ComplaintText) : Prop




structure ReconciledSection2000d (p : Person) (e : Entity) (pr : Program) (c : ComplaintText) : Prop where
  personInUS      : IsPersonInUS p c
  fundedProgram   : IsFederalFundingRecipient e c
  adverseAction   : SufferedCoveredAdverseAction p pr c
  protectedGround : OnProtectedGround p c
  intent          : IntentToDiscriminate p c
  timely          : WithinLimitations p c



structure ReconciledSection2000dState (p : Person) (e : Entity) (pr : Program) (c : ComplaintText) : Prop where
  base              : ReconciledSection2000d p e pr c
  immunityAbrogated : SovereignImmunityAbrogated p c
  afterEffective    : ViolationAfterEffectiveDate p c



structure ReconciledSection2000d1 (a : Agency) (e : Entity) (pr : Program) (c : ComplaintText) : Prop where
  fundedProgram    : IsFederalFundingRecipient e c
  validEnforcement : ValidAgencyEnforcementAction a pr c



inductive ReconciledValidTitleVIClaim (p : Person) (e : Entity) (pr : Program) (c : ComplaintText) : Prop where
  | againstRecipient (h : ReconciledSection2000d p e pr c) : ReconciledValidTitleVIClaim p e pr c
  | againstState     (h : ReconciledSection2000dState p e pr c) : ReconciledValidTitleVIClaim p e pr c

end Proving.USC.Reconciled.T42
