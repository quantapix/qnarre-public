import Proving.USC.T18.Ch11.Reslice.Elements.Statute
import Proving.USC.Common.Tactic






set_option autoImplicit false
set_option relaxedAutoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch11.Reslice.Elements




@[grind →] theorem officialActCore_of_leaves {oa : OfficialAct} {c : ComplaintText}
    (h1 : IsQuestionOrMatter oa c) (h2 : MatterPendingBeforeOfficial oa c)
    (h3 : FormalDecisionOrActionOnMatter oa c) : OfficialActCore oa c :=
  ⟨h1, h2, h3⟩

theorem officialActCore_intro {oa : OfficialAct} {c : ComplaintText}
    (h1 : IsQuestionOrMatter oa c) (h2 : MatterPendingBeforeOfficial oa c)
    (h3 : FormalDecisionOrActionOnMatter oa c) : OfficialActCore oa c :=
  ⟨h1, h2, h3⟩


example {oa : OfficialAct} {c : ComplaintText}
    (h1 : IsQuestionOrMatter oa c) (h2 : MatterPendingBeforeOfficial oa c)
    (h3 : FormalDecisionOrActionOnMatter oa c) : IsOfficialAct oa c := by
  prove_element



theorem section201b1_intro {giver recipient : Person} {tov : ThingOfValue} {oa : OfficialAct} {c : ComplaintText}
    (hConfers : ConfersThingOfValue giver tov c) (hValue : IsThingOfValue tov c)
    (hRecipient : IsBriberyRecipient recipient c) (hCorrupt : ActsCorruptly giver c)
    (hPurpose : BriberyPurpose201b1 giver oa c) : Section201b1 giver recipient tov oa c :=
  ⟨hConfers, hValue, hRecipient, hCorrupt, hPurpose⟩

theorem section201b2_intro {official : Person} {tov : ThingOfValue} {oa : OfficialAct} {c : ComplaintText}
    (hOfficial : IsBriberyRecipient official c) (hSolicits : SolicitsOrReceivesThingOfValue official tov c)
    (hValue : IsThingOfValue tov c) (hCorrupt : ActsCorruptly official c)
    (hReturn : BriberyReturn201b2 official oa c) : Section201b2 official tov oa c :=
  ⟨hOfficial, hSolicits, hValue, hCorrupt, hReturn⟩

theorem section201b3_intro {giver witness : Person} {tov : ThingOfValue} {c : ComplaintText}
    (hConfers : ConfersThingOfValue giver tov c) (hValue : IsThingOfValue tov c)
    (hWitness : IsWitness witness c) (hCorrupt : ActsCorruptly giver c)
    (hIntent : IntentToInfluenceTestimony giver c) (hNotFee : ¬ IsLawfulWitnessFeePayment c) :
    Section201b3 giver witness tov c :=
  ⟨hConfers, hValue, hWitness, hCorrupt, hIntent, hNotFee⟩

theorem section201b4_intro {witness : Person} {tov : ThingOfValue} {c : ComplaintText}
    (hWitness : IsWitness witness c) (hSolicits : SolicitsOrReceivesThingOfValue witness tov c)
    (hValue : IsThingOfValue tov c) (hCorrupt : ActsCorruptly witness c)
    (hReturn : InReturnForInfluencedTestimony witness c) (hNotFee : ¬ IsLawfulWitnessFeePayment c) :
    Section201b4 witness tov c :=
  ⟨hWitness, hSolicits, hValue, hCorrupt, hReturn, hNotFee⟩

theorem section201c1_intro {party recipient : Person} {tov : ThingOfValue} {oa : OfficialAct} {c : ComplaintText}
    (hLaw : OtherwiseThanProvidedByLaw c) (hValue : IsThingOfValue tov c)
    (hAct : ConfersThingOfValue party tov c ∨ SolicitsOrReceivesThingOfValue party tov c)
    (hOfficial : IsBriberyRecipient recipient c ∨ IsPublicOfficial recipient c)
    (hNexus : ForOrBecauseOfOfficialAct party oa c) : Section201c1 party recipient tov oa c :=
  ⟨hLaw, hValue, hAct, hOfficial, hNexus⟩

theorem section201c2_intro {party : Person} {tov : ThingOfValue} {c : ComplaintText}
    (hValue : IsThingOfValue tov c)
    (hAct : ConfersThingOfValue party tov c ∨ SolicitsOrReceivesThingOfValue party tov c)
    (hNexus : ForOrBecauseOfTestimony party c) (hNotFee : ¬ IsLawfulWitnessFeePayment c) :
    Section201c2 party tov c :=
  ⟨hValue, hAct, hNexus, hNotFee⟩



theorem section203a_intro {party : Person} {comp : RepresentationalCompensation} {pm : ParticularMatter} {c : ComplaintText}
    (hLaw : OtherwiseThanProvidedByLaw c) (hRepr : IsRepresentationalServices comp c)
    (hMatter : MatterInWhichUSHasInterest pm c)
    (hCovered : IsMemberOfCongress party c ∨ IsOfficerOrEmployeeOfUS party c)
    (hAct : DemandsOrReceivesRepresentationalCompensation party comp c
              ∨ GivesRepresentationalCompensation party comp c) :
    Section203a party comp pm c :=
  ⟨hLaw, hRepr, hMatter, hCovered, hAct⟩

theorem section204_intro {party : Person} {c : ComplaintText}
    (hMember : IsMemberOfCongress party c) (hPractices : PracticesInRestrictedCourt party c) :
    Section204 party c :=
  ⟨hMember, hPractices⟩

theorem section205a_intro {party : Person} {claim : Claim} {pm : ParticularMatter} {c : ComplaintText}
    (hOfficer : IsOfficerOrEmployeeOfUS party c) (hLaw : OtherwiseThanProvidedByLaw c)
    (hMatter : MatterInWhichUSHasInterest pm c)
    (hAct : ProsecutesClaimAgainstUS party claim c ∨ ActsAsAgentOrAttorney party pm c) :
    Section205a party claim pm c :=
  ⟨hOfficer, hLaw, hMatter, hAct⟩

theorem section207a1_intro {party : Person} {comm : Communication} {pm : ParticularMatter} {c : ComplaintText}
    (hFormer : IsFormerOfficerOrEmployee party c) (hComm : MakesCommunicationWithIntentToInfluence party comm c)
    (hBehalf : OnBehalfOfAnotherPerson party comm c) (hMatter : MatterInWhichUSHasInterest pm c)
    (hPart : ParticipatedPersonallyAndSubstantially party pm c) (hSpecific : MatterInvolvedSpecificParties pm c) :
    Section207a1 party comm pm c :=
  ⟨hFormer, hComm, hBehalf, hMatter, hPart, hSpecific⟩

theorem section207Timed_intro {party : Person} {comm : Communication} {pm : ParticularMatter} {c : ComplaintText}
    (hFormer : IsFormerOfficerOrEmployee party c) (hComm : MakesCommunicationWithIntentToInfluence party comm c)
    (hBehalf : OnBehalfOfAnotherPerson party comm c) (hMatter : MatterInWhichUSHasInterest pm c)
    (hWindow : WithinPostEmploymentWindow party comm c) : Section207Timed party comm pm c :=
  ⟨hFormer, hComm, hBehalf, hMatter, hWindow⟩

theorem section208a_intro {party : Person} {fi : FinancialInterest} {pm : ParticularMatter} {c : ComplaintText}
    (hOfficer : IsOfficerOrEmployeeOfUS party c) (hPart : ParticipatedPersonallyAndSubstantially party pm c)
    (hInterest : HasFinancialInterestInMatter party fi pm c) (hNotPermitted : ¬ PermittedUnderSection208b party pm c) :
    Section208a party fi pm c :=
  ⟨hOfficer, hPart, hInterest, hNotPermitted⟩



theorem section209a_intro {party : Person} {ss : SalarySupplementation} {c : ComplaintText}
    (hOfficer : IsOfficerOrEmployeeOfUS party c) (hReceives : ReceivesOutsideSalarySupplementation party ss c)
    (hComp : IsCompensationForOfficialServices ss c) : Section209a party ss c :=
  ⟨hOfficer, hReceives, hComp⟩

theorem section210_intro {party : Person} {office : AppointiveOffice} {c : ComplaintText}
    (hOffers : OffersValueToProcureAppointiveOffice party office c) : Section210 party office c :=
  ⟨hOffers⟩

theorem section211_intro {party : Person} {office : AppointiveOffice} {c : ComplaintText}
    (hSolicits : SolicitsValueForAppointiveOfficeInfluence party office c) : Section211 party office c :=
  ⟨hSolicits⟩

theorem section212_intro {party : Person} {fi : FinancialInstitution} {lg : LoanOrGratuity} {c : ComplaintText}
    (hInsider : IsFinancialInstitutionInsider party fi c) (hGives : GivesLoanOrGratuityToExaminer party lg c)
    (hNotExempt : ¬ IsExemptExaminerCredit lg c) : Section212 party fi lg c :=
  ⟨hInsider, hGives, hNotExempt⟩

theorem section213_intro {party : Person} {lg : LoanOrGratuity} {c : ComplaintText}
    (hExaminer : IsExaminer party c) (hAccepts : ExaminerAcceptsLoanOrGratuity party lg c)
    (hNotExempt : ¬ IsExemptExaminerCredit lg c) : Section213 party lg c :=
  ⟨hExaminer, hAccepts, hNotExempt⟩

theorem section214_intro {party : Person} {fee : FeeOrCommission} {c : ComplaintText}
    (hProcures : GivesOrReceivesFeeForFedReserveProcurement party fee c)
    (hNotDisclosed : ¬ DisclosedInWriting fee c) : Section214 party fee c :=
  ⟨hProcures, hNotDisclosed⟩

theorem section215Give_intro {giver : Person} {tov : ThingOfValue} {fi : FinancialInstitution} {c : ComplaintText}
    (hConfers : ConfersThingOfValue giver tov c) (hCorrupt : ActsCorruptly giver c)
    (hIntent : IntentToInfluenceOrRewardInsider giver c) (hConn : InConnectionWithInstitutionBusiness fi c)
    (hNotBona : ¬ IsBonaFideCompensation tov c) : Section215Give giver tov fi c :=
  ⟨hConfers, hCorrupt, hIntent, hConn, hNotBona⟩

theorem section215Receive_intro {party : Person} {tov : ThingOfValue} {fi : FinancialInstitution} {c : ComplaintText}
    (hInsider : IsFinancialInstitutionInsider party fi c) (hSolicits : SolicitsOrReceivesThingOfValue party tov c)
    (hCorrupt : ActsCorruptly party c) (hIntent : IntentToInfluenceOrRewardInsider party c)
    (hConn : InConnectionWithInstitutionBusiness fi c) (hNotBona : ¬ IsBonaFideCompensation tov c) :
    Section215Receive party tov fi c :=
  ⟨hInsider, hSolicits, hCorrupt, hIntent, hConn, hNotBona⟩

theorem section217_intro {party : Person} {c : ComplaintText}
    (hOfficer : IsOfficerOrEmployeeOfUS party c) (hAccepts : AcceptsConsiderationForFarmIndebtedness party c) :
    Section217 party c :=
  ⟨hOfficer, hAccepts⟩

theorem section219_intro {party : Person} {c : ComplaintText}
    (hOfficial : IsPublicOfficial party c) (hAgent : ActsAsAgentOfForeignPrincipal party c)
    (hRegistrable : ForeignPrincipalRequiredToRegister party c) : Section219 party c :=
  ⟨hOfficial, hAgent, hRegistrable⟩



theorem section220_intro {party : Person} {rem : Remuneration} {ref : Referral} {c : ComplaintText}
    (hScienter : KnowinglyAndWillfully party c) (hCovered : ServicesCoveredByHealthCareBenefitProgram ref c)
    (hCommerce : AffectsInterstateOrForeignCommerce c)
    (hAct : SolicitsRemunerationForReferral party rem ref c ∨ PaysRemunerationToInduceReferral party rem ref c)
    (hNotSafe : ¬ FallsWithinSection220bException rem c) : Section220 party rem ref c :=
  ⟨hScienter, hCovered, hCommerce, hAct, hNotSafe⟩

theorem section224_intro {party : Person} {sc : BriberyScheme} {target : SportingContest} {c : ComplaintText}
    (hScheme : CarriesOutSchemeToInfluenceContest party sc c) (hCommerce : SchemeInCommerce sc c)
    (hContest : IsSportingContest target c) (hKnow : KnowsSchemePurposeIsBribery party sc c) :
    Section224 party sc target c :=
  ⟨hScheme, hCommerce, hContest, hKnow⟩


example {ce : CrimesEnterprise} {c : ComplaintText} (h : numPersonsInConcert ce c = 5) :
    AtLeastFourInConcert ce c := by unfold AtLeastFourInConcert; omega


example {party : Person} {ce : CrimesEnterprise} {c : ComplaintText}
    (h : grossReceiptsUsdIn24Months party ce c = 6000000) : GrossReceiptsAtLeast5M party ce c := by
  unfold GrossReceiptsAtLeast5M; omega

theorem continuingEnterprise_intro {ce : CrimesEnterprise} {c : ComplaintText}
    (hSeries : SeriesOfEnumeratedFinancialViolations ce c) (hFour : AtLeastFourInConcert ce c) :
    ContinuingFinancialCrimesEnterprise ce c :=
  ⟨hSeries, hFour⟩

theorem section225_intro {party : Person} {ce : CrimesEnterprise} {c : ComplaintText}
    (hOrg : OrganizesManagesSupervisesEnterprise party ce c)
    (hEnt : ContinuingFinancialCrimesEnterprise ce c) (hReceipts : GrossReceiptsAtLeast5M party ce c) :
    Section225 party ce c :=
  ⟨hOrg, hEnt, hReceipts⟩

theorem section226Give_intro {giver : Person} {tov : ThingOfValue} {c : ComplaintText}
    (hKnow : KnowinglyAndWillfully giver c) (hConfers : ConfersThingOfValue giver tov c)
    (hCorrupt : ActsCorruptly giver c) (hIntent : IntentToCommitTerrorismAffectingSeaport giver c) :
    Section226Give giver tov c :=
  ⟨hKnow, hConfers, hCorrupt, hIntent⟩

theorem section226Receive_intro {official : Person} {tov : ThingOfValue} {c : ComplaintText}
    (hKnow : KnowinglyAndWillfully official c) (hSolicits : SolicitsOrReceivesThingOfValue official tov c)
    (hCorrupt : ActsCorruptly official c) (hReturn : InReturnForInfluenceAffectingSeaport official c) :
    Section226Receive official tov c :=
  ⟨hKnow, hSolicits, hCorrupt, hReturn⟩

theorem section227_intro {party : Person} {ed : EmploymentDecision} {c : ComplaintText}
    (hCovered : IsCoveredGovernmentPerson party c) (hIntent : IntentToInfluenceEmploymentOnPartisanBasis party ed c)
    (hAct : TakesOrInfluencesOfficialAct party c) (hPrivate : TargetIsPrivateEntity ed c) :
    Section227 party ed c :=
  ⟨hCovered, hIntent, hAct, hPrivate⟩

theorem section218Recovery_intro {t : Transaction} {c : ComplaintText}
    (hTainted : TransactionInViolationOfChapter t c) : Section218Recovery t c :=
  ⟨hTainted⟩

end Proving.USC.T18.Ch11.Reslice.Elements
