import Proving.USC.Common.Types
import Proving.USC.T42.Ch21Misc.Elements.Types
import Proving.USC.T42.Ch21Misc.Elements.Predicates
import Proving.USC.T42.Ch21Misc.Elements.Statute






namespace Proving.USC.T42.Ch21Misc.Elements
open Proving.USC.Common



theorem programOrActivity_intro_stateLocal {e : Entity} {c : ComplaintText}
    (hInst : IsStateOrLocalInstrumentality e c)
    (hFFA : ReceivesFederalFinancialAssistance e c) : ProgramOrActivity e c :=
  ProgramOrActivity.stateLocal hInst hFFA

theorem programOrActivity_intro_education {e : Entity} {c : ComplaintText}
    (hEdu : IsEducationalEntity e c)
    (hFFA : ReceivesFederalFinancialAssistance e c) : ProgramOrActivity e c :=
  ProgramOrActivity.education hEdu hFFA

theorem programOrActivity_intro_privateOrganization {e : Entity} {c : ComplaintText}
    (hOrg : IsCoveredPrivateOrganization e c)
    (hFFA : ReceivesFederalFinancialAssistance e c) : ProgramOrActivity e c :=
  ProgramOrActivity.privateOrganization hOrg hFFA

theorem programOrActivity_intro_separateFacility {e : Entity} {c : ComplaintText}
    (hFac : IsPlantOrSeparateFacility e c)
    (hFFA : ReceivesFederalFinancialAssistance e c) : ProgramOrActivity e c :=
  ProgramOrActivity.separateFacility hFac hFFA

theorem programOrActivity_intro_jointEntity {e : Entity} {c : ComplaintText}
    (hJoint : IsJointlyEstablishedEntity e c)
    (hFFA : ReceivesFederalFinancialAssistance e c) : ProgramOrActivity e c :=
  ProgramOrActivity.jointEntity hJoint hFFA



theorem section2000e1Overcome_intro {e : Entity} {p : Person} {c : ComplaintText}
    (hAlien : ¬ EmploysAliensOutsideUS e p c)
    (hRelig : ¬ ReligiousEntityReligionBasedEmployment e p c)
    (hForeignLaw : ¬ ForeignWorkplaceLawConflict e p c)
    (hForeignOps : ¬ ForeignPersonNotAmericanControlled e c) :
    Section2000e1Overcome e p c :=
  ⟨hAlien, hRelig, hForeignLaw, hForeignOps⟩

theorem section2000e1c1Attribution_intro {e corp : Entity} {pr : EmploymentPractice} {c : ComplaintText}
    (hCtrl : ControlsForeignCorporation e corp c)
    (hPractice : EngagedInProhibitedPractice corp pr c) :
    Section2000e1c1Attribution e corp pr c :=
  ⟨hCtrl, hPractice⟩



theorem section2000e7Preserved_intro {l : Law} {c : ComplaintText}
    (hLiab : StateLawImposesLiability l c)
    (hNotUnlawful : ¬ StateLawRequiresOrPermitsUnlawfulPractice l c) :
    Section2000e7Preserved l c :=
  ⟨hLiab, hNotUnlawful⟩



theorem section2000e10a_intro {e : Entity} {c : ComplaintText}
    (hCovered : IsCoveredPostingEntity e c)
    (hFailed : FailedToPostRequiredNotice e c) : Section2000e10a e c :=
  ⟨hCovered, hFailed⟩

theorem section2000e10b_intro {e : Entity} {c : ComplaintText}
    (hViolation : Section2000e10a e c)
    (hWillful : ActedWithScienter e c) : Section2000e10b e c :=
  ⟨hViolation, hWillful⟩



theorem section2000e11Preserved_intro {l : Law} {c : ComplaintText}
    (hVet : CreatesVeteransPreference l c) : Section2000e11Preserved l c :=
  ⟨hVet⟩



theorem section2000e13Offense_intro {d v : Person} {c : ComplaintText}
    (hPersonnel : IsCommissionPersonnel v c)
    (hKilling : KillsInViolationOf1114 d v c)
    (hNexus : EngagedInOrOnAccountOfOfficialDuties v c) :
    Section2000e13Offense d v c :=
  ⟨hPersonnel, hKilling, hNexus⟩



theorem section2000e14Compliance_intro {e : Entity} {c : ComplaintText}
    (hCoord : DevelopsCoordinationPolicies e c)
    (hReport : TransmitsAnnualReport e c) : Section2000e14Compliance e c :=
  ⟨hCoord, hReport⟩



theorem section2000e15Compliance_intro {p : Person} {c : ComplaintText}
    (hConvenes : ConvenesLeadershipConferences p c)
    (hInvites : InvitesEnumeratedParticipants p c) : Section2000e15Compliance p c :=
  ⟨hConvenes, hInvites⟩



theorem section2000e17Violation_intro {e : Entity} {k : GovContract}
    {pl : AffirmativeActionPlan} {c : ComplaintText}
    (hPlan : HasAcceptedAffirmativeActionPlan e pl c)
    (hFacility : PlanForSameFacility pl c)
    (hTwelve : AcceptedWithinTwelveMonths pl c)
    (hDeemed : PlanDeemedAccepted pl c)
    (hNoDev : ¬ SubstantialDeviationFromPlan e pl c)
    (hAction : ContractActionTaken k e c)
    (hNoHearing : ¬ AccordedFullHearing e k c) :
    Section2000e17Violation e k pl c :=
  ⟨hPlan, hFacility, hTwelve, hDeemed, hNoDev, hAction, hNoHearing⟩

end Proving.USC.T42.Ch21Misc.Elements
