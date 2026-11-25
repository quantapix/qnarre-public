












import Proving.USC.T42.Ch6ASchI.Part3.Structure.Predicates

namespace Proving.USC.T42.Ch6ASchI.Part3.Structure
open Proving.USC.Common




def edge_218_incorporates_254b : Ref :=
  { source := "42 USC § 218", target := "42 USC § 254b", kind := .Incorporates }

def edge_218_notwithstanding_t5_1013a : Ref :=
  { source := "42 USC § 218(d)", target := "5 USC § 1013(a)", kind := .Notwithstanding }



structure Coherent218 (c : ComplaintText) : Prop where
  grantProgram : IncorporationHonored edge_218_incorporates_254b c
  t5Override   : OverrideTriggered edge_218_notwithstanding_t5_1013a c




def edge_218a_incorporates_213 : Ref :=
  { source := "42 USC § 218a(c)", target := "42 USC § 213", kind := .Incorporates }

def edge_218a_incorporates_233 : Ref :=
  { source := "42 USC § 218a(c)", target := "42 USC § 233", kind := .Incorporates }


structure Coherent218a (c : ComplaintText) : Prop where
  benefits213 : IncorporationHonored edge_218a_incorporates_213 c
  benefits233 : IncorporationHonored edge_218a_incorporates_233 c




def edge_233_incorporates_t28_1346b : Ref :=
  { source := "42 USC § 233(a)", target := "28 USC § 1346(b)", kind := .Incorporates }

def edge_233_incorporates_t28_2672 : Ref :=
  { source := "42 USC § 233(a)", target := "28 USC § 2672", kind := .Incorporates }

def edge_233_incorporates_t28_2677 : Ref :=
  { source := "42 USC § 233(d)", target := "28 USC § 2677", kind := .Incorporates }


def edge_233_notwithstanding_t28_2680h : Ref :=
  { source := "42 USC § 233(e)", target := "28 USC § 2680(h)", kind := .Notwithstanding }

def edge_233_incorporates_t28_2679b : Ref :=
  { source := "42 USC § 233(f)", target := "28 USC § 2679(b)", kind := .Incorporates }

def edge_233_incorporates_t28_ch171 : Ref :=
  { source := "42 USC § 233(k)(1)", target := "28 USC ch. 171", kind := .Incorporates }

def edge_233_incorporates_254b : Ref :=
  { source := "42 USC § 233(g)(4)", target := "42 USC § 254b", kind := .Incorporates }

def edge_233_incorporates_256a : Ref :=
  { source := "42 USC § 233(g)(1)(G)", target := "42 USC § 256a", kind := .Incorporates }

def edge_233_incorporates_254h : Ref :=
  { source := "42 USC § 233(j)", target := "42 USC § 254h(e)", kind := .Incorporates }

def edge_233_incorporates_ssa_1395 : Ref :=
  { source := "42 USC § 233(m)(2)", target := "42 USC § 1395 et seq.", kind := .Incorporates }


def edge_233_incorporates_partC : Ref :=
  { source := "42 USC § 233(p)", target := "42 USC § 239 et seq.", kind := .Incorporates }


def edge_233_exceptAsProvided_partC : Ref :=
  { source := "42 USC § 233(p)(3)(B)", target := "42 USC § 239 et seq.", kind := .ExceptAsProvided }





structure Coherent233 (c : ComplaintText) : Prop where
  ftcaRemedy      : IncorporationHonored edge_233_incorporates_t28_1346b c
  adminRemedy     : IncorporationHonored edge_233_incorporates_t28_2672 c
  paymentRegime   : IncorporationHonored edge_233_incorporates_t28_ch171 c
  intentionalTort : OverrideTriggered edge_233_notwithstanding_t28_2680h c
  partCException  : ExceptionApplies edge_233_exceptAsProvided_partC c




def edge_234_incorporates_300hh15 : Ref :=
  { source := "42 USC § 234(a)", target := "42 USC § 300hh-15", kind := .Incorporates }

def edge_234_incorporates_247d7b : Ref :=
  { source := "42 USC § 234(a)", target := "42 USC § 247d-7b", kind := .Incorporates }

def edge_234_incorporates_247d : Ref :=
  { source := "42 USC § 234(a)(1)(A)", target := "42 USC § 247d(a)", kind := .Incorporates }

def edge_234_incorporates_5170 : Ref :=
  { source := "42 USC § 234(a)(1)(B)", target := "42 USC § 5170", kind := .Incorporates }

def edge_234_incorporates_t50_1621 : Ref :=
  { source := "42 USC § 234(a)(1)(B)", target := "50 USC § 1621", kind := .Incorporates }


def edge_234_savings_vpa : Ref :=
  { source := "42 USC § 234(b)", target := "42 USC § 14501 et seq.", kind := .Savings }

def edge_234_lexSpecialis_stateLaw : Ref :=
  { source := "42 USC § 234(c)", target := "State liability law", kind := .LexSpecialis }




structure Coherent234 (c : ComplaintText) : Prop where
  mrcRegistry   : IncorporationHonored edge_234_incorporates_300hh15 c
  esarRegistry  : IncorporationHonored edge_234_incorporates_247d7b c
  emergencyDecl : IncorporationHonored edge_234_incorporates_247d c
  vpaSavings    : SavingsPreserved edge_234_savings_vpa c
  statePreempt  : ReferencedSectionExists edge_234_lexSpecialis_stateLaw c




def edge_235_incorporates_246 : Ref :=
  { source := "42 USC § 235", target := "42 USC § 246", kind := .Incorporates }

def edge_235_incorporates_242b : Ref :=
  { source := "42 USC § 235", target := "42 USC § 242b", kind := .Incorporates }


def edge_235_savings_otherLaw : Ref :=
  { source := "42 USC § 235", target := "requirements imposed by law", kind := .Savings }



structure Coherent235 (c : ComplaintText) : Prop where
  grantPrograms : IncorporationHonored edge_235_incorporates_246 c
  lawSavings    : SavingsPreserved edge_235_savings_otherLaw c




def edge_236_incorporates_t21_360aa : Ref :=
  { source := "42 USC § 236(c)(1)(A)", target := "21 USC § 360aa et seq.", kind := .Incorporates }

def edge_236_incorporates_t21_355 : Ref :=
  { source := "42 USC § 236(c)(5)", target := "21 USC § 355", kind := .Incorporates }

def edge_236_incorporates_262 : Ref :=
  { source := "42 USC § 236(c)(5)", target := "42 USC § 262", kind := .Incorporates }

def edge_236_incorporates_t21_360bb : Ref :=
  { source := "42 USC § 236(e)(1)", target := "21 USC § 360bb", kind := .Incorporates }



structure Coherent236 (c : ComplaintText) : Prop where
  fdcaOrphan   : IncorporationHonored edge_236_incorporates_t21_360aa c
  fdcaApproval : IncorporationHonored edge_236_incorporates_t21_355 c
  biologics262 : IncorporationHonored edge_236_incorporates_262 c





def edge_237_notwithstanding_t5_appt : Ref :=
  { source := "42 USC § 237(b)", target := "5 USC (appointment provisions)", kind := .Notwithstanding }

def edge_237_incorporates_t3_102 : Ref :=
  { source := "42 USC § 237(d)(2)", target := "3 USC § 102", kind := .Incorporates }



structure Coherent237 (c : ComplaintText) : Prop where
  t5Override : OverrideTriggered edge_237_notwithstanding_t5_appt c
  payCeiling : IncorporationHonored edge_237_incorporates_t3_102 c





def edge_238a_exceptAsProvided_249a : Ref :=
  { source := "42 USC § 238a", target := "42 USC § 249(a)", kind := .ExceptAsProvided }


structure Coherent238a (c : ComplaintText) : Prop where
  entitlementCarveout : ExceptionApplies edge_238a_exceptAsProvided_249a c





def edge_238d_incorporates_9511 : Ref :=
  { source := "42 USC § 238d", target := "42 USC § 9511 et seq.", kind := .Incorporates }


structure Coherent238d (c : ComplaintText) : Prop where
  mhsaFunds : IncorporationHonored edge_238d_incorporates_9511 c




def edge_238e_incorporates_203 : Ref :=
  { source := "42 USC § 238e", target := "42 USC § 203", kind := .Incorporates }


structure Coherent238e (c : ComplaintText) : Prop where
  reorg203 : IncorporationHonored edge_238e_incorporates_203 c





def edge_238l_incorporates_cmhca_2689 : Ref :=
  { source := "42 USC § 238l(a)", target := "42 USC § 2689 et seq.", kind := .Incorporates }


def edge_238l_incorporates_2689j : Ref :=
  { source := "42 USC § 238l(a)(1)(A)", target := "42 USC § 2689j", kind := .Incorporates }



structure Coherent238l (c : ComplaintText) : Prop where
  cmhcaFunds   : IncorporationHonored edge_238l_incorporates_cmhca_2689 c
  transferTest : IncorporationHonored edge_238l_incorporates_2689j c




def edge_238m_incorporates_247d : Ref :=
  { source := "42 USC § 238m(a)(1)(B)", target := "42 USC § 247d", kind := .Incorporates }


def edge_238m_notwithstanding_t41_6101 : Ref :=
  { source := "42 USC § 238m(b)(1)", target := "41 USC § 6101", kind := .Notwithstanding }

def edge_238m_incorporates_1395u : Ref :=
  { source := "42 USC § 238m(d)", target := "42 USC § 1395u", kind := .Incorporates }


def edge_238m_incorporates_t25_5321 : Ref :=
  { source := "42 USC § 238m(e)", target := "25 USC § 5321 et seq.", kind := .Incorporates }



structure Coherent238m (c : ComplaintText) : Prop where
  carrierRegime : IncorporationHonored edge_238m_incorporates_1395u c
  isdaAuthority : IncorporationHonored edge_238m_incorporates_t25_5321 c
  competitionWaiver : OverrideTriggered edge_238m_notwithstanding_t41_6101 c

end Proving.USC.T42.Ch6ASchI.Part3.Structure
