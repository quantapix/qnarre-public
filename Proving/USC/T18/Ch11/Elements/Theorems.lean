import Proving.USC.T18.Ch11.Elements.Statute










namespace Proving.USC.T18.Ch11.Elements

open Proving.USC.Common



theorem section201b1_intro {p o t m c}
    (official : IsPublicOfficial o c ∨ IsSelectedToBePublicOfficial o c)
    (gives : GivesOffersOrPromisesThingOfValue p t c) (value : ThingOfValue t c)
    (corrupt : ActsCorruptly p c) (intent : IntentToInfluenceOfficialAct p m c)
    (officialAct : IsOfficialAct m c) : Section201b1_Bribery p o t m c :=
  ⟨official, gives, value, corrupt, intent, officialAct⟩

theorem section201b2_intro {o t m c}
    (official : IsPublicOfficial o c ∨ IsSelectedToBePublicOfficial o c)
    (demands : DemandsSeeksReceivesAcceptsThingOfValue o t c) (value : ThingOfValue t c)
    (corrupt : ActsCorruptly o c) (inReturn : InReturnForBeingInfluenced o m c)
    (officialAct : IsOfficialAct m c) : Section201b2_Bribery o t m c :=
  ⟨official, demands, value, corrupt, inReturn, officialAct⟩

theorem section201b3_intro {p t m c}
    (gives : GivesOffersOrPromisesThingOfValue p t c) (value : ThingOfValue t c)
    (corrupt : ActsCorruptly p c) (intent : IntentToInfluenceTestimony p c)
    (proceeding : IsWitnessProceeding m c) (notFee : ¬ IsWitnessFeePayment t c)
    : Section201b3_WitnessBribery p t m c :=
  ⟨gives, value, corrupt, intent, proceeding, notFee⟩

theorem section201c1_intro {p o t m c}
    (official : IsPublicOfficial o c ∨ IsSelectedToBePublicOfficial o c)
    (conveys : GivesOffersOrPromisesThingOfValue p t c ∨ DemandsSeeksReceivesAcceptsThingOfValue o t c)
    (value : ThingOfValue t c) (nexus : ForOrBecauseOfOfficialAct p m c)
    (officialAct : IsOfficialAct m c) : Section201c1_Gratuity p o t m c :=
  ⟨official, conveys, value, nexus, officialAct⟩

theorem section201c2_intro {p t m c}
    (conveys : GivesOffersOrPromisesThingOfValue p t c ∨ SolicitsOrReceivesThingOfValue p t c)
    (value : ThingOfValue t c) (nexus : ForOrBecauseOfTestimony p c)
    (proceeding : IsWitnessProceeding m c) (notFee : ¬ IsWitnessFeePayment t c)
    : Section201c2_WitnessGratuity p t m c :=
  ⟨conveys, value, nexus, proceeding, notFee⟩

theorem violatesSection201_bribeGiver {p o t m c}
    (h : Section201b1_Bribery p o t m c) : ViolatesSection201 p o t m c := .bribeGiver h
theorem violatesSection201_bribeOfficial {p o t m c}
    (h : Section201b2_Bribery o t m c) : ViolatesSection201 p o t m c := .bribeOfficial h
theorem violatesSection201_witnessBribe {p o t m c}
    (h : Section201b3_WitnessBribery p t m c) : ViolatesSection201 p o t m c := .witnessBribe h
theorem violatesSection201_gratuity {p o t m c}
    (h : Section201c1_Gratuity p o t m c) : ViolatesSection201 p o t m c := .gratuity h
theorem violatesSection201_witnessGratuity {p o t m c}
    (h : Section201c2_WitnessGratuity p t m c) : ViolatesSection201 p o t m c := .witnessGratuity h



theorem section203aReceiver_intro {p c}
    (covered : IsOfficerOrEmployeeOfUS p c ∨ IsMemberOfCongress p c)
    (otherwise : OtherwiseThanProperDischarge p c)
    (receives : ReceivesCompensationForRepresentation p c) : Section203a_Receiver p c :=
  ⟨covered, otherwise, receives⟩

theorem section203aGiver_intro {p c}
    (knowingly : ActsKnowingly p c) (gives : GivesCompensationForRepresentation p c)
    : Section203a_Giver p c := ⟨knowingly, gives⟩

theorem section204_intro {p c}
    (member : IsMemberOfCongress p c) (practices : PracticesInCoveredCourt p c)
    : Section204 p c := ⟨member, practices⟩

theorem section205a1_intro {p m c}
    (officer : IsOfficerOrEmployeeOfUS p c) (otherwise : OtherwiseThanProperDischarge p c)
    (prosecutes : ProsecutesClaimAgainstGovernment p m c)
    (notExempt : ¬ IsExemptRetiredOfficer p c) : Section205a1_Claim p m c :=
  ⟨officer, otherwise, prosecutes, notExempt⟩

theorem section205a2_intro {p m c}
    (officer : IsOfficerOrEmployeeOfUS p c) (otherwise : OtherwiseThanProperDischarge p c)
    (agent : ActsAsAgentOrAttorney p m c) (covered : IsCoveredMatter m c)
    (interest : GovernmentIsPartyOrHasInterest m c) (notExempt : ¬ IsExemptRetiredOfficer p c)
    : Section205a2_Representation p m c :=
  ⟨officer, otherwise, agent, covered, interest, notExempt⟩



theorem section207a1_intro {p m c}
    (former : IsFormerOfficerOrEmployee p c) (knowingly : ActsKnowingly p c)
    (communicates : MakesCommunicationOrAppearance p m c) (intent : IntentToInfluence p c)
    (onBehalf : OnBehalfOfAnotherPerson p c) (particular : IsParticularMatter m c)
    (interest : GovernmentIsPartyOrHasInterest m c)
    (participated : ParticipatedPersonallyAndSubstantially p m c)
    (specific : InvolvedSpecificParties m c) : Section207a1_Permanent p m c :=
  ⟨former, knowingly, communicates, intent, onBehalf, particular, interest, participated, specific⟩

theorem section207a2_intro {p m c}
    (former : IsFormerOfficerOrEmployee p c) (knowingly : ActsKnowingly p c)
    (communicates : MakesCommunicationOrAppearance p m c) (intent : IntentToInfluence p c)
    (onBehalf : OnBehalfOfAnotherPerson p c) (particular : IsParticularMatter m c)
    (interest : GovernmentIsPartyOrHasInterest m c) (window : WithinRestrictedPeriod p c)
    : Section207a2_TwoYear p m c :=
  ⟨former, knowingly, communicates, intent, onBehalf, particular, interest, window⟩

theorem section207c_intro {p m c}
    (former : IsFormerOfficerOrEmployee p c) (knowingly : ActsKnowingly p c)
    (communicates : MakesCommunicationOrAppearance p m c) (intent : IntentToInfluence p c)
    (onBehalf : OnBehalfOfAnotherPerson p c) (window : WithinRestrictedPeriod p c)
    : Section207c_CoolingOff p m c :=
  ⟨former, knowingly, communicates, intent, onBehalf, window⟩

theorem violatesSection207_permanent {p m c}
    (h : Section207a1_Permanent p m c) : ViolatesSection207 p m c := .permanent h
theorem violatesSection207_twoYear {p m c}
    (h : Section207a2_TwoYear p m c) : ViolatesSection207 p m c := .twoYear h
theorem violatesSection207_coolingOff {p m c}
    (h : Section207c_CoolingOff p m c) : ViolatesSection207 p m c := .coolingOff h



theorem section208a_intro {p m c}
    (officer : IsExecutiveBranchOfficerOrEmployee p c ∨ IsSpecialGovernmentEmployee p c)
    (participated : ParticipatedPersonallyAndSubstantially p m c)
    (particular : IsParticularMatter m c) (interest : HasFinancialInterestInMatter p m c)
    (knows : KnowsOfFinancialInterest p m c) (notWaived : ¬ GrantedWaiverOrExemption208 p c)
    : Section208a p m c :=
  ⟨officer, participated, particular, interest, knows, notWaived⟩

theorem section209aReceiver_intro {p t c}
    (officer : IsExecutiveBranchOfficerOrEmployee p c)
    (receives : ReceivesSalarySupplementation p t c) (nonGov : FromNonGovernmentSource t c)
    (notSGE : ¬ IsSpecialGovernmentEmployee p c) : Section209a_Receiver p t c :=
  ⟨officer, receives, nonGov, notSGE⟩

theorem section209aPayer_intro {p t c}
    (pays : PaysSalarySupplementation p t c) (nonGov : FromNonGovernmentSource t c)
    : Section209a_Payer p t c := ⟨pays, nonGov⟩

theorem section210_intro {p t c}
    (gives : GivesOffersOrPromisesThingOfValue p t c) (value : ThingOfValue t c)
    (consider : InConsiderationOfInfluenceForAppointiveOffice p c) : Section210 p t c :=
  ⟨gives, value, consider⟩

theorem section211_intro {p t c}
    (solicits : SolicitsOrReceivesThingOfValue p t c) (value : ThingOfValue t c)
    (consider : InConsiderationOfInfluenceForAppointiveOffice p c) : Section211 p t c :=
  ⟨solicits, value, consider⟩



theorem section212_intro {p i c}
    (insider : IsFinancialInstitutionInsider p i c) (makes : MakesLoanOrGratuityToExaminer p c)
    : Section212 p i c := ⟨insider, makes⟩

theorem section213_intro {p c}
    (examiner : IsExaminer p c) (accepts : AcceptsLoanOrGratuityFromExaminedInstitution p c)
    : Section213 p c := ⟨examiner, accepts⟩

theorem section214_intro {p t c}
    (gives : GivesOffersOrPromisesThingOfValue p t c) (value : ThingOfValue t c)
    (procuring : ForProcuringFederalReserveCredit p c) (notDisclosed : ¬ DisclosedInWriting c)
    : Section214 p t c := ⟨gives, value, procuring, notDisclosed⟩

theorem section215a1_intro {p t i c}
    (corrupt : ActsCorruptly p c) (gives : GivesOffersOrPromisesThingOfValue p t c)
    (value : ThingOfValue t c) (intent : IntentToInfluenceOrRewardBankInsider p i c)
    : Section215a1_Giver p t i c := ⟨corrupt, gives, value, intent⟩

theorem section215a2_intro {p t i c}
    (insider : IsFinancialInstitutionInsider p i c) (corrupt : ActsCorruptly p c)
    (demands : DemandsSeeksReceivesAcceptsThingOfValue p t c) (value : ThingOfValue t c)
    (intent : IntentToInfluenceOrRewardBankInsider p i c) : Section215a2_Insider p t i c :=
  ⟨insider, corrupt, demands, value, intent⟩



theorem section216b_intro {p c}
    (conduct : ConductConstitutesChapterOffense p c) : Section216b_CivilAction p c :=
  ⟨conduct⟩

theorem section217_intro {p t m c}
    (officer : IsOfficerOrEmployeeOfUS p c) (accepts : AcceptsConsideration p t c)
    (nexus : InConnectionWithFarmIndebtednessAdjustment m c) : Section217 p t m c :=
  ⟨officer, accepts, nexus⟩

theorem section218_intro {p m c}
    (conviction : FinalConvictionForChapterViolation p c)
    (transaction : TransactionInRelationToViolation m c) : Section218_Recovery p m c :=
  ⟨conviction, transaction⟩

theorem section219_intro {p c}
    (official : IsPublicOfficial p c) (agent : ActsAsAgentOfForeignPrincipal p c)
    : Section219 p c := ⟨official, agent⟩



theorem section220a1_intro {p t e c}
    (services : ServicesCoveredByHealthCareBenefitProgram c)
    (commerce : AffectsInterstateOrForeignCommerce c) (scienter : ActsKnowinglyAndWillfully p c)
    (solicits : SolicitsOrReceivesThingOfValue p t c) (referral : ForReferralToCoveredTarget p e c)
    (notSafe : ¬ FallsWithinSafeHarbor220 c) : Section220a1_Solicit p t e c :=
  ⟨services, commerce, scienter, solicits, referral, notSafe⟩

theorem section220a2_intro {p t e c}
    (services : ServicesCoveredByHealthCareBenefitProgram c)
    (commerce : AffectsInterstateOrForeignCommerce c) (scienter : ActsKnowinglyAndWillfully p c)
    (pays : PaysRemunerationToInduceReferral p t c) (referral : ForReferralToCoveredTarget p e c)
    (notSafe : ¬ FallsWithinSafeHarbor220 c) : Section220a2_Pay p t e c :=
  ⟨services, commerce, scienter, pays, referral, notSafe⟩



theorem section224_intro {p e c}
    (carries : CarriesIntoEffectScheme p c) (commerce : AffectsInterstateOrForeignCommerce c)
    (purpose : ToInfluenceSportingContestByBribery e c) (contest : IsSportingContest e c)
    (knows : KnowsSchemePurpose p c) : Section224 p e c :=
  ⟨carries, commerce, purpose, contest, knows⟩

theorem continuingFinancialCrimesEnterprise_intro {e c}
    (series : SeriesOfEnumeratedViolations e c) (concert : PersonsActingInConcert e c)
    (fourPlus : CommittedByAtLeastFourPersons e c) : ContinuingFinancialCrimesEnterprise e c :=
  ⟨series, concert, fourPlus⟩

theorem section225_intro {p e c}
    (organizes : OrganizesManagesSupervisesEnterprise p e c)
    (cfce : ContinuingFinancialCrimesEnterprise e c) (receipts : MeetsGrossReceiptsThreshold e c)
    : Section225 p e c := ⟨organizes, cfce, receipts⟩

theorem section226a1_intro {p t m c}
    (knowingly : ActsKnowingly p c) (corrupt : ActsCorruptly p c)
    (gives : GivesOffersOrPromisesThingOfValue p t c) (value : ThingOfValue t c)
    (terror : IntentToCommitTerrorism p c) (seaport : AffectsSecureOrRestrictedAreaOrSeaport m c)
    : Section226a1_Giver p t m c := ⟨knowingly, corrupt, gives, value, terror, seaport⟩

theorem section226a2_intro {p t m c}
    (knowingly : ActsKnowingly p c) (corrupt : ActsCorruptly p c)
    (demands : DemandsSeeksReceivesAcceptsThingOfValue p t c) (value : ThingOfValue t c)
    (terror : IntentToCommitTerrorism p c) (seaport : AffectsSecureOrRestrictedAreaOrSeaport m c)
    : Section226a2_Receiver p t m c := ⟨knowingly, corrupt, demands, value, terror, seaport⟩

theorem section227_intro {p e c}
    (covered : IsCoveredGovernmentPerson p c) (intent : IntentToInfluenceEmploymentPartisan p e c)
    (target : IsPrivateEntityEmploymentDecision e c) (act : TakesOrInfluencesOfficialAct p c)
    : Section227 p e c := ⟨covered, intent, target, act⟩

end Proving.USC.T18.Ch11.Elements
