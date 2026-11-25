









import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Procedure

open Proving.USC.Common





opaque Charge : Type




opaque Locus : Type



opaque Tribunal : Type



opaque Element : Type



opaque Property : Type



opaque OfficialRepresentation : Type


opaque FinancialInstitution : Type



opaque HealthCareBenefitProgram : Type



opaque IdentificationDocument : Type


opaque DocumentMakingImplement : Type



opaque AccessDevice : Type








inductive Stage
  | conductAlleged
  | federallyCognizable
  | charged
  | elementsProved
  | convicted
  | sentenced
  | forfeitureOrdered
  deriving DecidableEq, Repr


inductive Party
  | prosecution
  | defendant
  deriving DecidableEq, Repr



inductive BurdenStandard
  | beyondReasonableDoubt
  | preponderanceOfTheEvidence
  deriving DecidableEq, Repr




inductive Paragraph1028a
  | p1 | p2 | p3 | p4 | p5 | p6 | p7 | p8
  deriving DecidableEq, Repr


inductive Paragraph1029a
  | p1 | p2 | p3 | p4 | p5 | p6 | p7 | p8 | p9 | p10
  deriving DecidableEq, Repr


inductive PunishmentTier1028
  | thirtyYears
  | twentyYears
  | fifteenYears
  | fiveYears
  | oneYear
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch1Ch47.Recert.Procedure
