import Proving.USC.T18.Ch11.Reslice.Elements.Types












set_option autoImplicit false
set_option relaxedAutoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch11.Reslice.Elements






axiom IsPublicOfficial (p : Person) (c : ComplaintText) : Prop


axiom IsPersonSelectedToBePublicOfficial (p : Person) (c : ComplaintText) : Prop


axiom IsOfficerOrEmployeeOfUS (p : Person) (c : ComplaintText) : Prop


axiom IsMemberOfCongress (p : Person) (c : ComplaintText) : Prop


axiom IsSpecialGovernmentEmployee (p : Person) (c : ComplaintText) : Prop



axiom IsFinancialInstitutionInsider (p : Person) (fi : FinancialInstitution) (c : ComplaintText) : Prop


axiom IsExaminer (p : Person) (c : ComplaintText) : Prop


axiom IsFormerOfficerOrEmployee (p : Person) (c : ComplaintText) : Prop


axiom IsCoveredGovernmentPerson (p : Person) (c : ComplaintText) : Prop



axiom IsWitness (p : Person) (c : ComplaintText) : Prop



axiom ActsAsAgentOfForeignPrincipal (p : Person) (c : ComplaintText) : Prop






axiom ConfersThingOfValue (giver : Person) (tov : ThingOfValue) (c : ComplaintText) : Prop



axiom SolicitsOrReceivesThingOfValue (p : Person) (tov : ThingOfValue) (c : ComplaintText) : Prop


axiom IsThingOfValue (tov : ThingOfValue) (c : ComplaintText) : Prop





axiom ActsCorruptly (p : Person) (c : ComplaintText) : Prop



axiom OtherwiseThanProvidedByLaw (c : ComplaintText) : Prop


axiom KnowinglyAndWillfully (p : Person) (c : ComplaintText) : Prop





axiom IntentToInfluenceOfficialAct (giver : Person) (oa : OfficialAct) (c : ComplaintText) : Prop


axiom IntentToInduceFraudOnUS (giver : Person) (c : ComplaintText) : Prop



axiom IntentToInduceViolationOfOfficialDuty (giver : Person) (c : ComplaintText) : Prop






axiom InReturnForBeingInfluencedInOfficialAct (p : Person) (oa : OfficialAct) (c : ComplaintText) : Prop


axiom InReturnForFraudOnUS (p : Person) (c : ComplaintText) : Prop


axiom InReturnForViolationOfOfficialDuty (p : Person) (c : ComplaintText) : Prop





axiom IntentToInfluenceTestimony (giver : Person) (c : ComplaintText) : Prop



axiom InReturnForInfluencedTestimony (p : Person) (c : ComplaintText) : Prop



axiom ForOrBecauseOfOfficialAct (p : Person) (oa : OfficialAct) (c : ComplaintText) : Prop


axiom ForOrBecauseOfTestimony (p : Person) (c : ComplaintText) : Prop




axiom IsLawfulWitnessFeePayment (c : ComplaintText) : Prop






axiom IsQuestionOrMatter (oa : OfficialAct) (c : ComplaintText) : Prop



axiom MatterPendingBeforeOfficial (oa : OfficialAct) (c : ComplaintText) : Prop



axiom FormalDecisionOrActionOnMatter (oa : OfficialAct) (c : ComplaintText) : Prop






axiom DemandsOrReceivesRepresentationalCompensation (p : Person) (comp : RepresentationalCompensation) (c : ComplaintText) : Prop



axiom GivesRepresentationalCompensation (p : Person) (comp : RepresentationalCompensation) (c : ComplaintText) : Prop



axiom IsRepresentationalServices (comp : RepresentationalCompensation) (c : ComplaintText) : Prop




axiom MatterInWhichUSHasInterest (pm : ParticularMatter) (c : ComplaintText) : Prop



axiom ParticipatedPersonallyAndSubstantially (p : Person) (pm : ParticularMatter) (c : ComplaintText) : Prop



axiom PracticesInRestrictedCourt (p : Person) (c : ComplaintText) : Prop



axiom ProsecutesClaimAgainstUS (p : Person) (claim : Claim) (c : ComplaintText) : Prop



axiom ActsAsAgentOrAttorney (p : Person) (pm : ParticularMatter) (c : ComplaintText) : Prop






axiom MakesCommunicationWithIntentToInfluence (p : Person) (comm : Communication) (c : ComplaintText) : Prop



axiom OnBehalfOfAnotherPerson (p : Person) (comm : Communication) (c : ComplaintText) : Prop



axiom MatterInvolvedSpecificParties (pm : ParticularMatter) (c : ComplaintText) : Prop



axiom WithinPostEmploymentWindow (p : Person) (comm : Communication) (c : ComplaintText) : Prop







axiom HasFinancialInterestInMatter (p : Person) (fi : FinancialInterest) (pm : ParticularMatter) (c : ComplaintText) : Prop




axiom PermittedUnderSection208b (p : Person) (pm : ParticularMatter) (c : ComplaintText) : Prop






axiom ReceivesOutsideSalarySupplementation (p : Person) (ss : SalarySupplementation) (c : ComplaintText) : Prop



axiom IsCompensationForOfficialServices (ss : SalarySupplementation) (c : ComplaintText) : Prop






axiom OffersValueToProcureAppointiveOffice (p : Person) (office : AppointiveOffice) (c : ComplaintText) : Prop




axiom SolicitsValueForAppointiveOfficeInfluence (p : Person) (office : AppointiveOffice) (c : ComplaintText) : Prop






axiom GivesLoanOrGratuityToExaminer (p : Person) (lg : LoanOrGratuity) (c : ComplaintText) : Prop


axiom ExaminerAcceptsLoanOrGratuity (p : Person) (lg : LoanOrGratuity) (c : ComplaintText) : Prop



axiom IsExemptExaminerCredit (lg : LoanOrGratuity) (c : ComplaintText) : Prop



axiom GivesOrReceivesFeeForFedReserveProcurement (p : Person) (fee : FeeOrCommission) (c : ComplaintText) : Prop



axiom DisclosedInWriting (fee : FeeOrCommission) (c : ComplaintText) : Prop



axiom IntentToInfluenceOrRewardInsider (p : Person) (c : ComplaintText) : Prop



axiom InConnectionWithInstitutionBusiness (fi : FinancialInstitution) (c : ComplaintText) : Prop



axiom IsBonaFideCompensation (tov : ThingOfValue) (c : ComplaintText) : Prop






axiom AcceptsConsiderationForFarmIndebtedness (p : Person) (c : ComplaintText) : Prop



axiom ForeignPrincipalRequiredToRegister (p : Person) (c : ComplaintText) : Prop






axiom SolicitsRemunerationForReferral (p : Person) (rem : Remuneration) (ref : Referral) (c : ComplaintText) : Prop



axiom PaysRemunerationToInduceReferral (p : Person) (rem : Remuneration) (ref : Referral) (c : ComplaintText) : Prop


axiom ServicesCoveredByHealthCareBenefitProgram (ref : Referral) (c : ComplaintText) : Prop


axiom AffectsInterstateOrForeignCommerce (c : ComplaintText) : Prop



axiom FallsWithinSection220bException (rem : Remuneration) (c : ComplaintText) : Prop






axiom CarriesOutSchemeToInfluenceContest (p : Person) (sc : BriberyScheme) (c : ComplaintText) : Prop



axiom SchemeInCommerce (sc : BriberyScheme) (c : ComplaintText) : Prop



axiom KnowsSchemePurposeIsBribery (p : Person) (sc : BriberyScheme) (c : ComplaintText) : Prop


axiom IsSportingContest (target : SportingContest) (c : ComplaintText) : Prop






axiom OrganizesManagesSupervisesEnterprise (p : Person) (ce : CrimesEnterprise) (c : ComplaintText) : Prop




axiom SeriesOfEnumeratedFinancialViolations (ce : CrimesEnterprise) (c : ComplaintText) : Prop



axiom numPersonsInConcert (ce : CrimesEnterprise) (c : ComplaintText) : Nat



axiom grossReceiptsUsdIn24Months (p : Person) (ce : CrimesEnterprise) (c : ComplaintText) : Nat







axiom IntentToCommitTerrorismAffectingSeaport (p : Person) (c : ComplaintText) : Prop




axiom InReturnForInfluenceAffectingSeaport (p : Person) (c : ComplaintText) : Prop






axiom IntentToInfluenceEmploymentOnPartisanBasis (p : Person) (ed : EmploymentDecision) (c : ComplaintText) : Prop



axiom TakesOrInfluencesOfficialAct (p : Person) (c : ComplaintText) : Prop


axiom TargetIsPrivateEntity (ed : EmploymentDecision) (c : ComplaintText) : Prop






axiom TransactionInViolationOfChapter (t : Transaction) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch11.Reslice.Elements
