





import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch21CivilRights.Recert.Elements.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Elements.Predicates
import Proving.USC.T42.Ch21CivilRights.Recert.Elements.Statute

set_option autoImplicit false

namespace Proving.USC.T42.Ch21CivilRights.Recert.Elements

open Proving.USC.Common



theorem privateOrganizationRoute_intro_asWhole {pr : Program} {c : ComplaintText}
    (h : AssistanceExtendedToOrganizationAsWhole pr c) : PrivateOrganizationRoute pr c :=
  .asWhole h

theorem privateOrganizationRoute_intro_principallyEngaged {pr : Program} {c : ComplaintText}
    (h : PrincipallyEngagedInCoveredServices pr c) : PrivateOrganizationRoute pr c :=
  .principallyEngaged h

theorem entirePrivateOrganization_intro {pr : Program} {c : ComplaintText}
    (hEntire : IsEntirePrivateOrganization pr c) (hRoute : PrivateOrganizationRoute pr c) :
    EntirePrivateOrganization pr c :=
  ⟨hEntire, hRoute⟩

theorem programOrActivityCategory_intro_stateOrLocalInstrumentality
    {pr : Program} {c : ComplaintText} (h : IsStateOrLocalInstrumentality pr c) :
    ProgramOrActivityCategory pr c := .stateOrLocalInstrumentality h

theorem programOrActivityCategory_intro_stateOrLocalDistributingEntity
    {pr : Program} {c : ComplaintText} (h : IsStateOrLocalDistributingEntity pr c) :
    ProgramOrActivityCategory pr c := .stateOrLocalDistributingEntity h

theorem programOrActivityCategory_intro_postsecondary
    {pr : Program} {c : ComplaintText} (h : IsPostsecondaryInstitution pr c) :
    ProgramOrActivityCategory pr c := .postsecondary h

theorem programOrActivityCategory_intro_schoolSystem
    {pr : Program} {c : ComplaintText} (h : IsSchoolSystemOrLocalEducationalAgency pr c) :
    ProgramOrActivityCategory pr c := .schoolSystem h

theorem programOrActivityCategory_intro_entirePrivateOrganization
    {pr : Program} {c : ComplaintText} (h : EntirePrivateOrganization pr c) :
    ProgramOrActivityCategory pr c := .entirePrivateOrganization h

theorem programOrActivityCategory_intro_separateFacility
    {pr : Program} {c : ComplaintText} (h : IsGeographicallySeparateFundedFacility pr c) :
    ProgramOrActivityCategory pr c := .separateFacility h

theorem programOrActivityCategory_intro_establishedByCoveredEntities
    {pr : Program} {c : ComplaintText} (h : EstablishedByTwoOrMoreCoveredEntities pr c) :
    ProgramOrActivityCategory pr c := .establishedByCoveredEntities h

theorem programOrActivity2000d4a_intro {pr : Program} {c : ComplaintText}
    (hCat : ProgramOrActivityCategory pr c)
    (hFunded : AnyPartExtendedFederalFinancialAssistance pr c) :
    ProgramOrActivity2000d4a pr c :=
  ⟨hCat, hFunded⟩



theorem prohibitedGround_intro_race {p : Person} {c : ComplaintText}
    (h : OnGroundOfRace p c) : ProhibitedGround p c := .race h

theorem prohibitedGround_intro_color {p : Person} {c : ComplaintText}
    (h : OnGroundOfColor p c) : ProhibitedGround p c := .color h

theorem prohibitedGround_intro_nationalOrigin {p : Person} {c : ComplaintText}
    (h : OnGroundOfNationalOrigin p c) : ProhibitedGround p c := .nationalOrigin h

theorem prohibitedTreatment_intro_exclusion {p : Person} {pr : Program} {c : ComplaintText}
    (h : ExcludedFromParticipation p pr c) : ProhibitedTreatment p pr c := .exclusion h

theorem prohibitedTreatment_intro_denialOfBenefits
    {p : Person} {pr : Program} {c : ComplaintText}
    (h : DeniedBenefits p pr c) : ProhibitedTreatment p pr c := .denialOfBenefits h

theorem prohibitedTreatment_intro_discrimination
    {p : Person} {pr : Program} {c : ComplaintText}
    (h : SubjectedToDiscrimination p pr c) : ProhibitedTreatment p pr c := .discrimination h

theorem section2000d_intro {p : Person} {r : Recipient} {pr : Program} {c : ComplaintText}
    (hPerson : IsPersonInUS p c)
    (hNotState : ¬ IsStateInstrumentality p c)
    (hGround : ProhibitedGround p c)
    (hTreatment : ProhibitedTreatment p pr c)
    (hOnGround : TreatmentOnGroundOfProtectedTrait p pr c)
    (hOperates : OperatesProgramOrActivity r pr c)
    (hProgram : IsProgramOrActivity pr c)
    (hAssisted : ReceivesFederalFinancialAssistance pr c) :
    Section2000d p r pr c :=
  ⟨hPerson, hNotState, hGround, hTreatment, hOnGround, hOperates, hProgram, hAssisted⟩

theorem validSection2000dJudicialClaim_intro
    {p : Person} {r : Recipient} {pr : Program} {c : ComplaintText}
    (hViolation : Section2000d p r pr c)
    (hIntent : IntentToDiscriminate p c)
    (hInjury : SufferedInjury p c)
    (hCause : ProximateCause p c)
    (hTimely : WithinLimitations p c) :
    ValidSection2000dJudicialClaim p r pr c :=
  ⟨hViolation, hIntent, hInjury, hCause, hTimely⟩



theorem effectuationPrerequisites_intro {a : FederalAgency} {req : Requirement}
    {c : ComplaintText}
    (hAgency : IsFederalFundingAgency a c)
    (hAdopted : RequirementAdoptedByRuleOfGeneralApplicability req a c)
    (hConsistent : RuleConsistentWithStatutoryObjectives req c)
    (hApproved : RuleApprovedByPresident req c) :
    EffectuationPrerequisites a req c :=
  ⟨hAgency, hAdopted, hConsistent, hApproved⟩

theorem terminationRoute_intro {r : Recipient} {req : Requirement}
    {act : EnforcementAction} {c : ComplaintText}
    (hNoncompliance : RecipientFailedToComplyWithRequirement r req c)
    (hHearing : OpportunityForHearingAfforded r act c)
    (hFinding : ExpressFindingOfNoncomplianceOnRecord r act c)
    (hLimRecipient : TerminationLimitedToFoundRecipient act c)
    (hLimProgram : TerminationLimitedToFoundProgram act c)
    (hReport : WrittenReportFiledWithCongressionalCommittees act c)
    (hDays : 30 ≤ daysFromReportFilingToEffectiveDate act c) :
    TerminationRoute r req act c :=
  ⟨hNoncompliance, hHearing, hFinding, hLimRecipient, hLimProgram, hReport, hDays⟩

theorem effectuationRoute_intro_termination {r : Recipient} {req : Requirement}
    {act : EnforcementAction} {c : ComplaintText}
    (h : TerminationRoute r req act c) : EffectuationRoute r req act c := .termination h

theorem effectuationRoute_intro_otherMeans {r : Recipient} {req : Requirement}
    {act : EnforcementAction} {c : ComplaintText}
    (h : OtherMeansAuthorizedByLaw act c) : EffectuationRoute r req act c := .otherMeans h

theorem section2000d1_intro {a : FederalAgency} {req : Requirement} {r : Recipient}
    {act : EnforcementAction} {c : ComplaintText}
    (hPre : EffectuationPrerequisites a req c)
    (hAdvised : AdvisedOfFailureToComply r act c)
    (hVoluntary : VoluntaryComplianceDeterminedUnavailable r act c)
    (hRoute : EffectuationRoute r req act c) :
    Section2000d1 a req r act c :=
  ⟨hPre, hAdvised, hVoluntary, hRoute⟩



theorem coveredAntidiscriminationViolation_intro_rehabSection504
    {v : Violation} {c : ComplaintText} (h : ViolationOfRehabilitationActSection504 v c) :
    CoveredAntidiscriminationViolation v c := .rehabSection504 h

theorem coveredAntidiscriminationViolation_intro_titleIX
    {v : Violation} {c : ComplaintText} (h : ViolationOfTitleIX v c) :
    CoveredAntidiscriminationViolation v c := .titleIX h

theorem coveredAntidiscriminationViolation_intro_ageAct
    {v : Violation} {c : ComplaintText} (h : ViolationOfAgeDiscriminationAct v c) :
    CoveredAntidiscriminationViolation v c := .ageAct h

theorem coveredAntidiscriminationViolation_intro_titleVI
    {v : Violation} {c : ComplaintText} (h : ViolationOfTitleVI v c) :
    CoveredAntidiscriminationViolation v c := .titleVI h

theorem coveredAntidiscriminationViolation_intro_otherFundingStatute
    {v : Violation} {c : ComplaintText}
    (h : ViolationOfOtherFederalFundingAntidiscriminationStatute v c) :
    CoveredAntidiscriminationViolation v c := .otherFundingStatute h

theorem section2000d7Abrogation_intro {d : Person} {v : Violation} {c : ComplaintText}
    (hState : DefendantIsState d c)
    (hCovered : CoveredAntidiscriminationViolation v c)
    (hAfter : abrogationEffectiveDay < violationLatestConductDay v c) :
    Section2000d7Abrogation d v c :=
  ⟨hState, hCovered, hAfter⟩

theorem section2000d7RemediesEqualization_intro
    {d : Person} {v : Violation} {c : ComplaintText}
    (hAbrogation : Section2000d7Abrogation d v c)
    (hRemedy : RemedySoughtAvailableAgainstNonStateEntity v c) :
    Section2000d7RemediesEqualization d v c :=
  ⟨hAbrogation, hRemedy⟩



theorem section2000a4InvestigationAuthority_intro {i : Investigation} {c : ComplaintText}
    (hReferred : ComplaintReferredByCourt i c) :
    Section2000a4InvestigationAuthority i c :=
  ⟨hReferred⟩

theorem section2000a4LawfulTestimonyRelease_intro {t : Testimony} {c : ComplaintText}
    (hAgreed : AllPartiesAgreedToRelease t c)
    (hPermitted : CourtPermittedRelease t c) :
    Section2000a4LawfulTestimonyRelease t c :=
  ⟨hAgreed, hPermitted⟩

theorem section2000a4Compliance_intro {i : Investigation} {h : Hearing} {c : ComplaintText}
    (hAuthority : Section2000a4InvestigationAuthority i c)
    (hSession : HearingConductedInExecutiveSession h c)
    (hEndeavor : EndeavoredToBringVoluntarySettlement i c) :
    Section2000a4Compliance i h c :=
  ⟨hAuthority, hSession, hEndeavor⟩



theorem section2000a5Action_intro {d : Person} {pp : PatternOrPractice} {pl : Pleading}
    {c : ComplaintText}
    (hCause : AttorneyGeneralHasReasonableCause pp c)
    (hPattern : EngagedInPatternOrPracticeOfResistance d pp c)
    (hRights : ResistanceToRightsSecuredBySubchapter pp c)
    (hIntent : PatternIntendedToDenyFullExercise pp c)
    (hCourt : FiledInAppropriateDistrictCourt pl c)
    (hSigned : ComplaintSignedByAttorneyGeneral pl c)
    (hFacts : ComplaintSetsForthPatternFacts pl c)
    (hRelief : ComplaintRequestsPreventiveRelief pl c) :
    Section2000a5Action d pp pl c :=
  ⟨hCause, hPattern, hRights, hIntent, hCourt, hSigned, hFacts, hRelief⟩

theorem section2000a5ThreeJudgeCourt_intro {d : Person} {pp : PatternOrPractice}
    {pl : Pleading} {c : ComplaintText}
    (hAction : Section2000a5Action d pp pl c)
    (hRequest : ThreeJudgeCourtRequestFiled pl c)
    (hCertificate : CertificateOfGeneralPublicImportanceFiled pl c) :
    Section2000a5ThreeJudgeCourt d pp pl c :=
  ⟨hAction, hRequest, hCertificate⟩

end Proving.USC.T42.Ch21CivilRights.Recert.Elements
