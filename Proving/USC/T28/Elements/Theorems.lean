import Proving.USC.T28.Elements.Types
import Proving.USC.T28.Elements.Predicates
import Proving.USC.T28.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T28.Elements
open Proving.USC.Common




theorem section1343a1_intro {a : CivilAction} {c : ComplaintText}
    (hAuth : CivilActionAuthorizedByLaw a c)
    (hDam : SeeksDamages a c)
    (hInj : Injury1343a1 a c)
    (hFurth : ActInFurtheranceOfSection1985Conspiracy a c) :
    Section1343a1 a c :=
  ⟨hAuth, hDam, hInj, hFurth⟩


theorem section1343a2_intro {p : Person} {a : CivilAction} {c : ComplaintText}
    (hAuth : CivilActionAuthorizedByLaw a c)
    (hDam : SeeksDamages a c)
    (hKnow : KnewOfImpendingSection1985Wrongs p c)
    (hPow : HadPowerToPrevent p c)
    (hFail : FailedToPreventOrAidInPreventing p c) :
    Section1343a2 p a c :=
  ⟨hAuth, hDam, hKnow, hPow, hFail⟩


theorem section1343a3_intro {p : Person} {a : CivilAction} {c : ComplaintText}
    (hAuth : CivilActionAuthorizedByLaw a c)
    (hDep : DeprivationOfRightPrivilegeOrImmunity a c)
    (hSrc : SecuredRightSource1343a3 a c)
    (hCol : ActsUnderColorOfStateLaw p c) :
    Section1343a3 p a c :=
  ⟨hAuth, hDep, hSrc, hCol⟩


theorem section1343a4_intro {a : CivilAction} {c : ComplaintText}
    (hAuth : CivilActionAuthorizedByLaw a c)
    (hAct : ClaimUnderCivilRightsProtectionAct a c)
    (hRel : SeeksDamagesOrEquitableOrOtherRelief a c) :
    Section1343a4 a c :=
  ⟨hAuth, hAct, hRel⟩


theorem section1746Declaration_intro {d : Declaration} {c : ComplaintText}
    (hApp : MatterRequiresOrPermitsSwornSupport d c)
    (hNotExc : ¬ ExceptedSwornMatter d c)
    (hWrit : IsWrittenDeclaration d c)
    (hSub : SubscribedAsTrueUnderPenaltyOfPerjury d c)
    (hDate : IsDated d c)
    (hForm : FormCompliance1746 d c) :
    Section1746Declaration d c :=
  ⟨hApp, hNotExc, hWrit, hSub, hDate, hForm⟩

end Proving.USC.T28.Elements
