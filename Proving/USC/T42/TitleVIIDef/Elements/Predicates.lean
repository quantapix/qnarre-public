














import Proving.USC.Common.Types
import Proving.USC.T42.TitleVIIDef.Elements.Types

namespace Proving.USC.T42.TitleVIIDef.Elements

open Proving.USC.Common






axiom IsCoveredRespondent (r : Person) (c : ComplaintText) : Prop





axiom TookAdverseEmploymentAction (r : Person) (p : Person) (ep : EmploymentPractice) (c : ComplaintText) : Prop





axiom ProtectedGroundWasMotivatingFactor (p : Person) (ep : EmploymentPractice) (c : ComplaintText) : Prop





axiom PracticeCausesDisparateImpact (ep : EmploymentPractice) (c : ComplaintText) : Prop






axiom NotJobRelatedAndConsistentWithBusinessNecessity (ep : EmploymentPractice) (c : ComplaintText) : Prop






axiom NotBonaFideOccupationalQualification (r : Person) (ep : EmploymentPractice) (c : ComplaintText) : Prop





axiom NotPursuantToBonaFideSeniorityOrMeritSystem (r : Person) (ep : EmploymentPractice) (c : ComplaintText) : Prop






axiom EngagedInProtectedActivity (p : Person) (c : ComplaintText) : Prop






axiom AdverseActionBecauseOfProtectedActivity (r : Person) (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVIIDef.Elements
