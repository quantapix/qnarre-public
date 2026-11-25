







import Proving.USC.T18.CommercePredicates.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.CommercePredicates.Ontology

open Proving.USC.Common


theorem pecuniaryValueDef_intro {v c}
    (hPec : IsPecuniaryValue v c) : PecuniaryValueDef v c := ⟨hPec⟩


theorem commerceFacilityDef_intro {f c}
    (hFac : IsCommerceFacility f c) : CommerceFacilityDef f c := ⟨hFac⟩


theorem moneyTransmittingDef_intro {m c}
    (hTrans : IsMoneyTransmitting m c) : MoneyTransmittingDef m c := ⟨hTrans⟩



theorem unlicensedMoneyTransmittingBusinessDef_intro {b c}
    (hBiz : IsMoneyTransmittingBusiness b c) (hUnl : UnlicensedCondition b c)
    : UnlicensedMoneyTransmittingBusinessDef b c := ⟨hBiz, hUnl⟩

end Proving.USC.T18.CommercePredicates.Ontology
