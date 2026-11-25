














import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch21Core.Structure

open Proving.USC.Common





abbrev Cite := String






inductive EdgeKind

  | Incorporates

  | SubjectTo

  | Notwithstanding

  | ExceptAsProvided

  | Savings

  | LexSpecialis


structure Ref where
  source : Cite
  target : Cite
  kind   : EdgeKind




def edge_1981b_defScope_1981 : Ref :=
  { source := "42 USC § 1981(b)", target := "42 USC § 1981", kind := .Incorporates }



def edge_1981a_a1_inc_2000e5 : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 2000e-5", kind := .Incorporates }
def edge_1981a_a1_inc_2000e16 : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 2000e-16", kind := .Incorporates }
def edge_1981a_a1_inc_2000e2 : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 2000e-2", kind := .Incorporates }
def edge_1981a_a1_inc_2000e3 : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 2000e-3", kind := .Incorporates }
def edge_1981a_a1_inc_2000e5g : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 2000e-5(g)", kind := .Incorporates }


def edge_1981a_a1_subjectTo_1981 : Ref :=
  { source := "42 USC § 1981a(a)(1)", target := "42 USC § 1981", kind := .SubjectTo }
def edge_1981a_a2_inc_12117a : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "42 USC § 12117(a)", kind := .Incorporates }
def edge_1981a_a2_inc_29_794a : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "29 USC § 794a(a)(1)", kind := .Incorporates }
def edge_1981a_a2_inc_29_791 : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "29 USC § 791", kind := .Incorporates }
def edge_1981a_a2_inc_12112 : Ref :=
  { source := "42 USC § 1981a(a)(2)", target := "42 USC § 12112", kind := .Incorporates }


def edge_1981a_a3_exc_12112b5 : Ref :=
  { source := "42 USC § 1981a(a)", target := "42 USC § 12112(b)(5)", kind := .ExceptAsProvided }

def edge_1981a_b2_exc_2000e5g : Ref :=
  { source := "42 USC § 1981a(b)", target := "42 USC § 2000e-5(g)", kind := .ExceptAsProvided }


def edge_1981a_b4_savings_1981 : Ref :=
  { source := "42 USC § 1981a(b)(4)", target := "42 USC § 1981", kind := .Savings }
def edge_1981a_d1A_inc_2000e : Ref :=
  { source := "42 USC § 1981a(d)(1)(A)", target := "42 USC § 2000e", kind := .Incorporates }
def edge_1981a_d1B_inc_12111 : Ref :=
  { source := "42 USC § 1981a(d)(1)(B)", target := "42 USC § 12111", kind := .Incorporates }
def edge_1981a_d1B_inc_29_794a : Ref :=
  { source := "42 USC § 1981a(d)(1)(B)", target := "29 USC § 794a(a)(1)", kind := .Incorporates }










def edge_1983_inc_constitutionAndLaws : Ref :=
  { source := "42 USC § 1983",
    target := "U.S. Const.; laws of the United States (unenumerated)",
    kind := .Incorporates }


def edge_1983_inc_dcActs : Ref :=
  { source := "42 USC § 1983",
    target := "Acts of Congress applicable exclusively to the District of Columbia",
    kind := .Incorporates }



def edge_1983_exc_judicialOfficer : Ref :=
  { source := "42 USC § 1983",
    target := "42 USC § 1983 (judicial-officer injunctive-relief proviso)",
    kind := .ExceptAsProvided }

def edge_1983_subjectTo_1997e_a : Ref :=
  { source := "42 USC § 1983", target := "42 USC § 1997e(a)", kind := .SubjectTo }

def edge_1983_subjectTo_1997e_c : Ref :=
  { source := "42 USC § 1983", target := "42 USC § 1997e(c)", kind := .SubjectTo }


def edge_1983_subjectTo_1997e_f : Ref :=
  { source := "42 USC § 1983", target := "42 USC § 1997e(f)", kind := .SubjectTo }





def edge_1985_3_inc_1985_1 : Ref :=
  { source := "42 USC § 1985(3)", target := "42 USC § 1985(1)", kind := .Incorporates }

def edge_1985_3_inc_1985_2 : Ref :=
  { source := "42 USC § 1985(3)", target := "42 USC § 1985(2)", kind := .Incorporates }






def edge_1986_inc_1985 : Ref :=
  { source := "42 USC § 1986", target := "42 USC § 1985", kind := .Incorporates }


def edge_1986_exc_oneYear : Ref :=
  { source := "42 USC § 1986",
    target := "42 USC § 1986 (one-year limitations proviso)",
    kind := .ExceptAsProvided }



def edge_1988_a_inc_rsTitles : Ref :=
  { source := "42 USC § 1988(a)",
    target := "Rev. Stat. titles 13, 24, and 70 (district-court civil-rights jurisdiction)",
    kind := .Incorporates }


def edge_1988_a_lexSpecialis_usLaws : Ref :=
  { source := "42 USC § 1988(a)",
    target := "laws of the United States (unenumerated)",
    kind := .LexSpecialis }
def edge_1988_a_inc_stateCommonLaw : Ref :=
  { source := "42 USC § 1988(a)",
    target := "common law of the forum State, as modified by its constitution and statutes",
    kind := .Incorporates }


def edge_1988_a_subjectTo_usConstAndLaws : Ref :=
  { source := "42 USC § 1988(a)",
    target := "U.S. Const.; laws of the United States (unenumerated)",
    kind := .SubjectTo }

def edge_1988_b_inc_1981 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1981", kind := .Incorporates }
def edge_1988_b_inc_1981a : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1981a", kind := .Incorporates }
def edge_1988_b_inc_1982 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1982", kind := .Incorporates }
def edge_1988_b_inc_1983 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1983", kind := .Incorporates }
def edge_1988_b_inc_1985 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1985", kind := .Incorporates }
def edge_1988_b_inc_1986 : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 1986", kind := .Incorporates }
def edge_1988_b_inc_20_1681 : Ref :=
  { source := "42 USC § 1988(b)", target := "20 USC § 1681", kind := .Incorporates }
def edge_1988_b_inc_2000bb : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 2000bb", kind := .Incorporates }
def edge_1988_b_inc_2000cc : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 2000cc", kind := .Incorporates }
def edge_1988_b_inc_2000d : Ref :=
  { source := "42 USC § 1988(b)", target := "42 USC § 2000d", kind := .Incorporates }
def edge_1988_b_inc_34_12361 : Ref :=
  { source := "42 USC § 1988(b)", target := "34 USC § 12361", kind := .Incorporates }


def edge_1988_b_exc_judicialOfficer : Ref :=
  { source := "42 USC § 1988(b)",
    target := "42 USC § 1988(b) (judicial-officer costs proviso)",
    kind := .ExceptAsProvided }
def edge_1988_c_inc_1981 : Ref :=
  { source := "42 USC § 1988(c)", target := "42 USC § 1981", kind := .Incorporates }
def edge_1988_c_inc_1981a : Ref :=
  { source := "42 USC § 1988(c)", target := "42 USC § 1981a", kind := .Incorporates }

def edge_1988_c_subjectTo_1988_b : Ref :=
  { source := "42 USC § 1988(c)", target := "42 USC § 1988(b)", kind := .SubjectTo }

def edge_1988_subjectTo_1997e_d : Ref :=
  { source := "42 USC § 1988", target := "42 USC § 1997e(d)", kind := .SubjectTo }




def edge_subchapter_inc_1997 : Ref :=
  { source := "42 USC ch. 21, subch. III (§§ 1997–1997j)",
    target := "42 USC § 1997", kind := .Incorporates }


def edge_1997_1_exc_1997_2 : Ref :=
  { source := "42 USC § 1997(1)", target := "42 USC § 1997(2)", kind := .ExceptAsProvided }
def edge_1997_2_inc_ssa_1381 : Ref :=
  { source := "42 USC § 1997(2)", target := "42 USC § 1381 et seq.", kind := .Incorporates }
def edge_1997_2_inc_ssa_1395 : Ref :=
  { source := "42 USC § 1997(2)", target := "42 USC § 1395 et seq.", kind := .Incorporates }
def edge_1997_2_inc_ssa_1396 : Ref :=
  { source := "42 USC § 1997(2)", target := "42 USC § 1396 et seq.", kind := .Incorporates }



def edge_1997a_a_inc_1997 : Ref :=
  { source := "42 USC § 1997a(a)", target := "42 USC § 1997", kind := .Incorporates }



def edge_1997a_a_exc_1997_1Bii : Ref :=
  { source := "42 USC § 1997a(a)", target := "42 USC § 1997(1)(B)(ii)",
    kind := .ExceptAsProvided }

def edge_1997a_subjectTo_1997b : Ref :=
  { source := "42 USC § 1997a", target := "42 USC § 1997b", kind := .SubjectTo }


def edge_1997a_subjectTo_1997h : Ref :=
  { source := "42 USC § 1997a", target := "42 USC § 1997h", kind := .SubjectTo }


def edge_1997a_exc_1997e_b : Ref :=
  { source := "42 USC § 1997a", target := "42 USC § 1997e(b)", kind := .ExceptAsProvided }



def edge_1997a1_a_inc_1997 : Ref :=
  { source := "42 USC § 1997a-1(a)", target := "42 USC § 1997", kind := .Incorporates }

def edge_1997a1_a_inc_subchapter : Ref :=
  { source := "42 USC § 1997a-1(a)",
    target := "42 USC ch. 21, subch. III (§§ 1997–1997j)", kind := .Incorporates }


def edge_1997a1_c_exc_useRestriction : Ref :=
  { source := "42 USC § 1997a-1",
    target := "42 USC § 1997a-1(c) (use, transmission, and redaction restrictions)",
    kind := .ExceptAsProvided }



def edge_1997b_a_inc_1997a : Ref :=
  { source := "42 USC § 1997b(a)", target := "42 USC § 1997a", kind := .Incorporates }



def edge_1997c_a1_inc_1997 : Ref :=
  { source := "42 USC § 1997c(a)(1)", target := "42 USC § 1997", kind := .Incorporates }



def edge_1997c_a1_exc_1997c_a2 : Ref :=
  { source := "42 USC § 1997c(a)(1)", target := "42 USC § 1997c(a)(2)",
    kind := .ExceptAsProvided }
def edge_1997c_subjectTo_1997h : Ref :=
  { source := "42 USC § 1997c", target := "42 USC § 1997h", kind := .SubjectTo }
def edge_1997c_exc_1997e_b : Ref :=
  { source := "42 USC § 1997c", target := "42 USC § 1997e(b)", kind := .ExceptAsProvided }


def edge_1997c_d_savings_otherFees : Ref :=
  { source := "42 USC § 1997c(d)",
    target := "attorney's-fee provisions elsewhere in the United States Code",
    kind := .Savings }



def edge_1997e_a_inc_1983 : Ref :=
  { source := "42 USC § 1997e(a)", target := "42 USC § 1983", kind := .Incorporates }

def edge_1997e_a_inc_otherFederalLaw : Ref :=
  { source := "42 USC § 1997e(a)",
    target := "any other Federal law (prison-conditions actions)",
    kind := .Incorporates }


def edge_1997e_a_exc_1997e_c2 : Ref :=
  { source := "42 USC § 1997e(a)", target := "42 USC § 1997e(c)(2)",
    kind := .ExceptAsProvided }
def edge_1997e_b_inc_1997a : Ref :=
  { source := "42 USC § 1997e(b)", target := "42 USC § 1997a", kind := .Incorporates }
def edge_1997e_b_inc_1997c : Ref :=
  { source := "42 USC § 1997e(b)", target := "42 USC § 1997c", kind := .Incorporates }
def edge_1997e_c1_inc_1983 : Ref :=
  { source := "42 USC § 1997e(c)(1)", target := "42 USC § 1983", kind := .Incorporates }
def edge_1997e_d1_inc_1988 : Ref :=
  { source := "42 USC § 1997e(d)(1)", target := "42 USC § 1988", kind := .Incorporates }
def edge_1997e_d3_inc_18_3006A : Ref :=
  { source := "42 USC § 1997e(d)(3)", target := "18 USC § 3006A", kind := .Incorporates }
def edge_1997e_e_inc_18_2246 : Ref :=
  { source := "42 USC § 1997e(e)", target := "18 USC § 2246", kind := .Incorporates }
def edge_1997e_f1_inc_1983 : Ref :=
  { source := "42 USC § 1997e(f)(1)", target := "42 USC § 1983", kind := .Incorporates }
def edge_1997e_g1_inc_1983 : Ref :=
  { source := "42 USC § 1997e(g)(1)", target := "42 USC § 1983", kind := .Incorporates }


def edge_1997e_g1_notwithstanding_otherLaw : Ref :=
  { source := "42 USC § 1997e(g)(1)",
    target := "any other law or rule of procedure (unenumerated)",
    kind := .Notwithstanding }

def edge_1997e_h_defScope_1997e : Ref :=
  { source := "42 USC § 1997e(h)", target := "42 USC § 1997e", kind := .Incorporates }



def edge_1997f_inc_28_522 : Ref :=
  { source := "42 USC § 1997f", target := "28 USC § 522", kind := .Incorporates }
def edge_1997f_inc_subchapter : Ref :=
  { source := "42 USC § 1997f",
    target := "42 USC ch. 21, subch. III (§§ 1997–1997j)", kind := .Incorporates }



def edge_1997h_inc_1997a : Ref :=
  { source := "42 USC § 1997h", target := "42 USC § 1997a", kind := .Incorporates }
def edge_1997h_inc_1997c : Ref :=
  { source := "42 USC § 1997h", target := "42 USC § 1997c", kind := .Incorporates }





def edge_1997i_savings_subchapter : Ref :=
  { source := "42 USC § 1997i",
    target := "42 USC ch. 21, subch. III (§§ 1997–1997j)", kind := .Savings }





def edge_1997j_savings_existingLaw : Ref :=
  { source := "42 USC § 1997j",
    target := "rights of parties other than the United States under existing law",
    kind := .Savings }


def edge_1997j_savings_privateLitigation : Ref :=
  { source := "42 USC § 1997j",
    target := "litigation on behalf of parties other than the United States",
    kind := .Savings }

end Proving.USC.T42.Ch21Core.Structure
