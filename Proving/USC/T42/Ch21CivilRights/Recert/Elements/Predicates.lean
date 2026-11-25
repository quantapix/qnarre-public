









import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch21CivilRights.Recert.Elements.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch21CivilRights.Recert.Elements

open Proving.USC.Common





axiom ExcludedFromParticipation (p : Person) (pr : Program) (c : ComplaintText) : Prop



axiom DeniedBenefits (p : Person) (pr : Program) (c : ComplaintText) : Prop



axiom SubjectedToDiscrimination (p : Person) (pr : Program) (c : ComplaintText) : Prop



axiom OnGroundOfRace (p : Person) (c : ComplaintText) : Prop



axiom OnGroundOfColor (p : Person) (c : ComplaintText) : Prop



axiom OnGroundOfNationalOrigin (p : Person) (c : ComplaintText) : Prop




axiom TreatmentOnGroundOfProtectedTrait (p : Person) (pr : Program) (c : ComplaintText) : Prop




axiom ReceivesFederalFinancialAssistance (pr : Program) (c : ComplaintText) : Prop




axiom OperatesProgramOrActivity (r : Recipient) (pr : Program) (c : ComplaintText) : Prop





axiom IsStateInstrumentality (p : Person) (c : ComplaintText) : Prop



axiom SufferedInjury (p : Person) (c : ComplaintText) : Prop






axiom IsStateOrLocalInstrumentality (pr : Program) (c : ComplaintText) : Prop





axiom IsStateOrLocalDistributingEntity (pr : Program) (c : ComplaintText) : Prop




axiom IsPostsecondaryInstitution (pr : Program) (c : ComplaintText) : Prop




axiom IsSchoolSystemOrLocalEducationalAgency (pr : Program) (c : ComplaintText) : Prop




axiom IsEntirePrivateOrganization (pr : Program) (c : ComplaintText) : Prop



axiom AssistanceExtendedToOrganizationAsWhole (pr : Program) (c : ComplaintText) : Prop





axiom PrincipallyEngagedInCoveredServices (pr : Program) (c : ComplaintText) : Prop





axiom IsGeographicallySeparateFundedFacility (pr : Program) (c : ComplaintText) : Prop




axiom EstablishedByTwoOrMoreCoveredEntities (pr : Program) (c : ComplaintText) : Prop




axiom AnyPartExtendedFederalFinancialAssistance (pr : Program) (c : ComplaintText) : Prop







axiom IsFederalFundingAgency (a : FederalAgency) (c : ComplaintText) : Prop




axiom RequirementAdoptedByRuleOfGeneralApplicability
    (req : Requirement) (a : FederalAgency) (c : ComplaintText) : Prop




axiom RuleConsistentWithStatutoryObjectives (req : Requirement) (c : ComplaintText) : Prop



axiom RuleApprovedByPresident (req : Requirement) (c : ComplaintText) : Prop



axiom RecipientFailedToComplyWithRequirement
    (r : Recipient) (req : Requirement) (c : ComplaintText) : Prop



axiom OpportunityForHearingAfforded
    (r : Recipient) (act : EnforcementAction) (c : ComplaintText) : Prop



axiom ExpressFindingOfNoncomplianceOnRecord
    (r : Recipient) (act : EnforcementAction) (c : ComplaintText) : Prop




axiom AdvisedOfFailureToComply
    (r : Recipient) (act : EnforcementAction) (c : ComplaintText) : Prop




axiom VoluntaryComplianceDeterminedUnavailable
    (r : Recipient) (act : EnforcementAction) (c : ComplaintText) : Prop




axiom TerminationLimitedToFoundRecipient (act : EnforcementAction) (c : ComplaintText) : Prop




axiom TerminationLimitedToFoundProgram (act : EnforcementAction) (c : ComplaintText) : Prop





axiom WrittenReportFiledWithCongressionalCommittees
    (act : EnforcementAction) (c : ComplaintText) : Prop





axiom daysFromReportFilingToEffectiveDate
    (act : EnforcementAction) (c : ComplaintText) : Nat



axiom OtherMeansAuthorizedByLaw (act : EnforcementAction) (c : ComplaintText) : Prop






axiom DefendantIsState (d : Person) (c : ComplaintText) : Prop




axiom ViolationOfRehabilitationActSection504 (v : Violation) (c : ComplaintText) : Prop




axiom ViolationOfTitleIX (v : Violation) (c : ComplaintText) : Prop




axiom ViolationOfAgeDiscriminationAct (v : Violation) (c : ComplaintText) : Prop




axiom ViolationOfTitleVI (v : Violation) (c : ComplaintText) : Prop





axiom ViolationOfOtherFederalFundingAntidiscriminationStatute
    (v : Violation) (c : ComplaintText) : Prop





axiom violationLatestConductDay (v : Violation) (c : ComplaintText) : Nat




axiom RemedySoughtAvailableAgainstNonStateEntity (v : Violation) (c : ComplaintText) : Prop






axiom ComplaintReferredByCourt (i : Investigation) (c : ComplaintText) : Prop



axiom HearingConductedInExecutiveSession (h : Hearing) (c : ComplaintText) : Prop




axiom AllPartiesAgreedToRelease (t : Testimony) (c : ComplaintText) : Prop



axiom CourtPermittedRelease (t : Testimony) (c : ComplaintText) : Prop




axiom EndeavoredToBringVoluntarySettlement (i : Investigation) (c : ComplaintText) : Prop






axiom AttorneyGeneralHasReasonableCause (pp : PatternOrPractice) (c : ComplaintText) : Prop




axiom EngagedInPatternOrPracticeOfResistance
    (d : Person) (pp : PatternOrPractice) (c : ComplaintText) : Prop




axiom ResistanceToRightsSecuredBySubchapter (pp : PatternOrPractice) (c : ComplaintText) : Prop




axiom PatternIntendedToDenyFullExercise (pp : PatternOrPractice) (c : ComplaintText) : Prop




axiom FiledInAppropriateDistrictCourt (pl : Pleading) (c : ComplaintText) : Prop




axiom ComplaintSignedByAttorneyGeneral (pl : Pleading) (c : ComplaintText) : Prop




axiom ComplaintSetsForthPatternFacts (pl : Pleading) (c : ComplaintText) : Prop




axiom ComplaintRequestsPreventiveRelief (pl : Pleading) (c : ComplaintText) : Prop




axiom ThreeJudgeCourtRequestFiled (pl : Pleading) (c : ComplaintText) : Prop




axiom CertificateOfGeneralPublicImportanceFiled (pl : Pleading) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21CivilRights.Recert.Elements
