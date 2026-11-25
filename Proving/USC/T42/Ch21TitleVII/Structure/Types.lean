






















import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Structure


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
  deriving DecidableEq, Repr




def e_s2000e_b_inc_t5s2102 : Ref :=
  ⟨"42 USC § 2000e(b)", "5 USC § 2102", .Incorporates⟩

def e_s2000e_b_inc_t26s501c : Ref :=
  ⟨"42 USC § 2000e(b)", "26 USC § 501(c)", .Incorporates⟩

def e_s2000e_a_inc_t11 : Ref :=
  ⟨"42 USC § 2000e(a)", "11 USC (cases under title 11)", .Incorporates⟩

def e_s2000e_e_inc_nlra : Ref :=
  ⟨"42 USC § 2000e(e)(1)", "29 USC § 151 et seq.", .Incorporates⟩

def e_s2000e_e_inc_rla : Ref :=
  ⟨"42 USC § 2000e(e)(1)", "45 USC § 151 et seq.", .Incorporates⟩

def e_s2000e_h_inc_lmrda : Ref :=
  ⟨"42 USC § 2000e(h)", "29 USC § 401 et seq.", .Incorporates⟩

def e_s2000e_i_inc_ocsla : Ref :=
  ⟨"42 USC § 2000e(i)", "43 USC § 1331 et seq.", .Incorporates⟩


def e_s2000e_k_notw_s2000e2h : Ref :=
  ⟨"42 USC § 2000e(k)", "42 USC § 2000e-2(h)", .Notwithstanding⟩

def e_s2000e_n_inc_s2000e16 : Ref :=
  ⟨"42 USC § 2000e(n)", "42 USC § 2000e-16", .Incorporates⟩




def e_s2000e1_b_inc_s2000e2 : Ref :=
  ⟨"42 USC § 2000e-1(b)", "42 USC § 2000e-2", .Incorporates⟩

def e_s2000e1_b_inc_s2000e3 : Ref :=
  ⟨"42 USC § 2000e-1(b)", "42 USC § 2000e-3", .Incorporates⟩


def e_s2000e1_c1_inc_s2000e2 : Ref :=
  ⟨"42 USC § 2000e-1(c)(1)", "42 USC § 2000e-2", .Incorporates⟩

def e_s2000e2_exc_s2000e1a : Ref :=
  ⟨"42 USC § 2000e-2", "42 USC § 2000e-1(a)", .ExceptAsProvided⟩

def e_s2000e2_exc_s2000e1b : Ref :=
  ⟨"42 USC § 2000e-2", "42 USC § 2000e-1(b)", .ExceptAsProvided⟩

def e_s2000e3_exc_s2000e1 : Ref :=
  ⟨"42 USC § 2000e-3", "42 USC § 2000e-1", .ExceptAsProvided⟩






def e_s2000e2_inc_s2000e : Ref :=
  ⟨"42 USC § 2000e-2", "42 USC § 2000e", .Incorporates⟩

def e_s2000e2_k1_inc_s2000e_m : Ref :=
  ⟨"42 USC § 2000e-2(k)(1)", "42 USC § 2000e(m)", .Incorporates⟩

def e_s2000e2_e_notw_subch : Ref :=
  ⟨"42 USC § 2000e-2(e)", "42 USC § 2000e et seq. (subchapter VI)", .Notwithstanding⟩

def e_s2000e2_g_notw_subch : Ref :=
  ⟨"42 USC § 2000e-2(g)", "42 USC § 2000e et seq. (subchapter VI)", .Notwithstanding⟩


def e_s2000e2_g_inc_securityprogram : Ref :=
  ⟨"42 USC § 2000e-2(g)(1)", "any Federal national-security program statute or Executive order", .Incorporates⟩

def e_s2000e2_h_notw_subch : Ref :=
  ⟨"42 USC § 2000e-2(h)", "42 USC § 2000e et seq. (subchapter VI)", .Notwithstanding⟩


def e_s2000e2_h_inc_t29s206d : Ref :=
  ⟨"42 USC § 2000e-2(h)", "29 USC § 206(d)", .Incorporates⟩

def e_s2000e2_f_inc_saca : Ref :=
  ⟨"42 USC § 2000e-2(f)", "50 USC § 781 et seq.", .Incorporates⟩

def e_s2000e2_exc_s2000e2f : Ref :=
  ⟨"42 USC § 2000e-2", "42 USC § 2000e-2(f)", .ExceptAsProvided⟩

def e_s2000e2_exc_s2000e2i : Ref :=
  ⟨"42 USC § 2000e-2", "42 USC § 2000e-2(i)", .ExceptAsProvided⟩


def e_s2000e2_j_constr_subch : Ref :=
  ⟨"42 USC § 2000e-2(j)", "42 USC § 2000e et seq. (subchapter VI)", .ExceptAsProvided⟩



def e_s2000e2_k1C_inc_priorlaw : Ref :=
  ⟨"42 USC § 2000e-2(k)(1)(C)", "law as it existed on June 4, 1989 ('alternative employment practice')", .Incorporates⟩


def e_s2000e2_k3_inc_csa : Ref :=
  ⟨"42 USC § 2000e-2(k)(3)", "21 USC § 802(6)", .Incorporates⟩

def e_s2000e2_k3_notw_subch : Ref :=
  ⟨"42 USC § 2000e-2(k)(3)", "42 USC § 2000e et seq. (subchapter VI)", .Notwithstanding⟩

def e_s2000e2_m_exc_subch : Ref :=
  ⟨"42 USC § 2000e-2(m)", "42 USC § 2000e et seq. (subchapter VI)", .ExceptAsProvided⟩

def e_s2000e2_n1_notw_law : Ref :=
  ⟨"42 USC § 2000e-2(n)(1)(A)", "any other provision of law", .Notwithstanding⟩

def e_s2000e2_n1_exc_n2 : Ref :=
  ⟨"42 USC § 2000e-2(n)(1)", "42 USC § 2000e-2(n)(2)", .ExceptAsProvided⟩


def e_s2000e2_n2_inc_frcp24 : Ref :=
  ⟨"42 USC § 2000e-2(n)(2)(A)", "Fed. R. Civ. P. 24", .Incorporates⟩

def e_s2000e2_n3_inc_t28s1404 : Ref :=
  ⟨"42 USC § 2000e-2(n)(3)", "28 USC § 1404", .Incorporates⟩




def e_s2000e3_inc_s2000e : Ref :=
  ⟨"42 USC § 2000e-3", "42 USC § 2000e", .Incorporates⟩

def e_s2000e3_a_inc_s2000e2 : Ref :=
  ⟨"42 USC § 2000e-3(a)", "42 USC § 2000e-2", .Incorporates⟩

def e_s2000e3_a_inc_s2000e5 : Ref :=
  ⟨"42 USC § 2000e-3(a)", "42 USC § 2000e-5", .Incorporates⟩

def e_s2000e3_b_inc_s2000e2e : Ref :=
  ⟨"42 USC § 2000e-3(b)", "42 USC § 2000e-2(e)", .Incorporates⟩





def e_s2000e4_a_inc_t5civilservice : Ref :=
  ⟨"42 USC § 2000e-4(a)", "5 USC ch. 51; 5 USC ch. 53 subch. III; 5 USC §§ 3105, 3344, 5372, 7521", .Incorporates⟩

def e_s2000e4_b1_inc_s2000e5 : Ref :=
  ⟨"42 USC § 2000e-4(b)(1)", "42 USC § 2000e-5", .Incorporates⟩

def e_s2000e4_b1_inc_s2000e6 : Ref :=
  ⟨"42 USC § 2000e-4(b)(1)", "42 USC § 2000e-6", .Incorporates⟩

def e_s2000e4_g6_inc_s2000e5 : Ref :=
  ⟨"42 USC § 2000e-4(g)(6)", "42 USC § 2000e-5", .Incorporates⟩



def e_s2000e4_i_inc_t5s7324 : Ref :=
  ⟨"42 USC § 2000e-4(i)", "5 USC § 7324", .Incorporates⟩

def e_s2000e4_i_notw_t5s7324exempt : Ref :=
  ⟨"42 USC § 2000e-4(i)", "5 USC § 7324 (exemptions)", .Notwithstanding⟩




def e_s2000e5_a_inc_s2000e2 : Ref :=
  ⟨"42 USC § 2000e-5(a)", "42 USC § 2000e-2", .Incorporates⟩

def e_s2000e5_a_inc_s2000e3 : Ref :=
  ⟨"42 USC § 2000e-5(a)", "42 USC § 2000e-3", .Incorporates⟩

def e_s2000e5_inc_s2000e : Ref :=
  ⟨"42 USC § 2000e-5", "42 USC § 2000e", .Incorporates⟩



def e_s2000e5_b_sub_cd : Ref :=
  ⟨"42 USC § 2000e-5(b)", "42 USC § 2000e-5(c), (d)", .SubjectTo⟩




def e_s2000e5_c_inc_s2000e5b : Ref :=
  ⟨"42 USC § 2000e-5(c)", "42 USC § 2000e-5(b)", .Incorporates⟩

def e_s2000e5_e3B_inc_s1981a : Ref :=
  ⟨"42 USC § 2000e-5(e)(3)(B)", "42 USC § 1981a", .Incorporates⟩


def e_s2000e5_f2_inc_frcp65 : Ref :=
  ⟨"42 USC § 2000e-5(f)(2)", "Fed. R. Civ. P. 65", .Incorporates⟩

def e_s2000e5_f3_inc_t28s1404_1406 : Ref :=
  ⟨"42 USC § 2000e-5(f)(3)", "28 USC §§ 1404, 1406", .Incorporates⟩


def e_s2000e5_f5_inc_frcp53 : Ref :=
  ⟨"42 USC § 2000e-5(f)(5)", "Fed. R. Civ. P. 53", .Incorporates⟩

def e_s2000e5_g2A_inc_s2000e3a : Ref :=
  ⟨"42 USC § 2000e-5(g)(2)(A)", "42 USC § 2000e-3(a)", .Incorporates⟩


def e_s2000e5_g2B_inc_s2000e2m : Ref :=
  ⟨"42 USC § 2000e-5(g)(2)(B)", "42 USC § 2000e-2(m)", .Incorporates⟩


def e_s2000e5_h_notw_t29ch6 : Ref :=
  ⟨"42 USC § 2000e-5(h)", "29 USC ch. 6", .Notwithstanding⟩

def e_s2000e5_j_inc_t28s1291_1292 : Ref :=
  ⟨"42 USC § 2000e-5(j)", "28 USC §§ 1291, 1292", .Incorporates⟩





def e_s2000e6_a_inc_subch : Ref :=
  ⟨"42 USC § 2000e-6(a)", "42 USC § 2000e et seq. (subchapter VI)", .Incorporates⟩


def e_s2000e6_c_inc_t5ch9 : Ref :=
  ⟨"42 USC § 2000e-6(c)", "5 USC ch. 9", .Incorporates⟩

def e_s2000e6_d_inc_s2000e6c : Ref :=
  ⟨"42 USC § 2000e-6(d)", "42 USC § 2000e-6(c)", .Incorporates⟩


def e_s2000e6_e_sub_s2000e5 : Ref :=
  ⟨"42 USC § 2000e-6(e)", "42 USC § 2000e-5", .SubjectTo⟩






def e_s2000e7_sav_statelaw : Ref :=
  ⟨"42 USC § 2000e-7", "State or political-subdivision law", .Savings⟩



def e_s2000e7_constr_s2000e2 : Ref :=
  ⟨"42 USC § 2000e-7", "42 USC § 2000e-2", .ExceptAsProvided⟩





def e_s2000e8_a_inc_s2000e5 : Ref :=
  ⟨"42 USC § 2000e-8(a)", "42 USC § 2000e-5", .Incorporates⟩


def e_s2000e8_b_notw_law : Ref :=
  ⟨"42 USC § 2000e-8(b)", "any other provision of law", .Notwithstanding⟩

def e_s2000e8_d_inc_s2000e8c : Ref :=
  ⟨"42 USC § 2000e-8(d)", "42 USC § 2000e-8(c)", .Incorporates⟩




def e_s2000e9_inc_t29s161 : Ref :=
  ⟨"42 USC § 2000e-9", "29 USC § 161", .Incorporates⟩





def e_s2000e10_a_inc_subch : Ref :=
  ⟨"42 USC § 2000e-10(a)", "42 USC § 2000e et seq. (subchapter VI)", .Incorporates⟩

def e_s2000e10_a_inc_s2000e5 : Ref :=
  ⟨"42 USC § 2000e-10(a)", "42 USC § 2000e-5", .Incorporates⟩





def e_s2000e11_sav_veterans : Ref :=
  ⟨"42 USC § 2000e-11", "Federal, State, territorial, or local veterans'-preference law", .Savings⟩





def e_s2000e12_a_sub_apa : Ref :=
  ⟨"42 USC § 2000e-12(a)", "5 USC ch. 5, subch. II", .SubjectTo⟩


def e_s2000e12_b_exc_subch : Ref :=
  ⟨"42 USC § 2000e et seq. (subchapter VI)", "42 USC § 2000e-12(b)", .ExceptAsProvided⟩





def e_s2000e13_inc_t18s111_1114 : Ref :=
  ⟨"42 USC § 2000e-13", "18 USC §§ 111, 1114", .Incorporates⟩



def e_s2000e13_notw_t18s1114 : Ref :=
  ⟨"42 USC § 2000e-13", "18 USC § 1114", .Notwithstanding⟩





def e_s2000e14_inc_eeolaws : Ref :=
  ⟨"42 USC § 2000e-14", "Federal equal employment opportunity legislation, orders, and policies", .Incorporates⟩





def e_s2000e15_inc_subch : Ref :=
  ⟨"42 USC § 2000e-15", "42 USC § 2000e et seq. (subchapter VI)", .Incorporates⟩




def e_s2000e16_a_inc_t5s102 : Ref :=
  ⟨"42 USC § 2000e-16(a)", "5 USC § 102", .Incorporates⟩

def e_s2000e16_a_inc_t5s105 : Ref :=
  ⟨"42 USC § 2000e-16(a)", "5 USC § 105", .Incorporates⟩


def e_s2000e16_c_inc_s2000e5 : Ref :=
  ⟨"42 USC § 2000e-16(c)", "42 USC § 2000e-5", .Incorporates⟩


def e_s2000e16_c_inc_eo11478 : Ref :=
  ⟨"42 USC § 2000e-16(c)", "Exec. Order No. 11478 (and successors)", .Incorporates⟩


def e_s2000e16_d_sub_s2000e5fk : Ref :=
  ⟨"42 USC § 2000e-16(d)", "42 USC § 2000e-5(f)–(k)", .SubjectTo⟩



def e_s2000e16_e_sav_agencyduty : Ref :=
  ⟨"42 USC § 2000e-16(e)", "Constitution, other statutes, and Exec. Order No. 11478 agency duties", .Savings⟩


def e_s2000e16_f_inc_s2000e5e3 : Ref :=
  ⟨"42 USC § 2000e-16(f)", "42 USC § 2000e-5(e)(3)", .Incorporates⟩






def e_s2000e16a_c_inc_s2000e16b : Ref :=
  ⟨"42 USC § 2000e-16a(c)", "42 USC § 2000e-16b(a)", .Incorporates⟩






def e_s2000e16b_a_inc_t2s1219 : Ref :=
  ⟨"42 USC § 2000e-16b(a)", "2 USC § 1219", .Incorporates⟩

def e_s2000e16b_a_inc_s2000e16c : Ref :=
  ⟨"42 USC § 2000e-16b(a)", "42 USC § 2000e-16c", .Incorporates⟩


def e_s2000e16b_a1_inc_s2000e16 : Ref :=
  ⟨"42 USC § 2000e-16b(a)(1)", "42 USC § 2000e-16", .Incorporates⟩

def e_s2000e16b_a2_inc_t29s633a : Ref :=
  ⟨"42 USC § 2000e-16b(a)(2)", "29 USC § 633a", .Incorporates⟩

def e_s2000e16b_a3_inc_t29s791 : Ref :=
  ⟨"42 USC § 2000e-16b(a)(3)", "29 USC § 791", .Incorporates⟩

def e_s2000e16b_a3_inc_ada : Ref :=
  ⟨"42 USC § 2000e-16b(a)(3)", "42 USC §§ 12112–12114", .Incorporates⟩


def e_s2000e16b_b1_inc_remedies : Ref :=
  ⟨"42 USC § 2000e-16b(b)(1)", "42 USC §§ 2000e-5(g), 2000e-5(k), 2000e-16(d)", .Incorporates⟩


def e_s2000e16b_b1_inc_s1981 : Ref :=
  ⟨"42 USC § 2000e-16b(b)(1)", "42 USC § 1981; 42 USC §§ 1981a(a), 1981a(b)(2)", .Incorporates⟩


def e_s2000e16b_b2_inc_t29s633ac : Ref :=
  ⟨"42 USC § 2000e-16b(b)(2)", "29 USC § 633a(c)", .Incorporates⟩





def e_s2000e16c_a_inc_s2000e16b : Ref :=
  ⟨"42 USC § 2000e-16c(a)", "42 USC § 2000e-16b", .Incorporates⟩


def e_s2000e16c_b1_sub_t5s554_557 : Ref :=
  ⟨"42 USC § 2000e-16c(b)(1)", "5 USC §§ 554–557", .SubjectTo⟩



def e_s2000e16c_b2_sub_s2000e5d : Ref :=
  ⟨"42 USC § 2000e-16c(b)(2)", "42 USC § 2000e-5(d)", .SubjectTo⟩

def e_s2000e16c_c_inc_t28ch158 : Ref :=
  ⟨"42 USC § 2000e-16c(c)", "28 USC ch. 158", .Incorporates⟩




def e_s2000e16c_e_inc_s2000e5k : Ref :=
  ⟨"42 USC § 2000e-16c(e)", "42 USC § 2000e-5(k)", .Incorporates⟩





def e_s2000e17_inc_t5s554 : Ref :=
  ⟨"42 USC § 2000e-17", "5 USC § 554 et seq.", .Incorporates⟩


def e_s2000e17_lexspec_eeolaw : Ref :=
  ⟨"42 USC § 2000e-17", "any equal employment opportunity law or order", .LexSpecialis⟩


def e_s2000e17_constr_deviation : Ref :=
  ⟨"42 USC § 2000e-17", "42 USC § 2000e-17 (substantial-deviation proviso)", .ExceptAsProvided⟩





def chain_s2000e16c_to_s2000e5 : List Ref :=
  [e_s2000e16c_a_inc_s2000e16b, e_s2000e16b_a1_inc_s2000e16, e_s2000e16_d_sub_s2000e5fk]


def chain_s2000e3_to_s2000e : List Ref :=
  [e_s2000e3_a_inc_s2000e2, e_s2000e2_inc_s2000e]

end Proving.USC.T42.Ch21TitleVII.Structure
