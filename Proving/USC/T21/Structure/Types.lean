import Proving.USC.Common.Types







namespace Proving.USC.T21.Structure

open Proving.USC.Common (ComplaintText)


inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis


structure Ref where
  source : String
  target : String
  kind   : EdgeKind





def edge_802_6_incorporates_irc_subtitleE : Ref :=
  { source := "21 USC § 802(6)", target := "26 USC subtitle E", kind := .Incorporates }


def edge_802_12_incorporates_321g1 : Ref :=
  { source := "21 USC § 802(12)", target := "21 USC § 321(g)(1)", kind := .Incorporates }


def edge_802_16_incorporates_7_1639o : Ref :=
  { source := "21 USC § 802(16)(B)(i)", target := "7 USC § 1639o", kind := .Incorporates }


def edge_802_58_incorporates_18_924e2 : Ref :=
  { source := "21 USC § 802(58)", target := "18 USC § 924(e)(2)", kind := .Incorporates }



def edge_802_60_incorporates_812c : Ref :=
  { source := "21 USC § 802(60)", target := "21 USC § 812(c) schedule I(e)(2)", kind := .Incorporates }





def edge_841a_exceptAs_subchapterAuth : Ref :=
  { source := "21 USC § 841(a)", target := "21 USC ch. 13 subch. I (§§ 821–832 authorizations)",
    kind := .ExceptAsProvided }


def edge_841a_incorporates_802_6 : Ref :=
  { source := "21 USC § 841(a)(1)", target := "21 USC § 802(6)", kind := .Incorporates }


def edge_841a_incorporates_802_7 : Ref :=
  { source := "21 USC § 841(a)(2)", target := "21 USC § 802(7)", kind := .Incorporates }



def edge_841a_incorporates_802_verbs : Ref :=
  { source := "21 USC § 841(a)(1)", target := "21 USC § 802(10)/(11)/(15)", kind := .Incorporates }


def edge_841b_incorporates_802_44 : Ref :=
  { source := "21 USC § 841(b)", target := "21 USC § 802(44)", kind := .Incorporates }



def edge_841b_exceptAs_849 : Ref :=
  { source := "21 USC § 841(b)", target := "21 USC § 849", kind := .ExceptAsProvided }


def edge_841b_exceptAs_859 : Ref :=
  { source := "21 USC § 841(b)", target := "21 USC § 859", kind := .ExceptAsProvided }


def edge_841b_exceptAs_860 : Ref :=
  { source := "21 USC § 841(b)", target := "21 USC § 860", kind := .ExceptAsProvided }


def edge_841b_exceptAs_861 : Ref :=
  { source := "21 USC § 841(b)", target := "21 USC § 861", kind := .ExceptAsProvided }


def edge_841b_incorporates_t18_fines : Ref :=
  { source := "21 USC § 841(b)", target := "18 USC (fine provisions)", kind := .Incorporates }



def edge_841b1C_notwithstanding_18_3583 : Ref :=
  { source := "21 USC § 841(b)(1)(C)", target := "18 USC § 3583", kind := .Notwithstanding }



def edge_841b1C_notwithstanding_anyLaw : Ref :=
  { source := "21 USC § 841(b)(1)(C)", target := "any other provision of law", kind := .Notwithstanding }



def edge_841b4_notwithstanding_841b1D : Ref :=
  { source := "21 USC § 841(b)(4)", target := "21 USC § 841(b)(1)(D)", kind := .Notwithstanding }


def edge_841b4_incorporates_844 : Ref :=
  { source := "21 USC § 841(b)(4)", target := "21 USC § 844", kind := .Incorporates }


def edge_841b4_incorporates_18_3607 : Ref :=
  { source := "21 USC § 841(b)(4)", target := "18 USC § 3607", kind := .Incorporates }


def edge_841b7_incorporates_18_16 : Ref :=
  { source := "21 USC § 841(b)(7)(A)", target := "18 USC § 16", kind := .Incorporates }



def edge_841cf_incorporates_830 : Ref :=
  { source := "21 USC § 841(c)(3), (f)", target := "21 USC § 830", kind := .Incorporates }



def edge_841f1_exceptAs_842a : Ref :=
  { source := "21 USC § 841(f)(1)", target := "21 USC § 842(a)(12)–(14)", kind := .ExceptAsProvided }



def edge_841g_incorporates_5_553 : Ref :=
  { source := "21 USC § 841(g)(2)(A)(iv)", target := "5 USC § 553", kind := .Incorporates }


def edge_841h_incorporates_18_2 : Ref :=
  { source := "21 USC § 841(h)(1)(B)", target := "18 USC § 2", kind := .Incorporates }



def edge_841h_incorporates_823g : Ref :=
  { source := "21 USC § 841(h)(2)", target := "21 USC § 823(g)", kind := .Incorporates }


def edge_841h_incorporates_829e : Ref :=
  { source := "21 USC § 841(h)(2)", target := "21 USC § 829(e)", kind := .Incorporates }



def edge_841h_incorporates_831 : Ref :=
  { source := "21 USC § 841(h)(2)(E)", target := "21 USC § 831(d), (e)", kind := .Incorporates }



def edge_841h_incorporates_47_231 : Ref :=
  { source := "21 USC § 841(h)(3)(A)(iii)(I)", target := "47 USC § 231", kind := .Incorporates }



def edge_841h_incorporates_47_230c : Ref :=
  { source := "21 USC § 841(h)(3)(A)(iii)(II)", target := "47 USC § 230(c)", kind := .Incorporates }





def edge_846_incorporates_offenses : Ref :=
  { source := "21 USC § 846", target := "21 USC ch. 13 subch. I offenses (incl. § 841(a))",
    kind := .Incorporates }



def edge_846_incorporates_penalties : Ref :=
  { source := "21 USC § 846", target := "21 USC § 841(b) (object-offense penalties)",
    kind := .Incorporates }

end Proving.USC.T21.Structure
