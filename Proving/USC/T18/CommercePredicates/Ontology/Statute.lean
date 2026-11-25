









import Proving.USC.T18.CommercePredicates.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.CommercePredicates.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  dangling   : Bool := false





def edge_unlicensedBiz_dependsOn_moneyTransmitting : DefEdge :=
  { defined := "unlicensed money transmitting business",
    dependsOn := "money transmitting", citeDefine := "18 USC § 1960(b)(1)" }



def edge_unlicensedBiz_dependsOn_s5330 : DefEdge :=
  { defined := "unlicensed money transmitting business",
    dependsOn := "31 USC § 5330 money transmitting business registration",
    citeDefine := "18 USC § 1960(b)(1)(B)", dangling := true }



def edge_unlicensedBiz_dependsOn_state1960 : DefEdge :=
  { defined := "unlicensed money transmitting business",
    dependsOn := "State (§ 1960)", citeDefine := "18 USC § 1960(b)(1)(A)" }


def defEdges : List DefEdge :=
  [ edge_unlicensedBiz_dependsOn_moneyTransmitting,
    edge_unlicensedBiz_dependsOn_s5330,
    edge_unlicensedBiz_dependsOn_state1960 ]




structure PecuniaryValueDef (v : PecuniaryValue) (c : ComplaintText) : Prop where
  isPecuniary : IsPecuniaryValue v c



structure CommerceFacilityDef (f : CommerceFacility) (c : ComplaintText) : Prop where
  isFacility : IsCommerceFacility f c




structure MoneyTransmittingDef (m : MoneyTransmitting) (c : ComplaintText) : Prop where
  isTransmitting : IsMoneyTransmitting m c




inductive UnlicensedCondition (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop

  | noStateLicense    : LacksStateLicense b c → UnlicensedCondition b c

  | noFedRegistration : FailsFederalRegistration b c → UnlicensedCondition b c

  | criminalProceeds  : InvolvesCriminalProceeds b c → UnlicensedCondition b c





structure UnlicensedMoneyTransmittingBusinessDef
    (b : MoneyTransmittingBusiness) (c : ComplaintText) : Prop where
  isBusiness   : IsMoneyTransmittingBusiness b c
  unlicensed   : UnlicensedCondition b c

end Proving.USC.T18.CommercePredicates.Ontology
