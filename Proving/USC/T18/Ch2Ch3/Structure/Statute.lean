import Proving.USC.T18.Ch2Ch3.Structure.Types
import Proving.USC.T18.Ch2Ch3.Structure.Predicates
import Proving.USC.Common.Types
set_option autoImplicit false
open Proving.USC.Common

namespace Proving.USC.T18.Ch2Ch3.Structure








def edge_32_incorporates_ina101 : Ref :=
  { source := "18 USC § 32", target := "8 USC § 1101(a)(22)", kind := .Incorporates }
def edge_32_incorporates_3571 : Ref :=
  { source := "18 USC § 32", target := "18 USC § 3571", kind := .Incorporates }


def edge_36_incorporates_csa848c : Ref :=
  { source := "18 USC § 36", target := "21 USC § 848(c)", kind := .Incorporates }
def edge_36_incorporates_csa846 : Ref :=
  { source := "18 USC § 36", target := "21 USC § 846", kind := .Incorporates }
def edge_36_incorporates_csiea963 : Ref :=
  { source := "18 USC § 36", target := "21 USC § 963", kind := .Incorporates }
def edge_36_incorporates_csa841 : Ref :=
  { source := "18 USC § 36", target := "21 USC § 841(b)(1)(A)", kind := .Incorporates }
def edge_36_incorporates_csiea960 : Ref :=
  { source := "18 USC § 36", target := "21 USC § 960(b)(1)", kind := .Incorporates }
def edge_36_incorporates_1111a : Ref :=
  { source := "18 USC § 36", target := "18 USC § 1111(a)", kind := .Incorporates }
def edge_36_incorporates_3571 : Ref :=
  { source := "18 USC § 36", target := "18 USC § 3571", kind := .Incorporates }


def edge_37_incorporates_1365 : Ref :=
  { source := "18 USC § 37", target := "18 USC § 1365", kind := .Incorporates }
def edge_37_incorporates_ina101 : Ref :=
  { source := "18 USC § 37", target := "8 USC § 1101(a)(22)", kind := .Incorporates }
def edge_37_incorporates_norris113c : Ref :=
  { source := "18 USC § 37", target := "29 USC § 113(c)", kind := .Incorporates }
def edge_37_incorporates_3571 : Ref :=
  { source := "18 USC § 37", target := "18 USC § 3571", kind := .Incorporates }


def edge_38_incorporates_1365 : Ref :=
  { source := "18 USC § 38", target := "18 USC § 1365", kind := .Incorporates }
def edge_38_subjectTo_853 : Ref :=
  { source := "18 USC § 38", target := "21 USC § 853", kind := .SubjectTo }
def edge_38_savings_otherlaw : Ref :=
  { source := "18 USC § 38", target := "other Federal or State remedy", kind := .Savings }
def edge_38_incorporates_3571 : Ref :=
  { source := "18 USC § 38", target := "18 USC § 3571", kind := .Incorporates }


def edge_39b_incorporates_cfr71 : Ref :=
  { source := "18 USC § 39B", target := "14 CFR pt. 71", kind := .Incorporates }
def edge_39b_except_c2 : Ref :=
  { source := "18 USC § 39B(c)(1)", target := "18 USC § 39B(c)(2)", kind := .ExceptAsProvided }
def edge_39b_incorporates_3571 : Ref :=
  { source := "18 USC § 39B", target := "18 USC § 3571", kind := .Incorporates }


def edge_40a_incorporates_t49_44801 : Ref :=
  { source := "18 USC § 40A", target := "49 USC § 44801", kind := .Incorporates }
def edge_40a_incorporates_t42_1856m : Ref :=
  { source := "18 USC § 40A", target := "42 USC § 1856m", kind := .Incorporates }
def edge_40a_except_b : Ref :=
  { source := "18 USC § 40A(a)", target := "18 USC § 40A(b)", kind := .ExceptAsProvided }
def edge_40a_incorporates_3571 : Ref :=
  { source := "18 USC § 40A", target := "18 USC § 3571", kind := .Incorporates }


def edge_42_savings_phsa : Ref :=
  { source := "18 USC § 42", target := "Public Health Service Act", kind := .Savings }
def edge_42_savings_fdca : Ref :=
  { source := "18 USC § 42", target := "Federal Food, Drug, and Cosmetic Act", kind := .Savings }
def edge_42_savings_fppa : Ref :=
  { source := "18 USC § 42", target := "Federal Plant Pest Act", kind := .Savings }
def edge_42_notwithstanding_a1 : Ref :=
  { source := "18 USC § 42(a)(3)", target := "18 USC § 42(a)(1)", kind := .Notwithstanding }
def edge_42_incorporates_3571 : Ref :=
  { source := "18 USC § 42", target := "18 USC § 3571", kind := .Incorporates }


def edge_43_incorporates_115 : Ref :=
  { source := "18 USC § 43", target := "18 USC § 115", kind := .Incorporates }
def edge_43_subjectTo_3663 : Ref :=
  { source := "18 USC § 43", target := "18 USC § 3663", kind := .SubjectTo }
def edge_43_subjectTo_3663a : Ref :=
  { source := "18 USC § 43", target := "18 USC § 3663A", kind := .SubjectTo }
def edge_43_savings_firstAmendment : Ref :=
  { source := "18 USC § 43", target := "U.S. Const. amend. I", kind := .Savings }
def edge_43_savings_remedies : Ref :=
  { source := "18 USC § 43", target := "existing legal remedies", kind := .Savings }
def edge_43_savings_statelaw : Ref :=
  { source := "18 USC § 43", target := "State or local law", kind := .Savings }
def edge_43_incorporates_3571 : Ref :=
  { source := "18 USC § 43", target := "18 USC § 3571", kind := .Incorporates }














structure Coherent32 (c : ComplaintText) : Prop where
  inaExists       : ReferencedSectionExists edge_32_incorporates_ina101 c
  inaIncorporated : IncorporationHonored edge_32_incorporates_ina101 c
  finesExist      : ReferencedSectionExists edge_32_incorporates_3571 c

structure Coherent36 (c : ComplaintText) : Prop where
  csa848cInc  : IncorporationHonored edge_36_incorporates_csa848c c
  csa846Inc   : IncorporationHonored edge_36_incorporates_csa846 c
  csiea963Inc : IncorporationHonored edge_36_incorporates_csiea963 c
  csa841Inc   : IncorporationHonored edge_36_incorporates_csa841 c
  csiea960Inc : IncorporationHonored edge_36_incorporates_csiea960 c
  murderInc   : IncorporationHonored edge_36_incorporates_1111a c
  finesExist  : ReferencedSectionExists edge_36_incorporates_3571 c

structure Coherent37 (c : ComplaintText) : Prop where
  sbiInc          : IncorporationHonored edge_37_incorporates_1365 c
  inaInc          : IncorporationHonored edge_37_incorporates_ina101 c
  laborDisputeInc : IncorporationHonored edge_37_incorporates_norris113c c
  finesExist      : ReferencedSectionExists edge_37_incorporates_3571 c

structure Coherent38 (c : ComplaintText) : Prop where
  sbiInc           : IncorporationHonored edge_38_incorporates_1365 c
  forfeitureGovern : ReferencedSectionExists edge_38_subjectTo_853 c
  savingsPreserved : SavingsPreserved edge_38_savings_otherlaw c
  finesExist       : ReferencedSectionExists edge_38_incorporates_3571 c

structure Coherent39B (c : ComplaintText) : Prop where
  cfrInc          : IncorporationHonored edge_39b_incorporates_cfr71 c
  exceptionHonored : ExceptionApplies edge_39b_except_c2 c
  finesExist      : ReferencedSectionExists edge_39b_incorporates_3571 c

structure Coherent40A (c : ComplaintText) : Prop where
  unmannedInc      : IncorporationHonored edge_40a_incorporates_t49_44801 c
  wildfireInc      : IncorporationHonored edge_40a_incorporates_t42_1856m c
  govExceptHonored : ExceptionApplies edge_40a_except_b c
  finesExist       : ReferencedSectionExists edge_40a_incorporates_3571 c

structure Coherent42 (c : ComplaintText) : Prop where
  phsaSavings       : SavingsPreserved edge_42_savings_phsa c
  fdcaSavings       : SavingsPreserved edge_42_savings_fdca c
  plantPestSavings  : SavingsPreserved edge_42_savings_fppa c
  permitOverrides   : OverrideTriggered edge_42_notwithstanding_a1 c
  finesExist        : ReferencedSectionExists edge_42_incorporates_3571 c

structure Coherent43 (c : ComplaintText) : Prop where
  familyInc            : IncorporationHonored edge_43_incorporates_115 c
  restitution3663      : ReferencedSectionExists edge_43_subjectTo_3663 c
  restitution3663A     : ReferencedSectionExists edge_43_subjectTo_3663a c
  firstAmendmentSaving : SavingsPreserved edge_43_savings_firstAmendment c
  remediesSaving       : SavingsPreserved edge_43_savings_remedies c
  stateLawSaving       : SavingsPreserved edge_43_savings_statelaw c
  finesExist           : ReferencedSectionExists edge_43_incorporates_3571 c

end Proving.USC.T18.Ch2Ch3.Structure
