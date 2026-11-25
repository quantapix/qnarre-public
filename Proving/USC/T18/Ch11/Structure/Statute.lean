import Proving.USC.T18.Ch11.Structure.Types
import Proving.USC.T18.Ch11.Structure.Predicates
import Proving.USC.Common.Types








namespace Proving.USC.T18.Ch11.Structure
open Proving.USC.Common




def edge_201_savings_1503 : Ref := { source := "18 USC § 201", target := "18 USC § 1503", kind := .Savings }


def edge_202_notwithstanding_5t5 : Ref := { source := "18 USC § 202", target := "5 USC § 5534", kind := .Notwithstanding }


def edge_203_incorporates_202 : Ref := { source := "18 USC § 203", target := "18 USC § 202", kind := .Incorporates }
def edge_203_penalty_216      : Ref := { source := "18 USC § 203", target := "18 USC § 216", kind := .SubjectTo }


def edge_204_penalty_216 : Ref := { source := "18 USC § 204", target := "18 USC § 216", kind := .SubjectTo }


def edge_205_incorporates_202 : Ref := { source := "18 USC § 205", target := "18 USC § 202", kind := .Incorporates }
def edge_205_penalty_216      : Ref := { source := "18 USC § 205", target := "18 USC § 216", kind := .SubjectTo }


def edge_206_except_203 : Ref := { source := "18 USC § 206", target := "18 USC § 203", kind := .ExceptAsProvided }
def edge_206_except_205 : Ref := { source := "18 USC § 206", target := "18 USC § 205", kind := .ExceptAsProvided }


def edge_207_incorporates_202  : Ref := { source := "18 USC § 207", target := "18 USC § 202", kind := .Incorporates }
def edge_207_penalty_216       : Ref := { source := "18 USC § 207", target := "18 USC § 216", kind := .SubjectTo }
def edge_207_incorporates_552t5 : Ref := { source := "18 USC § 207", target := "5 USC § 552", kind := .Incorporates }


def edge_208_incorporates_202 : Ref := { source := "18 USC § 208", target := "18 USC § 202", kind := .Incorporates }
def edge_208_penalty_216      : Ref := { source := "18 USC § 208", target := "18 USC § 216", kind := .SubjectTo }


def edge_209_incorporates_202   : Ref := { source := "18 USC § 209", target := "18 USC § 202", kind := .Incorporates }
def edge_209_penalty_216        : Ref := { source := "18 USC § 209", target := "18 USC § 216", kind := .SubjectTo }
def edge_209_incorporates_3701t5 : Ref := { source := "18 USC § 209", target := "5 USC § 3701", kind := .Incorporates }


def edge_213_incorporates_212 : Ref := { source := "18 USC § 213", target := "18 USC § 212", kind := .Incorporates }


def edge_216_references_203  : Ref := { source := "18 USC § 216", target := "18 USC § 203", kind := .Incorporates }
def edge_216_savings_other   : Ref := { source := "18 USC § 216", target := "other law", kind := .Savings }


def edge_217_incorporates_1150t12 : Ref := { source := "18 USC § 217", target := "12 USC § 1150", kind := .Incorporates }


def edge_218_incorporates_ch11 : Ref := { source := "18 USC § 218", target := "18 USC ch. 11", kind := .Incorporates }
def edge_218_savings_other     : Ref := { source := "18 USC § 218", target := "other law", kind := .Savings }


def edge_219_incorporates_fara3 : Ref := { source := "18 USC § 219", target := "Foreign Agents Registration Act § 3(6)", kind := .Incorporates }


def edge_220_incorporates_24b    : Ref := { source := "18 USC § 220", target := "18 USC § 24", kind := .Incorporates }
def edge_220_incorporates_353phsa : Ref := { source := "18 USC § 220", target := "42 USC § 263a", kind := .Incorporates }
def edge_220_except_220b         : Ref := { source := "18 USC § 220", target := "18 USC § 220(b)", kind := .ExceptAsProvided }


def edge_225_incorporates_215  : Ref := { source := "18 USC § 225", target := "18 USC § 215", kind := .Incorporates }
def edge_225_incorporates_1344 : Ref := { source := "18 USC § 225", target := "18 USC § 1344", kind := .Incorporates }


def edge_226_incorporates_2331     : Ref := { source := "18 USC § 226", target := "18 USC § 2331", kind := .Incorporates }
def edge_226_incorporates_70103t46 : Ref := { source := "18 USC § 226", target := "46 USC § 70103", kind := .Incorporates }


def edge_227_incorporates_2105t5 : Ref := { source := "18 USC § 227", target := "5 USC § 2105", kind := .Incorporates }




structure Coherent201 (c : ComplaintText) : Prop where
  obstructionSectionsExist : ReferencedSectionExists edge_201_savings_1503 c
  separateAndAdditional    : SavingsClausePreserved edge_201_savings_1503 c



structure Coherent202 (c : ComplaintText) : Prop where
  displacedProvisionExists : ReferencedSectionExists edge_202_notwithstanding_5t5 c
  overrideFires            : OverrideTriggered edge_202_notwithstanding_5t5 c


structure Coherent203 (c : ComplaintText) : Prop where
  definitionsImported : DefinitionImported edge_203_incorporates_202 c
  penaltyApplies      : PenaltyRegimeApplies edge_203_penalty_216 c


structure Coherent204 (c : ComplaintText) : Prop where
  penaltyApplies : PenaltyRegimeApplies edge_204_penalty_216 c


structure Coherent205 (c : ComplaintText) : Prop where
  definitionsImported : DefinitionImported edge_205_incorporates_202 c
  penaltyApplies      : PenaltyRegimeApplies edge_205_penalty_216 c


structure Coherent206 (c : ComplaintText) : Prop where
  exempts203 : ExceptionApplies edge_206_except_203 c
  exempts205 : ExceptionApplies edge_206_except_205 c


structure Coherent207 (c : ComplaintText) : Prop where
  definitionsImported : DefinitionImported edge_207_incorporates_202 c
  penaltyApplies      : PenaltyRegimeApplies edge_207_penalty_216 c
  foiaTestIncorporated : IncorporationHonored edge_207_incorporates_552t5 c


structure Coherent208 (c : ComplaintText) : Prop where
  definitionsImported : DefinitionImported edge_208_incorporates_202 c
  penaltyApplies      : PenaltyRegimeApplies edge_208_penalty_216 c


structure Coherent209 (c : ComplaintText) : Prop where
  definitionsImported : DefinitionImported edge_209_incorporates_202 c
  penaltyApplies      : PenaltyRegimeApplies edge_209_penalty_216 c
  agencyDefImported   : IncorporationHonored edge_209_incorporates_3701t5 c


structure Coherent213 (c : ComplaintText) : Prop where
  definitionsImported : DefinitionImported edge_213_incorporates_212 c


structure Coherent216 (c : ComplaintText) : Prop where
  offensesExist    : ReferencedSectionExists edge_216_references_203 c
  savingsPreserved : SavingsClausePreserved edge_216_savings_other c


structure Coherent217 (c : ComplaintText) : Prop where
  farmIndebtednessIncorporated : IncorporationHonored edge_217_incorporates_1150t12 c


structure Coherent218 (c : ComplaintText) : Prop where
  chapterViolationResolvable : PredicateOffenseResolvable edge_218_incorporates_ch11 c
  savingsPreserved           : SavingsClausePreserved edge_218_savings_other c


structure Coherent219 (c : ComplaintText) : Prop where
  foreignEntityDefImported : IncorporationHonored edge_219_incorporates_fara3 c



structure Coherent220 (c : ComplaintText) : Prop where
  healthProgramDefImported : DefinitionImported edge_220_incorporates_24b c
  laboratoryDefImported    : IncorporationHonored edge_220_incorporates_353phsa c
  exceptionsHonored        : ExceptionApplies edge_220_except_220b c


structure Coherent225 (c : ComplaintText) : Prop where
  inChapterPredicateResolvable    : PredicateOffenseResolvable edge_225_incorporates_215 c
  crossChapterPredicateResolvable : PredicateOffenseResolvable edge_225_incorporates_1344 c


structure Coherent226 (c : ComplaintText) : Prop where
  terrorismDefImported  : IncorporationHonored edge_226_incorporates_2331 c
  secureAreaDefImported : IncorporationHonored edge_226_incorporates_70103t46 c


structure Coherent227 (c : ComplaintText) : Prop where
  employeeDefImported : DefinitionImported edge_227_incorporates_2105t5 c

end Proving.USC.T18.Ch11.Structure
