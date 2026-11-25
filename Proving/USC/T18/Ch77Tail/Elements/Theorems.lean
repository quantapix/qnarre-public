





import Proving.USC.Common.Types
import Proving.USC.T18.Ch77Tail.Elements.Types
import Proving.USC.T18.Ch77Tail.Elements.Predicates
import Proving.USC.T18.Ch77Tail.Elements.Statute

namespace Proving.USC.T18.Ch77Tail.Elements
open Proving.USC.Common


theorem section1582_intro {p v c}
    (hPrep : PreparesOrDispatchesSlaveVessel p v c)
    (hLoc : WithinUSTerritorialJurisdiction c)
    (hPurp : PurposeToProcureForSlavery p c) : Section1582 p v c :=
  ⟨hPrep, hLoc, hPurp⟩


theorem section1585_intro {p victim c}
    (hCrew : IsCrewOfSlaveTradeVessel p c)
    (hAct : SeizesOrTransportsPersonAsSlave p victim c)
    (hInt : IntentToEnslave p c) : Section1585 p victim c :=
  ⟨hCrew, hAct, hInt⟩


theorem section1586_intro {p v c}
    (hCit : IsUSCitizenOrResident p c)
    (hServ : VoluntarilyServesOnSlaveTransportVessel p v c) : Section1586 p v c :=
  ⟨hCit, hServ⟩


theorem section1587_intro {p v victim c}
    (hCmd : IsVesselCommander p c)
    (hLoc : WithinUSTerritorialJurisdiction c)
    (hPoss : PossessesPersonForSaleAsSlave p victim c) : Section1587 p v victim c :=
  ⟨hCmd, hLoc, hPoss⟩


theorem section1588_intro {p victim c}
    (hChg : IsVesselMasterOwnerOrInCharge p c)
    (hAct : ReceivesOrCarriesPersonFromUS p victim c)
    (hSci : KnowledgeOrIntentToHoldOrSellAsSlave p c) : Section1588 p victim c :=
  ⟨hChg, hAct, hSci⟩



theorem section1592a_intro {p d c}
    (hHand : KnowinglyHandlesIdentityDocument p d c)
    (hDoc : DocumentIsIdentityDocOfAnother d c)
    (hNexus : TraffickingDocumentNexus p c)
    (hNotVictim : ¬ VictimOwnConductException p c) : Section1592a p d c :=
  ⟨hHand, hDoc, hNexus, hNotVictim⟩


theorem section1592c_intro {p c}
    (hObs : ObstructsEnforcement p c) : Section1592c p c :=
  ⟨hObs⟩

end Proving.USC.T18.Ch77Tail.Elements
