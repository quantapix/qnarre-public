import Proving.USC.T18.Ch31.Ontology.Types









namespace Proving.USC.T18.Ch31.Ontology
open Proving.USC.Common




axiom IsGoodsOrChattels (g : Goods) (c : ComplaintText) : Prop





axiom IsMovingInInterstateCommerce (g : Goods) (c : ComplaintText) : Prop




axiom IsCommonCarrier (cc : CommonCarrier) (c : ComplaintText) : Prop




axiom IsShippingDocument (d : ShippingDocument) (c : ComplaintText) : Prop




axiom IsPreRetailMedicalProduct (m : MedicalProduct) (c : ComplaintText) : Prop




axiom IsEmployeeBenefitPlan (p : BenefitPlan) (c : ComplaintText) : Prop





axiom IsErisaTitleISubject (p : BenefitPlan) (c : ComplaintText) : Prop



axiom IsFundConnectedToPlan (f : Fund) (p : BenefitPlan) (c : ComplaintText) : Prop



axiom IsPlanAsset (a : Asset) (p : BenefitPlan) (c : ComplaintText) : Prop



axiom IsFundAsset (a : Asset) (f : Fund) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch31.Ontology
