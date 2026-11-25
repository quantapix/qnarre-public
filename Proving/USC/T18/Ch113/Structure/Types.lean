













namespace Proving.USC.T18.Ch113.Structure


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












def edge_2312_incorporates_2311 : Ref :=
  { source := "18 USC § 2312", target := "18 USC § 2311", kind := .Incorporates }


def edge_2313_incorporates_2311 : Ref :=
  { source := "18 USC § 2313", target := "18 USC § 2311", kind := .Incorporates }


def edge_2313a_incorporates_2313b : Ref :=
  { source := "18 USC § 2313(a)", target := "18 USC § 2313(b)", kind := .Incorporates }


def edge_2312_incorporates_3571 : Ref :=
  { source := "18 USC § 2312", target := "18 USC § 3571", kind := .Incorporates }


def edge_2313_incorporates_3571 : Ref :=
  { source := "18 USC § 2313", target := "18 USC § 3571", kind := .Incorporates }

end Proving.USC.T18.Ch113.Structure
