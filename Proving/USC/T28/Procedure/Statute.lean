import Proving.USC.Common.Types
import Proving.USC.T28.Procedure.Types
import Proving.USC.T28.Procedure.Predicates







namespace Proving.USC.T28.Procedure

open Proving.USC.Common






inductive JurisdictionalGround1343 (a : CivilAction) (c : ComplaintText) : Prop
  | conspiracyDamages
      (h : SeeksConspiracyDeprivationDamages1985 a c) : JurisdictionalGround1343 a c
  | neglectToPrevent
      (h : SeeksNeglectToPreventDamages1985 a c) : JurisdictionalGround1343 a c
  | colorOfStateLaw
      (h : SeeksRedressColorOfStateLaw a c) : JurisdictionalGround1343 a c
  | civilRightsRelief
      (h : SeeksCivilRightsActRelief a c) : JurisdictionalGround1343 a c





structure Section1343Jurisdiction (a : CivilAction) (c : ComplaintText) : Prop where
  commenced  : ActionCommencedInDistrictCourt a c
  authorized : ActionAuthorizedByLaw a c
  ground     : JurisdictionalGround1343 a c






structure DeclarationExecutedWithoutUS (d : Declaration) (c : ComplaintText) : Prop where
  outsideUS  : ExecutedWithoutUnitedStates d c
  form       : UsesPerjuryFormWithoutUS d c
  subscribed : DeclarationSubscribed d c
  dated      : DeclarationDated d c




structure DeclarationExecutedWithinUS (d : Declaration) (c : ComplaintText) : Prop where
  insideUS   : ExecutedWithinUnitedStates d c
  form       : UsesPerjuryFormWithinUS d c
  subscribed : DeclarationSubscribed d c
  dated      : DeclarationDated d c




inductive ValidUnswornDeclaration1746 (d : Declaration) (c : ComplaintText) : Prop
  | withoutUS
      (h : DeclarationExecutedWithoutUS d c) : ValidUnswornDeclaration1746 d c
  | withinUS
      (h : DeclarationExecutedWithinUS d c) : ValidUnswornDeclaration1746 d c

end Proving.USC.T28.Procedure
