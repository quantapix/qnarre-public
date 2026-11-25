import Proving.USC.T18.Ch11.Reslice.Elements.Predicates









set_option autoImplicit false
set_option relaxedAutoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch11.Reslice.Elements




structure OfficialActCore (oa : OfficialAct) (c : ComplaintText) : Prop where
  question : IsQuestionOrMatter oa c
  pending  : MatterPendingBeforeOfficial oa c
  formal   : FormalDecisionOrActionOnMatter oa c



abbrev IsOfficialAct (oa : OfficialAct) (c : ComplaintText) : Prop := OfficialActCore oa c




abbrev IsBriberyRecipient (p : Person) (c : ComplaintText) : Prop :=
  IsPublicOfficial p c ∨ IsPersonSelectedToBePublicOfficial p c


inductive BriberyPurpose201b1 (giver : Person) (oa : OfficialAct) (c : ComplaintText) : Prop where
  | influenceAct    (h : IntentToInfluenceOfficialAct giver oa c)
  | induceFraud     (h : IntentToInduceFraudOnUS giver c)
  | induceViolation (h : IntentToInduceViolationOfOfficialDuty giver c)


structure Section201b1 (giver recipient : Person) (tov : ThingOfValue) (oa : OfficialAct) (c : ComplaintText) : Prop where
  confers         : ConfersThingOfValue giver tov c
  value           : IsThingOfValue tov c
  recipientStatus : IsBriberyRecipient recipient c
  corrupt         : ActsCorruptly giver c
  purpose         : BriberyPurpose201b1 giver oa c


inductive BriberyReturn201b2 (official : Person) (oa : OfficialAct) (c : ComplaintText) : Prop where
  | influencedAct   (h : InReturnForBeingInfluencedInOfficialAct official oa c)
  | fraudOnUS       (h : InReturnForFraudOnUS official c)
  | violationOfDuty (h : InReturnForViolationOfOfficialDuty official c)


structure Section201b2 (official : Person) (tov : ThingOfValue) (oa : OfficialAct) (c : ComplaintText) : Prop where
  officialStatus : IsBriberyRecipient official c
  solicits       : SolicitsOrReceivesThingOfValue official tov c
  value          : IsThingOfValue tov c
  corrupt        : ActsCorruptly official c
  returnFor      : BriberyReturn201b2 official oa c



structure Section201b3 (giver witness : Person) (tov : ThingOfValue) (c : ComplaintText) : Prop where
  confers       : ConfersThingOfValue giver tov c
  value         : IsThingOfValue tov c
  witnessStatus : IsWitness witness c
  corrupt       : ActsCorruptly giver c
  intent        : IntentToInfluenceTestimony giver c
  notFee        : ¬ IsLawfulWitnessFeePayment c


structure Section201b4 (witness : Person) (tov : ThingOfValue) (c : ComplaintText) : Prop where
  witnessStatus : IsWitness witness c
  solicits      : SolicitsOrReceivesThingOfValue witness tov c
  value         : IsThingOfValue tov c
  corrupt       : ActsCorruptly witness c
  returnFor     : InReturnForInfluencedTestimony witness c
  notFee        : ¬ IsLawfulWitnessFeePayment c



structure Section201c1 (party recipient : Person) (tov : ThingOfValue) (oa : OfficialAct) (c : ComplaintText) : Prop where
  otherwiseThanLaw : OtherwiseThanProvidedByLaw c
  value            : IsThingOfValue tov c
  act              : ConfersThingOfValue party tov c ∨ SolicitsOrReceivesThingOfValue party tov c
  official         : IsBriberyRecipient recipient c ∨ IsPublicOfficial recipient c
  nexus            : ForOrBecauseOfOfficialAct party oa c


structure Section201c2 (party : Person) (tov : ThingOfValue) (c : ComplaintText) : Prop where
  value  : IsThingOfValue tov c
  act    : ConfersThingOfValue party tov c ∨ SolicitsOrReceivesThingOfValue party tov c
  nexus  : ForOrBecauseOfTestimony party c
  notFee : ¬ IsLawfulWitnessFeePayment c


inductive Section201Violation (giver recipient witness : Person)
    (tov : ThingOfValue) (oa : OfficialAct) (c : ComplaintText) : Prop where
  | bribeGive    (h : Section201b1 giver recipient tov oa c)
  | bribeReceive (h : Section201b2 recipient tov oa c)
  | witnessGive  (h : Section201b3 giver witness tov c)
  | witnessRecv  (h : Section201b4 witness tov c)
  | gratuityAct  (h : Section201c1 giver recipient tov oa c)
  | gratuityWit  (h : Section201c2 giver tov c)





structure Section203a (party : Person) (comp : RepresentationalCompensation) (pm : ParticularMatter) (c : ComplaintText) : Prop where
  otherwiseThanLaw : OtherwiseThanProvidedByLaw c
  representational : IsRepresentationalServices comp c
  matter           : MatterInWhichUSHasInterest pm c
  coveredPerson    : IsMemberOfCongress party c ∨ IsOfficerOrEmployeeOfUS party c
  act              : DemandsOrReceivesRepresentationalCompensation party comp c
                       ∨ GivesRepresentationalCompensation party comp c


structure Section204 (party : Person) (c : ComplaintText) : Prop where
  member    : IsMemberOfCongress party c
  practices : PracticesInRestrictedCourt party c



structure Section205a (party : Person) (claim : Claim) (pm : ParticularMatter) (c : ComplaintText) : Prop where
  officer          : IsOfficerOrEmployeeOfUS party c
  otherwiseThanLaw : OtherwiseThanProvidedByLaw c
  matter           : MatterInWhichUSHasInterest pm c
  act              : ProsecutesClaimAgainstUS party claim c ∨ ActsAsAgentOrAttorney party pm c




structure Section207a1 (party : Person) (comm : Communication) (pm : ParticularMatter) (c : ComplaintText) : Prop where
  former        : IsFormerOfficerOrEmployee party c
  communication : MakesCommunicationWithIntentToInfluence party comm c
  onBehalfOther : OnBehalfOfAnotherPerson party comm c
  matter        : MatterInWhichUSHasInterest pm c
  participated  : ParticipatedPersonallyAndSubstantially party pm c
  specific      : MatterInvolvedSpecificParties pm c




structure Section207Timed (party : Person) (comm : Communication) (pm : ParticularMatter) (c : ComplaintText) : Prop where
  former        : IsFormerOfficerOrEmployee party c
  communication : MakesCommunicationWithIntentToInfluence party comm c
  onBehalfOther : OnBehalfOfAnotherPerson party comm c
  matter        : MatterInWhichUSHasInterest pm c
  window        : WithinPostEmploymentWindow party comm c


inductive Section207Restriction (party : Person) (comm : Communication) (pm : ParticularMatter) (c : ComplaintText) : Prop where
  | permanent (h : Section207a1 party comm pm c)
  | timed     (h : Section207Timed party comm pm c)



structure Section208a (party : Person) (fi : FinancialInterest) (pm : ParticularMatter) (c : ComplaintText) : Prop where
  officer      : IsOfficerOrEmployeeOfUS party c
  participated : ParticipatedPersonallyAndSubstantially party pm c
  interest     : HasFinancialInterestInMatter party fi pm c
  notPermitted : ¬ PermittedUnderSection208b party pm c





structure Section209a (party : Person) (ss : SalarySupplementation) (c : ComplaintText) : Prop where
  officer      : IsOfficerOrEmployeeOfUS party c
  receives     : ReceivesOutsideSalarySupplementation party ss c
  compensation : IsCompensationForOfficialServices ss c




structure Section210 (party : Person) (office : AppointiveOffice) (c : ComplaintText) : Prop where
  offers : OffersValueToProcureAppointiveOffice party office c



structure Section211 (party : Person) (office : AppointiveOffice) (c : ComplaintText) : Prop where
  solicits : SolicitsValueForAppointiveOfficeInfluence party office c





structure Section212 (party : Person) (fi : FinancialInstitution) (lg : LoanOrGratuity) (c : ComplaintText) : Prop where
  insider   : IsFinancialInstitutionInsider party fi c
  gives     : GivesLoanOrGratuityToExaminer party lg c
  notExempt : ¬ IsExemptExaminerCredit lg c


structure Section213 (party : Person) (lg : LoanOrGratuity) (c : ComplaintText) : Prop where
  examiner  : IsExaminer party c
  accepts   : ExaminerAcceptsLoanOrGratuity party lg c
  notExempt : ¬ IsExemptExaminerCredit lg c



structure Section214 (party : Person) (fee : FeeOrCommission) (c : ComplaintText) : Prop where
  procures     : GivesOrReceivesFeeForFedReserveProcurement party fee c
  notDisclosed : ¬ DisclosedInWriting fee c



structure Section215Give (giver : Person) (tov : ThingOfValue) (fi : FinancialInstitution) (c : ComplaintText) : Prop where
  confers      : ConfersThingOfValue giver tov c
  corrupt      : ActsCorruptly giver c
  intent       : IntentToInfluenceOrRewardInsider giver c
  connection   : InConnectionWithInstitutionBusiness fi c
  notBonaFide  : ¬ IsBonaFideCompensation tov c


structure Section215Receive (party : Person) (tov : ThingOfValue) (fi : FinancialInstitution) (c : ComplaintText) : Prop where
  insider      : IsFinancialInstitutionInsider party fi c
  solicits     : SolicitsOrReceivesThingOfValue party tov c
  corrupt      : ActsCorruptly party c
  intent       : IntentToInfluenceOrRewardInsider party c
  connection   : InConnectionWithInstitutionBusiness fi c
  notBonaFide  : ¬ IsBonaFideCompensation tov c


inductive Section215Violation (party : Person) (tov : ThingOfValue) (fi : FinancialInstitution) (c : ComplaintText) : Prop where
  | give    (h : Section215Give party tov fi c)
  | receive (h : Section215Receive party tov fi c)




structure Section217 (party : Person) (c : ComplaintText) : Prop where
  officer  : IsOfficerOrEmployeeOfUS party c
  accepts  : AcceptsConsiderationForFarmIndebtedness party c



structure Section219 (party : Person) (c : ComplaintText) : Prop where
  official     : IsPublicOfficial party c
  foreignAgent : ActsAsAgentOfForeignPrincipal party c
  registrable  : ForeignPrincipalRequiredToRegister party c






structure Section220 (party : Person) (rem : Remuneration) (ref : Referral) (c : ComplaintText) : Prop where
  scienter  : KnowinglyAndWillfully party c
  covered   : ServicesCoveredByHealthCareBenefitProgram ref c
  commerce  : AffectsInterstateOrForeignCommerce c
  act       : SolicitsRemunerationForReferral party rem ref c
                ∨ PaysRemunerationToInduceReferral party rem ref c
  notSafe   : ¬ FallsWithinSection220bException rem c





structure Section224 (party : Person) (sc : BriberyScheme) (target : SportingContest) (c : ComplaintText) : Prop where
  scheme   : CarriesOutSchemeToInfluenceContest party sc c
  commerce : SchemeInCommerce sc c
  contest  : IsSportingContest target c
  knowledge : KnowsSchemePurposeIsBribery party sc c




abbrev AtLeastFourInConcert (ce : CrimesEnterprise) (c : ComplaintText) : Prop :=
  numPersonsInConcert ce c ≥ 4


abbrev GrossReceiptsAtLeast5M (party : Person) (ce : CrimesEnterprise) (c : ComplaintText) : Prop :=
  grossReceiptsUsdIn24Months party ce c ≥ 5000000



structure ContinuingFinancialCrimesEnterprise (ce : CrimesEnterprise) (c : ComplaintText) : Prop where
  series      : SeriesOfEnumeratedFinancialViolations ce c
  fourPersons : AtLeastFourInConcert ce c


structure Section225 (party : Person) (ce : CrimesEnterprise) (c : ComplaintText) : Prop where
  organizes  : OrganizesManagesSupervisesEnterprise party ce c
  enterprise : ContinuingFinancialCrimesEnterprise ce c
  receipts   : GrossReceiptsAtLeast5M party ce c





structure Section226Give (giver : Person) (tov : ThingOfValue) (c : ComplaintText) : Prop where
  knowingly : KnowinglyAndWillfully giver c
  confers   : ConfersThingOfValue giver tov c
  corrupt   : ActsCorruptly giver c
  intent    : IntentToCommitTerrorismAffectingSeaport giver c



structure Section226Receive (official : Person) (tov : ThingOfValue) (c : ComplaintText) : Prop where
  knowingly : KnowinglyAndWillfully official c
  solicits  : SolicitsOrReceivesThingOfValue official tov c
  corrupt   : ActsCorruptly official c
  returnFor : InReturnForInfluenceAffectingSeaport official c


inductive Section226Violation (party : Person) (tov : ThingOfValue) (c : ComplaintText) : Prop where
  | give    (h : Section226Give party tov c)
  | receive (h : Section226Receive party tov c)





structure Section227 (party : Person) (ed : EmploymentDecision) (c : ComplaintText) : Prop where
  covered       : IsCoveredGovernmentPerson party c
  intent        : IntentToInfluenceEmploymentOnPartisanBasis party ed c
  act           : TakesOrInfluencesOfficialAct party c
  privateEntity : TargetIsPrivateEntity ed c





structure Section218Recovery (t : Transaction) (c : ComplaintText) : Prop where
  taintedTransaction : TransactionInViolationOfChapter t c

end Proving.USC.T18.Ch11.Reslice.Elements
