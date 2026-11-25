











import Proving.USC.T42.TitleVIIEnf.Structure.Types
import Proving.USC.T42.TitleVIIEnf.Structure.Predicates

namespace Proving.USC.T42.TitleVIIEnf.Structure

open Proving.USC.Common





def edge_2000e4_incorporates_2000e5 : Ref :=
  { source := "42 USC § 2000e-4(b)(1)", target := "42 USC § 2000e-5", kind := .Incorporates }
def edge_2000e4_incorporates_2000e6 : Ref :=
  { source := "42 USC § 2000e-4(b)(1)", target := "42 USC § 2000e-6", kind := .Incorporates }


def edge_2000e4g_incorporates_2000e5 : Ref :=
  { source := "42 USC § 2000e-4(g)(6)", target := "42 USC § 2000e-5", kind := .Incorporates }

def edge_2000e4_exceptAsProvided_2000e4b : Ref :=
  { source := "42 USC § 2000e-4(a)", target := "42 USC § 2000e-4(b)", kind := .ExceptAsProvided }


def edge_2000e4_notwithstanding_t5s7324 : Ref :=
  { source := "42 USC § 2000e-4(i)", target := "5 USC § 7324", kind := .Notwithstanding }





def edge_2000e5_incorporates_2000e2 : Ref :=
  { source := "42 USC § 2000e-5(a)", target := "42 USC § 2000e-2", kind := .Incorporates }
def edge_2000e5_incorporates_2000e3 : Ref :=
  { source := "42 USC § 2000e-5(a)", target := "42 USC § 2000e-3", kind := .Incorporates }

def edge_2000e5g_incorporates_2000e2m : Ref :=
  { source := "42 USC § 2000e-5(g)(2)(B)", target := "42 USC § 2000e-2(m)", kind := .Incorporates }


def edge_2000e5g_incorporates_1981a : Ref :=
  { source := "42 USC § 2000e-5(g)(2)(B)", target := "42 USC § 1981a", kind := .Incorporates }


def edge_2000e5_notwithstanding_t29ch6 : Ref :=
  { source := "42 USC § 2000e-5(h)", target := "29 USC ch. 6", kind := .Notwithstanding }





def edge_2000e6_incorporates_2000e5 : Ref :=
  { source := "42 USC § 2000e-6(e)", target := "42 USC § 2000e-5", kind := .Incorporates }


def edge_2000e6_subjectTo_t5ch9 : Ref :=
  { source := "42 USC § 2000e-6(c)", target := "5 USC ch. 9", kind := .SubjectTo }





def edge_2000e8_incorporates_2000e5 : Ref :=
  { source := "42 USC § 2000e-8(a)", target := "42 USC § 2000e-5", kind := .Incorporates }


def edge_2000e8_notwithstanding_otherLaw : Ref :=
  { source := "42 USC § 2000e-8(b)", target := "any other provision of law", kind := .Notwithstanding }





def edge_2000e9_incorporates_t29s161 : Ref :=
  { source := "42 USC § 2000e-9", target := "29 USC § 161", kind := .Incorporates }





def edge_2000e12_subjectTo_t5apa : Ref :=
  { source := "42 USC § 2000e-12(a)", target := "5 USC ch. 5, subch. II", kind := .SubjectTo }



def edge_2000e12_savings_reliance : Ref :=
  { source := "42 USC § 2000e-12(b)", target := "42 USC § 2000e-12(b) reliance defense", kind := .Savings }





def edge_2000e16_incorporates_2000e5 : Ref :=
  { source := "42 USC § 2000e-16(c)", target := "42 USC § 2000e-5", kind := .Incorporates }


def edge_2000e16_incorporates_2000e5fk : Ref :=
  { source := "42 USC § 2000e-16(d)", target := "42 USC § 2000e-5(f)-(k)", kind := .Incorporates }


def edge_2000e16_incorporates_2000e5e3 : Ref :=
  { source := "42 USC § 2000e-16(f)", target := "42 USC § 2000e-5(e)(3)", kind := .Incorporates }


def edge_2000e16_exceptAsProvided_self : Ref :=
  { source := "42 USC § 2000e-16(b)", target := "42 USC § 2000e-16(b)", kind := .ExceptAsProvided }



def edge_2000e16_savings_constitution : Ref :=
  { source := "42 USC § 2000e-16(e)", target := "constitutional/statutory nondiscrimination duty", kind := .Savings }






structure Coherent2000e4 (c : ComplaintText) : Prop where
  litExists      : ReferencedSectionExists edge_2000e4_incorporates_2000e5 c
  litHonored     : IncorporationHonored edge_2000e4_incorporates_2000e5 c
  agHonored      : IncorporationHonored edge_2000e4_incorporates_2000e6 c
  intervHonored  : IncorporationHonored edge_2000e4g_incorporates_2000e5 c
  gcException     : ExceptionApplies edge_2000e4_exceptAsProvided_2000e4b c
  hatchOverride   : OverrideTriggered edge_2000e4_notwithstanding_t5s7324 c




structure Coherent2000e5 (c : ComplaintText) : Prop where
  uep2Exists    : ReferencedSectionExists edge_2000e5_incorporates_2000e2 c
  uep2Honored   : IncorporationHonored edge_2000e5_incorporates_2000e2 c
  uep3Honored   : IncorporationHonored edge_2000e5_incorporates_2000e3 c
  mixedMotive   : IncorporationHonored edge_2000e5g_incorporates_2000e2m c
  damagesRelief : IncorporationHonored edge_2000e5g_incorporates_1981a c
  norrisOverride : OverrideTriggered edge_2000e5_notwithstanding_t29ch6 c




structure Coherent2000e6 (c : ComplaintText) : Prop where
  procExists   : ReferencedSectionExists edge_2000e6_incorporates_2000e5 c
  procHonored  : IncorporationHonored edge_2000e6_incorporates_2000e5 c
  reorgConstraint : ConstraintSatisfied edge_2000e6_subjectTo_t5ch9 c




structure Coherent2000e8 (c : ComplaintText) : Prop where
  chargeExists  : ReferencedSectionExists edge_2000e8_incorporates_2000e5 c
  chargeHonored : IncorporationHonored edge_2000e8_incorporates_2000e5 c
  payOverride   : OverrideTriggered edge_2000e8_notwithstanding_otherLaw c



structure Coherent2000e9 (c : ComplaintText) : Prop where
  nlraExists  : ReferencedSectionExists edge_2000e9_incorporates_t29s161 c
  nlraHonored : IncorporationHonored edge_2000e9_incorporates_t29s161 c



structure Coherent2000e12 (c : ComplaintText) : Prop where
  apaExists     : ReferencedSectionExists edge_2000e12_subjectTo_t5apa c
  apaConstraint : ConstraintSatisfied edge_2000e12_subjectTo_t5apa c
  relianceSavings : SavingsHonored edge_2000e12_savings_reliance c





structure Coherent2000e16 (c : ComplaintText) : Prop where
  remedyExists   : ReferencedSectionExists edge_2000e16_incorporates_2000e5 c
  remedyHonored  : IncorporationHonored edge_2000e16_incorporates_2000e5 c
  fkHonored      : IncorporationHonored edge_2000e16_incorporates_2000e5fk c
  e3Honored      : IncorporationHonored edge_2000e16_incorporates_2000e5e3 c
  authException  : ExceptionApplies edge_2000e16_exceptAsProvided_self c
  dutySavings    : SavingsHonored edge_2000e16_savings_constitution c






inductive EnforcementAuthorityResolved (c : ComplaintText) : Prop where

  | byAttorneyGeneral (h : IncorporationHonored edge_2000e6_incorporates_2000e5 c)
      : EnforcementAuthorityResolved c


  | byCommission (h : IncorporationHonored edge_2000e6_incorporates_2000e5 c)
      (hc : ConstraintSatisfied edge_2000e6_subjectTo_t5ch9 c)
      : EnforcementAuthorityResolved c

end Proving.USC.T42.TitleVIIEnf.Structure
