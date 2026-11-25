














import Proving.USC.Common.Types

namespace Proving.USC.T22.Structure


inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis





structure Ref where
  source   : String
  target   : String
  kind     : EdgeKind
  inCorpus : Bool





def edge_7102_incorporates_7103 : Ref :=
  { source := "22 USC § 7102(14)", target := "22 USC § 7103",
    kind := .Incorporates, inCorpus := true }



def edge_7102_incorporates_7106 : Ref :=
  { source := "22 USC § 7102(9)", target := "22 USC § 7106",
    kind := .Incorporates, inCorpus := true }




def edge_7102_incorporates_2151 : Ref :=
  { source := "22 USC § 7102(10)(A)", target := "22 USC § 2151",
    kind := .Incorporates, inCorpus := true }



def edge_7102_incorporates_2751 : Ref :=
  { source := "22 USC § 7102(10)(B)", target := "22 USC § 2751",
    kind := .Incorporates, inCorpus := true }



def edge_7102_incorporates_2394_1 : Ref :=
  { source := "22 USC § 7102(10)", target := "22 USC § 2394-1",
    kind := .Incorporates, inCorpus := true }






def edge_7102_incorporates_8_1182 : Ref :=
  { source := "22 USC § 7102(18)", target := "8 USC § 1182(a)(2)(H)",
    kind := .Incorporates, inCorpus := true }





def edge_7102_incorporates_faa1961 : Ref :=
  { source := "22 USC § 7102(10)(A)", target := "Foreign Assistance Act of 1961",
    kind := .Incorporates, inCorpus := false }



def edge_7102_incorporates_aeca : Ref :=
  { source := "22 USC § 7102(10)(B)", target := "Arms Export Control Act",
    kind := .Incorporates, inCorpus := false }

end Proving.USC.T22.Structure
