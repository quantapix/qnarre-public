








import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch21CivilRights.Recert.Elements.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Elements.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.Ch21CivilRights.Recert.Elements

open Proving.USC.Common







inductive PrivateOrganizationRoute (pr : Program) (c : ComplaintText) : Prop where
  | asWhole (h : AssistanceExtendedToOrganizationAsWhole pr c)
  | principallyEngaged (h : PrincipallyEngagedInCoveredServices pr c)



structure EntirePrivateOrganization (pr : Program) (c : ComplaintText) : Prop where
  entire : IsEntirePrivateOrganization pr c
  route  : PrivateOrganizationRoute pr c



inductive ProgramOrActivityCategory (pr : Program) (c : ComplaintText) : Prop where
  | stateOrLocalInstrumentality (h : IsStateOrLocalInstrumentality pr c)
  | stateOrLocalDistributingEntity (h : IsStateOrLocalDistributingEntity pr c)
  | postsecondary (h : IsPostsecondaryInstitution pr c)
  | schoolSystem (h : IsSchoolSystemOrLocalEducationalAgency pr c)
  | entirePrivateOrganization (h : EntirePrivateOrganization pr c)
  | separateFacility (h : IsGeographicallySeparateFundedFacility pr c)
  | establishedByCoveredEntities (h : EstablishedByTwoOrMoreCoveredEntities pr c)



structure ProgramOrActivity2000d4a (pr : Program) (c : ComplaintText) : Prop where
  category      : ProgramOrActivityCategory pr c
  anyPartFunded : AnyPartExtendedFederalFinancialAssistance pr c



abbrev IsProgramOrActivity (pr : Program) (c : ComplaintText) : Prop :=
  ProgramOrActivity2000d4a pr c




inductive ProhibitedGround (p : Person) (c : ComplaintText) : Prop where
  | race (h : OnGroundOfRace p c)
  | color (h : OnGroundOfColor p c)
  | nationalOrigin (h : OnGroundOfNationalOrigin p c)


inductive ProhibitedTreatment (p : Person) (pr : Program) (c : ComplaintText) : Prop where
  | exclusion (h : ExcludedFromParticipation p pr c)
  | denialOfBenefits (h : DeniedBenefits p pr c)
  | discrimination (h : SubjectedToDiscrimination p pr c)






structure Section2000d (p : Person) (r : Recipient) (pr : Program)
    (c : ComplaintText) : Prop where
  personInUS              : IsPersonInUS p c
  notStateInstrumentality : ¬ IsStateInstrumentality p c
  ground                  : ProhibitedGround p c
  treatment               : ProhibitedTreatment p pr c
  onThatGround            : TreatmentOnGroundOfProtectedTrait p pr c
  operatesProgram         : OperatesProgramOrActivity r pr c
  programOrActivity       : IsProgramOrActivity pr c
  federallyAssisted       : ReceivesFederalFinancialAssistance pr c




structure ValidSection2000dJudicialClaim (p : Person) (r : Recipient) (pr : Program)
    (c : ComplaintText) : Prop where
  violation   : Section2000d p r pr c
  intentional : IntentToDiscriminate p c
  injury      : SufferedInjury p c
  causation   : ProximateCause p c
  timely      : WithinLimitations p c







structure EffectuationPrerequisites (a : FederalAgency) (req : Requirement)
    (c : ComplaintText) : Prop where
  agency            : IsFederalFundingAgency a c
  adoptedByRule     : RequirementAdoptedByRuleOfGeneralApplicability req a c
  consistent        : RuleConsistentWithStatutoryObjectives req c
  presidentApproved : RuleApprovedByPresident req c




structure TerminationRoute (r : Recipient) (req : Requirement)
    (act : EnforcementAction) (c : ComplaintText) : Prop where
  noncompliance      : RecipientFailedToComplyWithRequirement r req c
  hearingOpportunity : OpportunityForHearingAfforded r act c
  expressFinding     : ExpressFindingOfNoncomplianceOnRecord r act c
  limitedToRecipient : TerminationLimitedToFoundRecipient act c
  limitedToProgram   : TerminationLimitedToFoundProgram act c
  reportFiled        : WrittenReportFiledWithCongressionalCommittees act c
  thirtyDaysElapsed  : 30 ≤ daysFromReportFilingToEffectiveDate act c


inductive EffectuationRoute (r : Recipient) (req : Requirement)
    (act : EnforcementAction) (c : ComplaintText) : Prop where
  | termination (h : TerminationRoute r req act c)
  | otherMeans (h : OtherMeansAuthorizedByLaw act c)




structure Section2000d1 (a : FederalAgency) (req : Requirement) (r : Recipient)
    (act : EnforcementAction) (c : ComplaintText) : Prop where
  prerequisites        : EffectuationPrerequisites a req c
  advised              : AdvisedOfFailureToComply r act c
  voluntaryUnavailable : VoluntaryComplianceDeterminedUnavailable r act c
  route                : EffectuationRoute r req act c






def abrogationEffectiveDay : Nat := 6137



inductive CoveredAntidiscriminationViolation (v : Violation) (c : ComplaintText) : Prop where
  | rehabSection504 (h : ViolationOfRehabilitationActSection504 v c)
  | titleIX (h : ViolationOfTitleIX v c)
  | ageAct (h : ViolationOfAgeDiscriminationAct v c)
  | titleVI (h : ViolationOfTitleVI v c)
  | otherFundingStatute (h : ViolationOfOtherFederalFundingAntidiscriminationStatute v c)




structure Section2000d7Abrogation (d : Person) (v : Violation) (c : ComplaintText) : Prop where
  defendantIsState   : DefendantIsState d c
  covered            : CoveredAntidiscriminationViolation v c
  afterEffectiveDate : abrogationEffectiveDay < violationLatestConductDay v c



structure Section2000d7RemediesEqualization (d : Person) (v : Violation)
    (c : ComplaintText) : Prop where
  abrogation        : Section2000d7Abrogation d v c
  remedyEqualized   : RemedySoughtAvailableAgainstNonStateEntity v c





structure Section2000a4InvestigationAuthority (i : Investigation)
    (c : ComplaintText) : Prop where
  referred : ComplaintReferredByCourt i c



structure Section2000a4LawfulTestimonyRelease (t : Testimony) (c : ComplaintText) : Prop where
  partiesAgreed  : AllPartiesAgreedToRelease t c
  courtPermitted : CourtPermittedRelease t c



structure Section2000a4Compliance (i : Investigation) (h : Hearing)
    (c : ComplaintText) : Prop where
  authority            : Section2000a4InvestigationAuthority i c
  executiveSession     : HearingConductedInExecutiveSession h c
  endeavoredSettlement : EndeavoredToBringVoluntarySettlement i c






structure Section2000a5Action (d : Person) (pp : PatternOrPractice) (pl : Pleading)
    (c : ComplaintText) : Prop where
  reasonableCause           : AttorneyGeneralHasReasonableCause pp c
  patternOrPractice         : EngagedInPatternOrPracticeOfResistance d pp c
  resistanceToSecuredRights : ResistanceToRightsSecuredBySubchapter pp c
  intendedToDeny            : PatternIntendedToDenyFullExercise pp c
  appropriateCourt          : FiledInAppropriateDistrictCourt pl c
  signed                    : ComplaintSignedByAttorneyGeneral pl c
  factsSetForth             : ComplaintSetsForthPatternFacts pl c
  reliefRequested           : ComplaintRequestsPreventiveRelief pl c



structure Section2000a5ThreeJudgeCourt (d : Person) (pp : PatternOrPractice)
    (pl : Pleading) (c : ComplaintText) : Prop where
  action       : Section2000a5Action d pp pl c
  requestFiled : ThreeJudgeCourtRequestFiled pl c
  certificate  : CertificateOfGeneralPublicImportanceFiled pl c

end Proving.USC.T42.Ch21CivilRights.Recert.Elements
