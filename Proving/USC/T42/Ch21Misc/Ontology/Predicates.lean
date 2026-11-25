import Proving.USC.T42.Ch21Misc.Ontology.Types






namespace Proving.USC.T42.Ch21Misc.Ontology

open Proving.USC.Common







axiom IsGovernmentalOperation (e : Entity) (c : ComplaintText) : Prop






axiom IsEducationalOperation (e : Entity) (c : ComplaintText) : Prop






axiom IsPrivateOrganizationOperation (e : Entity) (c : ComplaintText) : Prop




axiom IsJointlyEstablishedEntity (e : Entity) (c : ComplaintText) : Prop





axiom ReceivesFederalFinancialAssistance (e : Entity) (c : ComplaintText) : Prop







axiom IsReligiousEntity (e : Entity) (c : ComplaintText) : Prop




axiom IsEmploymentOfAliensOutsideStates (emp : EmploymentRelation) (c : ComplaintText) : Prop




axiom ForeignLawComplianceConflict (emp : EmploymentRelation) (c : ComplaintText) : Prop



axiom HasInterrelatedOperations (er : Employer) (corp : Corporation) (c : ComplaintText) : Prop



axiom HasCommonManagement (er : Employer) (corp : Corporation) (c : ComplaintText) : Prop



axiom HasCentralizedLaborRelationsControl (er : Employer) (corp : Corporation) (c : ComplaintText) : Prop



axiom HasCommonOwnershipOrFinancialControl (er : Employer) (corp : Corporation) (c : ComplaintText) : Prop




axiom IsForeignIncorporated (corp : Corporation) (c : ComplaintText) : Prop




axiom IsForeignPersonNotAmericanControlled (er : Employer) (c : ComplaintText) : Prop







axiom IsStateOrLocalLaw (l : Law) (c : ComplaintText) : Prop





axiom PurportsToRequireUnlawfulEmploymentPractice (l : Law) (c : ComplaintText) : Prop






axiom IsCommissionApprovedNotice (n : Notice) (c : ComplaintText) : Prop



axiom WillfulPostingViolation (e : Entity) (c : ComplaintText) : Prop






axiom IsVeteransPreferenceLaw (l : Law) (c : ComplaintText) : Prop






axiom IsCommissionPersonnel (p : Person) (c : ComplaintText) : Prop







axiom IsEEOEnforcementBody (e : Entity) (c : ComplaintText) : Prop








axiom IsEEOConferenceParticipant (p : Person) (c : ComplaintText) : Prop








axiom IsAcceptedAffirmativeActionPlan (pl : AffirmativeActionPlan) (c : ComplaintText) : Prop




axiom HasSubstantiallyDeviatedFromPlan (er : Employer) (pl : AffirmativeActionPlan) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21Misc.Ontology
