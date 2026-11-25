import Proving.USC.Common.Types
import Proving.USC.T42.Ch21Misc.Deontic.Types








namespace Proving.USC.T42.Ch21Misc.Deontic

open Proving.USC.Common








axiom IsProgramOrActivity (e : Entity) (c : ComplaintText) : Prop








axiom IsExemptEmploymentEntity2000e1a (e : Entity) (c : ComplaintText) : Prop




axiom TookCoveredEmploymentAction2000e1a (e : Entity) (p : Person) (c : ComplaintText) : Prop





axiom ExemptionConditionMet2000e1a (e : Entity) (p : Person) (c : ComplaintText) : Prop







axiom IsCoveredEmploymentActor2000e1b (e : Entity) (c : ComplaintText) : Prop




axiom TookOtherwiseProhibitedAction2000e1b (e : Entity) (p : Person) (c : ComplaintText) : Prop





axiom ComplianceWouldViolateForeignLaw2000e1b (e : Entity) (p : Person) (c : ComplaintText) : Prop







axiom IsForeignPersonEmployer2000e1c2 (e : Entity) (c : ComplaintText) : Prop






axiom NotControlledByAmericanEmployer2000e1c2 (e : Entity) (c : ComplaintText) : Prop




axiom PracticeInForeignOperations2000e1c2 (e : Entity) (c : ComplaintText) : Prop








axiom SubjectToStateLawDuty2000e7 (p : Person) (l : Law) (c : ComplaintText) : Prop




axiom DeemedExemptFromStateLaw2000e7 (p : Person) (l : Law) (c : ComplaintText) : Prop





axiom StateLawNotRequiringUnlawfulPractice2000e7 (l : Law) (c : ComplaintText) : Prop







axiom IsCoveredPostingEntity2000e10 (e : Entity) (c : ComplaintText) : Prop





axiom PostedAndKeptPostedNotice2000e10 (e : Entity) (c : ComplaintText) : Prop




axiom ViolationWasWillful2000e10b (e : Entity) (c : ComplaintText) : Prop







axiom LawCreatesVeteransPreference2000e11 (l : Law) (c : ComplaintText) : Prop




axiom ConstruedToRepealVeteransPreference2000e11 (l : Law) (c : ComplaintText) : Prop










axiom KilledPersonPerformingOfficialFunctions2000e13 (p v : Person) (c : ComplaintText) : Prop





axiom VictimEngagedInOfficialFunctions2000e13 (v : Person) (c : ComplaintText) : Prop







axiom IsEEOC2000e14 (e : Entity) (c : ComplaintText) : Prop






axiom DevelopedCoordinationAgreements2000e14 (e : Entity) (c : ComplaintText) : Prop





axiom TransmittedAnnualReportByOctober1_2000e14 (e : Entity) (c : ComplaintText) : Prop






axiom IsPresident2000e15 (p : Person) (c : ComplaintText) : Prop






axiom ConvenedLeadershipConferences2000e15 (p : Person) (c : ComplaintText) : Prop






axiom InvitedRequiredParticipants2000e15 (p : Person) (c : ComplaintText) : Prop








axiom IsFederalContractingAgency2000e17 (e : Entity) (c : ComplaintText) : Prop





axiom DeniedContractWithoutHearing2000e17 (e : Entity) (k : GovContract) (c : ComplaintText) : Prop






axiom HasAcceptedAAPlanWithin12Months2000e17 (k : GovContract) (c : ComplaintText) : Prop





axiom EmployerNotSubstantiallyDeviated2000e17 (k : GovContract) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21Misc.Deontic
