import Proving.USC.T42.TitleVII.Deontic.Types
import Proving.USC.T42.TitleVII.Deontic.Predicates















namespace Proving.USC.T42.TitleVII.Deontic

open Proving.USC.Common





structure EmployerProhibition where
  subject : LegalPerson
  victim : LegalPerson
  isEmployer : IsEmployer subject
  becauseOfTrait : BecauseOfProtectedTrait subject victim
  discriminates : DiscriminatesInEmployment subject victim


structure EmployerSegregationProhibition where
  subject : LegalPerson
  victim : LegalPerson
  isEmployer : IsEmployer subject
  becauseOfTrait : BecauseOfProtectedTrait subject victim
  limits : LimitsSegregatesOrClassifies subject victim


structure AgencyProhibition where
  subject : LegalPerson
  victim : LegalPerson
  isAgency : IsEmploymentAgency subject
  becauseOfTrait : BecauseOfProtectedTrait subject victim
  discriminates : DiscriminatesInReferral subject victim


structure LaborOrgProhibition where
  subject : LegalPerson
  victim : LegalPerson
  isLaborOrg : IsLaborOrganization subject
  becauseOfTrait : BecauseOfProtectedTrait subject victim
  discriminates : DiscriminatesInMembership subject victim


structure TrainingProhibition where
  subject : LegalPerson
  victim : LegalPerson
  controlsProgram : ControlsTrainingProgram subject
  becauseOfTrait : BecauseOfProtectedTrait subject victim
  discriminates : DiscriminatesInTraining subject victim



structure RetaliationProhibition where
  subject : LegalPerson
  victim : LegalPerson
  protectedActivity : EngagedInProtectedActivity victim
  retaliates : RetaliatesAgainst subject victim


structure FederalSectorProhibition where
  subject : LegalPerson
  victim : LegalPerson
  isFederalEntity : IsFederalEmployingEntity subject
  becauseOfTrait : BecauseOfProtectedTrait subject victim
  nonNeutralAction : TakesNonNeutralPersonnelAction subject victim





structure BFOQPermission where
  subject : LegalPerson
  victim : LegalPerson
  isEmployer : IsEmployer subject
  bfoq : IsBonaFideOccupationalQualification subject victim


structure ReligiousEntityExemption where
  subject : LegalPerson
  exempt : IsReligiousEntityExempt subject






structure CivilActionPower where
  claimant : LegalPerson
  timelyCharge : ChargeTimelyFiled claimant
  rightToSue : RightToSueConditionsMet claimant





structure MotivatingFactorPractice where
  subject : LegalPerson
  victim : LegalPerson
  isEmployer : IsEmployer subject
  motivatingFactor : IsMotivatingFactor subject victim
  discriminates : DiscriminatesInEmployment subject victim





inductive UnlawfulEmploymentPractice where
  | employer : EmployerProhibition → UnlawfulEmploymentPractice
  | employerSegregation : EmployerSegregationProhibition → UnlawfulEmploymentPractice
  | agency : AgencyProhibition → UnlawfulEmploymentPractice
  | laborOrg : LaborOrgProhibition → UnlawfulEmploymentPractice
  | training : TrainingProhibition → UnlawfulEmploymentPractice
  | retaliation : RetaliationProhibition → UnlawfulEmploymentPractice
  | federalSector : FederalSectorProhibition → UnlawfulEmploymentPractice

end Proving.USC.T42.TitleVII.Deontic
