import Proving.USC.Common.Types
import Proving.USC.T28.Procedure.Types
import Proving.USC.T28.Procedure.Predicates
import Proving.USC.T28.Procedure.Statute







namespace Proving.USC.T28.Procedure

open Proving.USC.Common




theorem jurisdictionalGround1343_conspiracyDamages_intro {a : CivilAction}
    {c : ComplaintText} (h : SeeksConspiracyDeprivationDamages1985 a c) :
    JurisdictionalGround1343 a c :=
  .conspiracyDamages h


theorem jurisdictionalGround1343_neglectToPrevent_intro {a : CivilAction}
    {c : ComplaintText} (h : SeeksNeglectToPreventDamages1985 a c) :
    JurisdictionalGround1343 a c :=
  .neglectToPrevent h


theorem jurisdictionalGround1343_colorOfStateLaw_intro {a : CivilAction}
    {c : ComplaintText} (h : SeeksRedressColorOfStateLaw a c) :
    JurisdictionalGround1343 a c :=
  .colorOfStateLaw h


theorem jurisdictionalGround1343_civilRightsRelief_intro {a : CivilAction}
    {c : ComplaintText} (h : SeeksCivilRightsActRelief a c) :
    JurisdictionalGround1343 a c :=
  .civilRightsRelief h



theorem section1343Jurisdiction_intro {a : CivilAction} {c : ComplaintText}
    (hCom : ActionCommencedInDistrictCourt a c)
    (hAuth : ActionAuthorizedByLaw a c)
    (hGround : JurisdictionalGround1343 a c) :
    Section1343Jurisdiction a c :=
  ⟨hCom, hAuth, hGround⟩




theorem declarationExecutedWithoutUS_intro {d : Declaration} {c : ComplaintText}
    (hOut : ExecutedWithoutUnitedStates d c)
    (hForm : UsesPerjuryFormWithoutUS d c)
    (hSub : DeclarationSubscribed d c)
    (hDate : DeclarationDated d c) :
    DeclarationExecutedWithoutUS d c :=
  ⟨hOut, hForm, hSub, hDate⟩


theorem declarationExecutedWithinUS_intro {d : Declaration} {c : ComplaintText}
    (hIn : ExecutedWithinUnitedStates d c)
    (hForm : UsesPerjuryFormWithinUS d c)
    (hSub : DeclarationSubscribed d c)
    (hDate : DeclarationDated d c) :
    DeclarationExecutedWithinUS d c :=
  ⟨hIn, hForm, hSub, hDate⟩


theorem validUnswornDeclaration1746_withoutUS_intro {d : Declaration}
    {c : ComplaintText} (h : DeclarationExecutedWithoutUS d c) :
    ValidUnswornDeclaration1746 d c :=
  .withoutUS h


theorem validUnswornDeclaration1746_withinUS_intro {d : Declaration}
    {c : ComplaintText} (h : DeclarationExecutedWithinUS d c) :
    ValidUnswornDeclaration1746 d c :=
  .withinUS h

end Proving.USC.T28.Procedure
