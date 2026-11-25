import Proving.USC.T42.Ch6ASchI.Part2.Structure.Types
import Proving.USC.T42.Ch6ASchI.Part2.Structure.Predicates
import Proving.USC.Common.Types







namespace Proving.USC.T42.Ch6ASchI.Part2.Structure
open Proving.USC.Common

open EdgeKind


def edge_211_incorporates_t10_1406 : Ref :=
  { source := "42 USC § 211(g)(3)(A)", target := "10 USC § 1406", kind := Incorporates }
def edge_211_incorporates_t10_1407 : Ref :=
  { source := "42 USC § 211(g)(3)(B)(i)", target := "10 USC § 1407", kind := Incorporates }
def edge_211_incorporates_t10_1409 : Ref :=
  { source := "42 USC § 211(g)(3)(B)(ii)", target := "10 USC § 1409", kind := Incorporates }
def edge_211_incorporates_210b : Ref :=
  { source := "42 USC § 211(l)", target := "42 USC § 210b", kind := Incorporates }
def edge_211_incorporates_t5_3332 : Ref :=
  { source := "42 USC § 211(m)", target := "5 USC § 3332", kind := Incorporates }
def edge_211_exceptAsProvided_211b : Ref :=
  { source := "42 USC § 211(d)(2)", target := "42 USC § 211(b)", kind := ExceptAsProvided }


def edge_211c_exceptAsProvided_otherLaw : Ref :=
  { source := "42 USC § 211c", target := "other provisions of law", kind := ExceptAsProvided }


def edge_212_incorporates_t10_1406 : Ref :=
  { source := "42 USC § 212(a)(4)", target := "10 USC § 1406", kind := Incorporates }
def edge_212_incorporates_t10_1407 : Ref :=
  { source := "42 USC § 212(a)(6)", target := "10 USC § 1407", kind := Incorporates }
def edge_212_incorporates_t10_1409 : Ref :=
  { source := "42 USC § 212(a)(4)", target := "10 USC § 1409", kind := Incorporates }
def edge_212_incorporates_t37_205 : Ref :=
  { source := "42 USC § 212(a)(4)(iii)", target := "37 USC § 205", kind := Incorporates }
def edge_212_incorporates_211 : Ref :=
  { source := "42 USC § 212(a)(7)", target := "42 USC § 211", kind := Incorporates }
def edge_212_incorporates_213a : Ref :=
  { source := "42 USC § 212(c)", target := "42 USC § 213a", kind := Incorporates }
def edge_212_incorporates_237 : Ref :=
  { source := "42 USC § 212(d)(4)", target := "42 USC § 237", kind := Incorporates }
def edge_212_incorporates_t10_1208 : Ref :=
  { source := "42 USC § 212(f)", target := "10 USC § 1208", kind := Incorporates }
def edge_212_exceptAsProvided_212a6 : Ref :=
  { source := "42 USC § 212(a)(4)", target := "42 USC § 212(a)(6)", kind := ExceptAsProvided }


def edge_213_incorporates_417 : Ref :=
  { source := "42 USC § 213(d)", target := "42 USC § 417", kind := Incorporates }
def edge_213_incorporates_t50_3901 : Ref :=
  { source := "42 USC § 213(e)", target := "50 USC § 3901", kind := Incorporates }
def edge_213_exceptAsProvided_b : Ref :=
  { source := "42 USC § 213(a)", target := "42 USC § 213(b)", kind := ExceptAsProvided }
def edge_213_savings_serviceIndemnity : Ref :=
  { source := "42 USC § 213(d)", target := "Servicemen's Indemnity Act of 1951", kind := Savings }


def edge_213a_incorporates_t10_1036 : Ref :=
  { source := "42 USC § 213a(a)(1)", target := "10 USC § 1036", kind := Incorporates }
def edge_213a_incorporates_t10_ch61 : Ref :=
  { source := "42 USC § 213a(a)(2)", target := "10 USC ch. 61", kind := Incorporates }
def edge_213a_incorporates_t10_ch1223 : Ref :=
  { source := "42 USC § 213a(a)(19)", target := "10 USC ch. 1223", kind := Incorporates }
def edge_213a_subjectTo_213 : Ref :=
  { source := "42 USC § 213a(a)(8)", target := "42 USC § 213", kind := SubjectTo }
def edge_213a_incorporates_t10_1034 : Ref :=
  { source := "42 USC § 213a(b)(2)", target := "10 USC § 1034", kind := Incorporates }


def edge_214_savings_otherLaw : Ref :=
  { source := "42 USC § 214(b)", target := "any other provision of law", kind := Savings }


def edge_215_incorporates_213 : Ref :=
  { source := "42 USC § 215(d)", target := "42 USC § 213", kind := Incorporates }
def edge_215_incorporates_204a : Ref :=
  { source := "42 USC § 215(e)", target := "42 USC § 204a", kind := Incorporates }


def edge_217_subjectTo_ucmj : Ref :=
  { source := "42 USC § 217", target := "10 USC § 801 et seq. (UCMJ)", kind := SubjectTo }


def edge_217a_notwithstanding_t5_ch51 : Ref :=
  { source := "42 USC § 217a(a)", target := "5 USC ch. 51", kind := Notwithstanding }
def edge_217a_notwithstanding_t5_ch53 : Ref :=
  { source := "42 USC § 217a(a)", target := "5 USC ch. 53 subch. III", kind := Notwithstanding }
def edge_217a_incorporates_210c : Ref :=
  { source := "42 USC § 217a(b)", target := "42 USC § 210(c)", kind := Incorporates }


def edge_217a1_incorporates_phsa : Ref :=
  { source := "42 USC § 217a-1", target := "42 USC § 201 et seq. (PHS Act)", kind := Incorporates }
def edge_217a1_incorporates_4541 : Ref :=
  { source := "42 USC § 217a-1", target := "42 USC § 4541 et seq.", kind := Incorporates }





structure Coherent211 (c : ComplaintText) : Prop where
  payBase1406   : ReferencedSectionExists edge_211_incorporates_t10_1406 c
  payBase1407   : ReferencedSectionExists edge_211_incorporates_t10_1407 c
  payMult1409   : ReferencedSectionExists edge_211_incorporates_t10_1409 c
  strengthCap   : ReferencedSectionExists edge_211_incorporates_210b c
  oathWaiver    : IncorporationHonored edge_211_incorporates_t5_3332 c


structure Coherent211c (c : ComplaintText) : Prop where
  noDoubleCredit : ExceptionApplies edge_211c_exceptAsProvided_otherLaw c



structure Coherent212 (c : ComplaintText) : Prop where
  payBase1406    : ReferencedSectionExists edge_212_incorporates_t10_1406 c
  payBase1407    : ReferencedSectionExists edge_212_incorporates_t10_1407 c
  payMult1409    : ReferencedSectionExists edge_212_incorporates_t10_1409 c
  basicPay205    : IncorporationHonored edge_212_incorporates_t37_205 c
  s211Formula    : IncorporationHonored edge_212_incorporates_211 c
  s213aRecall    : ReferencedSectionExists edge_212_incorporates_213a c
  disability1208 : ReferencedSectionExists edge_212_incorporates_t10_1208 c
  paraSixCarve   : ExceptionApplies edge_212_exceptAsProvided_212a6 c



structure Coherent213 (c : ComplaintText) : Prop where
  s417Benefit    : ReferencedSectionExists edge_213_incorporates_417 c
  scra3901       : ReferencedSectionExists edge_213_incorporates_t50_3901 c
  subsecBCarve   : ExceptionApplies edge_213_exceptAsProvided_b c
  indemnityCarve : ExceptionApplies edge_213_savings_serviceIndemnity c



structure Coherent213a (c : ComplaintText) : Prop where
  escort1036     : ReferencedSectionExists edge_213a_incorporates_t10_1036 c
  disabilityCh61 : IncorporationHonored edge_213a_incorporates_t10_ch61 c
  nonRegularPay  : IncorporationHonored edge_213a_incorporates_t10_ch1223 c
  claimsCondition : ReferencedSectionExists edge_213a_subjectTo_213 c
  whistleblower1034 : ReferencedSectionExists edge_213a_incorporates_t10_1034 c



structure Coherent214 (c : ComplaintText) : Prop where
  priorFlagBar : ExceptionApplies edge_214_savings_otherLaw c



structure Coherent215 (c : ComplaintText) : Prop where
  benefits213      : IncorporationHonored edge_215_incorporates_213 c
  emergencyDef204a : ReferencedSectionExists edge_215_incorporates_204a c


structure Coherent217 (c : ComplaintText) : Prop where
  ucmjApplies : ReferencedSectionExists edge_217_subjectTo_ucmj c



structure Coherent217a (c : ComplaintText) : Prop where
  overrideCh51 : OverrideTriggered edge_217a_notwithstanding_t5_ch51 c
  overrideCh53 : OverrideTriggered edge_217a_notwithstanding_t5_ch53 c
  compRate210c : IncorporationHonored edge_217a_incorporates_210c c


structure Coherent217a1 (c : ComplaintText) : Prop where
  phsAct     : ReferencedSectionExists edge_217a1_incorporates_phsa c
  alcoholAct : ReferencedSectionExists edge_217a1_incorporates_4541 c

end Proving.USC.T42.Ch6ASchI.Part2.Structure
