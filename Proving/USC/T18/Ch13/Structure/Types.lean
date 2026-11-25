import Proving.USC.Common.Types















namespace Proving.USC.T18.Ch13.Structure

open Proving.USC.Common


inductive EdgeKind
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






def edge_241_rights : Ref :=
  { source := "18 USC § 241", target := "US Const.; laws of the United States", kind := .Incorporates }

def edge_241_penalty : Ref :=
  { source := "18 USC § 241", target := "18 USC § 3571", kind := .Incorporates }



def edge_242_rights : Ref :=
  { source := "18 USC § 242", target := "US Const.; laws of the United States", kind := .Incorporates }

def edge_242_penalty : Ref :=
  { source := "18 USC § 242", target := "18 USC § 3571", kind := .Incorporates }



def edge_244_penalty : Ref :=
  { source := "18 USC § 244", target := "18 USC § 3571", kind := .Incorporates }



def edge_245_internal_4A : Ref :=
  { source := "18 USC § 245(a)(4)(A)", target := "18 USC § 245(a)(1)(A)–(E), (2)(A)–(F)", kind := .Incorporates }

def edge_245_internal_5 : Ref :=
  { source := "18 USC § 245(a)(5)", target := "18 USC § 245(a)(1)(A)–(E), (2)(A)–(F)", kind := .Incorporates }

def edge_245_savings_state : Ref :=
  { source := "18 USC § 245(a)(1)", target := "State jurisdiction; State and local law", kind := .Savings }

def edge_245_leo_carveout : Ref :=
  { source := "18 USC § 245(c)", target := "law-enforcement-officer lawful duties", kind := .ExceptAsProvided }

def edge_245_penalty : Ref :=
  { source := "18 USC § 245", target := "18 USC § 3571", kind := .Incorporates }



def edge_246_relief_acts : Ref :=
  { source := "18 USC § 246", target := "Acts of Congress appropriating work-relief funds", kind := .Incorporates }

def edge_246_penalty : Ref :=
  { source := "18 USC § 246", target := "18 USC § 3571", kind := .Incorporates }



def edge_247_a_to_b : Ref :=
  { source := "18 USC § 247(a)", target := "18 USC § 247(b)", kind := .Incorporates }

def edge_247_c_to_d : Ref :=
  { source := "18 USC § 247(c)", target := "18 USC § 247(d)", kind := .Incorporates }

def edge_247_d_to_ac : Ref :=
  { source := "18 USC § 247(d)", target := "18 USC § 247(a), (c)", kind := .Incorporates }



def edge_248_c_to_a : Ref :=
  { source := "18 USC § 248(c)(1)(A)", target := "18 USC § 248(a)", kind := .Incorporates }

def edge_248_savings_preempt : Ref :=
  { source := "18 USC § 248(d)(3)", target := "State or local laws (non-preemption)", kind := .Savings }

def edge_248_savings_firstamd : Ref :=
  { source := "18 USC § 248(d)(1)", target := "First Amendment expressive conduct", kind := .Savings }



def edge_249_bodilyInjury_1365 : Ref :=
  { source := "18 USC § 249(c)(1)", target := "18 USC § 1365(h)(4)", kind := .Incorporates }

def edge_249_explosive_232 : Ref :=
  { source := "18 USC § 249(c)(2)", target := "18 USC § 232", kind := .Incorporates }

def edge_249_firearm_921 : Ref :=
  { source := "18 USC § 249(c)(3)", target := "18 USC § 921(a)", kind := .Incorporates }

def edge_249_sbi_2246 : Ref :=
  { source := "18 USC § 249(a)(5)", target := "18 USC § 2246", kind := .Incorporates }

def edge_249_supervised_3583 : Ref :=
  { source := "18 USC § 249(e)", target := "18 USC § 3583", kind := .Incorporates }


def edge_249_except_d1_d2 : Ref :=
  { source := "18 USC § 249(d)(1)", target := "18 USC § 249(d)(2)", kind := .ExceptAsProvided }



def edge_250_chapter : Ref :=
  { source := "18 USC § 250(a)", target := "18 USC ch. 13 (§§ 241–249)", kind := .Incorporates }


def edge_250_fha_3631 : Ref :=
  { source := "18 USC § 250(a)", target := "42 USC § 3631", kind := .Incorporates }

def edge_250_aggSexAbuse_2241 : Ref :=
  { source := "18 USC § 250(b)(1)", target := "18 USC § 2241", kind := .Incorporates }

def edge_250_sexAbuse_2242 : Ref :=
  { source := "18 USC § 250(b)(1)", target := "18 USC § 2242", kind := .Incorporates }

def edge_250_sexAct_2246 : Ref :=
  { source := "18 USC § 250(b)(3)", target := "18 USC § 2246", kind := .Incorporates }

def edge_250_contact_2244 : Ref :=
  { source := "18 USC § 250(b)(4)", target := "18 USC § 2244", kind := .Incorporates }

end Proving.USC.T18.Ch13.Structure
