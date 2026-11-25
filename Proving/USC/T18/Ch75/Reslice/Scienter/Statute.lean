












import Proving.USC.T18.Ch75.Reslice.Scienter.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Scienter

open Proving.USC.Common
















def ScienterSatisfied (required : MentalState) (p : Person) (el : ScienterElement)
    (c : ComplaintText) : Prop :=
  required = MentalState.StrictLiability ∨
    ∃ rung : MentalState, rung.atLeast required ∧ MentalStateProven p rung el c















def requiredRungForgeryOfPassport : Option MentalState := none




def requiredRungPossessionOfPrintingInstrumentality : Option MentalState := none



def requiredRungPersonationInImmigrationApplication : Option MentalState := none





def requiredRungDispositionOfDocumentToUnauthorizedPerson : Option MentalState := none





def requiredRungFalseAttestation : Option MentalState := none








structure Scienter1542 where
  addressee : Person


  falseStatementRung : MentalState

  intentToInduceRung : MentalState



  fraudulentUseRung : MentalState


def scienter1542 (p : Person) : Scienter1542 :=
  { addressee := p
    falseStatementRung := .Specific
    intentToInduceRung := .Specific
    fraudulentUseRung := .Specific }



def Section1542FalseApplicationCulpable (s : Scienter1542) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.falseStatementRung s.addressee
      .FalseStatementInPassportApplication c ∧
  ScienterSatisfied s.intentToInduceRung s.addressee
      .IntentToInduceIssuanceOfPassport c


def Section1542FraudulentUseCulpable (s : Scienter1542) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.fraudulentUseRung s.addressee
      .UseOfFraudulentlySecuredPassport c


inductive Section1542Culpable (s : Scienter1542) (c : ComplaintText) : Prop
  | falseApplication (h : Section1542FalseApplicationCulpable s c) : Section1542Culpable s c
  | fraudulentUse (h : Section1542FraudulentUseCulpable s c) : Section1542Culpable s c






structure Scienter1543 where
  addressee : Person

  intentThatForgedPassportBeUsedRung : MentalState


  forgedUseRung : MentalState


def scienter1543 (p : Person) : Scienter1543 :=
  { addressee := p
    intentThatForgedPassportBeUsedRung := .Specific
    forgedUseRung := .Specific }




def Section1543ForgeryCulpable (s : Scienter1543) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.intentThatForgedPassportBeUsedRung s.addressee
      .IntentThatForgedPassportBeUsed c


def Section1543ForgedUseCulpable (s : Scienter1543) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.forgedUseRung s.addressee .UseOfForgedPassport c


inductive Section1543Culpable (s : Scienter1543) (c : ComplaintText) : Prop
  | forgery (h : Section1543ForgeryCulpable s c) : Section1543Culpable s c
  | forgedUse (h : Section1543ForgedUseCulpable s c) : Section1543Culpable s c





structure Scienter1544 where
  addressee : Person


  anothersPassportRung : MentalState


  contraryToConditionsRung : MentalState



  furnishingRung : MentalState


def scienter1544 (p : Person) : Scienter1544 :=
  { addressee := p
    anothersPassportRung := .Specific
    contraryToConditionsRung := .Specific
    furnishingRung := .Specific }


def Section1544AnothersPassportCulpable (s : Scienter1544) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.anothersPassportRung s.addressee .UseOfAnothersPassport c


def Section1544ContraryToConditionsCulpable (s : Scienter1544) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.contraryToConditionsRung s.addressee
      .UseOfPassportContraryToConditions c


def Section1544FurnishingCulpable (s : Scienter1544) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.furnishingRung s.addressee .FurnishingPassportForUseByAnother c



inductive Section1544Culpable (s : Scienter1544) (c : ComplaintText) : Prop
  | anothersPassport (h : Section1544AnothersPassportCulpable s c) : Section1544Culpable s c
  | contraryToConditions (h : Section1544ContraryToConditionsCulpable s c) :
      Section1544Culpable s c
  | furnishing (h : Section1544FurnishingCulpable s c) : Section1544Culpable s c









structure Scienter1546a where
  addressee : Person


  forgeryRung : MentalState



  useOfFalseDocumentRung : MentalState

  blankPermitRung : MentalState

  evasionRung : MentalState


  falseStatementUnderOathRung : MentalState


  presentationRung : MentalState


def scienter1546a (p : Person) : Scienter1546a :=
  { addressee := p
    forgeryRung := .Knowledge
    useOfFalseDocumentRung := .Knowledge
    blankPermitRung := .Knowledge
    evasionRung := .Specific
    falseStatementUnderOathRung := .Knowledge
    presentationRung := .Knowledge }


def Section1546aForgeryCulpable (s : Scienter1546a) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.forgeryRung s.addressee .ForgeryOfImmigrationDocument c



def Section1546aUseCulpable (s : Scienter1546a) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.useOfFalseDocumentRung s.addressee
      .UseOfFalseImmigrationDocument c


def Section1546aBlankPermitCulpable (s : Scienter1546a) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.blankPermitRung s.addressee .PossessionOfBlankPermit c



def Section1546aEvasionCulpable (s : Scienter1546a) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.evasionRung s.addressee .EvasionOfImmigrationLawsByAssumedName c


def Section1546aFalseOathCulpable (s : Scienter1546a) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.falseStatementUnderOathRung s.addressee .FalseStatementUnderOath c



def Section1546aPresentationCulpable (s : Scienter1546a) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.presentationRung s.addressee
      .PresentationOfDocumentContainingFalseStatement c





inductive Section1546aCulpable (s : Scienter1546a) (c : ComplaintText) : Prop
  | forgery (h : Section1546aForgeryCulpable s c) : Section1546aCulpable s c
  | useOfFalseDocument (h : Section1546aUseCulpable s c) : Section1546aCulpable s c
  | blankPermit (h : Section1546aBlankPermitCulpable s c) : Section1546aCulpable s c
  | evasion (h : Section1546aEvasionCulpable s c) : Section1546aCulpable s c
  | falseOath (h : Section1546aFalseOathCulpable s c) : Section1546aCulpable s c
  | presentation (h : Section1546aPresentationCulpable s c) : Section1546aCulpable s c













structure Scienter1546b where
  addressee : Person


  documentStatusRung : MentalState


  employmentVerificationPurposeRung : MentalState


def scienter1546b (p : Person) : Scienter1546b :=
  { addressee := p
    documentStatusRung := .Negligence
    employmentVerificationPurposeRung := .Specific }



def Section1546bUnlawfulDocumentCulpable (s : Scienter1546b) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.documentStatusRung s.addressee
      .UseOfUnlawfullyIssuedIdentificationDocument c ∧
  ScienterSatisfied s.employmentVerificationPurposeRung s.addressee
      .PurposeOfSatisfyingEmploymentVerification c



def Section1546bFalseDocumentCulpable (s : Scienter1546b) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.documentStatusRung s.addressee
      .UseOfFalseIdentificationDocument c ∧
  ScienterSatisfied s.employmentVerificationPurposeRung s.addressee
      .PurposeOfSatisfyingEmploymentVerification c





def Section1546bFalseAttestationCulpable (s : Scienter1546b) (c : ComplaintText) : Prop :=
  ScienterSatisfied s.employmentVerificationPurposeRung s.addressee
      .PurposeOfSatisfyingEmploymentVerification c



inductive Section1546bCulpable (s : Scienter1546b) (c : ComplaintText) : Prop
  | unlawfulDocument (h : Section1546bUnlawfulDocumentCulpable s c) : Section1546bCulpable s c
  | falseDocument (h : Section1546bFalseDocumentCulpable s c) : Section1546bCulpable s c
  | falseAttestation (h : Section1546bFalseAttestationCulpable s c) : Section1546bCulpable s c













def CommittedToFacilitateInternationalTerrorism (p : Person) (c : ComplaintText) : Prop :=
  ScienterSatisfied MentalState.Specific p .PurposeToFacilitateInternationalTerrorism c




def CommittedToFacilitateDrugTraffickingCrime (p : Person) (c : ComplaintText) : Prop :=
  ScienterSatisfied MentalState.Specific p .PurposeToFacilitateDrugTraffickingCrime c

end Proving.USC.T18.Ch75.Reslice.Scienter
