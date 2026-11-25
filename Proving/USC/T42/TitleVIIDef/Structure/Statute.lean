










import Proving.USC.Common.Types
import Proving.USC.T42.TitleVIIDef.Structure.Types
import Proving.USC.T42.TitleVIIDef.Structure.Predicates

namespace Proving.USC.T42.TitleVIIDef.Structure

open Proving.USC.Common






def edge_2000e_b_incorporates_t5_2102 : Ref :=
  { source := "42 USC § 2000e(b)", target := "5 USC § 2102", kind := .Incorporates }


def edge_2000e_b_incorporates_t26_501c : Ref :=
  { source := "42 USC § 2000e(b)", target := "26 USC § 501(c)", kind := .Incorporates }


def edge_2000e_e_incorporates_nlra : Ref :=
  { source := "42 USC § 2000e(e)", target := "29 USC § 151 et seq. (NLRA)", kind := .Incorporates }


def edge_2000e_e_incorporates_rla : Ref :=
  { source := "42 USC § 2000e(e)", target := "45 USC § 151 et seq. (RLA)", kind := .Incorporates }


def edge_2000e_h_incorporates_lmrda : Ref :=
  { source := "42 USC § 2000e(h)", target := "29 USC § 401 et seq. (LMRDA)", kind := .Incorporates }


def edge_2000e_i_incorporates_ocsla : Ref :=
  { source := "42 USC § 2000e(i)", target := "43 USC § 1331 et seq. (OCSLA)", kind := .Incorporates }



def edge_2000e_k_overrides_2000e2h : Ref :=
  { source := "42 USC § 2000e(k)", target := "42 USC § 2000e-2(h)", kind := .Notwithstanding }


def edge_2000e_n_incorporates_2000e16 : Ref :=
  { source := "42 USC § 2000e(n)", target := "42 USC § 2000e-16", kind := .Incorporates }





def edge_2000e2_incorporates_defs : Ref :=
  { source := "42 USC § 2000e-2", target := "42 USC § 2000e (Definitions)", kind := .Incorporates }



def edge_2000e2_e_notwithstanding_subchapter : Ref :=
  { source := "42 USC § 2000e-2(e)", target := "42 USC ch21 subch. VI (this subchapter)", kind := .Notwithstanding }



def edge_2000e2_g_notwithstanding_subchapter : Ref :=
  { source := "42 USC § 2000e-2(g)", target := "42 USC ch21 subch. VI (this subchapter)", kind := .Notwithstanding }



def edge_2000e2_h_notwithstanding_subchapter : Ref :=
  { source := "42 USC § 2000e-2(h)", target := "42 USC ch21 subch. VI (this subchapter)", kind := .Notwithstanding }



def edge_2000e2_h_incorporates_t29_206d : Ref :=
  { source := "42 USC § 2000e-2(h)", target := "29 USC § 206(d) (Equal Pay Act)", kind := .Incorporates }


def edge_2000e2_f_incorporates_saca : Ref :=
  { source := "42 USC § 2000e-2(f)", target := "50 USC § 781 et seq. (SACA 1950)", kind := .Incorporates }



def edge_2000e2_k3_incorporates_csa : Ref :=
  { source := "42 USC § 2000e-2(k)(3)", target := "21 USC § 802(6) (Controlled Substances Act)", kind := .Incorporates }


def edge_2000e2_k3_notwithstanding_subchapter : Ref :=
  { source := "42 USC § 2000e-2(k)(3)", target := "42 USC ch21 subch. VI (this subchapter)", kind := .Notwithstanding }


def edge_2000e2_m_exceptAsProvided_subchapter : Ref :=
  { source := "42 USC § 2000e-2(m)", target := "42 USC ch21 subch. VI (this subchapter)", kind := .ExceptAsProvided }



def edge_2000e2_n_notwithstanding_law : Ref :=
  { source := "42 USC § 2000e-2(n)(1)(A)", target := "any other provision of law", kind := .Notwithstanding }



def edge_2000e2_n_exceptAsProvided_para2 : Ref :=
  { source := "42 USC § 2000e-2(n)(1)(A)", target := "42 USC § 2000e-2(n)(2)", kind := .ExceptAsProvided }


def edge_2000e2_n_incorporates_frcp24 : Ref :=
  { source := "42 USC § 2000e-2(n)(2)(A)", target := "Fed. R. Civ. P. 24", kind := .Incorporates }


def edge_2000e2_n_incorporates_t28_1404 : Ref :=
  { source := "42 USC § 2000e-2(n)(3)", target := "28 USC § 1404", kind := .Incorporates }





def edge_2000e3_incorporates_defs : Ref :=
  { source := "42 USC § 2000e-3", target := "42 USC § 2000e (Definitions)", kind := .Incorporates }



def edge_2000e3_a_incorporates_2000e2 : Ref :=
  { source := "42 USC § 2000e-3(a)", target := "42 USC § 2000e-2 (unlawful employment practices)", kind := .Incorporates }




def edge_2000e3_b_exceptAsProvided_bfoq : Ref :=
  { source := "42 USC § 2000e-3(b)", target := "42 USC § 2000e-2(e) (BFOQ)", kind := .ExceptAsProvided }










structure Coherent2000e (c : ComplaintText) : Prop where
  t5Exists      : ReferencedSectionExists edge_2000e_b_incorporates_t5_2102 c
  t5Honored     : IncorporationHonored    edge_2000e_b_incorporates_t5_2102 c
  t26Honored    : IncorporationHonored    edge_2000e_b_incorporates_t26_501c c
  nlraHonored   : IncorporationHonored    edge_2000e_e_incorporates_nlra c
  lmrdaHonored  : IncorporationHonored    edge_2000e_h_incorporates_lmrda c
  ocslaHonored  : IncorporationHonored    edge_2000e_i_incorporates_ocsla c
  e16Exists     : ReferencedSectionExists edge_2000e_n_incorporates_2000e16 c






structure Coherent2000e2 (c : ComplaintText) : Prop where
  defsHonored      : IncorporationHonored    edge_2000e2_incorporates_defs c
  eqPayHonored     : IncorporationHonored    edge_2000e2_h_incorporates_t29_206d c
  csaExists        : ReferencedSectionExists edge_2000e2_k3_incorporates_csa c
  frcp24Exists     : ReferencedSectionExists edge_2000e2_n_incorporates_frcp24 c
  bfoqOverride     : OverrideTriggered       edge_2000e2_e_notwithstanding_subchapter c
  motivatingExcept : ExceptionApplies        edge_2000e2_m_exceptAsProvided_subchapter c




structure Coherent2000e3 (c : ComplaintText) : Prop where
  defsHonored    : IncorporationHonored edge_2000e3_incorporates_defs c
  anchorHonored  : IncorporationHonored edge_2000e3_a_incorporates_2000e2 c
  bfoqException  : ExceptionApplies     edge_2000e3_b_exceptAsProvided_bfoq c






inductive Section2000e2OverrideCoheres (c : ComplaintText) : Prop where
  | viaProvisionOfLaw       (h : OverrideTriggered edge_2000e2_n_notwithstanding_law c)
      : Section2000e2OverrideCoheres c
  | viaProvisionOfSubchapter (h : OverrideTriggered edge_2000e2_h_notwithstanding_subchapter c)
      : Section2000e2OverrideCoheres c

end Proving.USC.T42.TitleVIIDef.Structure
