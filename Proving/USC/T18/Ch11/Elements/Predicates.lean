import Proving.USC.T18.Ch11.Elements.Types











namespace Proving.USC.T18.Ch11.Elements

open Proving.USC.Common




axiom IsPublicOfficial (p : Person) (c : ComplaintText) : Prop

axiom IsSelectedToBePublicOfficial (p : Person) (c : ComplaintText) : Prop

axiom IsOfficerOrEmployeeOfUS (p : Person) (c : ComplaintText) : Prop

axiom IsExecutiveBranchOfficerOrEmployee (p : Person) (c : ComplaintText) : Prop

axiom IsSpecialGovernmentEmployee (p : Person) (c : ComplaintText) : Prop

axiom IsMemberOfCongress (p : Person) (c : ComplaintText) : Prop

axiom IsFormerOfficerOrEmployee (p : Person) (c : ComplaintText) : Prop

axiom IsExaminer (p : Person) (c : ComplaintText) : Prop

axiom IsFinancialInstitutionInsider (p : Person) (i : Institution) (c : ComplaintText) : Prop

axiom IsCoveredGovernmentPerson (p : Person) (c : ComplaintText) : Prop

axiom IsExemptRetiredOfficer (p : Person) (c : ComplaintText) : Prop




axiom ActsCorruptly (p : Person) (c : ComplaintText) : Prop

axiom ActsKnowingly (p : Person) (c : ComplaintText) : Prop

axiom ActsKnowinglyAndWillfully (p : Person) (c : ComplaintText) : Prop




axiom GivesOffersOrPromisesThingOfValue (p : Person) (t : Thing) (c : ComplaintText) : Prop

axiom DemandsSeeksReceivesAcceptsThingOfValue (p : Person) (t : Thing) (c : ComplaintText) : Prop

axiom SolicitsOrReceivesThingOfValue (p : Person) (t : Thing) (c : ComplaintText) : Prop

axiom ThingOfValue (t : Thing) (c : ComplaintText) : Prop

axiom ReceivesCompensationForRepresentation (p : Person) (c : ComplaintText) : Prop

axiom GivesCompensationForRepresentation (p : Person) (c : ComplaintText) : Prop

axiom ReceivesSalarySupplementation (p : Person) (t : Thing) (c : ComplaintText) : Prop

axiom PaysSalarySupplementation (p : Person) (t : Thing) (c : ComplaintText) : Prop

axiom MakesLoanOrGratuityToExaminer (p : Person) (c : ComplaintText) : Prop

axiom AcceptsLoanOrGratuityFromExaminedInstitution (p : Person) (c : ComplaintText) : Prop

axiom AcceptsConsideration (p : Person) (t : Thing) (c : ComplaintText) : Prop

axiom PaysRemunerationToInduceReferral (p : Person) (t : Thing) (c : ComplaintText) : Prop




axiom IntentToInfluenceOfficialAct (p : Person) (m : Matter) (c : ComplaintText) : Prop

axiom InReturnForBeingInfluenced (p : Person) (m : Matter) (c : ComplaintText) : Prop

axiom ForOrBecauseOfOfficialAct (p : Person) (m : Matter) (c : ComplaintText) : Prop

axiom IntentToInfluenceTestimony (p : Person) (c : ComplaintText) : Prop

axiom ForOrBecauseOfTestimony (p : Person) (c : ComplaintText) : Prop

axiom IntentToInfluenceOrRewardBankInsider (p : Person) (i : Institution) (c : ComplaintText) : Prop

axiom IntentToInfluence (p : Person) (c : ComplaintText) : Prop

axiom IntentToCommitTerrorism (p : Person) (c : ComplaintText) : Prop

axiom IntentToInfluenceEmploymentPartisan (p : Person) (e : Entity) (c : ComplaintText) : Prop

axiom InConsiderationOfInfluenceForAppointiveOffice (p : Person) (c : ComplaintText) : Prop

axiom ForReferralToCoveredTarget (p : Person) (e : Entity) (c : ComplaintText) : Prop




axiom IsOfficialAct (m : Matter) (c : ComplaintText) : Prop

axiom IsWitnessProceeding (m : Matter) (c : ComplaintText) : Prop

axiom IsCoveredMatter (m : Matter) (c : ComplaintText) : Prop

axiom IsParticularMatter (m : Matter) (c : ComplaintText) : Prop

axiom GovernmentIsPartyOrHasInterest (m : Matter) (c : ComplaintText) : Prop

axiom ActsAsAgentOrAttorney (p : Person) (m : Matter) (c : ComplaintText) : Prop

axiom ProsecutesClaimAgainstGovernment (p : Person) (m : Matter) (c : ComplaintText) : Prop

axiom MakesCommunicationOrAppearance (p : Person) (m : Matter) (c : ComplaintText) : Prop

axiom OnBehalfOfAnotherPerson (p : Person) (c : ComplaintText) : Prop

axiom ParticipatedPersonallyAndSubstantially (p : Person) (m : Matter) (c : ComplaintText) : Prop

axiom InvolvedSpecificParties (m : Matter) (c : ComplaintText) : Prop

axiom WithinRestrictedPeriod (p : Person) (c : ComplaintText) : Prop

axiom HasFinancialInterestInMatter (p : Person) (m : Matter) (c : ComplaintText) : Prop

axiom KnowsOfFinancialInterest (p : Person) (m : Matter) (c : ComplaintText) : Prop

axiom FromNonGovernmentSource (t : Thing) (c : ComplaintText) : Prop

axiom ForProcuringFederalReserveCredit (p : Person) (c : ComplaintText) : Prop

axiom InConnectionWithFarmIndebtednessAdjustment (m : Matter) (c : ComplaintText) : Prop

axiom PracticesInCoveredCourt (p : Person) (c : ComplaintText) : Prop

axiom ActsAsAgentOfForeignPrincipal (p : Person) (c : ComplaintText) : Prop

axiom ServicesCoveredByHealthCareBenefitProgram (c : ComplaintText) : Prop

axiom AffectsInterstateOrForeignCommerce (c : ComplaintText) : Prop

axiom CarriesIntoEffectScheme (p : Person) (c : ComplaintText) : Prop

axiom ToInfluenceSportingContestByBribery (e : Entity) (c : ComplaintText) : Prop

axiom IsSportingContest (e : Entity) (c : ComplaintText) : Prop

axiom KnowsSchemePurpose (p : Person) (c : ComplaintText) : Prop

axiom AffectsSecureOrRestrictedAreaOrSeaport (m : Matter) (c : ComplaintText) : Prop

axiom IsPrivateEntityEmploymentDecision (e : Entity) (c : ComplaintText) : Prop

axiom TakesOrInfluencesOfficialAct (p : Person) (c : ComplaintText) : Prop




axiom OrganizesManagesSupervisesEnterprise (p : Person) (e : Enterprise) (c : ComplaintText) : Prop

axiom SeriesOfEnumeratedViolations (e : Enterprise) (c : ComplaintText) : Prop

axiom PersonsActingInConcert (e : Enterprise) (c : ComplaintText) : Prop

axiom GrossReceiptsInWindow (e : Enterprise) (c : ComplaintText) : Nat

axiom PersonCountInConcert (e : Enterprise) (c : ComplaintText) : Nat




axiom OtherwiseThanProperDischarge (p : Person) (c : ComplaintText) : Prop

axiom ConductConstitutesChapterOffense (p : Person) (c : ComplaintText) : Prop

axiom FinalConvictionForChapterViolation (p : Person) (c : ComplaintText) : Prop

axiom TransactionInRelationToViolation (m : Matter) (c : ComplaintText) : Prop




axiom IsWitnessFeePayment (t : Thing) (c : ComplaintText) : Prop

axiom DisclosedInWriting (c : ComplaintText) : Prop

axiom GrantedWaiverOrExemption208 (p : Person) (c : ComplaintText) : Prop

axiom FallsWithinSafeHarbor220 (c : ComplaintText) : Prop

end Proving.USC.T18.Ch11.Elements
