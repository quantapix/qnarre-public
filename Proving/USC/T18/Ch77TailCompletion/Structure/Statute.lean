









import Proving.USC.T18.Ch77TailCompletion.Structure.Types
import Proving.USC.T18.Ch77TailCompletion.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77TailCompletion.Structure

open Proving.USC.Common



def edge_1593_notwithstanding_3663 : Ref :=
  { source := "18 USC § 1593(a)", target := "18 USC § 3663", kind := .Notwithstanding }
def edge_1593_notwithstanding_3663A : Ref :=
  { source := "18 USC § 1593(a)", target := "18 USC § 3663A", kind := .Notwithstanding }
def edge_1593_incorporates_3664 : Ref :=
  { source := "18 USC § 1593(b)(2)", target := "18 USC § 3664", kind := .Incorporates }
def edge_1593_incorporates_2259 : Ref :=
  { source := "18 USC § 1593(b)(3)", target := "18 USC § 2259(c)(2)", kind := .Incorporates }

def edge_1593_incorporates_flsa : Ref :=
  { source := "18 USC § 1593(b)(3)", target := "29 USC § 201", kind := .Incorporates }

def edge_1593_incorporates_csa853 : Ref :=
  { source := "18 USC § 1593(b)(4)", target := "21 USC § 853", kind := .Incorporates }




structure Coherent1593 (c : ComplaintText) : Prop where
  enforcementMechanismExists : ReferencedSectionExists edge_1593_incorporates_3664 c
  lossDefinitionIncorporated : IncorporationHonored edge_1593_incorporates_2259 c
  generalRestitutionOverridden : OverrideTriggered edge_1593_notwithstanding_3663 c



def edge_1593A_incorporates_chapter : Ref :=
  { source := "18 USC § 1593A", target := "18 USC ch. 77", kind := .Incorporates }



structure Coherent1593A (c : ComplaintText) : Prop where
  chapterPenaltyIncorporated : IncorporationHonored edge_1593A_incorporates_chapter c



def edge_1594_incorporates_1591 : Ref :=
  { source := "18 USC § 1594(a)", target := "18 USC § 1591", kind := .Incorporates }
def edge_1594_incorporates_ch46 : Ref :=
  { source := "18 USC § 1594(e)(2)", target := "18 USC ch. 46", kind := .Incorporates }
def edge_1594_incorporates_ch224 : Ref :=
  { source := "18 USC § 1594(g)", target := "18 USC ch. 224", kind := .Incorporates }




structure Coherent1594 (c : ComplaintText) : Prop where
  targetPenaltyIncorporated : IncorporationHonored edge_1594_incorporates_1591 c
  civilForfeitureExtends : ReferencedSectionExists edge_1594_incorporates_ch46 c
  witnessProtectionExists : ReferencedSectionExists edge_1594_incorporates_ch224 c



def edge_1595_incorporates_chapter : Ref :=
  { source := "18 USC § 1595(a)", target := "18 USC ch. 77", kind := .Incorporates }
def edge_1595_incorporates_1591 : Ref :=
  { source := "18 USC § 1595(d)", target := "18 USC § 1591", kind := .Incorporates }




structure Coherent1595 (c : ComplaintText) : Prop where
  chapterViolationIncorporated : IncorporationHonored edge_1595_incorporates_chapter c
  parensPatriaeHookExists : ReferencedSectionExists edge_1595_incorporates_1591 c



def edge_1595A_incorporates_ch110 : Ref :=
  { source := "18 USC § 1595A(a)", target := "18 USC ch. 110", kind := .Incorporates }
def edge_1595A_incorporates_ch117 : Ref :=
  { source := "18 USC § 1595A(a)", target := "18 USC ch. 117", kind := .Incorporates }
def edge_1595A_incorporates_371 : Ref :=
  { source := "18 USC § 1595A(a)", target := "18 USC § 371", kind := .Incorporates }

def edge_1595A_except_frcrp : Ref :=
  { source := "18 USC § 1595A(c)(1)", target := "Fed. R. Crim. P.", kind := .ExceptAsProvided }

def edge_1595A_savings_firstAmendment : Ref :=
  { source := "18 USC § 1595A(d)", target := "U.S. Const. amend. I", kind := .Savings }




structure Coherent1595A (c : ComplaintText) : Prop where
  enjoinableScopeExists : ReferencedSectionExists edge_1595A_incorporates_ch110 c
  discoveryExceptionApplies : ExceptionApplies edge_1595A_except_frcrp c
  firstAmendmentPreserved : SavingsClausePreserved edge_1595A_savings_firstAmendment c



def edge_1596_incorporates_1591 : Ref :=
  { source := "18 USC § 1596(a)", target := "18 USC § 1591", kind := .Incorporates }

def edge_1596_incorporates_ina101 : Ref :=
  { source := "18 USC § 1596(a)(1)", target := "8 USC § 1101", kind := .Incorporates }

def edge_1596_except_agapproval : Ref :=
  { source := "18 USC § 1596(b)", target := "18 USC § 1596(b)", kind := .ExceptAsProvided }




structure Coherent1596 (c : ComplaintText) : Prop where
  offenseSectionsExist : ReferencedSectionExists edge_1596_incorporates_1591 c
  inaDefinitionsIncorporated : IncorporationHonored edge_1596_incorporates_ina101 c
  foreignProsecutionExceptionApplies : ExceptionApplies edge_1596_except_agapproval c



def edge_1597_incorporates_1351 : Ref :=
  { source := "18 USC § 1597(a)(1)", target := "18 USC § 1351", kind := .Incorporates }

def edge_1597_incorporates_ina274 : Ref :=
  { source := "18 USC § 1597(a)(1)", target := "8 USC § 1324", kind := .Incorporates }



structure Coherent1597 (c : ComplaintText) : Prop where
  fraudPredicateExists : ReferencedSectionExists edge_1597_incorporates_1351 c
  smugglingPredicateIncorporated : IncorporationHonored edge_1597_incorporates_ina274 c

end Proving.USC.T18.Ch77TailCompletion.Structure
