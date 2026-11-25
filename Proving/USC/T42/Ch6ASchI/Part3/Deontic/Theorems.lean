








import Proving.USC.T42.Ch6ASchI.Part3.Deontic.Statute

namespace Proving.USC.T42.Ch6ASchI.Part3.Deontic
open Proving.USC.Common


theorem permission217bExercised_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond217bForHealthCareOperation c)
    (hAct : AcceptsVolunteerServices217b p c) : Permission217bExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation218Breached_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond218Within120Days c)
    (hNotAct : ¬ AppointsMigrantHealthCouncil218 p c) : Obligation218Breached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem obligation218aBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : IsCommissionedOfficer p c) (hCond : Cond218aLeftServiceEarly c)
    (hNotAct : ¬ RepaysDoubleTrainingCosts218a p c) : Obligation218aBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem power231Exercised_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSurgeonGeneral p c) (hCond : Cond231SecretaryApproved c)
    (hAct : OperatesServiceSupplyFund231 p c) : Power231Exercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem power232Exercised_intro {p : Person} {c : ComplaintText}
    (hAddr : IsAdministratorGSA p c) (hCond : Cond232SurgeonGeneralAdvised c)
    (hAct : AcquiresAndConstructsNIMH232 p c) : Power232Exercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition233aViolated_intro {p : Person} {c : ComplaintText}
    (hAddr : IsCivilClaimant p c) (hCond : Cond233aInjuryFromOfficerWithinScope p c)
    (hAct : BringsOtherActionAgainstOfficer233a p c) : Prohibition233aViolated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation233bDefendBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : IsAttorneyGeneral p c) (hCond : Cond233bActionAgainstCoveredPerson c)
    (hNotAct : ¬ DefendsCoveredPerson233b p c) : Obligation233bDefendBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem obligation233bDeliverBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : IsCoveredPerson233 p c) (hCond : Cond233bServedWithProcess c)
    (hNotAct : ¬ DeliversProcessToSuperior233b p c) : Obligation233bDeliverBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem power233cExercised_intro {p : Person} {c : ComplaintText}
    (hAddr : IsAttorneyGeneral p c) (hCond : Cond233cCertifiedWithinScope c)
    (hAct : RemovesStateActionToFederalCourt233c p c) : Power233cExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition233gViolated_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond233gNoApprovedApplication e c)
    (hAct : DeemsEntityPHSEmployee233g p e c) : Prohibition233gViolated p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation233kBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond233kFundEstablished c)
    (hNotAct : ¬ TransfersFundToTreasuryByDec31_233k p c) : Obligation233kBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem obligation233lBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : IsAttorneyGeneral p c) (hCond : Cond233lNotifiedOfStateFiling c)
    (hNotAct : ¬ AppearsInStateCourtWithin15Days233l p c) : Obligation233lBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem prohibition233pViolated_intro {p : Person} {c : ComplaintText}
    (hAddr : IsCivilClaimant p c) (hCond : Cond233pPartCNotExhausted c)
    (hAct : BringsSmallpoxCountermeasureClaim233p p c) : Prohibition233pViolated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission234Exercised_intro {p : Person} {c : ComplaintText}
    (hAddr : IsQualifiedVolunteerHealthProfessional p c) (hCond : Cond234RespondingWithinScope c)
    (hAct : ProtectedFromOtherStateLiability234 p c) : Permission234Exercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem power235Exercised_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond235MultigrantSingleProject c)
    (hAct : PromulgatesMultigrantRegs235 p c) : Power235Exercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition235Violated_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond235RequirementImposedByLaw c)
    (hAct : WaivesStatutoryRequirement235 p c) : Prohibition235Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation236Breached_intro {p : Person} {c : ComplaintText}
    (hAddr : IsOrphanProductsBoardMember p c) (hCond : Cond236BoardEstablished c)
    (hNotAct : ¬ SubmitsOrphanProductsAnnualReport236 p c) : Obligation236Breached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem prohibition237Violated_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond237IndividualLacksCredentials c)
    (hAct : AppointsIndividualToConteService237 p c) : Prohibition237Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation237aBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond237aOfficeEstablished c)
    (hNotAct : ¬ CarriesOutWomensHealthFunctions237a p c) : Obligation237aBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem prohibition238Violated_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond238ExpenditureNotCongressApproved c)
    (hAct : AcceptsConditionalGift238 p c) : Prohibition238Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation238aBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSurgeonGeneral p c) (hCond : Cond238aINSHospitalUsePermitted c)
    (hNotAct : ¬ ReimbursesINSActualCost238a p c) : Obligation238aBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem obligation238bBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSurgeonGeneral p c) (hCond : Cond238bMoneyCollectedForPatientCare c)
    (hNotAct : ¬ CoversMoneyIntoAppropriation238b p c) : Obligation238bBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem permission238cExercised_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSurgeonGeneral p c) (hCond : Cond238cOfficerDiedInLineOfDuty c)
    (hAct : UsesTravelFundsForBurial238c p c) : Permission238cExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission238dExercised_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond238dFederalInstitutionGrant c)
    (hAct : FundsFederalGrantAtFullCost238d p c) : Permission238dExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem power238eExercised_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond238eReorganizationOMBApproved c)
    (hAct : TransfersFundsBetweenAppropriations238e p c) : Power238eExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission238fExercised_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSurgeonGeneral p c) (hCond : Cond238fChapterPurpose c)
    (hAct : ExpendsAppropriationsForListedPurposes238f p c) : Permission238fExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition238gViolated_intro {p : Person} {c : ComplaintText}
    (hAddr : IsUnauthorizedNonOfficer p c) (hCond : Cond238gNotPresidentiallyAuthorized c)
    (hAct : WearsServiceUniform238g p c) : Prohibition238gViolated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation238hBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSurgeonGeneral p c) (hCond : Cond238hBiennialReportDue c)
    (hNotAct : ¬ TransmitsBiennialReport238h p c) : Obligation238hBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem permission238iExercised_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond238iContributionToNationHealth c)
    (hAct : AcknowledgesContribution238i p c) : Permission238iExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation238jBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond238jProgramsAppropriated c)
    (hNotAct : ¬ MakesEvaluationFundsAvailableAndReports238j p c) : Obligation238jBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem power238kExercised_intro {p : Person} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond238kAmountsAppropriated c)
    (hAct : EntersContractsUnderChapter238k p c) : Power238kExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation238lBreached_intro {p : Person} {c : ComplaintText}
    (hAddr : IsFacilityHolder p c) (hCond : Cond238lFacilitySoldOrUseCeased c)
    (hNotAct : ¬ ProvidesWrittenNotice238l p c) : Obligation238lBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem prohibition238mViolated_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hAddr : IsSecretaryHHS p c) (hCond : Cond238mEntityNotFinanciallyResponsible e c)
    (hAct : EntersFiscalAgentContract238m p e c) : Prohibition238mViolated p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T42.Ch6ASchI.Part3.Deontic
