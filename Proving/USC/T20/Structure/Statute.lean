import Proving.USC.T20.Structure.Types
import Proving.USC.T20.Structure.Predicates
import Proving.USC.Common.Types






namespace Proving.USC.T20.Structure
open Proving.USC.Common





def edge_1681a_incorporates_1681c : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(c)", kind := .Incorporates }



def edge_1681a_incorporates_1687 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1687", kind := .Incorporates }



def edge_1681a6A_incorporates_26s501a : Ref :=
  { source := "20 USC § 1681(a)(6)(A)", target := "26 USC § 501(a)", kind := .Incorporates }



def edge_1681a_except_1 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(1)", kind := .ExceptAsProvided }
def edge_1681a_except_2 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(2)", kind := .ExceptAsProvided }
def edge_1681a_except_3 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(3)", kind := .ExceptAsProvided }
def edge_1681a_except_4 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(4)", kind := .ExceptAsProvided }
def edge_1681a_except_5 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(5)", kind := .ExceptAsProvided }
def edge_1681a_except_6 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(6)", kind := .ExceptAsProvided }
def edge_1681a_except_7 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(7)", kind := .ExceptAsProvided }
def edge_1681a_except_8 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(8)", kind := .ExceptAsProvided }
def edge_1681a_except_9 : Ref :=
  { source := "20 USC § 1681(a)", target := "20 USC § 1681(a)(9)", kind := .ExceptAsProvided }


def exceptions_1681a : List Ref :=
  [edge_1681a_except_1, edge_1681a_except_2, edge_1681a_except_3,
   edge_1681a_except_4, edge_1681a_except_5, edge_1681a_except_6,
   edge_1681a_except_7, edge_1681a_except_8, edge_1681a_except_9]




def edge_1681b_savings_1681a : Ref :=
  { source := "20 USC § 1681(b)", target := "20 USC § 1681(a)", kind := .Savings }





def edge_1682_incorporates_1681 : Ref :=
  { source := "20 USC § 1682", target := "20 USC § 1681", kind := .Incorporates }




def edge_1682_savings_otherLaw : Ref :=
  { source := "20 USC § 1682", target := "other means authorized by law (unspecified)", kind := .Savings }





def edge_1683_incorporates_1682 : Ref :=
  { source := "20 USC § 1683", target := "20 USC § 1682", kind := .Incorporates }



def edge_1683_incorporates_5ch7 : Ref :=
  { source := "20 USC § 1683", target := "5 USC ch. 7", kind := .Incorporates }





def edge_1683_notwithstanding_5s701 : Ref :=
  { source := "20 USC § 1683", target := "5 USC § 701", kind := .Notwithstanding }




def edge_1683_savings_otherReview : Ref :=
  { source := "20 USC § 1683", target := "judicial review otherwise provided by law (unspecified)", kind := .Savings }






structure Coherent1681 (c : ComplaintText) : Prop where
  defnEducationalInstitution : IncorporationHonored edge_1681a_incorporates_1681c c
  defnProgramOrActivity      : ReferencedSectionExists edge_1681a_incorporates_1687 c
  taxExemptTargetExists      : ReferencedSectionExists edge_1681a6A_incorporates_26s501a c
  exceptionsResolvable       : ∀ r ∈ exceptions_1681a, ReferencedSectionExists r c
  noQuotaConstruction        : SavingsPreserved edge_1681b_savings_1681a c




structure Coherent1682 (c : ComplaintText) : Prop where
  substantiveRuleExists : ReferencedSectionExists edge_1682_incorporates_1681 c
  effectuates1681       : IncorporationHonored edge_1682_incorporates_1681 c
  otherMeansPreserved   : SavingsPreserved edge_1682_savings_otherLaw c




structure Coherent1683 (c : ComplaintText) : Prop where
  enforcementActionRef       : IncorporationHonored edge_1683_incorporates_1682 c
  apaChapterExists           : ReferencedSectionExists edge_1683_incorporates_5ch7 c
  unreviewabilityOverridden  : OverrideTriggered edge_1683_notwithstanding_5s701 c
  otherReviewPreserved       : SavingsPreserved edge_1683_savings_otherReview c




inductive ReviewPath1683 (c : ComplaintText) : Prop
  | otherwiseProvided
      (hSav : SavingsPreserved edge_1683_savings_otherReview c) :
      ReviewPath1683 c
  | apaDefault
      (hCh7 : ReferencedSectionExists edge_1683_incorporates_5ch7 c)
      (hOvr : OverrideTriggered edge_1683_notwithstanding_5s701 c) :
      ReviewPath1683 c




inductive Applicability1681a (c : ComplaintText) : Prop
  | governed
      (hNone : ∀ r ∈ exceptions_1681a, ¬ ExceptionApplies r c) :
      Applicability1681a c
  | exempted
      (r : Ref) (hMem : r ∈ exceptions_1681a)
      (hApp : ExceptionApplies r c) :
      Applicability1681a c

end Proving.USC.T20.Structure
