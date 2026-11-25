











import Proving.USC.Common.Types
import Proving.USC.T18.Ch2.Structure.Types
import Proving.USC.T18.Ch2.Structure.Predicates

namespace Proving.USC.T18.Ch2.Structure

open Proving.USC.Common





def edge_31b_inc_49_40102 : Ref :=
  { source := "18 USC § 31(b)", target := "49 USC § 40102(a)", kind := .Incorporates }


def edge_31b_inc_49_46501 : Ref :=
  { source := "18 USC § 31(b)", target := "49 USC § 46501", kind := .Incorporates }

structure Coherent31 (c : ComplaintText) : Prop where
  t49_40102Exists : ReferencedSectionExists edge_31b_inc_49_40102 c
  t49_46501Exists : ReferencedSectionExists edge_31b_inc_49_46501 c





def edge_32_inc_31 : Ref :=
  { source := "18 USC § 32", target := "18 USC § 31", kind := .Incorporates }

structure Coherent32 (c : ComplaintText) : Prop where
  defs31Honored : IncorporationHonored edge_32_inc_31 c




def edge_33_inc_31 : Ref :=
  { source := "18 USC § 33", target := "18 USC § 31", kind := .Incorporates }

def edge_33b_inc_42_10101_12 : Ref :=
  { source := "18 USC § 33(b)", target := "42 USC § 10101(12)", kind := .Incorporates }

def edge_33b_inc_42_10101_23 : Ref :=
  { source := "18 USC § 33(b)", target := "42 USC § 10101(23)", kind := .Incorporates }

structure Coherent33 (c : ComplaintText) : Prop where
  defs31Honored    : IncorporationHonored edge_33_inc_31 c
  hlrwExists       : ReferencedSectionExists edge_33b_inc_42_10101_12 c
  spentFuelExists  : ReferencedSectionExists edge_33b_inc_42_10101_23 c





def edge_34_inc_ch2 : Ref :=
  { source := "18 USC § 34", target := "18 USC ch. 2", kind := .Incorporates }

structure Coherent34 (c : ComplaintText) : Prop where
  chapterOffensesExist : ReferencedSectionExists edge_34_inc_ch2 c




def edge_35_inc_ch2 : Ref :=
  { source := "18 USC § 35", target := "18 USC ch. 2", kind := .Incorporates }

def edge_35_inc_ch97 : Ref :=
  { source := "18 USC § 35", target := "18 USC ch. 97", kind := .Incorporates }

def edge_35_inc_ch111 : Ref :=
  { source := "18 USC § 35", target := "18 USC ch. 111", kind := .Incorporates }

structure Coherent35 (c : ComplaintText) : Prop where
  ch2Exists   : ReferencedSectionExists edge_35_inc_ch2 c
  ch97Exists  : ReferencedSectionExists edge_35_inc_ch97 c
  ch111Exists : ReferencedSectionExists edge_35_inc_ch111 c




def edge_36_inc_21_848c : Ref :=
  { source := "18 USC § 36(a)(1)", target := "21 USC § 848(c)", kind := .Incorporates }

def edge_36_inc_21_846 : Ref :=
  { source := "18 USC § 36(a)(2)", target := "21 USC § 846", kind := .Incorporates }

def edge_36_inc_21_963 : Ref :=
  { source := "18 USC § 36(a)(2)", target := "21 USC § 963", kind := .Incorporates }

def edge_36_inc_21_841 : Ref :=
  { source := "18 USC § 36(a)(3)", target := "21 USC § 841(b)(1)(A)", kind := .Incorporates }

def edge_36_inc_21_960 : Ref :=
  { source := "18 USC § 36(a)(3)", target := "21 USC § 960(b)(1)", kind := .Incorporates }

def edge_36_inc_18_1111a : Ref :=
  { source := "18 USC § 36(b)(2)", target := "18 USC § 1111(a)", kind := .Incorporates }

structure Coherent36 (c : ComplaintText) : Prop where
  cce848Exists      : ReferencedSectionExists edge_36_inc_21_848c c
  csa846Exists      : ReferencedSectionExists edge_36_inc_21_846 c
  ieca963Exists     : ReferencedSectionExists edge_36_inc_21_963 c
  csa841Exists      : ReferencedSectionExists edge_36_inc_21_841 c
  ieca960Exists     : ReferencedSectionExists edge_36_inc_21_960 c
  murder1111Honored : IncorporationHonored edge_36_inc_18_1111a c




def edge_37_inc_18_1365 : Ref :=
  { source := "18 USC § 37(a)(1)", target := "18 USC § 1365", kind := .Incorporates }

def edge_37_inc_8_1101 : Ref :=
  { source := "18 USC § 37(b)(2)(B)", target := "8 USC § 1101(a)(22)", kind := .Incorporates }

def edge_37_inc_29_113 : Ref :=
  { source := "18 USC § 37(c)", target := "29 USC § 113(c)", kind := .Incorporates }


def edge_37c_bar_37a : Ref :=
  { source := "18 USC § 37(c)", target := "18 USC § 37(a)", kind := .ExceptAsProvided }

def edge_37_lexspec_31 : Ref :=
  { source := "18 USC § 37(c)", target := "18 USC § 31(a)(9)", kind := .LexSpecialis }

structure Coherent37 (c : ComplaintText) : Prop where
  sbi1365Honored     : IncorporationHonored edge_37_inc_18_1365 c
  national1101Exists : ReferencedSectionExists edge_37_inc_8_1101 c
  laborDispute113Exists : ReferencedSectionExists edge_37_inc_29_113 c
  laborBarApplies    : ExceptionApplies edge_37c_bar_37a c
  stateLexSpecialis  : OverrideTriggered edge_37_lexspec_31 c




def edge_38_inc_31 : Ref :=
  { source := "18 USC § 38", target := "18 USC § 31", kind := .Incorporates }

def edge_38_inc_18_1365 : Ref :=
  { source := "18 USC § 38(b)(2)", target := "18 USC § 1365", kind := .Incorporates }

def edge_38d_inc_21_853 : Ref :=
  { source := "18 USC § 38(d)(2)", target := "21 USC § 853", kind := .SubjectTo }

def edge_38d_except_21_853d : Ref :=
  { source := "18 USC § 38(d)(2)", target := "21 USC § 853(d)", kind := .ExceptAsProvided }

def edge_38e_savings : Ref :=
  { source := "18 USC § 38(e)", target := "other Federal or State law", kind := .Savings }

structure Coherent38 (c : ComplaintText) : Prop where
  defs31Honored        : IncorporationHonored edge_38_inc_31 c
  sbi1365Honored       : IncorporationHonored edge_38_inc_18_1365 c
  forfeit853Exists     : ReferencedSectionExists edge_38d_inc_21_853 c
  forfeit853dExcluded  : ExceptionApplies edge_38d_except_21_853d c
  savingsPreservesLaw  : ExceptionApplies edge_38e_savings c








def edge_39A_inc_31 : Ref :=
  { source := "18 USC § 39A(a)", target := "18 USC § 31", kind := .Incorporates }


def edge_39Ac_except_39Aa : Ref :=
  { source := "18 USC § 39A(c)", target := "18 USC § 39A(a)", kind := .ExceptAsProvided }

structure Coherent39A (c : ComplaintText) : Prop where
  juris31Honored  : IncorporationHonored edge_39A_inc_31 c
  exceptionsApply : ExceptionApplies edge_39Ac_except_39Aa c





def edge_39B_inc_31 : Ref :=
  { source := "18 USC § 39B(a)", target := "18 USC § 31", kind := .Incorporates }

def edge_39B_inc_14cfr71 : Ref :=
  { source := "18 USC § 39B(b)(2)", target := "14 CFR pt. 71", kind := .Incorporates }


def edge_39Bc1_except_39Bc2 : Ref :=
  { source := "18 USC § 39B(c)(1)", target := "18 USC § 39B(c)(2)", kind := .ExceptAsProvided }




inductive Coherent39B (c : ComplaintText) : Prop
  | base
      (juris31Honored  : IncorporationHonored edge_39B_inc_31 c)
      (airspace71Exists : ReferencedSectionExists edge_39B_inc_14cfr71 c)
  | enhanced
      (juris31Honored  : IncorporationHonored edge_39B_inc_31 c)
      (airspace71Exists : ReferencedSectionExists edge_39B_inc_14cfr71 c)
      (override        : OverrideTriggered edge_39Bc1_except_39Bc2 c)





def edge_40_inc_49_31132 : Ref :=
  { source := "18 USC § 40(a)", target := "49 USC § 31132", kind := .Incorporates }

structure Coherent40 (c : ComplaintText) : Prop where
  cmv31132Exists : ReferencedSectionExists edge_40_inc_49_31132 c





def edge_40Aa_except_40Ab : Ref :=
  { source := "18 USC § 40A(a)", target := "18 USC § 40A(b)", kind := .ExceptAsProvided }

def edge_40A_inc_49_44801 : Ref :=
  { source := "18 USC § 40A(c)(1)", target := "49 USC § 44801", kind := .Incorporates }

def edge_40A_inc_42_1856m : Ref :=
  { source := "18 USC § 40A(c)(2)", target := "42 USC § 1856m", kind := .Incorporates }

structure Coherent40A (c : ComplaintText) : Prop where
  govExceptionApplies  : ExceptionApplies edge_40Aa_except_40Ab c
  unmanned44801Exists  : ReferencedSectionExists edge_40A_inc_49_44801 c
  wildfire1856mExists  : ReferencedSectionExists edge_40A_inc_42_1856m c

end Proving.USC.T18.Ch2.Structure
