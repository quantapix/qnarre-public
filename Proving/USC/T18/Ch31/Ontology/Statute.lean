import Proving.USC.T18.Ch31.Ontology.Predicates









namespace Proving.USC.T18.Ch31.Ontology
open Proving.USC.Common






structure InterstateShipment (g : Goods) (c : ComplaintText) : Prop where
  goods  : IsGoodsOrChattels g c
  moving : IsMovingInInterstateCommerce g c





inductive BenefitPlanKind
  | welfare
  | pension



structure CoveredBenefitPlan (p : BenefitPlan) (c : ComplaintText) : Prop where
  basePlan     : IsEmployeeBenefitPlan p c
  erisaCovered : IsErisaTitleISubject p c



inductive ProtectedAsset (a : Asset) (p : BenefitPlan) (c : ComplaintText) : Prop
  | ofPlan (h : IsPlanAsset a p c) : ProtectedAsset a p c
  | ofConnectedFund {f : Fund} (hf : IsFundConnectedToPlan f p c)
      (ha : IsFundAsset a f c) : ProtectedAsset a p c






structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  external   : Bool := false


def edge_shipment_dependsOn_goods : DefEdge :=
  { defined := "interstate or foreign shipment", dependsOn := "goods or chattels",
    citeDefine := "18 USC § 659" }


def edge_shipment_dependsOn_movement : DefEdge :=
  { defined := "interstate or foreign shipment",
    dependsOn := "moving in interstate or foreign commerce",
    citeDefine := "18 USC § 659" }


def edge_shipment_dependsOn_shippingDocument : DefEdge :=
  { defined := "interstate or foreign shipment", dependsOn := "shipping document",
    citeDefine := "18 USC § 659" }


def edge_offense_dependsOn_commonCarrier : DefEdge :=
  { defined := "§ 659 offense", dependsOn := "common carrier",
    citeDefine := "18 USC § 659", external := true }


def edge_medicalProduct_dependsOn_s670 : DefEdge :=
  { defined := "pre-retail medical product", dependsOn := "18 USC § 670 definition",
    citeDefine := "18 USC § 659", external := true }


def edge_coveredPlan_dependsOn_benefitPlan : DefEdge :=
  { defined := "covered employee benefit plan", dependsOn := "employee benefit plan",
    citeDefine := "18 USC § 664" }


def edge_coveredPlan_dependsOn_erisa : DefEdge :=
  { defined := "covered employee benefit plan",
    dependsOn := "ERISA title I (29 USC ch. 18)",
    citeDefine := "18 USC § 664", external := true }


def edge_fund_dependsOn_benefitPlan : DefEdge :=
  { defined := "fund connected therewith", dependsOn := "employee benefit plan",
    citeDefine := "18 USC § 664" }


def edge_protectedAsset_dependsOn_benefitPlan : DefEdge :=
  { defined := "protected plan asset", dependsOn := "employee benefit plan",
    citeDefine := "18 USC § 664" }

end Proving.USC.T18.Ch31.Ontology
