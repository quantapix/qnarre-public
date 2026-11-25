












import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Scienter

open Proving.USC.Common





instance instDecidableMentalStateAtLeast (a b : MentalState) :
    Decidable (MentalState.atLeast a b) :=
  inferInstanceAs (Decidable (b.rank ≤ a.rank))











inductive Paragraph201

  | b1A


  | b1B


  | b1C

  | b2A


  | b2B


  | b2C

  | b3Influence

  | b3Absence

  | b4Influence

  | b4Absence

  | c1A

  | c1B

  | c2

  | c3
  deriving DecidableEq, Repr






inductive OffenseTier201

  | bribery

  | gratuity
  deriving DecidableEq, Repr



def Paragraph201.tier : Paragraph201 → OffenseTier201
  | .b1A | .b1B | .b1C
  | .b2A | .b2B | .b2C
  | .b3Influence | .b3Absence
  | .b4Influence | .b4Absence => .bribery
  | .c1A | .c1B | .c2 | .c3 => .gratuity



def Paragraph201.cite : Paragraph201 → String
  | .b1A => "18 USC § 201(b)(1)(A)"
  | .b1B => "18 USC § 201(b)(1)(B)"
  | .b1C => "18 USC § 201(b)(1)(C)"
  | .b2A => "18 USC § 201(b)(2)(A)"
  | .b2B => "18 USC § 201(b)(2)(B)"
  | .b2C => "18 USC § 201(b)(2)(C)"
  | .b3Influence => "18 USC § 201(b)(3)"
  | .b3Absence => "18 USC § 201(b)(3)"
  | .b4Influence => "18 USC § 201(b)(4)"
  | .b4Absence => "18 USC § 201(b)(4)"
  | .c1A => "18 USC § 201(c)(1)(A)"
  | .c1B => "18 USC § 201(c)(1)(B)"
  | .c2 => "18 USC § 201(c)(2)"
  | .c3 => "18 USC § 201(c)(3)"



def Paragraph201.withinWitnessFeeCarve : Paragraph201 → Bool
  | .b3Influence | .b3Absence | .b4Influence | .b4Absence | .c2 | .c3 => true
  | _ => false

end Proving.USC.T18.Ch11.EchoReslice.Scienter
