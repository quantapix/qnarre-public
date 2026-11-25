import Proving.USC.Common.Types
import Proving.USC.T42.Ch21Misc.Elements.Types







namespace Proving.USC.T42.Ch21Misc.Elements
open Proving.USC.Common






axiom IsStateOrLocalInstrumentality (e : Entity) (c : ComplaintText) : Prop




axiom IsEducationalEntity (e : Entity) (c : ComplaintText) : Prop




axiom IsCoveredPrivateOrganization (e : Entity) (c : ComplaintText) : Prop



axiom IsPlantOrSeparateFacility (e : Entity) (c : ComplaintText) : Prop



axiom IsJointlyEstablishedEntity (e : Entity) (c : ComplaintText) : Prop




axiom ReceivesFederalFinancialAssistance (e : Entity) (c : ComplaintText) : Prop





axiom EmploysAliensOutsideUS (e : Entity) (p : Person) (c : ComplaintText) : Prop




axiom ReligiousEntityReligionBasedEmployment (e : Entity) (p : Person) (c : ComplaintText) : Prop




axiom ForeignWorkplaceLawConflict (e : Entity) (p : Person) (c : ComplaintText) : Prop




axiom ForeignPersonNotAmericanControlled (e : Entity) (c : ComplaintText) : Prop




axiom ControlsForeignCorporation (e : Entity) (corp : Entity) (c : ComplaintText) : Prop



axiom EngagedInProhibitedPractice (corp : Entity) (pr : EmploymentPractice) (c : ComplaintText) : Prop





axiom StateLawImposesLiability (l : Law) (c : ComplaintText) : Prop



axiom StateLawRequiresOrPermitsUnlawfulPractice (l : Law) (c : ComplaintText) : Prop





axiom IsCoveredPostingEntity (e : Entity) (c : ComplaintText) : Prop



axiom FailedToPostRequiredNotice (e : Entity) (c : ComplaintText) : Prop



axiom ActedWithScienter (e : Entity) (c : ComplaintText) : Prop





axiom CreatesVeteransPreference (l : Law) (c : ComplaintText) : Prop





axiom IsCommissionPersonnel (v : Person) (c : ComplaintText) : Prop



axiom KillsInViolationOf1114 (d : Person) (v : Person) (c : ComplaintText) : Prop



axiom EngagedInOrOnAccountOfOfficialDuties (v : Person) (c : ComplaintText) : Prop





axiom DevelopsCoordinationPolicies (e : Entity) (c : ComplaintText) : Prop




axiom TransmitsAnnualReport (e : Entity) (c : ComplaintText) : Prop





axiom ConvenesLeadershipConferences (p : Person) (c : ComplaintText) : Prop



axiom InvitesEnumeratedParticipants (p : Person) (c : ComplaintText) : Prop





axiom HasAcceptedAffirmativeActionPlan (e : Entity) (pl : AffirmativeActionPlan) (c : ComplaintText) : Prop



axiom PlanForSameFacility (pl : AffirmativeActionPlan) (c : ComplaintText) : Prop



axiom AcceptedWithinTwelveMonths (pl : AffirmativeActionPlan) (c : ComplaintText) : Prop




axiom PlanDeemedAccepted (pl : AffirmativeActionPlan) (c : ComplaintText) : Prop




axiom SubstantialDeviationFromPlan (e : Entity) (pl : AffirmativeActionPlan) (c : ComplaintText) : Prop




axiom ContractActionTaken (k : GovContract) (e : Entity) (c : ComplaintText) : Prop



axiom AccordedFullHearing (e : Entity) (k : GovContract) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21Misc.Elements
