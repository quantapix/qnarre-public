







import Proving.USC.T18.Ch11.Reslice.Structure.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch11.Reslice.Structure

open Proving.USC.Common

theorem section216IncorporationsResolve_intro {c : ComplaintText}
    (e203 : ReferencedSectionExists edge_216_incorporates_203 c)
    (e204 : ReferencedSectionExists edge_216_incorporates_204 c)
    (e205 : ReferencedSectionExists edge_216_incorporates_205 c)
    (e207 : ReferencedSectionExists edge_216_incorporates_207 c)
    (e208 : ReferencedSectionExists edge_216_incorporates_208 c)
    (e209 : ReferencedSectionExists edge_216_incorporates_209 c)
    : Section216IncorporationsResolve c :=
  ⟨e203, e204, e205, e207, e208, e209⟩

theorem section202IncorporationsResolve_intro {c : ComplaintText}
    (serves203 : ReferencedSectionExists edge_202_serves_203 c)
    (serves205 : ReferencedSectionExists edge_202_serves_205 c)
    (serves207 : ReferencedSectionExists edge_202_serves_207 c)
    (serves208 : ReferencedSectionExists edge_202_serves_208 c)
    (serves209 : ReferencedSectionExists edge_202_serves_209 c)
    (serves218 : ReferencedSectionExists edge_202_serves_218 c)
    (t28ch40 : ReferencedSectionExists edge_202_incorporates_t28ch40 c)
    : Section202IncorporationsResolve c :=
  ⟨serves203, serves205, serves207, serves208, serves209, serves218, t28ch40⟩

theorem section213IncorporationsResolve_intro {c : ComplaintText}
    (defs212 : IncorporationHonored edge_213_incorporates_212 c)
    : Section213IncorporationsResolve c :=
  ⟨defs212⟩

theorem section206ExemptionResolves_intro {c : ComplaintText}
    (except203 : ExceptionApplies edge_206_except_203 c)
    (except205 : ExceptionApplies edge_206_except_205 c)
    : Section206ExemptionResolves c :=
  ⟨except203, except205⟩

theorem section218IncorporationsResolve_intro {c : ComplaintText}
    (chapterRef : ReferencedSectionExists edge_218_incorporates_ch11 c)
    : Section218IncorporationsResolve c :=
  ⟨chapterRef⟩

theorem section221_222RenumberingResolves_intro {c : ComplaintText}
    (to216 : ReferencedSectionExists { source := "18 USC §§ 221, 222", target := "18 USC § 216", kind := .LexSpecialis } c)
    (to217 : ReferencedSectionExists { source := "18 USC §§ 221, 222", target := "18 USC § 217", kind := .LexSpecialis } c)
    : Section221_222RenumberingResolves c :=
  ⟨to216, to217⟩

theorem coherent203_intro {c : ComplaintText}
    (penalty216 : ReferencedSectionExists edge_203_subjectTo_216 c)
    (defs202 : IncorporationHonored edge_203_incorporates_202 c)
    : Coherent203 c :=
  ⟨penalty216, defs202⟩

theorem coherent205_intro {c : ComplaintText}
    (penalty216 : ReferencedSectionExists edge_205_subjectTo_216 c)
    (defs202 : IncorporationHonored edge_205_incorporates_202 c)
    : Coherent205 c :=
  ⟨penalty216, defs202⟩

theorem coherent204_intro {c : ComplaintText}
    (penalty216 : ReferencedSectionExists edge_204_subjectTo_216 c)
    (defs202d : IncorporationHonored edge_204_incorporates_202d c)
    : Coherent204 c :=
  ⟨penalty216, defs202d⟩

theorem coherent207_intro {c : ComplaintText}
    (penalty216 : ReferencedSectionExists edge_207_subjectTo_216 c)
    (defs202 : IncorporationHonored edge_207_incorporates_202 c)
    (foia552 : IncorporationHonored edge_207_incorporates_t5s552 c)
    : Coherent207 c :=
  ⟨penalty216, defs202, foia552⟩

theorem coherent208_intro {c : ComplaintText}
    (penalty216 : ReferencedSectionExists edge_208_subjectTo_216 c)
    (defs202 : IncorporationHonored edge_208_incorporates_202 c)
    (exceptB : ExceptionApplies edge_208_except_subsecB c)
    : Coherent208 c :=
  ⟨penalty216, defs202, exceptB⟩

theorem coherent209_intro {c : ComplaintText}
    (penalty216 : ReferencedSectionExists edge_209_subjectTo_216 c)
    (defs202 : IncorporationHonored edge_209_incorporates_202 c)
    (injuryRefs : ReferencedSectionExists edge_209_incorporates_351_1751 c)
    : Coherent209 c :=
  ⟨penalty216, defs202, injuryRefs⟩

theorem coherent201_intro {c : ComplaintText}
    (savings1503 : ReferencedSectionExists edge_201_savings_1503_1505 c)
    : Coherent201 c :=
  ⟨savings1503⟩

theorem coherent217_intro {c : ComplaintText}
    (t12Refs : ReferencedSectionExists edge_217_incorporates_t12 c)
    : Coherent217 c :=
  ⟨t12Refs⟩

theorem coherent219_intro {c : ComplaintText}
    (faraLda : IncorporationHonored edge_219_incorporates_fara_lda c)
    : Coherent219 c :=
  ⟨faraLda⟩

theorem coherent220_intro {c : ComplaintText}
    (hcbp24b : IncorporationHonored edge_220_incorporates_24b c)
    (exceptSsa : ExceptionApplies edge_220_except_ssa1128B c)
    (savingsState : ReferencedSectionExists edge_220_savings_stateLaw c)
    : Coherent220 c :=
  ⟨hcbp24b, exceptSsa, savingsState⟩

theorem coherent224_intro {c : ComplaintText}
    (savingsState : ReferencedSectionExists edge_224_savings_stateLaw c)
    : Coherent224 c :=
  ⟨savingsState⟩

theorem coherent225_intro {c : ComplaintText}
    (pred215 : IncorporationHonored edge_225_incorporates_215 c)
    (predList : ReferencedSectionExists edge_225_incorporates_predicates c)
    : Coherent225 c :=
  ⟨pred215, predList⟩

theorem coherent226_intro {c : ComplaintText}
    (terror2331 : IncorporationHonored edge_226_incorporates_2331 c)
    (port70103 : IncorporationHonored edge_226_incorporates_t46s70103 c)
    : Coherent226 c :=
  ⟨terror2331, port70103⟩

theorem coherent227_intro {c : ComplaintText}
    (emp2105 : IncorporationHonored edge_227_incorporates_t5s2105 c)
    : Coherent227 c :=
  ⟨emp2105⟩

end Proving.USC.T18.Ch11.Reslice.Structure
