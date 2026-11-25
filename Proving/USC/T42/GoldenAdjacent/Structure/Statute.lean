






















import Proving.USC.T42.GoldenAdjacent.Structure.Predicates

namespace Proving.USC.T42.GoldenAdjacent.Structure

open Proving.USC.Common





def edge_1988a_incorporates_rs : Ref :=
  { source := "42 USC § 1988(a)", target := "R.S. titles 13, 24, 70", kind := .Incorporates }
def edge_1988a_savings_stateLaw : Ref :=
  { source := "42 USC § 1988(a)", target := "common law as modified by State law", kind := .Savings }


def edge_1988b_target_1981 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1981", kind := .Incorporates }
def edge_1988b_target_1981a : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1981a", kind := .Incorporates }
def edge_1988b_target_1982 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1982", kind := .Incorporates }
def edge_1988b_target_1983 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1983", kind := .Incorporates }
def edge_1988b_target_1985 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1985", kind := .Incorporates }
def edge_1988b_target_1986 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1986", kind := .Incorporates }
def edge_1988b_target_titleIX : Ref :=
  { source := "42 USC § 1988(b)", target := "20 USC § 1681 et seq.", kind := .Incorporates }
def edge_1988b_target_rfra : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 2000bb et seq.", kind := .Incorporates }
def edge_1988b_target_rluipa : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 2000cc et seq.", kind := .Incorporates }
def edge_1988b_target_titleVI : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 2000d et seq.", kind := .Incorporates }
def edge_1988b_target_34_12361 : Ref :=
  { source := "42 USC § 1988(b)", target := "34 USC § 12361", kind := .Incorporates }


def edge_1988b_except_judicialOfficer : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1988(b) (judicial-officer proviso)", kind := .ExceptAsProvided }


def edge_1988c_subjectTo_1988b : Ref :=
  { source := "42 USC § 1988(c)", target := "42 USC § 1988(b)", kind := .SubjectTo }
def edge_1988c_target_1981 : Ref :=
  { source := "42 USC § 1988(c)", target := "42 USC § 1981", kind := .Incorporates }
def edge_1988c_target_1981a : Ref :=
  { source := "42 USC § 1988(c)", target := "42 USC § 1981a", kind := .Incorporates }


def edge_1982_enforcedBy_1988b : Ref :=
  { source := "42 USC § 1982", target := "42 USC § 1988(b)", kind := .Incorporates }






structure Coherent1982 (c : ComplaintText) : Prop where
  enforceHookExists : ReferencedSectionExists edge_1982_enforcedBy_1988b c



structure Coherent1988a (c : ComplaintText) : Prop where
  jurisdictionHonored : IncorporationHonored edge_1988a_incorporates_rs c
  savingsExists       : ReferencedSectionExists edge_1988a_savings_stateLaw c




structure Coherent1988b (c : ComplaintText) : Prop where
  targetEnumerated  : EnforcementTargetEnumerated edge_1988b_target_1983 c
  targetExists      : ReferencedSectionExists edge_1988b_target_1983 c
  exceptionHonored  : ExceptionApplies edge_1988b_except_judicialOfficer c



structure Coherent1988c (c : ComplaintText) : Prop where
  ridesOnSubB    : IncorporationHonored edge_1988c_subjectTo_1988b c
  targetExists   : ReferencedSectionExists edge_1988c_target_1981 c





inductive Section1988bReach (c : ComplaintText) : Prop where
  | viaCivilRights (h : ReferencedSectionExists edge_1988b_target_1983 c) : Section1988bReach c
  | viaTitleIX     (h : ReferencedSectionExists edge_1988b_target_titleIX c) : Section1988bReach c
  | viaTitleVI     (h : ReferencedSectionExists edge_1988b_target_titleVI c) : Section1988bReach c
  | viaRFRA        (h : ReferencedSectionExists edge_1988b_target_rfra c) : Section1988bReach c

end Proving.USC.T42.GoldenAdjacent.Structure
