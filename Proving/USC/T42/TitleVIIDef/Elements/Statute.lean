















import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.TitleVIIDef.Elements.Types
import Proving.USC.T42.TitleVIIDef.Elements.Predicates

namespace Proving.USC.T42.TitleVIIDef.Elements

open Proving.USC.Common






structure DisparateTreatment
    (r : Person) (e : Entity) (p : Person) (ep : EmploymentPractice) (c : ComplaintText) : Prop where
  respondent     : IsCoveredRespondent r c
  commerce       : EngagedInInterstateCommerce e c
  protectedParty : IsPersonInUS p c
  ground         : OnProtectedGround p c
  adverse        : TookAdverseEmploymentAction r p ep c
  intent         : IntentToDiscriminate r c
  notBFOQ        : NotBonaFideOccupationalQualification r ep c
  notSeniority   : NotPursuantToBonaFideSeniorityOrMeritSystem r ep c






structure DisparateImpact
    (r : Person) (e : Entity) (p : Person) (ep : EmploymentPractice) (c : ComplaintText) : Prop where
  respondent     : IsCoveredRespondent r c
  commerce       : EngagedInInterstateCommerce e c
  protectedParty : IsPersonInUS p c
  ground         : OnProtectedGround p c
  impact         : PracticeCausesDisparateImpact ep c
  notJustified   : NotJobRelatedAndConsistentWithBusinessNecessity ep c




structure Retaliation
    (r : Person) (e : Entity) (p : Person) (c : ComplaintText) : Prop where
  respondent     : IsCoveredRespondent r c
  commerce       : EngagedInInterstateCommerce e c
  protectedParty : IsPersonInUS p c
  protectedAct   : EngagedInProtectedActivity p c
  causalLink     : AdverseActionBecauseOfProtectedActivity r p c




inductive ValidTitleVIIClaim
    (r : Person) (e : Entity) (p : Person) (ep : EmploymentPractice) (c : ComplaintText) : Prop where
  | viaDisparateTreatment : DisparateTreatment r e p ep c → ValidTitleVIIClaim r e p ep c
  | viaDisparateImpact    : DisparateImpact r e p ep c → ValidTitleVIIClaim r e p ep c
  | viaRetaliation        : Retaliation r e p c → ValidTitleVIIClaim r e p ep c

end Proving.USC.T42.TitleVIIDef.Elements
