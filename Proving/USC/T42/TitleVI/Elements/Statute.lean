















import Proving.USC.T42.TitleVI.Elements.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.TitleVI.Elements

open Proving.USC.Common




structure Section2000d
    (p : Person) (e : Entity) (pr : Program) (c : ComplaintText) : Prop where

  personInUS    : IsPersonInUS p c

  fundedProgram : IsFederalFundingRecipient e c

  adverseAction : SufferedCoveredAdverseAction p pr c

  protectedGround : OnProtectedGround p c

  intent        : IntentToDiscriminate p c

  timely        : WithinLimitations p c



structure Section2000dState
    (p : Person) (e : Entity) (pr : Program) (c : ComplaintText) : Prop where

  base          : Section2000d p e pr c

  immunityAbrogated : SovereignImmunityAbrogated p c

  afterEffective    : ViolationAfterEffectiveDate p c


structure Section2000d1
    (a : Agency) (e : Entity) (pr : Program) (c : ComplaintText) : Prop where

  fundedProgram   : IsFederalFundingRecipient e c



  validEnforcement : ValidAgencyEnforcementAction a pr c


inductive ValidTitleVIClaim
    (p : Person) (e : Entity) (pr : Program) (c : ComplaintText) : Prop where

  | againstRecipient (h : Section2000d p e pr c) : ValidTitleVIClaim p e pr c

  | againstState (h : Section2000dState p e pr c) : ValidTitleVIClaim p e pr c

end Proving.USC.T42.TitleVI.Elements
