import Proving.USC.T18.Ch31.Structure.Types
import Proving.USC.T18.Ch31.Structure.Predicates
import Proving.USC.Common.Types










namespace Proving.USC.T18.Ch31.Structure
open Proving.USC.Common




def edge_659_incorporates_670 : Ref :=
  { source := "18 USC § 659", target := "18 USC § 670", kind := .Incorporates }




def edge_659_lexSpecialis_670 : Ref :=
  { source := "18 USC § 659", target := "18 USC § 670", kind := .LexSpecialis }


def edge_659_incorporates_3571 : Ref :=
  { source := "18 USC § 659", target := "18 USC § 3571", kind := .Incorporates }



def edge_659_savings_stateLaw : Ref :=
  { source := "18 USC § 659", target := "State law", kind := .Savings }



def edge_659_savings_statePriorAdjudication : Ref :=
  { source := "18 USC § 659", target := "State law (prior adjudication)", kind := .Savings }



structure Coherent659 (c : ComplaintText) : Prop where
  medProductSectionExists : ReferencedSectionExists edge_659_incorporates_670 c
  medProductDefHonored    : IncorporationHonored edge_659_incorporates_670 c
  fineRegimeHonored       : IncorporationHonored edge_659_incorporates_3571 c
  fieldNotOccupied        : SavingsClauseHonored edge_659_savings_stateLaw c
  statePriorBarHonored    : SavingsClauseHonored edge_659_savings_statePriorAdjudication c





inductive PunishmentPath659 (c : ComplaintText) : Prop where
  | defaultUnder659 (h : ReferencedSectionExists edge_659_incorporates_3571 c) : PunishmentPath659 c
  | routedTo670     (h : OverrideTriggered edge_659_lexSpecialis_670 c)        : PunishmentPath659 c





def edge_664_incorporates_erisaTitleI : Ref :=
  { source := "18 USC § 664", target := "29 USC ch. 18, subch. I (ERISA Title I)", kind := .Incorporates }


def edge_664_incorporates_3571 : Ref :=
  { source := "18 USC § 664", target := "18 USC § 3571", kind := .Incorporates }



structure Coherent664 (c : ComplaintText) : Prop where
  erisaSectionExists : ReferencedSectionExists edge_664_incorporates_erisaTitleI c
  erisaDefHonored    : IncorporationHonored edge_664_incorporates_erisaTitleI c
  fineRegimeHonored  : IncorporationHonored edge_664_incorporates_3571 c

end Proving.USC.T18.Ch31.Structure
