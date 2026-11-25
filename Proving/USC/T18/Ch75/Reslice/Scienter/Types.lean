








import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Scienter

open Proving.USC.Common














inductive MentalState
  | StrictLiability
  | Negligence
  | Recklessness
  | Knowledge
  | Specific
deriving DecidableEq, Repr


def MentalState.rank : MentalState → Nat
  | .StrictLiability => 0
  | .Negligence      => 1
  | .Recklessness    => 2
  | .Knowledge       => 3
  | .Specific        => 4




def MentalState.atLeast (a b : MentalState) : Prop := b.rank ≤ a.rank










inductive ScienterElement

  | FalseStatementInPassportApplication

  | IntentToInduceIssuanceOfPassport


  | UseOfFraudulentlySecuredPassport


  | ForgeryOfPassport

  | IntentThatForgedPassportBeUsed


  | UseOfForgedPassport

  | UseOfAnothersPassport


  | UseOfPassportContraryToConditions


  | FurnishingPassportForUseByAnother


  | ForgeryOfImmigrationDocument



  | UseOfFalseImmigrationDocument

  | PossessionOfBlankPermit





  | PossessionOfPrintingInstrumentality


  | PersonationInImmigrationApplication



  | EvasionOfImmigrationLawsByAssumedName


  | DispositionOfDocumentToUnauthorizedPerson



  | FalseStatementUnderOath



  | PresentationOfDocumentContainingFalseStatement


  | UseOfUnlawfullyIssuedIdentificationDocument

  | UseOfFalseIdentificationDocument

  | FalseAttestation


  | PurposeOfSatisfyingEmploymentVerification



  | PurposeToFacilitateInternationalTerrorism



  | PurposeToFacilitateDrugTraffickingCrime
deriving DecidableEq, Repr

end Proving.USC.T18.Ch75.Reslice.Scienter
