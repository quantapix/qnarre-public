import Proving.USC.T18.Ch31.Ontology.Statute








namespace Proving.USC.T18.Ch31.Ontology
open Proving.USC.Common



theorem interstateShipment_intro {g c}
    (hGoods : IsGoodsOrChattels g c) (hMoving : IsMovingInInterstateCommerce g c)
    : InterstateShipment g c := ⟨hGoods, hMoving⟩



theorem coveredBenefitPlan_intro {p c}
    (hBase : IsEmployeeBenefitPlan p c) (hErisa : IsErisaTitleISubject p c)
    : CoveredBenefitPlan p c := ⟨hBase, hErisa⟩


theorem protectedAsset_ofPlan_intro {a p c}
    (h : IsPlanAsset a p c) : ProtectedAsset a p c :=
  ProtectedAsset.ofPlan h


theorem protectedAsset_ofConnectedFund_intro {a p c f}
    (hf : IsFundConnectedToPlan f p c) (ha : IsFundAsset a f c)
    : ProtectedAsset a p c :=
  ProtectedAsset.ofConnectedFund hf ha

end Proving.USC.T18.Ch31.Ontology
