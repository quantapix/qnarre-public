import Proving.USC.T18.Ch11.Elements.Predicates










namespace Proving.USC.T18.Ch11.Elements

open Proving.USC.Common




structure Section201b1_Bribery (p o : Person) (t : Thing) (m : Matter) (c : ComplaintText) : Prop where
  official    : IsPublicOfficial o c ∨ IsSelectedToBePublicOfficial o c
  gives       : GivesOffersOrPromisesThingOfValue p t c
  value       : ThingOfValue t c
  corrupt     : ActsCorruptly p c
  intent      : IntentToInfluenceOfficialAct p m c
  officialAct : IsOfficialAct m c


structure Section201b2_Bribery (o : Person) (t : Thing) (m : Matter) (c : ComplaintText) : Prop where
  official    : IsPublicOfficial o c ∨ IsSelectedToBePublicOfficial o c
  demands     : DemandsSeeksReceivesAcceptsThingOfValue o t c
  value       : ThingOfValue t c
  corrupt     : ActsCorruptly o c
  inReturn    : InReturnForBeingInfluenced o m c
  officialAct : IsOfficialAct m c


structure Section201b3_WitnessBribery (p : Person) (t : Thing) (m : Matter) (c : ComplaintText) : Prop where
  gives      : GivesOffersOrPromisesThingOfValue p t c
  value      : ThingOfValue t c
  corrupt    : ActsCorruptly p c
  intent     : IntentToInfluenceTestimony p c
  proceeding : IsWitnessProceeding m c
  notFee     : ¬ IsWitnessFeePayment t c


structure Section201c1_Gratuity (p o : Person) (t : Thing) (m : Matter) (c : ComplaintText) : Prop where
  official    : IsPublicOfficial o c ∨ IsSelectedToBePublicOfficial o c
  conveys     : GivesOffersOrPromisesThingOfValue p t c ∨ DemandsSeeksReceivesAcceptsThingOfValue o t c
  value       : ThingOfValue t c
  nexus       : ForOrBecauseOfOfficialAct p m c
  officialAct : IsOfficialAct m c


structure Section201c2_WitnessGratuity (p : Person) (t : Thing) (m : Matter) (c : ComplaintText) : Prop where
  conveys    : GivesOffersOrPromisesThingOfValue p t c ∨ SolicitsOrReceivesThingOfValue p t c
  value      : ThingOfValue t c
  nexus      : ForOrBecauseOfTestimony p c
  proceeding : IsWitnessProceeding m c
  notFee     : ¬ IsWitnessFeePayment t c


inductive ViolatesSection201 (p o : Person) (t : Thing) (m : Matter) (c : ComplaintText) : Prop where
  | bribeGiver      (h : Section201b1_Bribery p o t m c)
  | bribeOfficial   (h : Section201b2_Bribery o t m c)
  | witnessBribe    (h : Section201b3_WitnessBribery p t m c)
  | gratuity        (h : Section201c1_Gratuity p o t m c)
  | witnessGratuity (h : Section201c2_WitnessGratuity p t m c)




structure Section203a_Receiver (p : Person) (c : ComplaintText) : Prop where
  covered   : IsOfficerOrEmployeeOfUS p c ∨ IsMemberOfCongress p c
  otherwise : OtherwiseThanProperDischarge p c
  receives  : ReceivesCompensationForRepresentation p c


structure Section203a_Giver (p : Person) (c : ComplaintText) : Prop where
  knowingly : ActsKnowingly p c
  gives     : GivesCompensationForRepresentation p c



structure Section204 (p : Person) (c : ComplaintText) : Prop where
  member    : IsMemberOfCongress p c
  practices : PracticesInCoveredCourt p c




structure Section205a1_Claim (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  officer    : IsOfficerOrEmployeeOfUS p c
  otherwise  : OtherwiseThanProperDischarge p c
  prosecutes : ProsecutesClaimAgainstGovernment p m c
  notExempt  : ¬ IsExemptRetiredOfficer p c


structure Section205a2_Representation (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  officer   : IsOfficerOrEmployeeOfUS p c
  otherwise : OtherwiseThanProperDischarge p c
  agent     : ActsAsAgentOrAttorney p m c
  covered   : IsCoveredMatter m c
  interest  : GovernmentIsPartyOrHasInterest m c
  notExempt : ¬ IsExemptRetiredOfficer p c




structure Section207a1_Permanent (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  former       : IsFormerOfficerOrEmployee p c
  knowingly    : ActsKnowingly p c
  communicates : MakesCommunicationOrAppearance p m c
  intent       : IntentToInfluence p c
  onBehalf     : OnBehalfOfAnotherPerson p c
  particular   : IsParticularMatter m c
  interest     : GovernmentIsPartyOrHasInterest m c
  participated : ParticipatedPersonallyAndSubstantially p m c
  specific     : InvolvedSpecificParties m c


structure Section207a2_TwoYear (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  former       : IsFormerOfficerOrEmployee p c
  knowingly    : ActsKnowingly p c
  communicates : MakesCommunicationOrAppearance p m c
  intent       : IntentToInfluence p c
  onBehalf     : OnBehalfOfAnotherPerson p c
  particular   : IsParticularMatter m c
  interest     : GovernmentIsPartyOrHasInterest m c
  window       : WithinRestrictedPeriod p c


structure Section207c_CoolingOff (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  former       : IsFormerOfficerOrEmployee p c
  knowingly    : ActsKnowingly p c
  communicates : MakesCommunicationOrAppearance p m c
  intent       : IntentToInfluence p c
  onBehalf     : OnBehalfOfAnotherPerson p c
  window       : WithinRestrictedPeriod p c


inductive ViolatesSection207 (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  | permanent  (h : Section207a1_Permanent p m c)
  | twoYear    (h : Section207a2_TwoYear p m c)
  | coolingOff (h : Section207c_CoolingOff p m c)



structure Section208a (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  officer      : IsExecutiveBranchOfficerOrEmployee p c ∨ IsSpecialGovernmentEmployee p c
  participated : ParticipatedPersonallyAndSubstantially p m c
  particular   : IsParticularMatter m c
  interest     : HasFinancialInterestInMatter p m c
  knows        : KnowsOfFinancialInterest p m c
  notWaived    : ¬ GrantedWaiverOrExemption208 p c



structure Section209a_Receiver (p : Person) (t : Thing) (c : ComplaintText) : Prop where
  officer  : IsExecutiveBranchOfficerOrEmployee p c
  receives : ReceivesSalarySupplementation p t c
  nonGov   : FromNonGovernmentSource t c
  notSGE   : ¬ IsSpecialGovernmentEmployee p c

structure Section209a_Payer (p : Person) (t : Thing) (c : ComplaintText) : Prop where
  pays   : PaysSalarySupplementation p t c
  nonGov : FromNonGovernmentSource t c



structure Section210 (p : Person) (t : Thing) (c : ComplaintText) : Prop where
  gives    : GivesOffersOrPromisesThingOfValue p t c
  value    : ThingOfValue t c
  consider : InConsiderationOfInfluenceForAppointiveOffice p c

structure Section211 (p : Person) (t : Thing) (c : ComplaintText) : Prop where
  solicits : SolicitsOrReceivesThingOfValue p t c
  value    : ThingOfValue t c
  consider : InConsiderationOfInfluenceForAppointiveOffice p c



structure Section212 (p : Person) (i : Institution) (c : ComplaintText) : Prop where
  insider : IsFinancialInstitutionInsider p i c
  makes   : MakesLoanOrGratuityToExaminer p c

structure Section213 (p : Person) (c : ComplaintText) : Prop where
  examiner : IsExaminer p c
  accepts  : AcceptsLoanOrGratuityFromExaminedInstitution p c



structure Section214 (p : Person) (t : Thing) (c : ComplaintText) : Prop where
  gives        : GivesOffersOrPromisesThingOfValue p t c
  value        : ThingOfValue t c
  procuring    : ForProcuringFederalReserveCredit p c
  notDisclosed : ¬ DisclosedInWriting c



structure Section215a1_Giver (p : Person) (t : Thing) (i : Institution) (c : ComplaintText) : Prop where
  corrupt : ActsCorruptly p c
  gives   : GivesOffersOrPromisesThingOfValue p t c
  value   : ThingOfValue t c
  intent  : IntentToInfluenceOrRewardBankInsider p i c

structure Section215a2_Insider (p : Person) (t : Thing) (i : Institution) (c : ComplaintText) : Prop where
  insider : IsFinancialInstitutionInsider p i c
  corrupt : ActsCorruptly p c
  demands : DemandsSeeksReceivesAcceptsThingOfValue p t c
  value   : ThingOfValue t c
  intent  : IntentToInfluenceOrRewardBankInsider p i c



structure Section216b_CivilAction (p : Person) (c : ComplaintText) : Prop where
  conduct : ConductConstitutesChapterOffense p c



structure Section217 (p : Person) (t : Thing) (m : Matter) (c : ComplaintText) : Prop where
  officer : IsOfficerOrEmployeeOfUS p c
  accepts : AcceptsConsideration p t c
  nexus   : InConnectionWithFarmIndebtednessAdjustment m c



structure Section218_Recovery (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  conviction  : FinalConvictionForChapterViolation p c
  transaction : TransactionInRelationToViolation m c



structure Section219 (p : Person) (c : ComplaintText) : Prop where
  official : IsPublicOfficial p c
  agent    : ActsAsAgentOfForeignPrincipal p c



structure Section220a1_Solicit (p : Person) (t : Thing) (e : Entity) (c : ComplaintText) : Prop where
  services : ServicesCoveredByHealthCareBenefitProgram c
  commerce : AffectsInterstateOrForeignCommerce c
  scienter : ActsKnowinglyAndWillfully p c
  solicits : SolicitsOrReceivesThingOfValue p t c
  referral : ForReferralToCoveredTarget p e c
  notSafe  : ¬ FallsWithinSafeHarbor220 c

structure Section220a2_Pay (p : Person) (t : Thing) (e : Entity) (c : ComplaintText) : Prop where
  services : ServicesCoveredByHealthCareBenefitProgram c
  commerce : AffectsInterstateOrForeignCommerce c
  scienter : ActsKnowinglyAndWillfully p c
  pays     : PaysRemunerationToInduceReferral p t c
  referral : ForReferralToCoveredTarget p e c
  notSafe  : ¬ FallsWithinSafeHarbor220 c



structure Section224 (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  carries  : CarriesIntoEffectScheme p c
  commerce : AffectsInterstateOrForeignCommerce c
  purpose  : ToInfluenceSportingContestByBribery e c
  contest  : IsSportingContest e c
  knows    : KnowsSchemePurpose p c




def MeetsGrossReceiptsThreshold (e : Enterprise) (c : ComplaintText) : Prop :=
  GrossReceiptsInWindow e c ≥ 5000000


def CommittedByAtLeastFourPersons (e : Enterprise) (c : ComplaintText) : Prop :=
  PersonCountInConcert e c ≥ 4


structure ContinuingFinancialCrimesEnterprise (e : Enterprise) (c : ComplaintText) : Prop where
  series   : SeriesOfEnumeratedViolations e c
  concert  : PersonsActingInConcert e c
  fourPlus : CommittedByAtLeastFourPersons e c


structure Section225 (p : Person) (e : Enterprise) (c : ComplaintText) : Prop where
  organizes : OrganizesManagesSupervisesEnterprise p e c
  cfce      : ContinuingFinancialCrimesEnterprise e c
  receipts  : MeetsGrossReceiptsThreshold e c



structure Section226a1_Giver (p : Person) (t : Thing) (m : Matter) (c : ComplaintText) : Prop where
  knowingly : ActsKnowingly p c
  corrupt   : ActsCorruptly p c
  gives     : GivesOffersOrPromisesThingOfValue p t c
  value     : ThingOfValue t c
  terror    : IntentToCommitTerrorism p c
  seaport   : AffectsSecureOrRestrictedAreaOrSeaport m c

structure Section226a2_Receiver (p : Person) (t : Thing) (m : Matter) (c : ComplaintText) : Prop where
  knowingly : ActsKnowingly p c
  corrupt   : ActsCorruptly p c
  demands   : DemandsSeeksReceivesAcceptsThingOfValue p t c
  value     : ThingOfValue t c
  terror    : IntentToCommitTerrorism p c
  seaport   : AffectsSecureOrRestrictedAreaOrSeaport m c



structure Section227 (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  covered : IsCoveredGovernmentPerson p c
  intent  : IntentToInfluenceEmploymentPartisan p e c
  target  : IsPrivateEntityEmploymentDecision e c
  act     : TakesOrInfluencesOfficialAct p c

end Proving.USC.T18.Ch11.Elements
