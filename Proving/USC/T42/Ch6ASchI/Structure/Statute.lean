













import Proving.USC.T42.Ch6ASchI.Structure.Predicates

namespace Proving.USC.T42.Ch6ASchI.Structure

open Proving.USC.Common







def edge_201_notwithstanding_anyLaw : Ref :=
  { source := "42 USC § 201", target := "any other provision of law", kind := .Notwithstanding }
def edge_201_incorporates_1396 : Ref :=
  { source := "42 USC § 201", target := "42 USC § 1396", kind := .Incorporates }
def edge_201_incorporates_1381 : Ref :=
  { source := "42 USC § 201", target := "42 USC § 1381", kind := .Incorporates }
def edge_201_incorporates_ricky101 : Ref :=
  { source := "42 USC § 201", target := "Ricky Ray Hemophilia Relief Fund Act of 1998 § 101", kind := .Incorporates }


def edge_204_incorporates_295p : Ref :=
  { source := "42 USC § 204", target := "42 USC § 295p", kind := .Incorporates }
def edge_204_incorporates_t37 : Ref :=
  { source := "42 USC § 204", target := "37 USC (title 37)", kind := .Incorporates }
def edge_204_notwithstanding_reserveRefs : Ref :=
  { source := "42 USC § 204", target := "any Federal statute (\"Reserve Corps\" references)", kind := .Notwithstanding }
def edge_204_exceptAsProvided_subsecB : Ref :=
  { source := "42 USC § 204", target := "42 USC § 204(b)", kind := .ExceptAsProvided }


def edge_204a_incorporates_215 : Ref :=
  { source := "42 USC § 204a", target := "42 USC § 215", kind := .Incorporates }
def edge_204a_incorporates_247d : Ref :=
  { source := "42 USC § 204a", target := "42 USC § 247d", kind := .Incorporates }
def edge_204a_incorporates_nea1601 : Ref :=
  { source := "42 USC § 204a", target := "50 USC § 1601", kind := .Incorporates }
def edge_204a_incorporates_stafford5121 : Ref :=
  { source := "42 USC § 204a", target := "42 USC § 5121", kind := .Incorporates }
def edge_204a_exceptAsProvided_par4 : Ref :=
  { source := "42 USC § 204a", target := "42 USC § 204a(a)(4)", kind := .ExceptAsProvided }


def edge_207_incorporates_206b : Ref :=
  { source := "42 USC § 207", target := "42 USC § 206(b)", kind := .Incorporates }
def edge_207_incorporates_206c : Ref :=
  { source := "42 USC § 207", target := "42 USC § 206(c)", kind := .Incorporates }


def edge_209_incorporates_212d : Ref :=
  { source := "42 USC § 209", target := "42 USC § 212(d)", kind := .Incorporates }
def edge_209_exceptAsProvided_205 : Ref :=
  { source := "42 USC § 209", target := "42 USC § 205", kind := .ExceptAsProvided }
def edge_209_exceptAsProvided_subsecBE : Ref :=
  { source := "42 USC § 209", target := "42 USC § 209(b),(e)", kind := .ExceptAsProvided }


def edge_209d_subjectTo_act : Ref :=
  { source := "42 USC § 209d", target := "Public Health Service Act (other provisions)", kind := .SubjectTo }


def edge_210_incorporates_211g3 : Ref :=
  { source := "42 USC § 210", target := "42 USC § 211(g)(3)", kind := .Incorporates }
def edge_210_incorporates_212 : Ref :=
  { source := "42 USC § 210", target := "42 USC § 212", kind := .Incorporates }
def edge_210_incorporates_213a : Ref :=
  { source := "42 USC § 210", target := "42 USC § 213a(a)", kind := .Incorporates }
def edge_210_incorporates_t37_303a : Ref :=
  { source := "42 USC § 210", target := "37 USC § 303a(b)", kind := .Incorporates }
def edge_210_incorporates_t5_5703 : Ref :=
  { source := "42 USC § 210", target := "5 USC § 5703", kind := .Incorporates }
def edge_210_incorporates_209g : Ref :=
  { source := "42 USC § 210", target := "42 USC § 209(g)", kind := .Incorporates }
def edge_210_incorporates_t5_5313 : Ref :=
  { source := "42 USC § 210", target := "5 USC § 5313", kind := .Incorporates }


def edge_210b_incorporates_209a1 : Ref :=
  { source := "42 USC § 210b", target := "42 USC § 209(a)(1)", kind := .Incorporates }
def edge_210b_subjectTo_207d : Ref :=
  { source := "42 USC § 210b", target := "42 USC § 207(d)", kind := .SubjectTo }
def edge_210b_incorporates_207c : Ref :=
  { source := "42 USC § 210b", target := "42 USC § 207(c)", kind := .Incorporates }
def edge_210b_incorporates_209 : Ref :=
  { source := "42 USC § 210b", target := "42 USC § 209", kind := .Incorporates }
def edge_210b_incorporates_206c : Ref :=
  { source := "42 USC § 210b", target := "42 USC § 206(c)", kind := .Incorporates }










structure Coherent201 (c : ComplaintText) : Prop where
  overrides      : OverrideTriggered edge_201_notwithstanding_anyLaw c
  medicaid       : IncorporationHonored edge_201_incorporates_1396 c
  ssi            : IncorporationHonored edge_201_incorporates_1381 c
  fundResolves   : ReferencedSectionExists edge_201_incorporates_ricky101 c





structure Coherent204 (c : ComplaintText) : Prop where
  underserved     : IncorporationHonored edge_204_incorporates_295p c
  title37Resolves : ReferencedSectionExists edge_204_incorporates_t37 c
  reserveDeeming  : OverrideTriggered edge_204_notwithstanding_reserveRefs c
  subsecBCarveout : ExceptionApplies edge_204_exceptAsProvided_subsecB c





structure Coherent204a (c : ComplaintText) : Prop where
  sharedDefn      : IncorporationHonored edge_204a_incorporates_215 c
  phEmergency     : IncorporationHonored edge_204a_incorporates_247d c
  neaResolves     : ReferencedSectionExists edge_204a_incorporates_nea1601 c
  stafford        : IncorporationHonored edge_204a_incorporates_stafford5121 c
  waiverException : ExceptionApplies edge_204a_exceptAsProvided_par4 c



structure Coherent207 (c : ComplaintText) : Prop where
  positions206b : IncorporationHonored edge_207_incorporates_206b c
  positions206c : IncorporationHonored edge_207_incorporates_206c c




structure Coherent209 (c : ComplaintText) : Prop where
  activeService     : IncorporationHonored edge_209_incorporates_212d c
  section205Except  : ExceptionApplies edge_209_exceptAsProvided_205 c
  internalExcept    : ExceptionApplies edge_209_exceptAsProvided_subsecBE c



structure Coherent209d (c : ComplaintText) : Prop where
  subjectToAct : SubjectToConstraintHonored edge_209d_subjectTo_act c




structure Coherent210 (c : ComplaintText) : Prop where
  retiredPay211  : IncorporationHonored edge_210_incorporates_211g3 c
  retiredPay212  : IncorporationHonored edge_210_incorporates_212 c
  retiredPay213a : IncorporationHonored edge_210_incorporates_213a c
  fellowships209 : IncorporationHonored edge_210_incorporates_209g c
  title37Pay     : ReferencedSectionExists edge_210_incorporates_t37_303a c
  title5Travel   : ReferencedSectionExists edge_210_incorporates_t5_5703 c
  title5ExecSch  : ReferencedSectionExists edge_210_incorporates_t5_5313 c




structure Coherent210b (c : ComplaintText) : Prop where
  examSubjects   : IncorporationHonored edge_210b_incorporates_209a1 c
  gradeLimit207d : SubjectToConstraintHonored edge_210b_subjectTo_207d c
  grade207c      : IncorporationHonored edge_210b_incorporates_207c c
  appt209        : IncorporationHonored edge_210b_incorporates_209 c
  position206c   : IncorporationHonored edge_210b_incorporates_206c c

end Proving.USC.T42.Ch6ASchI.Structure
