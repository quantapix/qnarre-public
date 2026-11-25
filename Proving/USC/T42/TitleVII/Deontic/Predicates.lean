import Proving.USC.Common.Types
import Proving.USC.T42.TitleVII.Deontic.Types













namespace Proving.USC.T42.TitleVII.Deontic

open Proving.USC.Common






axiom IsEmployer : LegalPerson → Prop



axiom IsEmploymentAgency : LegalPerson → Prop



axiom IsLaborOrganization : LegalPerson → Prop



axiom ControlsTrainingProgram : LegalPerson → Prop



axiom IsFederalEmployingEntity : LegalPerson → Prop






axiom BecauseOfProtectedTrait : LegalPerson → LegalPerson → Prop




axiom IsMotivatingFactor : LegalPerson → LegalPerson → Prop




axiom EngagedInProtectedActivity : LegalPerson → Prop




axiom IsBonaFideOccupationalQualification : LegalPerson → LegalPerson → Prop





axiom IsReligiousEntityExempt : LegalPerson → Prop



axiom ChargeTimelyFiled : LegalPerson → Prop




axiom RightToSueConditionsMet : LegalPerson → Prop






axiom DiscriminatesInEmployment : LegalPerson → LegalPerson → Prop




axiom LimitsSegregatesOrClassifies : LegalPerson → LegalPerson → Prop



axiom DiscriminatesInReferral : LegalPerson → LegalPerson → Prop




axiom DiscriminatesInMembership : LegalPerson → LegalPerson → Prop




axiom DiscriminatesInTraining : LegalPerson → LegalPerson → Prop




axiom RetaliatesAgainst : LegalPerson → LegalPerson → Prop




axiom TakesNonNeutralPersonnelAction : LegalPerson → LegalPerson → Prop

end Proving.USC.T42.TitleVII.Deontic
