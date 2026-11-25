import Proving.USC.T42.TitleVII.Deontic.Types
import Proving.USC.T42.TitleVII.Deontic.Predicates
import Proving.USC.T42.TitleVII.Deontic.Statute









namespace Proving.USC.T42.TitleVII.Deontic

open Proving.USC.Common


def employerProhibition_intro
    (subject victim : LegalPerson)
    (isEmployer : IsEmployer subject)
    (becauseOfTrait : BecauseOfProtectedTrait subject victim)
    (discriminates : DiscriminatesInEmployment subject victim) :
    EmployerProhibition :=
  { subject, victim, isEmployer, becauseOfTrait, discriminates }


def employerSegregationProhibition_intro
    (subject victim : LegalPerson)
    (isEmployer : IsEmployer subject)
    (becauseOfTrait : BecauseOfProtectedTrait subject victim)
    (limits : LimitsSegregatesOrClassifies subject victim) :
    EmployerSegregationProhibition :=
  { subject, victim, isEmployer, becauseOfTrait, limits }


def agencyProhibition_intro
    (subject victim : LegalPerson)
    (isAgency : IsEmploymentAgency subject)
    (becauseOfTrait : BecauseOfProtectedTrait subject victim)
    (discriminates : DiscriminatesInReferral subject victim) :
    AgencyProhibition :=
  { subject, victim, isAgency, becauseOfTrait, discriminates }


def laborOrgProhibition_intro
    (subject victim : LegalPerson)
    (isLaborOrg : IsLaborOrganization subject)
    (becauseOfTrait : BecauseOfProtectedTrait subject victim)
    (discriminates : DiscriminatesInMembership subject victim) :
    LaborOrgProhibition :=
  { subject, victim, isLaborOrg, becauseOfTrait, discriminates }


def trainingProhibition_intro
    (subject victim : LegalPerson)
    (controlsProgram : ControlsTrainingProgram subject)
    (becauseOfTrait : BecauseOfProtectedTrait subject victim)
    (discriminates : DiscriminatesInTraining subject victim) :
    TrainingProhibition :=
  { subject, victim, controlsProgram, becauseOfTrait, discriminates }


def retaliationProhibition_intro
    (subject victim : LegalPerson)
    (protectedActivity : EngagedInProtectedActivity victim)
    (retaliates : RetaliatesAgainst subject victim) :
    RetaliationProhibition :=
  { subject, victim, protectedActivity, retaliates }


def federalSectorProhibition_intro
    (subject victim : LegalPerson)
    (isFederalEntity : IsFederalEmployingEntity subject)
    (becauseOfTrait : BecauseOfProtectedTrait subject victim)
    (nonNeutralAction : TakesNonNeutralPersonnelAction subject victim) :
    FederalSectorProhibition :=
  { subject, victim, isFederalEntity, becauseOfTrait, nonNeutralAction }


def bFOQPermission_intro
    (subject victim : LegalPerson)
    (isEmployer : IsEmployer subject)
    (bfoq : IsBonaFideOccupationalQualification subject victim) :
    BFOQPermission :=
  { subject, victim, isEmployer, bfoq }


def religiousEntityExemption_intro
    (subject : LegalPerson)
    (exempt : IsReligiousEntityExempt subject) :
    ReligiousEntityExemption :=
  { subject, exempt }


def civilActionPower_intro
    (claimant : LegalPerson)
    (timelyCharge : ChargeTimelyFiled claimant)
    (rightToSue : RightToSueConditionsMet claimant) :
    CivilActionPower :=
  { claimant, timelyCharge, rightToSue }


def motivatingFactorPractice_intro
    (subject victim : LegalPerson)
    (isEmployer : IsEmployer subject)
    (motivatingFactor : IsMotivatingFactor subject victim)
    (discriminates : DiscriminatesInEmployment subject victim) :
    MotivatingFactorPractice :=
  { subject, victim, isEmployer, motivatingFactor, discriminates }



def unlawfulEmploymentPractice_intro
    (h : EmployerProhibition) : UnlawfulEmploymentPractice :=
  .employer h

end Proving.USC.T42.TitleVII.Deontic
