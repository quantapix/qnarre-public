















import Proving.USC.T42.Ch6ASchI.Part3.Deontic.Types

namespace Proving.USC.T42.Ch6ASchI.Part3.Deontic
open Proving.USC.Common






axiom IsSecretaryHHS (p : Person) (c : ComplaintText) : Prop


axiom IsSurgeonGeneral (p : Person) (c : ComplaintText) : Prop


axiom IsAttorneyGeneral (p : Person) (c : ComplaintText) : Prop


axiom IsAdministratorGSA (p : Person) (c : ComplaintText) : Prop


axiom IsCommissionedOfficer (p : Person) (c : ComplaintText) : Prop



axiom IsCoveredPerson233 (p : Person) (c : ComplaintText) : Prop


axiom IsCivilClaimant (p : Person) (c : ComplaintText) : Prop



axiom IsQualifiedVolunteerHealthProfessional (p : Person) (c : ComplaintText) : Prop



axiom IsUnauthorizedNonOfficer (p : Person) (c : ComplaintText) : Prop



axiom IsFacilityHolder (p : Person) (c : ComplaintText) : Prop


axiom IsOrphanProductsBoardMember (p : Person) (c : ComplaintText) : Prop





axiom Cond217bForHealthCareOperation (c : ComplaintText) : Prop


axiom AcceptsVolunteerServices217b (p : Person) (c : ComplaintText) : Prop




axiom Cond218Within120Days (c : ComplaintText) : Prop


axiom AppointsMigrantHealthCouncil218 (p : Person) (c : ComplaintText) : Prop





axiom Cond218aLeftServiceEarly (c : ComplaintText) : Prop


axiom RepaysDoubleTrainingCosts218a (p : Person) (c : ComplaintText) : Prop





axiom Cond231SecretaryApproved (c : ComplaintText) : Prop


axiom OperatesServiceSupplyFund231 (p : Person) (c : ComplaintText) : Prop




axiom Cond232SurgeonGeneralAdvised (c : ComplaintText) : Prop


axiom AcquiresAndConstructsNIMH232 (p : Person) (c : ComplaintText) : Prop






axiom Cond233aInjuryFromOfficerWithinScope (p : Person) (c : ComplaintText) : Prop



axiom BringsOtherActionAgainstOfficer233a (p : Person) (c : ComplaintText) : Prop





axiom Cond233bActionAgainstCoveredPerson (c : ComplaintText) : Prop


axiom DefendsCoveredPerson233b (p : Person) (c : ComplaintText) : Prop





axiom Cond233bServedWithProcess (c : ComplaintText) : Prop



axiom DeliversProcessToSuperior233b (p : Person) (c : ComplaintText) : Prop





axiom Cond233cCertifiedWithinScope (c : ComplaintText) : Prop



axiom RemovesStateActionToFederalCourt233c (p : Person) (c : ComplaintText) : Prop





axiom Cond233gNoApprovedApplication (e : Entity) (c : ComplaintText) : Prop



axiom DeemsEntityPHSEmployee233g (p : Person) (e : Entity) (c : ComplaintText) : Prop





axiom Cond233kFundEstablished (c : ComplaintText) : Prop



axiom TransfersFundToTreasuryByDec31_233k (p : Person) (c : ComplaintText) : Prop





axiom Cond233lNotifiedOfStateFiling (c : ComplaintText) : Prop



axiom AppearsInStateCourtWithin15Days233l (p : Person) (c : ComplaintText) : Prop





axiom Cond233pPartCNotExhausted (c : ComplaintText) : Prop


axiom BringsSmallpoxCountermeasureClaim233p (p : Person) (c : ComplaintText) : Prop






axiom Cond234RespondingWithinScope (c : ComplaintText) : Prop



axiom ProtectedFromOtherStateLiability234 (p : Person) (c : ComplaintText) : Prop





axiom Cond235MultigrantSingleProject (c : ComplaintText) : Prop


axiom PromulgatesMultigrantRegs235 (p : Person) (c : ComplaintText) : Prop



axiom Cond235RequirementImposedByLaw (c : ComplaintText) : Prop



axiom WaivesStatutoryRequirement235 (p : Person) (c : ComplaintText) : Prop




axiom Cond236BoardEstablished (c : ComplaintText) : Prop


axiom SubmitsOrphanProductsAnnualReport236 (p : Person) (c : ComplaintText) : Prop





axiom Cond237IndividualLacksCredentials (c : ComplaintText) : Prop



axiom AppointsIndividualToConteService237 (p : Person) (c : ComplaintText) : Prop




axiom Cond237aOfficeEstablished (c : ComplaintText) : Prop



axiom CarriesOutWomensHealthFunctions237a (p : Person) (c : ComplaintText) : Prop





axiom Cond238ExpenditureNotCongressApproved (c : ComplaintText) : Prop


axiom AcceptsConditionalGift238 (p : Person) (c : ComplaintText) : Prop





axiom Cond238aINSHospitalUsePermitted (c : ComplaintText) : Prop



axiom ReimbursesINSActualCost238a (p : Person) (c : ComplaintText) : Prop




axiom Cond238bMoneyCollectedForPatientCare (c : ComplaintText) : Prop


axiom CoversMoneyIntoAppropriation238b (p : Person) (c : ComplaintText) : Prop




axiom Cond238cOfficerDiedInLineOfDuty (c : ComplaintText) : Prop


axiom UsesTravelFundsForBurial238c (p : Person) (c : ComplaintText) : Prop





axiom Cond238dFederalInstitutionGrant (c : ComplaintText) : Prop


axiom FundsFederalGrantAtFullCost238d (p : Person) (c : ComplaintText) : Prop




axiom Cond238eReorganizationOMBApproved (c : ComplaintText) : Prop



axiom TransfersFundsBetweenAppropriations238e (p : Person) (c : ComplaintText) : Prop




axiom Cond238fChapterPurpose (c : ComplaintText) : Prop


axiom ExpendsAppropriationsForListedPurposes238f (p : Person) (c : ComplaintText) : Prop




axiom Cond238gNotPresidentiallyAuthorized (c : ComplaintText) : Prop


axiom WearsServiceUniform238g (p : Person) (c : ComplaintText) : Prop





axiom Cond238hBiennialReportDue (c : ComplaintText) : Prop



axiom TransmitsBiennialReport238h (p : Person) (c : ComplaintText) : Prop





axiom Cond238iContributionToNationHealth (c : ComplaintText) : Prop


axiom AcknowledgesContribution238i (p : Person) (c : ComplaintText) : Prop





axiom Cond238jProgramsAppropriated (c : ComplaintText) : Prop



axiom MakesEvaluationFundsAvailableAndReports238j (p : Person) (c : ComplaintText) : Prop




axiom Cond238kAmountsAppropriated (c : ComplaintText) : Prop


axiom EntersContractsUnderChapter238k (p : Person) (c : ComplaintText) : Prop





axiom Cond238lFacilitySoldOrUseCeased (c : ComplaintText) : Prop



axiom ProvidesWrittenNotice238l (p : Person) (c : ComplaintText) : Prop





axiom Cond238mEntityNotFinanciallyResponsible (e : Entity) (c : ComplaintText) : Prop


axiom EntersFiscalAgentContract238m (p : Person) (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Part3.Deontic
