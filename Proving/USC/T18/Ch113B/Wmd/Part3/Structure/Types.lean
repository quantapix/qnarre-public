








import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Structure

open Proving.USC.Common


inductive EdgeKind where

  | Incorporates

  | SubjectTo

  | Notwithstanding

  | ExceptAsProvided

  | Savings

  | LexSpecialis
  deriving DecidableEq, Repr





structure Ref where
  source : String
  target : String
  kind   : EdgeKind
  deriving DecidableEq, Repr


def edge (src tgt : String) (k : EdgeKind) : Ref :=
  { source := src, target := tgt, kind := k }







def e2332a_ab_defs_c : Ref :=
  edge "18 USC § 2332a(a)-(b)" "18 USC § 2332a(c)" .Incorporates



def e2332a_c1_ina : Ref :=
  edge "18 USC § 2332a(c)(1)" "8 USC § 1101(a)(22)" .Incorporates


def e2332a_c2A_s921 : Ref :=
  edge "18 USC § 2332a(c)(2)(A)" "18 USC § 921" .Incorporates



def e2332a_c2C_s178 : Ref :=
  edge "18 USC § 2332a(c)(2)(C)" "18 USC § 178" .Incorporates




def e2332a_a_lawfulAuthority : Ref :=
  edge "18 USC § 2332a(a)" "other law conferring lawful authority (unspecified)" .ExceptAsProvided



def e2332a_b_lawfulAuthority : Ref :=
  edge "18 USC § 2332a(b)" "other law conferring lawful authority (unspecified)" .ExceptAsProvided


def edges2332a : List Ref :=
  [e2332a_ab_defs_c, e2332a_c1_ina, e2332a_c2A_s921, e2332a_c2C_s178,
   e2332a_a_lawfulAuthority, e2332a_b_lawfulAuthority]






def e2332b_a1_circ_b : Ref :=
  edge "18 USC § 2332b(a)(1)" "18 USC § 2332b(b)" .Incorporates



def e2332b_a1_stateLaw : Ref :=
  edge "18 USC § 2332b(a)(1)" "laws of any State, or of the United States (unspecified)" .Incorporates



def e2332b_a1_subjectTo_d2 : Ref :=
  edge "18 USC § 2332b(a)(1)" "18 USC § 2332b(d)(2)" .SubjectTo


def e2332b_a1_penalty_c : Ref :=
  edge "18 USC § 2332b(a)(1)" "18 USC § 2332b(c)" .Incorporates


def e2332b_a2_penalty_c : Ref :=
  edge "18 USC § 2332b(a)(2)" "18 USC § 2332b(c)" .Incorporates



def e2332b_a2_offense_a1 : Ref :=
  edge "18 USC § 2332b(a)(2)" "18 USC § 2332b(a)(1)" .Incorporates




def e2332b_b2_circ_b1 : Ref :=
  edge "18 USC § 2332b(b)(2)" "18 USC § 2332b(b)(1)(A)-(F)" .Incorporates



def e2332b_a1_b1A : Ref :=
  edge "18 USC § 2332b(a)(1)" "18 USC § 2332b(b)(1)(A)" .Incorporates



def e2332b_a1_b1B : Ref :=
  edge "18 USC § 2332b(a)(1)" "18 USC § 2332b(b)(1)(B)" .Incorporates



def e2332b_a1_b1C : Ref :=
  edge "18 USC § 2332b(a)(1)" "18 USC § 2332b(b)(1)(C)" .Incorporates



def e2332b_a1_b1D : Ref :=
  edge "18 USC § 2332b(a)(1)" "18 USC § 2332b(b)(1)(D)" .Incorporates


def e2332b_a1_b1E : Ref :=
  edge "18 USC § 2332b(a)(1)" "18 USC § 2332b(b)(1)(E)" .Incorporates



def e2332b_a1_b1F : Ref :=
  edge "18 USC § 2332b(a)(1)" "18 USC § 2332b(b)(1)(F)" .Incorporates




def e2332b_b1_subjectTo_d1 : Ref :=
  edge "18 USC § 2332b(b)(1)" "18 USC § 2332b(d)(1)" .SubjectTo



def e2332b_c2_notwithstanding : Ref :=
  edge "18 USC § 2332b(c)(2)" "any other provision of law (unenumerated)" .Notwithstanding



def e2332b_d2_lexSpecialis : Ref :=
  edge "18 USC § 2332b(d)(2)" "laws of any State (as adopted by § 2332b(a)(1))" .LexSpecialis



def e2332b_e1_extraterritorial_a : Ref :=
  edge "18 USC § 2332b(e)(1)" "18 USC § 2332b(a)" .Incorporates



def e2332b_e2_accessory_s3 : Ref :=
  edge "18 USC § 2332b(e)(2)" "18 USC § 3" .Incorporates



def e2332b_f_savings_s3056 : Ref :=
  edge "18 USC § 2332b(f)" "18 USC § 3056" .Savings



def e2332b_g2_s1958b2 : Ref :=
  edge "18 USC § 2332b(g)(2)" "18 USC § 1958(b)(2)" .Incorporates






def e2332b_g3_s1365g3 : Ref :=
  edge "18 USC § 2332b(g)(3)" "18 USC § 1365(g)(3)" .Incorporates



def agInvestigativeCites : List String :=
  ["18 USC § 351(e)", "18 USC § 844(e)", "18 USC § 844(f)(1)", "18 USC § 956(b)",
   "18 USC § 1361", "18 USC § 1366(b)", "18 USC § 1366(c)", "18 USC § 1751(e)",
   "18 USC § 2152", "18 USC § 2156"]


def agInvestigativeTargets : List Ref :=
  agInvestigativeCites.map (fun t => edge "18 USC § 2332b(f)" t .Incorporates)








def fctTitle18Cites : List String :=
  ["18 USC § 32", "18 USC § 37", "18 USC § 81", "18 USC § 175", "18 USC § 175b",
   "18 USC § 175c", "18 USC § 229", "18 USC § 351(a)", "18 USC § 351(b)",
   "18 USC § 351(c)", "18 USC § 351(d)", "18 USC § 831", "18 USC § 832",
   "18 USC § 842(m)", "18 USC § 842(n)", "18 USC § 844(f)(2)", "18 USC § 844(f)(3)",
   "18 USC § 844(i)", "18 USC § 930(c)", "18 USC § 956(a)(1)", "18 USC § 1030(a)(1)",
   "18 USC § 1030(a)(5)(A)", "18 USC § 1030(c)(4)(A)(i)", "18 USC § 1114",
   "18 USC § 1116", "18 USC § 1203", "18 USC § 1361", "18 USC § 1362",
   "18 USC § 1363", "18 USC § 1366(a)", "18 USC § 1751(a)", "18 USC § 1751(b)",
   "18 USC § 1751(c)", "18 USC § 1751(d)", "18 USC § 1992", "18 USC § 2155",
   "18 USC § 2156", "18 USC § 2280", "18 USC § 2280a", "18 USC § 2281",
   "18 USC § 2281a", "18 USC § 2332", "18 USC § 2332a", "18 USC § 2332b",
   "18 USC § 2332f", "18 USC § 2332g", "18 USC § 2332h", "18 USC § 2332i",
   "18 USC § 2339", "18 USC § 2339A", "18 USC § 2339B", "18 USC § 2339C",
   "18 USC § 2339D", "18 USC § 2340A"]


def fctTitle18Targets : List Ref :=
  fctTitle18Cites.map (fun t => edge "18 USC § 2332b(g)(5)(B)(i)" t .Incorporates)



def fctAtomicEnergyCites : List String :=
  ["42 USC § 2122", "42 USC § 2284"]


def fctAtomicEnergyTargets : List Ref :=
  fctAtomicEnergyCites.map (fun t => edge "18 USC § 2332b(g)(5)(B)(ii)" t .Incorporates)


def e2332b_g5_atomicEnergyAct : Ref :=
  edge "18 USC § 2332b(g)(5)(B)(ii)" "Atomic Energy Act of 1954 §§ 92, 236 (42 USC §§ 2122, 2284)" .Incorporates


def fctTitle49Cites : List String :=
  ["49 USC § 46502", "49 USC § 46504", "49 USC § 46505(b)(3)", "49 USC § 46505(c)",
   "49 USC § 46506", "49 USC § 60123(b)"]


def fctTitle49Targets : List Ref :=
  fctTitle49Cites.map (fun t => edge "18 USC § 2332b(g)(5)(B)(iii)" t .Incorporates)


def e2332b_g5_title49 : Ref :=
  edge "18 USC § 2332b(g)(5)(B)(iii)" "49 USC (enumerated aviation and pipeline offenses)" .Incorporates



def fctTitle21Cites : List String :=
  ["21 USC § 960a"]


def fctTitle21Targets : List Ref :=
  fctTitle21Cites.map (fun t => edge "18 USC § 2332b(g)(5)(B)(iv)" t .Incorporates)



def e2332b_g5_csiea : Ref :=
  edge "18 USC § 2332b(g)(5)(B)(iv)" "Controlled Substances Import and Export Act § 1010A (21 USC § 960a)" .Incorporates


def e2332b_g5_self : Ref :=
  edge "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2332b" .Incorporates



def e2332b_g5_2332a : Ref :=
  edge "18 USC § 2332b(g)(5)(B)(i)" "18 USC § 2332a" .Incorporates


def edges2332b : List Ref :=
  [e2332b_a1_circ_b, e2332b_a1_stateLaw, e2332b_a1_subjectTo_d2,
   e2332b_a1_penalty_c, e2332b_a2_penalty_c, e2332b_a2_offense_a1,
   e2332b_b2_circ_b1, e2332b_a1_b1A, e2332b_a1_b1B, e2332b_a1_b1C,
   e2332b_a1_b1D, e2332b_a1_b1E, e2332b_a1_b1F, e2332b_b1_subjectTo_d1,
   e2332b_c2_notwithstanding, e2332b_d2_lexSpecialis,
   e2332b_e1_extraterritorial_a, e2332b_e2_accessory_s3,
   e2332b_f_savings_s3056, e2332b_g2_s1958b2, e2332b_g3_s1365g3,
   e2332b_g5_atomicEnergyAct, e2332b_g5_title49, e2332b_g5_csiea,
   e2332b_g5_self, e2332b_g5_2332a]


def sliceEdges : List Ref :=
  edges2332a ++ edges2332b ++ agInvestigativeTargets ++ fctTitle18Targets
    ++ fctAtomicEnergyTargets ++ fctTitle49Targets ++ fctTitle21Targets

end Proving.USC.T18.Ch113B.Wmd.Part3.Structure
