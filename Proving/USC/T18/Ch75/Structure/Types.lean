






















import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch75.Structure




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




def edge_1542_incorp_2331 : Ref :=
  { source := "18 USC § 1542", target := "18 USC § 2331", kind := .Incorporates }
def edge_1542_incorp_929a : Ref :=
  { source := "18 USC § 1542", target := "18 USC § 929(a)", kind := .Incorporates }
def edge_1542_incorp_passportLaw : Ref :=
  { source := "18 USC § 1542", target := "laws regulating issuance of passports (22 USC ch. 4)", kind := .Incorporates }


def edge_1543_incorp_2331 : Ref :=
  { source := "18 USC § 1543", target := "18 USC § 2331", kind := .Incorporates }
def edge_1543_incorp_929a : Ref :=
  { source := "18 USC § 1543", target := "18 USC § 929(a)", kind := .Incorporates }


def edge_1544_incorp_2331 : Ref :=
  { source := "18 USC § 1544", target := "18 USC § 2331", kind := .Incorporates }
def edge_1544_incorp_929a : Ref :=
  { source := "18 USC § 1544", target := "18 USC § 929(a)", kind := .Incorporates }
def edge_1544_incorp_passportRules : Ref :=
  { source := "18 USC § 1544", target := "rules regulating issuance of passports (22 USC ch. 4 / 22 CFR)", kind := .Incorporates }


def edge_1546_incorp_2331 : Ref :=
  { source := "18 USC § 1546", target := "18 USC § 2331", kind := .Incorporates }
def edge_1546_incorp_929a : Ref :=
  { source := "18 USC § 1546", target := "18 USC § 929(a)", kind := .Incorporates }
def edge_1546_incorp_1746 : Ref :=
  { source := "18 USC § 1546(a)", target := "28 USC § 1746", kind := .Incorporates }
def edge_1546_incorp_ina : Ref :=
  { source := "18 USC § 1546(a)", target := "immigration laws (INA, 8 USC ch. 12)", kind := .Incorporates }
def edge_1546_except_occa : Ref :=
  { source := "18 USC § 1546(c)", target := "Organized Crime Control Act of 1970, tit. V (18 USC note prec. 3481)", kind := .ExceptAsProvided }

end Proving.USC.T18.Ch75.Structure
