







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.CommercePredicates.Elements.Types
import Proving.USC.T18.CommercePredicates.Elements.Predicates
import Proving.USC.T18.CommercePredicates.Elements.Statute

namespace Proving.USC.T18.CommercePredicates.Elements

open Proving.USC.Common





theorem section1958Completed_intro {p f c}
    (hMeans : JurisdictionalMeans1958 p f c)
    (hIntent : IntentThatMurderCommitted p c)
    (hConsid : AsConsiderationForPecuniaryValue p c) :
    Section1958Completed p f c :=
  ⟨hMeans, hIntent, hConsid⟩


theorem section1958_intro_completed {p f c}
    (h : Section1958Completed p f c) : ValidSection1958Charge p f c :=
  .completed h


theorem section1958_intro_conspiracy {p f c}
    (h : ConspiredToCommitMurderForHire p c) : ValidSection1958Charge p f c :=
  .conspiracy h





theorem section1960_intro {p b e c}
    (hKnowing : KnowinglyConductsMTB p b c)
    (hIsMTB : IsMoneyTransmittingBusiness b c)
    (hCommerce : EngagedInInterstateCommerce e c)
    (hUnlicensed : UnlicensedRoute1960 b c) :
    Section1960 p b e c :=
  ⟨hKnowing, hIsMTB, hCommerce, hUnlicensed⟩

end Proving.USC.T18.CommercePredicates.Elements
