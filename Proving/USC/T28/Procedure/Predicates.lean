import Proving.USC.Common.Types
import Proving.USC.T28.Procedure.Types







namespace Proving.USC.T28.Procedure

open Proving.USC.Common






axiom ActionCommencedInDistrictCourt (a : CivilAction) (c : ComplaintText) : Prop




axiom ActionAuthorizedByLaw (a : CivilAction) (c : ComplaintText) : Prop





axiom SeeksConspiracyDeprivationDamages1985 (a : CivilAction) (c : ComplaintText) : Prop





axiom SeeksNeglectToPreventDamages1985 (a : CivilAction) (c : ComplaintText) : Prop






axiom SeeksRedressColorOfStateLaw (a : CivilAction) (c : ComplaintText) : Prop





axiom SeeksCivilRightsActRelief (a : CivilAction) (c : ComplaintText) : Prop






axiom DeclarationSubscribed (d : Declaration) (c : ComplaintText) : Prop




axiom DeclarationDated (d : Declaration) (c : ComplaintText) : Prop



axiom ExecutedWithoutUnitedStates (d : Declaration) (c : ComplaintText) : Prop




axiom ExecutedWithinUnitedStates (d : Declaration) (c : ComplaintText) : Prop






axiom UsesPerjuryFormWithoutUS (d : Declaration) (c : ComplaintText) : Prop





axiom UsesPerjuryFormWithinUS (d : Declaration) (c : ComplaintText) : Prop

end Proving.USC.T28.Procedure
