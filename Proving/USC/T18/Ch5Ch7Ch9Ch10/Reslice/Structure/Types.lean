






import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Structure

open Proving.USC.Common


inductive EdgeKind where
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
  deriving Repr




def edge_111_incorporates_1114 : Ref :=
  { source := "18 USC § 111(a)", target := "18 USC § 1114", kind := .Incorporates }




def edge_112_incorporates_1116b : Ref :=
  { source := "18 USC § 112(c)", target := "18 USC § 1116(b)", kind := .Incorporates }


def edge_112_savings_amend1 : Ref :=
  { source := "18 USC § 112(d)", target := "U.S. Const. amend. I", kind := .Savings }


def edge_112_incorporates_5 : Ref :=
  { source := "18 USC § 112(e)", target := "18 USC § 5", kind := .Incorporates }


def edge_112_incorporates_7 : Ref :=
  { source := "18 USC § 112(e)", target := "18 USC § 7", kind := .Incorporates }


def edge_112_incorporates_t49s46501 : Ref :=
  { source := "18 USC § 112(e)", target := "49 USC § 46501(2)", kind := .Incorporates }



def edge_112_notwithstanding_contraryLaw : Ref :=
  { source := "18 USC § 112(f)"
    target := "any contrary statute, rule, or regulation"
    kind := .Notwithstanding }


def edge_113_incorporates_2241 : Ref :=
  { source := "18 USC § 113(a)(1)", target := "18 USC § 2241", kind := .Incorporates }


def edge_113_incorporates_2242 : Ref :=
  { source := "18 USC § 113(a)(1)", target := "18 USC § 2242", kind := .Incorporates }


def edge_113_exceptAsProvided_2241 : Ref :=
  { source := "18 USC § 113(a)(2)", target := "18 USC § 2241", kind := .ExceptAsProvided }


def edge_113_exceptAsProvided_2242 : Ref :=
  { source := "18 USC § 113(a)(2)", target := "18 USC § 2242", kind := .ExceptAsProvided }


def edge_113_incorporates_1365 : Ref :=
  { source := "18 USC § 113(b)(2)", target := "18 USC § 1365", kind := .Incorporates }





def edge_113_incorporates_2266 : Ref :=
  { source := "18 USC § 113(b)(3)", target := "18 USC § 2266", kind := .Incorporates }


def edge_114_incorporates_2340 : Ref :=
  { source := "18 USC § 114", target := "18 USC § 2340", kind := .Incorporates }


def edge_115_incorporates_1114 : Ref :=
  { source := "18 USC § 115(a)(1)", target := "18 USC § 1114", kind := .Incorporates }


def edge_115_subjectTo_115b : Ref :=
  { source := "18 USC § 115(a)", target := "18 USC § 115(b)", kind := .SubjectTo }


def edge_115_incorporates_1365 : Ref :=
  { source := "18 USC § 115(b)(1)(B)(iv)", target := "18 USC § 1365", kind := .Incorporates }


def edge_115_incorporates_2241 : Ref :=
  { source := "18 USC § 115(b)(1)(B)(iv)", target := "18 USC § 2241", kind := .Incorporates }


def edge_115_incorporates_2242 : Ref :=
  { source := "18 USC § 115(b)(1)(B)(iv)", target := "18 USC § 2242", kind := .Incorporates }


def edge_115_incorporates_1201 : Ref :=
  { source := "18 USC § 115(b)(2)", target := "18 USC § 1201", kind := .Incorporates }


def edge_115_incorporates_1201a5 : Ref :=
  { source := "18 USC § 115(b)(2)", target := "18 USC § 1201(a)(5)", kind := .Incorporates }


def edge_115_incorporates_1111 : Ref :=
  { source := "18 USC § 115(b)(3)", target := "18 USC § 1111", kind := .Incorporates }


def edge_115_incorporates_1113 : Ref :=
  { source := "18 USC § 115(b)(3)", target := "18 USC § 1113", kind := .Incorporates }


def edge_115_incorporates_1117 : Ref :=
  { source := "18 USC § 115(b)(3)", target := "18 USC § 1117", kind := .Incorporates }


def edge_115_incorporates_t5s101 : Ref :=
  { source := "18 USC § 115(c)(4)", target := "5 USC § 101", kind := .Incorporates }


def edge_115_savings_3056 : Ref :=
  { source := "18 USC § 115(d)", target := "18 USC § 3056", kind := .Savings }


def edge_115_savings_871 : Ref :=
  { source := "18 USC § 115(d)", target := "18 USC § 871", kind := .Savings }


def edge_115_savings_879 : Ref :=
  { source := "18 USC § 115(d)", target := "18 USC § 879", kind := .Savings }


def edge_116_exceptAsProvided_116b : Ref :=
  { source := "18 USC § 116(a)", target := "18 USC § 116(b)", kind := .ExceptAsProvided }


def edge_116_incorporates_116d : Ref :=
  { source := "18 USC § 116(a)", target := "18 USC § 116(d)", kind := .Incorporates }


def edge_116_incorporates_116e : Ref :=
  { source := "18 USC § 116(a)", target := "18 USC § 116(e)", kind := .Incorporates }




def edge_116_lexSpecialis_religiousCustom : Ref :=
  { source := "18 USC § 116(c)"
    target := "religion, custom, tradition, ritual, or standard practice"
    kind := .LexSpecialis }


def edge_117_incorporates_ch110A : Ref :=
  { source := "18 USC § 117(a)(2)", target := "18 USC ch. 110A", kind := .Incorporates }





def edge_117_incorporates_113b1 : Ref :=
  { source := "18 USC § 117(a)", target := "18 USC § 113(b)(1)", kind := .Incorporates }


def edge_118_incorporates_t22s2709 : Ref :=
  { source := "18 USC § 118", target := "22 USC § 2709", kind := .Incorporates }


def edge_118_incorporates_t22s4802 : Ref :=
  { source := "18 USC § 118", target := "22 USC § 4802", kind := .Incorporates }


def edge_119_incorporates_1114 : Ref :=
  { source := "18 USC § 119(b)(2)(A)", target := "18 USC § 1114", kind := .Incorporates }


def edge_119_incorporates_16 : Ref :=
  { source := "18 USC § 119(b)(3)", target := "18 USC § 16", kind := .Incorporates }



def edge_119_incorporates_115c2 : Ref :=
  { source := "18 USC § 119(b)(4)", target := "18 USC § 115(c)(2)", kind := .Incorporates }




def edge_151_incorporates_t11 : Ref :=
  { source := "18 USC § 151", target := "11 USC (title 11)", kind := .Incorporates }


def edge_ch9_incorporates_151 : Ref :=
  { source := "18 USC ch. 9", target := "18 USC § 151", kind := .Incorporates }


def edge_152_incorporates_151 : Ref :=
  { source := "18 USC § 152", target := "18 USC § 151", kind := .Incorporates }


def edge_152_incorporates_t11 : Ref :=
  { source := "18 USC § 152", target := "11 USC (title 11)", kind := .Incorporates }


def edge_152_incorporates_t28s1746 : Ref :=
  { source := "18 USC § 152(3)", target := "28 USC § 1746", kind := .Incorporates }


def edge_153_incorporates_151 : Ref :=
  { source := "18 USC § 153(a)", target := "18 USC § 151", kind := .Incorporates }


def edge_153_incorporates_t11 : Ref :=
  { source := "18 USC § 153", target := "11 USC (title 11)", kind := .Incorporates }


def edge_154_incorporates_t11 : Ref :=
  { source := "18 USC § 154(1)", target := "11 USC (title 11)", kind := .Incorporates }


def edge_155_incorporates_t11 : Ref :=
  { source := "18 USC § 155", target := "11 USC (title 11)", kind := .Incorporates }


def edge_156_incorporates_t11 : Ref :=
  { source := "18 USC § 156", target := "11 USC (title 11)", kind := .Incorporates }


def edge_156_incorporates_frbp : Ref :=
  { source := "18 USC § 156(b)"
    target := "Federal Rules of Bankruptcy Procedure"
    kind := .Incorporates }


def edge_157_incorporates_t11s303 : Ref :=
  { source := "18 USC § 157(1)", target := "11 USC § 303", kind := .Incorporates }


def edge_157_incorporates_t11 : Ref :=
  { source := "18 USC § 157", target := "11 USC (title 11)", kind := .Incorporates }


def edge_158_incorporates_152 : Ref :=
  { source := "18 USC § 158(a)", target := "18 USC § 152", kind := .Incorporates }


def edge_158_incorporates_157 : Ref :=
  { source := "18 USC § 158(a)", target := "18 USC § 157", kind := .Incorporates }


def edge_158_incorporates_3057 : Ref :=
  { source := "18 USC § 158(c)", target := "18 USC § 3057", kind := .Incorporates }




def edge_ch10_incorporates_178 : Ref :=
  { source := "18 USC ch. 10", target := "18 USC § 178", kind := .Incorporates }



def edge_175_incorporates_178 : Ref :=
  { source := "18 USC § 175", target := "18 USC § 178", kind := .Incorporates }


def edge_175a_incorporates_175 : Ref :=
  { source := "18 USC § 175a", target := "18 USC § 175", kind := .Incorporates }





def edge_175a_incorporates_t10s382 : Ref :=
  { source := "18 USC § 175a", target := "10 USC § 382", kind := .Incorporates }



def edge_175a_incorporates_t10s382f2 : Ref :=
  { source := "18 USC § 175a", target := "10 USC § 382(f)(2)", kind := .Incorporates }


def edge_175b_incorporates_t42s262a : Ref :=
  { source := "18 USC § 175b", target := "42 USC § 262a", kind := .Incorporates }


def edge_175b_incorporates_cfr73 : Ref :=
  { source := "18 USC § 175b(a)(2)(A)", target := "42 C.F.R. pt. 73", kind := .Incorporates }



def edge_175b_exceptAsProvided_cfr73 : Ref :=
  { source := "18 USC § 175b(a)(2)(B)"
    target := "42 C.F.R. pt. 73 (exclusions and exemptions)"
    kind := .ExceptAsProvided }



def edge_175b_exceptAsProvided_govActivity : Ref :=
  { source := "18 USC § 175b(a)(3)"
    target := "duly authorized United States governmental activity"
    kind := .ExceptAsProvided }



def edge_175b_incorporates_t7s8401 : Ref :=
  { source := "18 USC § 175b", target := "7 USC § 8401", kind := .Incorporates }


def edge_175b_incorporates_t21s802 : Ref :=
  { source := "18 USC § 175b(d)(2)(D)", target := "21 USC § 802", kind := .Incorporates }




def edge_175b_incorporates_t50appS2405j : Ref :=
  { source := "18 USC § 175b(d)(2)(G)(i)"
    target := "50 USC App. § 2405(j)"
    kind := .Incorporates }


def edge_175b_incorporates_t22s2371 : Ref :=
  { source := "18 USC § 175b(d)(2)(G)(i)", target := "22 USC § 2371", kind := .Incorporates }


def edge_175b_incorporates_t22s2780d : Ref :=
  { source := "18 USC § 175b(d)(2)(G)(i)", target := "22 USC § 2780(d)", kind := .Incorporates }


def edge_175b_incorporates_t8s1182 : Ref :=
  { source := "18 USC § 175b(d)(2)(I)"
    target := "8 USC § 1182(a)(3)(B)(vi)"
    kind := .Incorporates }


def edge_175b_incorporates_t8s1101a3 : Ref :=
  { source := "18 USC § 175b(d)(3)", target := "8 USC § 1101(a)(3)", kind := .Incorporates }


def edge_175b_incorporates_t8s1101a20 : Ref :=
  { source := "18 USC § 175b(d)(4)", target := "8 USC § 1101(a)(20)", kind := .Incorporates }


def edge_175b_incorporates_178 : Ref :=
  { source := "18 USC § 175b", target := "18 USC § 178", kind := .Incorporates }


def edge_175c_exceptAsProvided_175c_a2 : Ref :=
  { source := "18 USC § 175c(a)(1)", target := "18 USC § 175c(a)(2)", kind := .ExceptAsProvided }


def edge_176_incorporates_175 : Ref :=
  { source := "18 USC § 176(a)(1)(A)", target := "18 USC § 175", kind := .Incorporates }



def edge_176_exceptAsProvided_176a2 : Ref :=
  { source := "18 USC § 176(a)(1)", target := "18 USC § 176(a)(2)", kind := .ExceptAsProvided }


def edge_176_exceptAsProvided_176c : Ref :=
  { source := "18 USC § 176(a)(1)(B)", target := "18 USC § 176(c)", kind := .ExceptAsProvided }



def edge_176_incorporates_frcrp41 : Ref :=
  { source := "18 USC § 176(a)(1)", target := "Fed. R. Crim. P. 41", kind := .Incorporates }


def edge_176_incorporates_customsLaws : Ref :=
  { source := "18 USC § 176(b)"
    target := "19 USC § 1602 et seq. (customs forfeiture procedures)"
    kind := .Incorporates }



def edge_176_lexSpecialis_customsLaws : Ref :=
  { source := "18 USC § 176(b)"
    target := "19 USC § 1602 et seq. (customs forfeiture procedures)"
    kind := .LexSpecialis }


def edge_176_incorporates_178 : Ref :=
  { source := "18 USC § 176", target := "18 USC § 178", kind := .Incorporates }


def edge_177_incorporates_175 : Ref :=
  { source := "18 USC § 177(a)", target := "18 USC § 175", kind := .Incorporates }


def edge_177_incorporates_178 : Ref :=
  { source := "18 USC § 177(a)(3)", target := "18 USC § 178", kind := .Incorporates }


def edge_177_exceptAsProvided_177b : Ref :=
  { source := "18 USC § 177(a)(3)", target := "18 USC § 177(b)", kind := .ExceptAsProvided }


def edge_178_incorporates_t8s1101a22 : Ref :=
  { source := "18 USC § 178(5)", target := "8 USC § 1101(a)(22)", kind := .Incorporates }





def edge_penalty_incorporates_3571 : Ref :=
  { source := "18 USC chs. 7, 9, 10 (penal sections)"
    target := "18 USC § 3571"
    kind := .Incorporates }

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Structure
