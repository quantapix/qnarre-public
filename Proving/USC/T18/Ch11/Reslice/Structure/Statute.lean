





















import Proving.USC.T18.Ch11.Reslice.Structure.Types
import Proving.USC.T18.Ch11.Reslice.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch11.Reslice.Structure

open Proving.USC.Common




def edge_216_incorporates_203 : Ref := { source := "18 USC § 216", target := "18 USC § 203", kind := .Incorporates }
def edge_216_incorporates_204 : Ref := { source := "18 USC § 216", target := "18 USC § 204", kind := .Incorporates }
def edge_216_incorporates_205 : Ref := { source := "18 USC § 216", target := "18 USC § 205", kind := .Incorporates }
def edge_216_incorporates_207 : Ref := { source := "18 USC § 216", target := "18 USC § 207", kind := .Incorporates }
def edge_216_incorporates_208 : Ref := { source := "18 USC § 216", target := "18 USC § 208", kind := .Incorporates }
def edge_216_incorporates_209 : Ref := { source := "18 USC § 216", target := "18 USC § 209", kind := .Incorporates }

def edge_216_savings_otherRemedy : Ref := { source := "18 USC § 216", target := "other criminal/civil/common-law/administrative remedy", kind := .Savings }



def edge_202_serves_203 : Ref := { source := "18 USC § 202", target := "18 USC § 203", kind := .Incorporates }
def edge_202_serves_205 : Ref := { source := "18 USC § 202", target := "18 USC § 205", kind := .Incorporates }
def edge_202_serves_207 : Ref := { source := "18 USC § 202", target := "18 USC § 207", kind := .Incorporates }
def edge_202_serves_208 : Ref := { source := "18 USC § 202", target := "18 USC § 208", kind := .Incorporates }
def edge_202_serves_209 : Ref := { source := "18 USC § 202", target := "18 USC § 209", kind := .Incorporates }
def edge_202_serves_218 : Ref := { source := "18 USC § 202", target := "18 USC § 218", kind := .Incorporates }
def edge_202_incorporates_t28ch40 : Ref := { source := "18 USC § 202(a)", target := "28 USC ch. 40 (independent counsel); 28 USC § 594(c)", kind := .Incorporates }
def edge_202_notwithstanding_t5 : Ref := { source := "18 USC § 202(a)", target := "5 USC §§ 502, 2105(d), 5534", kind := .Notwithstanding }
def edge_202_incorporates_t5_execAgency : Ref := { source := "18 USC § 202(e)(1)", target := "5 USC (executive agency def.)", kind := .Incorporates }


def edge_203_subjectTo_216 : Ref := { source := "18 USC § 203", target := "18 USC § 216", kind := .SubjectTo }
def edge_203_incorporates_202 : Ref := { source := "18 USC § 203", target := "18 USC § 202", kind := .Incorporates }
def edge_205_subjectTo_216 : Ref := { source := "18 USC § 205", target := "18 USC § 216", kind := .SubjectTo }
def edge_205_incorporates_202 : Ref := { source := "18 USC § 205", target := "18 USC § 202", kind := .Incorporates }
def edge_205_savings_t5ch71 : Ref := { source := "18 USC § 205(i)", target := "5 USC ch. 71; 39 USC § 1004/ch. 12; 16 USC § 831b; 22 USC § 4104 et seq.", kind := .ExceptAsProvided }
def edge_204_subjectTo_216 : Ref := { source := "18 USC § 204", target := "18 USC § 216", kind := .SubjectTo }
def edge_204_incorporates_202d : Ref := { source := "18 USC § 204", target := "18 USC § 202(d) (Member of Congress def.)", kind := .Incorporates }
def edge_207_subjectTo_216 : Ref := { source := "18 USC § 207", target := "18 USC § 216", kind := .SubjectTo }
def edge_207_incorporates_202 : Ref := { source := "18 USC § 207", target := "18 USC § 202", kind := .Incorporates }
def edge_207_incorporates_t5s552 : Ref := { source := "18 USC § 207(b)(1)", target := "5 USC § 552 (FOIA)", kind := .Incorporates }
def edge_207_incorporates_t3 : Ref := { source := "18 USC § 207(c)(2)/(d)(1)", target := "3 USC §§ 105(a)(2), 106(a)(1)", kind := .Incorporates }
def edge_207_incorporates_t5_execSchedule : Ref := { source := "18 USC § 207(d)(2)(B)", target := "5 USC §§ 5312-5316 (Executive Schedule)", kind := .Incorporates }
def edge_207_except_25s450i : Ref := { source := "18 USC § 207(j)(1)(B)", target := "25 USC § 450i(j) (Indian Self-Determination Act)", kind := .ExceptAsProvided }
def edge_208_subjectTo_216 : Ref := { source := "18 USC § 208", target := "18 USC § 216", kind := .SubjectTo }
def edge_208_incorporates_202 : Ref := { source := "18 USC § 208", target := "18 USC § 202", kind := .Incorporates }
def edge_208_except_subsecB : Ref := { source := "18 USC § 208(a)", target := "18 USC § 208(b) (permitted-interest exceptions)", kind := .ExceptAsProvided }
def edge_208_incorporates_t5ch131 : Ref := { source := "18 USC § 208(b)(3)/(d)", target := "5 USC ch. 10 (advisory cmte.); ch. 131 (fin. disclosure); §§ 552, 13107", kind := .Incorporates }
def edge_209_subjectTo_216 : Ref := { source := "18 USC § 209", target := "18 USC § 216", kind := .SubjectTo }
def edge_209_incorporates_202 : Ref := { source := "18 USC § 209", target := "18 USC § 202", kind := .Incorporates }
def edge_209_incorporates_351_1751 : Ref := { source := "18 USC § 209(f)", target := "18 USC §§ 351, 1751; 26 USC § 501(c)(3)/(a)", kind := .Incorporates }
def edge_209_savings_t5ch41 : Ref := { source := "18 USC § 209(d)/(g)", target := "5 USC ch. 41; ch. 37; §§ 3701, 3701(?); 10 USC § 101(a)(13)", kind := .ExceptAsProvided }


def edge_206_except_203 : Ref := { source := "18 USC § 206", target := "18 USC § 203", kind := .ExceptAsProvided }
def edge_206_except_205 : Ref := { source := "18 USC § 206", target := "18 USC § 205", kind := .ExceptAsProvided }


def edge_213_incorporates_212 : Ref := { source := "18 USC § 213(b)", target := "18 USC § 212 (examiner / FI-reg-agency / financial institution / loan defs.)", kind := .Incorporates }
def edge_212_except_subsecB : Ref := { source := "18 USC § 212(a)", target := "18 USC § 212(b) (regulatory limitations)", kind := .ExceptAsProvided }


def edge_218_incorporates_ch11 : Ref := { source := "18 USC § 218", target := "18 USC ch. 11 (final conviction for any violation of this chapter)", kind := .Incorporates }
def edge_218_savings_otherRemedy : Ref := { source := "18 USC § 218", target := "any other remedies provided by law", kind := .Savings }


def edge_221_222_renumbered_216_217 : Ref := { source := "18 USC §§ 221, 222", target := "18 USC §§ 216, 217 (renumbered)", kind := .LexSpecialis }


def edge_201_savings_1503_1505 : Ref := { source := "18 USC § 201(e)", target := "18 USC §§ 1503, 1504, 1505", kind := .Savings }


def edge_217_incorporates_t12 : Ref := { source := "18 USC § 217", target := "12 USC §§ 1150, 1150a, 1150b", kind := .Incorporates }


def edge_219_incorporates_fara_lda : Ref := { source := "18 USC § 219", target := "Foreign Agents Registration Act of 1938 (22 USC § 611 et seq., § 616); Lobbying Disclosure Act of 1995 § 3(6) (2 USC § 1602(6))", kind := .Incorporates }


def edge_220_incorporates_24b : Ref := { source := "18 USC § 220(e)(3)", target := "18 USC § 24(b) (health care benefit program def.)", kind := .Incorporates }
def edge_220_except_ssa1128B : Ref := { source := "18 USC § 220(d)(1)", target := "42 USC § 1320a-7b (SSA § 1128B)", kind := .ExceptAsProvided }
def edge_220_savings_stateLaw : Ref := { source := "18 USC § 220(d)(2)", target := "State laws on the same subject matter", kind := .Savings }
def edge_220_incorporates_ssa_misc : Ref := { source := "18 USC § 220(b)/(e)", target := "42 USC §§ 1395w-114a(g), 1320a-7b(b)(3)(I), 263a; SSA §§ 1833(z), 1860D-14A(g)", kind := .Incorporates }


def edge_224_savings_stateLaw : Ref := { source := "18 USC § 224(b)", target := "law of any State/territory/Commonwealth/possession", kind := .Savings }


def edge_225_incorporates_215 : Ref := { source := "18 USC § 225(b)", target := "18 USC § 215", kind := .Incorporates }
def edge_225_incorporates_predicates : Ref := { source := "18 USC § 225(b)", target := "18 USC §§ 656, 657, 1005, 1006, 1007, 1014, 1032, 1341, 1343, 1344", kind := .Incorporates }


def edge_226_incorporates_2331 : Ref := { source := "18 USC § 226(a)(1)", target := "18 USC § 2331 (international/domestic terrorism defs.)", kind := .Incorporates }
def edge_226_incorporates_t46s70103 : Ref := { source := "18 USC § 226(b)", target := "46 USC § 70103 (secure/restricted area)", kind := .Incorporates }


def edge_227_incorporates_t5s2105 : Ref := { source := "18 USC § 227(b)(3)", target := "5 USC § 2105 (executive branch employee def.)", kind := .Incorporates }







structure Section216IncorporationsResolve (c : ComplaintText) : Prop where
  e203 : ReferencedSectionExists edge_216_incorporates_203 c
  e204 : ReferencedSectionExists edge_216_incorporates_204 c
  e205 : ReferencedSectionExists edge_216_incorporates_205 c
  e207 : ReferencedSectionExists edge_216_incorporates_207 c
  e208 : ReferencedSectionExists edge_216_incorporates_208 c
  e209 : ReferencedSectionExists edge_216_incorporates_209 c




structure Section202IncorporationsResolve (c : ComplaintText) : Prop where
  serves203 : ReferencedSectionExists edge_202_serves_203 c
  serves205 : ReferencedSectionExists edge_202_serves_205 c
  serves207 : ReferencedSectionExists edge_202_serves_207 c
  serves208 : ReferencedSectionExists edge_202_serves_208 c
  serves209 : ReferencedSectionExists edge_202_serves_209 c
  serves218 : ReferencedSectionExists edge_202_serves_218 c
  t28ch40   : ReferencedSectionExists edge_202_incorporates_t28ch40 c



structure Section213IncorporationsResolve (c : ComplaintText) : Prop where
  defs212 : IncorporationHonored edge_213_incorporates_212 c




structure Section206ExemptionResolves (c : ComplaintText) : Prop where
  except203 : ExceptionApplies edge_206_except_203 c
  except205 : ExceptionApplies edge_206_except_205 c



structure Section218IncorporationsResolve (c : ComplaintText) : Prop where
  chapterRef : ReferencedSectionExists edge_218_incorporates_ch11 c


structure Section221_222RenumberingResolves (c : ComplaintText) : Prop where
  to216 : ReferencedSectionExists { source := "18 USC §§ 221, 222", target := "18 USC § 216", kind := .LexSpecialis } c
  to217 : ReferencedSectionExists { source := "18 USC §§ 221, 222", target := "18 USC § 217", kind := .LexSpecialis } c








structure Coherent203 (c : ComplaintText) : Prop where
  penalty216 : ReferencedSectionExists edge_203_subjectTo_216 c
  defs202    : IncorporationHonored edge_203_incorporates_202 c


structure Coherent205 (c : ComplaintText) : Prop where
  penalty216 : ReferencedSectionExists edge_205_subjectTo_216 c
  defs202    : IncorporationHonored edge_205_incorporates_202 c


structure Coherent204 (c : ComplaintText) : Prop where
  penalty216 : ReferencedSectionExists edge_204_subjectTo_216 c
  defs202d   : IncorporationHonored edge_204_incorporates_202d c



structure Coherent207 (c : ComplaintText) : Prop where
  penalty216 : ReferencedSectionExists edge_207_subjectTo_216 c
  defs202    : IncorporationHonored edge_207_incorporates_202 c
  foia552    : IncorporationHonored edge_207_incorporates_t5s552 c



structure Coherent208 (c : ComplaintText) : Prop where
  penalty216 : ReferencedSectionExists edge_208_subjectTo_216 c
  defs202    : IncorporationHonored edge_208_incorporates_202 c
  exceptB    : ExceptionApplies edge_208_except_subsecB c



structure Coherent209 (c : ComplaintText) : Prop where
  penalty216 : ReferencedSectionExists edge_209_subjectTo_216 c
  defs202    : IncorporationHonored edge_209_incorporates_202 c
  injuryRefs : ReferencedSectionExists edge_209_incorporates_351_1751 c



structure Coherent201 (c : ComplaintText) : Prop where
  savings1503 : ReferencedSectionExists edge_201_savings_1503_1505 c



structure Coherent217 (c : ComplaintText) : Prop where
  t12Refs : ReferencedSectionExists edge_217_incorporates_t12 c


structure Coherent219 (c : ComplaintText) : Prop where
  faraLda : IncorporationHonored edge_219_incorporates_fara_lda c




structure Coherent220 (c : ComplaintText) : Prop where
  hcbp24b     : IncorporationHonored edge_220_incorporates_24b c
  exceptSsa   : ExceptionApplies edge_220_except_ssa1128B c
  savingsState : ReferencedSectionExists edge_220_savings_stateLaw c


structure Coherent224 (c : ComplaintText) : Prop where
  savingsState : ReferencedSectionExists edge_224_savings_stateLaw c



structure Coherent225 (c : ComplaintText) : Prop where
  pred215   : IncorporationHonored edge_225_incorporates_215 c
  predList  : ReferencedSectionExists edge_225_incorporates_predicates c



structure Coherent226 (c : ComplaintText) : Prop where
  terror2331 : IncorporationHonored edge_226_incorporates_2331 c
  port70103  : IncorporationHonored edge_226_incorporates_t46s70103 c



structure Coherent227 (c : ComplaintText) : Prop where
  emp2105 : IncorporationHonored edge_227_incorporates_t5s2105 c

end Proving.USC.T18.Ch11.Reslice.Structure
