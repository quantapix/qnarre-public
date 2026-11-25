














import Proving.USC.T42.Ch6ASchI.Part3.Deontic.Predicates

namespace Proving.USC.T42.Ch6ASchI.Part3.Deontic
open Proving.USC.Common


structure Permission217b (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond217bForHealthCareOperation c


def Permission217bExercised (p : Person) (c : ComplaintText) : Prop :=
  Permission217b p c ∧ AcceptsVolunteerServices217b p c


structure Obligation218 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond218Within120Days c


def Obligation218Breached (p : Person) (c : ComplaintText) : Prop :=
  Obligation218 p c ∧ ¬ AppointsMigrantHealthCouncil218 p c


structure Obligation218a (p : Person) (c : ComplaintText) : Prop where
  addressee : IsCommissionedOfficer p c
  condition : Cond218aLeftServiceEarly c
def Obligation218aBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation218a p c ∧ ¬ RepaysDoubleTrainingCosts218a p c


structure Power231 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSurgeonGeneral p c
  condition : Cond231SecretaryApproved c
def Power231Exercised (p : Person) (c : ComplaintText) : Prop :=
  Power231 p c ∧ OperatesServiceSupplyFund231 p c


structure Power232 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAdministratorGSA p c
  condition : Cond232SurgeonGeneralAdvised c
def Power232Exercised (p : Person) (c : ComplaintText) : Prop :=
  Power232 p c ∧ AcquiresAndConstructsNIMH232 p c


structure Prohibition233a (p : Person) (c : ComplaintText) : Prop where
  addressee : IsCivilClaimant p c
  condition : Cond233aInjuryFromOfficerWithinScope p c


def Prohibition233aViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition233a p c ∧ BringsOtherActionAgainstOfficer233a p c


structure Obligation233bDefend (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAttorneyGeneral p c
  condition : Cond233bActionAgainstCoveredPerson c
def Obligation233bDefendBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation233bDefend p c ∧ ¬ DefendsCoveredPerson233b p c


structure Obligation233bDeliver (p : Person) (c : ComplaintText) : Prop where
  addressee : IsCoveredPerson233 p c
  condition : Cond233bServedWithProcess c
def Obligation233bDeliverBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation233bDeliver p c ∧ ¬ DeliversProcessToSuperior233b p c


structure Power233c (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAttorneyGeneral p c
  condition : Cond233cCertifiedWithinScope c
def Power233cExercised (p : Person) (c : ComplaintText) : Prop :=
  Power233c p c ∧ RemovesStateActionToFederalCourt233c p c


structure Prohibition233g (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond233gNoApprovedApplication e c


def Prohibition233gViolated (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition233g p e c ∧ DeemsEntityPHSEmployee233g p e c


structure Obligation233k (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond233kFundEstablished c
def Obligation233kBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation233k p c ∧ ¬ TransfersFundToTreasuryByDec31_233k p c


structure Obligation233l (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAttorneyGeneral p c
  condition : Cond233lNotifiedOfStateFiling c
def Obligation233lBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation233l p c ∧ ¬ AppearsInStateCourtWithin15Days233l p c


structure Prohibition233p (p : Person) (c : ComplaintText) : Prop where
  addressee : IsCivilClaimant p c
  condition : Cond233pPartCNotExhausted c
def Prohibition233pViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition233p p c ∧ BringsSmallpoxCountermeasureClaim233p p c


structure Permission234 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsQualifiedVolunteerHealthProfessional p c
  condition : Cond234RespondingWithinScope c
def Permission234Exercised (p : Person) (c : ComplaintText) : Prop :=
  Permission234 p c ∧ ProtectedFromOtherStateLiability234 p c


structure Power235 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond235MultigrantSingleProject c
def Power235Exercised (p : Person) (c : ComplaintText) : Prop :=
  Power235 p c ∧ PromulgatesMultigrantRegs235 p c


structure Prohibition235 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond235RequirementImposedByLaw c
def Prohibition235Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition235 p c ∧ WaivesStatutoryRequirement235 p c


structure Obligation236 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsOrphanProductsBoardMember p c
  condition : Cond236BoardEstablished c
def Obligation236Breached (p : Person) (c : ComplaintText) : Prop :=
  Obligation236 p c ∧ ¬ SubmitsOrphanProductsAnnualReport236 p c


structure Prohibition237 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond237IndividualLacksCredentials c
def Prohibition237Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition237 p c ∧ AppointsIndividualToConteService237 p c


structure Obligation237a (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond237aOfficeEstablished c
def Obligation237aBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation237a p c ∧ ¬ CarriesOutWomensHealthFunctions237a p c


structure Prohibition238 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond238ExpenditureNotCongressApproved c
def Prohibition238Violated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition238 p c ∧ AcceptsConditionalGift238 p c


structure Obligation238a (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSurgeonGeneral p c
  condition : Cond238aINSHospitalUsePermitted c
def Obligation238aBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation238a p c ∧ ¬ ReimbursesINSActualCost238a p c


structure Obligation238b (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSurgeonGeneral p c
  condition : Cond238bMoneyCollectedForPatientCare c
def Obligation238bBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation238b p c ∧ ¬ CoversMoneyIntoAppropriation238b p c


structure Permission238c (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSurgeonGeneral p c
  condition : Cond238cOfficerDiedInLineOfDuty c
def Permission238cExercised (p : Person) (c : ComplaintText) : Prop :=
  Permission238c p c ∧ UsesTravelFundsForBurial238c p c


structure Permission238d (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond238dFederalInstitutionGrant c
def Permission238dExercised (p : Person) (c : ComplaintText) : Prop :=
  Permission238d p c ∧ FundsFederalGrantAtFullCost238d p c


structure Power238e (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond238eReorganizationOMBApproved c
def Power238eExercised (p : Person) (c : ComplaintText) : Prop :=
  Power238e p c ∧ TransfersFundsBetweenAppropriations238e p c


structure Permission238f (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSurgeonGeneral p c
  condition : Cond238fChapterPurpose c
def Permission238fExercised (p : Person) (c : ComplaintText) : Prop :=
  Permission238f p c ∧ ExpendsAppropriationsForListedPurposes238f p c


structure Prohibition238g (p : Person) (c : ComplaintText) : Prop where
  addressee : IsUnauthorizedNonOfficer p c
  condition : Cond238gNotPresidentiallyAuthorized c


def Prohibition238gViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition238g p c ∧ WearsServiceUniform238g p c


structure Obligation238h (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSurgeonGeneral p c
  condition : Cond238hBiennialReportDue c
def Obligation238hBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation238h p c ∧ ¬ TransmitsBiennialReport238h p c


structure Permission238i (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond238iContributionToNationHealth c
def Permission238iExercised (p : Person) (c : ComplaintText) : Prop :=
  Permission238i p c ∧ AcknowledgesContribution238i p c


structure Obligation238j (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond238jProgramsAppropriated c
def Obligation238jBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation238j p c ∧ ¬ MakesEvaluationFundsAvailableAndReports238j p c


structure Power238k (p : Person) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond238kAmountsAppropriated c
def Power238kExercised (p : Person) (c : ComplaintText) : Prop :=
  Power238k p c ∧ EntersContractsUnderChapter238k p c


structure Obligation238l (p : Person) (c : ComplaintText) : Prop where
  addressee : IsFacilityHolder p c
  condition : Cond238lFacilitySoldOrUseCeased c
def Obligation238lBreached (p : Person) (c : ComplaintText) : Prop :=
  Obligation238l p c ∧ ¬ ProvidesWrittenNotice238l p c


structure Prohibition238m (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : IsSecretaryHHS p c
  condition : Cond238mEntityNotFinanciallyResponsible e c
def Prohibition238mViolated (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition238m p e c ∧ EntersFiscalAgentContract238m p e c

end Proving.USC.T42.Ch6ASchI.Part3.Deontic
