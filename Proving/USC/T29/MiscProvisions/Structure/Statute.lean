








import Proving.USC.Common.Types
import Proving.USC.T29.MiscProvisions.Structure.Types
import Proving.USC.T29.MiscProvisions.Structure.Predicates

namespace Proving.USC.T29.MiscProvisions.Structure

open Proving.USC.Common





def edge_163_savings_157 : Ref :=
  { source := "29 USC § 163", target := "29 USC § 157", kind := .Savings }



def edge_163_exceptAsProvided_subchapter : Ref :=
  { source := "29 USC § 163", target := "29 USC subchapter II", kind := .ExceptAsProvided }



def edge_164a_savings_152 : Ref :=
  { source := "29 USC § 164(a)", target := "29 USC § 152", kind := .Savings }



def edge_164b_savings_stateLaw : Ref :=
  { source := "29 USC § 164(b)", target := "State or Territorial law", kind := .Savings }



def edge_164c_incorporates_apa : Ref :=
  { source := "29 USC § 164(c)(1)", target := "5 USC ch5 subch II", kind := .Incorporates }




def edge_165_notwithstanding_bankruptcy : Ref :=
  { source := "29 USC § 165", target := "11 USC (former § 672, Bankruptcy Act § 272)", kind := .Notwithstanding }



def edge_165_exceptAsProvided_bankruptcy : Ref :=
  { source := "29 USC § 165", target := "11 USC (former § 672, Bankruptcy Act § 272)", kind := .ExceptAsProvided }



def edge_166_savings_subchapter : Ref :=
  { source := "29 USC § 166", target := "29 USC subchapter II", kind := .Savings }



def edge_168_incorporates_159 : Ref :=
  { source := "29 USC § 168", target := "29 USC § 159", kind := .Incorporates }



def edge_168_exceptAsProvided_160 : Ref :=
  { source := "29 USC § 168", target := "29 USC § 160(e),(f)", kind := .ExceptAsProvided }



def edge_169_incorporates_501c3 : Ref :=
  { source := "29 USC § 169", target := "26 USC § 501(c)(3)", kind := .Incorporates }






structure Coherent163 (c : ComplaintText) : Prop where
  strikeRightExists : ReferencedSectionExists edge_163_savings_157 c
  savingsRespected  : SavingsClauseRespected edge_163_savings_157 c
  exceptApplies     : ExceptionApplies edge_163_exceptAsProvided_subchapter c




structure Coherent164 (c : ComplaintText) : Prop where
  defsExist          : ReferencedSectionExists edge_164a_savings_152 c
  supervisorSavings  : SavingsClauseRespected edge_164a_savings_152 c
  stateLawSavings    : SavingsClauseRespected edge_164b_savings_stateLaw c
  apaIncorporated    : IncorporationHonored edge_164c_incorporates_apa c





inductive Coherent165 (c : ComplaintText) : Prop where

  | prevails (h : OverrideTriggered edge_165_notwithstanding_bankruptcy c) : Coherent165 c


  | savingsFallback (h : ExceptionApplies edge_165_exceptAsProvided_bankruptcy c) : Coherent165 c




structure Coherent166 (c : ComplaintText) : Prop where
  separabilityRespected : SavingsClauseRespected edge_166_savings_subchapter c



structure Coherent168 (c : ComplaintText) : Prop where
  certMachineryExists : ReferencedSectionExists edge_168_incorporates_159 c
  validationHonored   : IncorporationHonored edge_168_incorporates_159 c
  finalJudgmentCarve  : ExceptionApplies edge_168_exceptAsProvided_160 c



structure Coherent169 (c : ComplaintText) : Prop where
  charitableFundExists : ReferencedSectionExists edge_169_incorporates_501c3 c
  incorporationHonored : IncorporationHonored edge_169_incorporates_501c3 c

end Proving.USC.T29.MiscProvisions.Structure
