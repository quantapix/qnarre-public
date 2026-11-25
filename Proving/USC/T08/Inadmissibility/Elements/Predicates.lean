
















import Proving.USC.Common.Types
import Proving.USC.T08.Inadmissibility.Elements.Types

namespace Proving.USC.T08.Inadmissibility.Elements

open Proving.USC.Common






axiom IsAlien (al : Alien) (c : ComplaintText) : Prop





axiom SeeksVisaOrAdmission (al : Alien) (c : ComplaintText) : Prop




axiom HealthRelatedGround (al : Alien) (c : ComplaintText) : Prop





axiom CriminalGround (al : Alien) (c : ComplaintText) : Prop





axiom SecurityOrTerrorismGround (al : Alien) (c : ComplaintText) : Prop




axiom PublicChargeGround (al : Alien) (c : ComplaintText) : Prop




axiom LaborCertificationGround (al : Alien) (c : ComplaintText) : Prop





axiom IllegalEntrantOrViolatorGround (al : Alien) (c : ComplaintText) : Prop




axiom DocumentationGround (al : Alien) (c : ComplaintText) : Prop




axiom IneligibleForCitizenshipGround (al : Alien) (c : ComplaintText) : Prop




axiom PreviouslyRemovedGround (al : Alien) (c : ComplaintText) : Prop




axiom MiscellaneousInadmissibilityGround (al : Alien) (c : ComplaintText) : Prop






axiom ApplicableWaiverGranted (al : Alien) (c : ComplaintText) : Prop







axiom IsPersonOrEntity (p : Person) (c : ComplaintText) : Prop




axiom HiredRecruitedOrReferred (p : Person) (al : Alien) (c : ComplaintText) : Prop



axiom ForEmploymentInUS (p : Person) (al : Alien) (c : ComplaintText) : Prop




axiom IsUnauthorizedAlien (al : Alien) (c : ComplaintText) : Prop





axiom GoodFaithVerificationDefense (p : Person) (c : ComplaintText) : Prop




axiom HiredForEmployment (p : Person) (al : Alien) (c : ComplaintText) : Prop





axiom FailedToComplyWithVerification (p : Person) (c : ComplaintText) : Prop



axiom ContinuedToEmploy (p : Person) (al : Alien) (c : ComplaintText) : Prop




axiom BecameUnauthorizedAlien (al : Alien) (c : ComplaintText) : Prop





axiom RequiredIndemnityBond (p : Person) (al : Alien) (c : ComplaintText) : Prop

end Proving.USC.T08.Inadmissibility.Elements
