import Proving.USC.T42.Ch21Core.Ontology.Types

set_option autoImplicit false










namespace Proving.USC.T42.Ch21Core.Ontology

open Proving.USC.Common





axiom IsPersonWithinJurisdictionOfUS (p : Person) (c : ComplaintText) : Prop



axiom IsWhiteCitizenComparatorRight (r : Right) (c : ComplaintText) : Prop



axiom IsContractMaking (a : ContractActivity) (c : ComplaintText) : Prop



axiom IsContractPerformance (a : ContractActivity) (c : ComplaintText) : Prop



axiom IsContractModification (a : ContractActivity) (c : ComplaintText) : Prop



axiom IsContractTermination (a : ContractActivity) (c : ComplaintText) : Prop




axiom IsContractualBenefitEnjoyment (a : ContractActivity) (c : ComplaintText) : Prop



axiom IsNongovernmentalDiscriminationImpairment (r : Right) (c : ComplaintText) : Prop



axiom IsImpairmentUnderColorOfStateLaw (r : Right) (c : ComplaintText) : Prop






axiom IsEEOCOrAttorneyGeneral (p : Person) (c : ComplaintText) : Prop




axiom IsTitleVIIEligibleClaimant (p : Person) (c : ComplaintText) : Prop




axiom IsDisabilityStatuteEligibleClaimant (p : Person) (c : ComplaintText) : Prop



axiom IsRespondent (e : Entity) (c : ComplaintText) : Prop




axiom IsGovernmentalRespondent (e : Entity) (c : ComplaintText) : Prop




axiom IsUnlawfulIntentionalDiscrimination (pr : Practice) (c : ComplaintText) : Prop




axiom IsDisparateImpactPractice (pr : Practice) (c : ComplaintText) : Prop




axiom IsDisabilityStatuteViolation (pr : Practice) (c : ComplaintText) : Prop




axiom IsReasonableAccommodationPractice (pr : Practice) (c : ComplaintText) : Prop




axiom IsAggrievedIndividual (p : Person) (c : ComplaintText) : Prop





axiom IsCompensatoryDamages (d : Damages) (c : ComplaintText) : Prop



axiom IsPunitiveDamages (d : Damages) (c : ComplaintText) : Prop




axiom IsBackpayOrSection706gRelief (d : Damages) (c : ComplaintText) : Prop




axiom HasEmployeesInTwentyOrMoreWeeks (e : Entity) (n : Nat) (c : ComplaintText) : Prop





axiom IsCitizenOfUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom IsRealOrPersonalProperty (pi : PropertyInterest) (c : ComplaintText) : Prop



axiom IsInheritDealing (d : PropertyDealing) (c : ComplaintText) : Prop



axiom IsPurchaseDealing (d : PropertyDealing) (c : ComplaintText) : Prop



axiom IsLeaseDealing (d : PropertyDealing) (c : ComplaintText) : Prop



axiom IsSellDealing (d : PropertyDealing) (c : ComplaintText) : Prop



axiom IsHoldDealing (d : PropertyDealing) (c : ComplaintText) : Prop



axiom IsConveyDealing (d : PropertyDealing) (c : ComplaintText) : Prop





axiom IsStatuteSource (l : LawSource) (c : ComplaintText) : Prop



axiom IsOrdinanceSource (l : LawSource) (c : ComplaintText) : Prop



axiom IsRegulationSource (l : LawSource) (c : ComplaintText) : Prop



axiom IsCustomSource (l : LawSource) (c : ComplaintText) : Prop



axiom IsUsageSource (l : LawSource) (c : ComplaintText) : Prop



axiom IsStateTerritoryOrDistrictOfColumbia (s : StateOrTerritory) (c : ComplaintText) : Prop




axiom IsRightSecuredByConstitutionAndLaws (r : Right) (c : ComplaintText) : Prop



axiom IsJudicialOfficer (p : Person) (c : ComplaintText) : Prop




axiom IsActOrOmissionInJudicialCapacity (a : Conduct) (c : ComplaintText) : Prop





axiom IsActOfCongressExclusiveToDistrictOfColumbia (l : LawSource) (c : ComplaintText) : Prop



axiom IsPartyInjured (p : Person) (c : ComplaintText) : Prop





axiom IsConspiracyOfTwoOrMorePersons (k : Conspiracy) (c : ComplaintText) : Prop




axiom IsOfficeTrustOrPlaceOfConfidenceUnderUnitedStates (o : Office) (c : ComplaintText) : Prop



axiom IsForceIntimidationOrThreat (a : Conduct) (c : ComplaintText) : Prop




axiom IsPartyOrWitnessInUnitedStatesCourt (p : Person) (c : ComplaintText) : Prop



axiom IsGrandOrPetitJuror (p : Person) (c : ComplaintText) : Prop




axiom IsEqualProtectionOfTheLaws (r : Right) (c : ComplaintText) : Prop




axiom IsGoingInDisguiseOnHighwayOrPremises (k : Conspiracy) (c : ComplaintText) : Prop



axiom IsCitizenLawfullyEntitledToVote (p : Person) (c : ComplaintText) : Prop




axiom IsActInFurtheranceOfConspiracy (a : Conduct) (k : Conspiracy) (c : ComplaintText) : Prop




axiom IsInjuryToPersonOrProperty (inj : Injury) (c : ComplaintText) : Prop







axiom HasKnowledgeOfImpendingSection1985Wrong
    (p : Person) (k : Conspiracy) (c : ComplaintText) : Prop




axiom HasPowerToPreventOrAidInPreventing
    (p : Person) (k : Conspiracy) (c : ComplaintText) : Prop




axiom IsNeglectOrRefusalToPrevent (a : Conduct) (c : ComplaintText) : Prop




axiom IsLegalRepresentativeOfDeceased
    (p : Person) (dec : Person) (c : ComplaintText) : Prop




axiom IsWidowOrNextOfKinOfDeceased
    (p : Person) (dec : Person) (c : ComplaintText) : Prop





axiom IsPrevailingPartyOtherThanUnitedStates
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop



axiom IsReasonableAttorneysFee (f : Fee) (c : ComplaintText) : Prop



axiom IsExpertFee (f : Fee) (c : ComplaintText) : Prop





axiom IsCivilRightsEnforcementProceeding (pr : Proceeding) (c : ComplaintText) : Prop




axiom IsFederalLawSuitableToCarryIntoEffect (l : LawSource) (c : ComplaintText) : Prop





axiom IsStateModifiedCommonLawGapFiller (l : LawSource) (c : ComplaintText) : Prop






axiom HasStateOwnershipOperationOrServiceNexus (f : Facility) (c : ComplaintText) : Prop




axiom IsFacilityForMentallyIllDisabledOrChronicallyIll
    (f : Facility) (c : ComplaintText) : Prop




axiom IsJailPrisonOrOtherCorrectionalFacility (f : Facility) (c : ComplaintText) : Prop



axiom IsPretrialDetentionFacility (f : Facility) (c : ComplaintText) : Prop



axiom IsJuvenileFacilityAwaitingTrial (f : Facility) (c : ComplaintText) : Prop




axiom IsJuvenileFacilityForCareOrTreatment (f : Facility) (c : ComplaintText) : Prop




axiom IsJuvenileFacilityForStatePurpose (f : Facility) (c : ComplaintText) : Prop







axiom IsEducationOnlyResidentialFacilityException
    (f : Facility) (c : ComplaintText) : Prop




axiom IsSkilledNursingIntermediateOrResidentialCareFacility
    (f : Facility) (c : ComplaintText) : Prop



axiom IsPrivatelyOwnedAndOperatedFacility (f : Facility) (c : ComplaintText) : Prop




axiom HasSoleStateNexusByLicensing (f : Facility) (c : ComplaintText) : Prop




axiom HasSoleStateNexusBySocialSecurityPayments (f : Facility) (c : ComplaintText) : Prop



axiom IsIndividual (p : Person) (c : ComplaintText) : Prop



axiom IsTrustOrEstate (p : Person) (c : ComplaintText) : Prop



axiom IsPartnership (p : Person) (c : ComplaintText) : Prop



axiom IsAssociation (p : Person) (c : ComplaintText) : Prop



axiom IsCorporation (p : Person) (c : ComplaintText) : Prop



axiom IsOneOfSeveralStates (s : StateOrTerritory) (c : ComplaintText) : Prop



axiom IsDistrictOfColumbiaJurisdiction (s : StateOrTerritory) (c : ComplaintText) : Prop



axiom IsCommonwealthOfPuertoRico (s : StateOrTerritory) (c : ComplaintText) : Prop




axiom IsTerritoryOrPossessionOfUnitedStates (s : StateOrTerritory) (c : ComplaintText) : Prop




axiom IsDayEitherHouseOfCongressInSession (d : CalendarDay) (c : ComplaintText) : Prop






axiom IsEgregiousOrFlagrantCondition (cond : Condition) (c : ComplaintText) : Prop



axiom CausesGrievousHarm (cond : Condition) (c : ComplaintText) : Prop




axiom IsPatternOrPracticeOfResistance (pp : PatternOrPractice) (c : ComplaintText) : Prop





axiom IsPersonActingOnBehalfOfState (p : Person) (c : ComplaintText) : Prop



axiom IsPersonResidingInOrConfinedToInstitution
    (p : Person) (f : Facility) (c : ComplaintText) : Prop




axiom IsMinimumCorrectiveEquitableRelief (rel : Relief) (c : ComplaintText) : Prop







axiom IsSubpoenableInstitutionalRecord (rec : InstitutionalRecord) (c : ComplaintText) : Prop




axiom IsInstitutionUnderInvestigation (f : Facility) (c : ComplaintText) : Prop



axiom IsPersonallyIdentifiableInformation
    (rec : InstitutionalRecord) (c : ComplaintText) : Prop





axiom IsCertificationToCourt (cert : Certification) (c : ComplaintText) : Prop



axiom IsWrittenNoticeToResponsibleOfficials (n : Notice) (c : ComplaintText) : Prop





axiom IsResponsibleStateOrInstitutionOfficial (p : Person) (c : ComplaintText) : Prop





axiom IsMotionToIntervene (pr : Proceeding) (c : ComplaintText) : Prop




axiom IsPendingInstitutionalConditionsAction (pr : Proceeding) (c : ComplaintText) : Prop





axiom IsPersonIncarceratedOrDetained (p : Person) (c : ComplaintText) : Prop





axiom IsAccusedConvictedSentencedOrAdjudicated (p : Person) (c : ComplaintText) : Prop




axiom IsPrisonConditionsAction (pr : Proceeding) (c : ComplaintText) : Prop



axiom IsAvailableAdministrativeRemedy (rem : AdministrativeRemedy) (c : ComplaintText) : Prop



axiom IsExhaustedAdministrativeRemedy (rem : AdministrativeRemedy) (c : ComplaintText) : Prop





axiom IsFrivolousMaliciousOrImmuneClaim (pr : Proceeding) (c : ComplaintText) : Prop



axiom IsPriorShowingOfPhysicalInjury (inj : Injury) (c : ComplaintText) : Prop




axiom IsSexualActUnderSection2246OfTitle18 (a : Conduct) (c : ComplaintText) : Prop






axiom IsAnnualReportToCongress (rep : Report) (c : ComplaintText) : Prop






axiom ReceivesFederalFinancialAssistance (f : Facility) (c : ComplaintText) : Prop




axiom IsAppropriateFederalSecretary (p : Person) (c : ComplaintText) : Prop






axiom IsRegulationDefiningStandardsOfCare (l : LawSource) (c : ComplaintText) : Prop






axiom IsPartyOtherThanUnitedStates (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21Core.Ontology
