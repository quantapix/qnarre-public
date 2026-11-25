







import Proving.USC.Common.Types
import Proving.USC.T22.Elements.Sub.Types
import Proving.USC.T22.Elements.Sub.Predicates
import Proving.USC.T22.Elements.Sub.Statute

namespace Proving.USC.T22.Elements.Sub

open Proving.USC.Common


theorem section7103_intro {c}
    (hTF : TaskForceEstablished c) (hMem : MembersAppointed c)
    (hChair : ChairedBySecretaryOfState c) (hAct : CarriesOutActivities c)
    (hOff : OfficeToMonitorEstablished c)
    (hSPOG : SeniorPolicyOperatingGroupEstablished c) : Section7103 c :=
  ⟨hTF, hMem, hChair, hAct, hOff, hSPOG⟩




theorem section7106_intro {g c}
    (hCrim : CriminalizesSevereTrafficking g c)
    (hGrave : PrescribesGraveCrimePunishment g c)
    (hStringent : PrescribesStringentPunishment g c)
    (hEfforts : MakesSeriousAndSustainedEfforts g c) : Section7106 g c :=
  ⟨hCrim, hGrave, hStringent, hEfforts⟩

end Proving.USC.T22.Elements.Sub
