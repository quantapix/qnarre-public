








import Proving.USC.Common.Types

namespace Proving.USC.T42.Ch21Misc.Structure

open Proving.USC.Common


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





def edge_2000d4a_incorporates_t20s7801 : Ref :=
  { source := "42 USC § 2000d-4a(2)(B)", target := "20 USC § 7801",
    kind := .Incorporates }





def edge_2000e1a_exceptsSubchapter : Ref :=
  { source := "42 USC § 2000e-1(a)", target := "42 USC § 2000e et seq.",
    kind := .ExceptAsProvided }



def edge_2000e1b_excepts_2000e2 : Ref :=
  { source := "42 USC § 2000e-1(b)", target := "42 USC § 2000e-2",
    kind := .ExceptAsProvided }



def edge_2000e1b_excepts_2000e3 : Ref :=
  { source := "42 USC § 2000e-1(b)", target := "42 USC § 2000e-3",
    kind := .ExceptAsProvided }




def edge_2000e1c1_incorporates_2000e2 : Ref :=
  { source := "42 USC § 2000e-1(c)(1)", target := "42 USC § 2000e-2",
    kind := .Incorporates }



def edge_2000e1c1_incorporates_2000e3 : Ref :=
  { source := "42 USC § 2000e-1(c)(1)", target := "42 USC § 2000e-3",
    kind := .Incorporates }




def edge_2000e1c2_excepts_2000e2 : Ref :=
  { source := "42 USC § 2000e-1(c)(2)", target := "42 USC § 2000e-2",
    kind := .ExceptAsProvided }


def edge_2000e1c2_excepts_2000e3 : Ref :=
  { source := "42 USC § 2000e-1(c)(2)", target := "42 USC § 2000e-3",
    kind := .ExceptAsProvided }







def edge_2000e7_savings_stateLaw : Ref :=
  { source := "42 USC § 2000e-7",
    target := "State or political-subdivision law (external, non-USC)",
    kind := .Savings }





def edge_2000e7_incorporates_2000e2 : Ref :=
  { source := "42 USC § 2000e-7", target := "42 USC § 2000e-2",
    kind := .Incorporates }





def edge_2000e10a_incorporates_2000e4 : Ref :=
  { source := "42 USC § 2000e-10(a)", target := "42 USC § 2000e-4",
    kind := .Incorporates }






def edge_2000e11_savings_veteransLaws : Ref :=
  { source := "42 USC § 2000e-11",
    target := "Federal/State/territorial/local veterans-preference law (external)",
    kind := .Savings }





def edge_2000e13_incorporates_t18s111 : Ref :=
  { source := "42 USC § 2000e-13", target := "18 USC § 111",
    kind := .Incorporates }


def edge_2000e13_incorporates_t18s1114 : Ref :=
  { source := "42 USC § 2000e-13", target := "18 USC § 1114",
    kind := .Incorporates }




def edge_2000e13_notwithstanding_t18s111 : Ref :=
  { source := "42 USC § 2000e-13", target := "18 USC § 111",
    kind := .Notwithstanding }


def edge_2000e13_notwithstanding_t18s1114 : Ref :=
  { source := "42 USC § 2000e-13", target := "18 USC § 1114",
    kind := .Notwithstanding }





def edge_2000e14_incorporates_2000e4 : Ref :=
  { source := "42 USC § 2000e-14", target := "42 USC § 2000e-4",
    kind := .Incorporates }






def edge_2000e15_incorporates_2000e : Ref :=
  { source := "42 USC § 2000e-15", target := "42 USC § 2000e",
    kind := .Incorporates }






def edge_2000e17_incorporates_t5s554 : Ref :=
  { source := "42 USC § 2000e-17", target := "5 USC § 554",
    kind := .Incorporates }




def edge_2000e17_proviso_excepts_self : Ref :=
  { source := "42 USC § 2000e-17", target := "42 USC § 2000e-17",
    kind := .ExceptAsProvided }





def edge_2000e17_lexSpecialis_eeoOrders : Ref :=
  { source := "42 USC § 2000e-17",
    target := "equal employment opportunity laws and orders (external/general)",
    kind := .LexSpecialis }

end Proving.USC.T42.Ch21Misc.Structure
