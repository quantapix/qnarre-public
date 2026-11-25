import Proving.USC.T42.Ch21Core.Ontology.Statute

set_option autoImplicit false










namespace Proving.USC.T42.Ch21Core.Ontology

open Proving.USC.Common

variable {p dec victim actor resident secretary official : Person}
variable {e : Entity} {c : ComplaintText}
variable {act : ContractActivity} {r : Right} {prac : Practice} {dmg : Damages}
variable {pint : PropertyInterest} {deal : PropertyDealing}
variable {l : LawSource} {st : StateOrTerritory}
variable {k : Conspiracy} {cdt : Conduct} {inj : Injury} {o : Office}
variable {proc pend mot : Proceeding} {fee fee2 : Fee}
variable {fac : Facility} {rec : InstitutionalRecord} {cert : Certification}
variable {ntc : Notice} {condn : Condition} {pp : PatternOrPractice}
variable {rem : AdministrativeRemedy} {day : CalendarDay} {rel : Relief}
variable {rep : Report} {n : Nat}



theorem makeAndEnforceContracts_intro_making
    (h : IsContractMaking act c) : MakeAndEnforceContracts act c := .making h

theorem makeAndEnforceContracts_intro_performance
    (h : IsContractPerformance act c) : MakeAndEnforceContracts act c := .performance h

theorem makeAndEnforceContracts_intro_modification
    (h : IsContractModification act c) : MakeAndEnforceContracts act c := .modification h

theorem makeAndEnforceContracts_intro_termination
    (h : IsContractTermination act c) : MakeAndEnforceContracts act c := .termination h

theorem makeAndEnforceContracts_intro_benefits
    (h : IsContractualBenefitEnjoyment act c) : MakeAndEnforceContracts act c := .benefits h

theorem section1981ContractRight_intro
    (h₁ : IsPersonWithinJurisdictionOfUS p c) (h₂ : MakeAndEnforceContracts act c)
    (h₃ : IsWhiteCitizenComparatorRight r c) :
    Section1981ContractRight p act r c := ⟨h₁, h₂, h₃⟩

theorem section1981Impairment_intro_nongovernmental
    (h : IsNongovernmentalDiscriminationImpairment r c) :
    Section1981Impairment r c := .nongovernmental h

theorem section1981Impairment_intro_underColorOfStateLaw
    (h : IsImpairmentUnderColorOfStateLaw r c) :
    Section1981Impairment r c := .underColorOfStateLaw h



theorem complainingPartyUnderSubsectionA1_intro_agency
    (h : IsEEOCOrAttorneyGeneral p c) : ComplainingPartyUnderSubsectionA1 p c := .agency h

theorem complainingPartyUnderSubsectionA1_intro_claimant
    (h : IsTitleVIIEligibleClaimant p c) : ComplainingPartyUnderSubsectionA1 p c := .claimant h

theorem complainingPartyUnderSubsectionA2_intro_agency
    (h : IsEEOCOrAttorneyGeneral p c) : ComplainingPartyUnderSubsectionA2 p c := .agency h

theorem complainingPartyUnderSubsectionA2_intro_claimant
    (h : IsDisabilityStatuteEligibleClaimant p c) :
    ComplainingPartyUnderSubsectionA2 p c := .claimant h

theorem discriminatoryPractice_intro_intentional
    (h : IsUnlawfulIntentionalDiscrimination prac c)
    (hNotImpact : ¬ IsDisparateImpactPractice prac c) :
    DiscriminatoryPractice prac c := .intentional h hNotImpact

theorem discriminatoryPractice_intro_disability
    (h : IsDisabilityStatuteViolation prac c) :
    DiscriminatoryPractice prac c := .disability h

theorem respondentSizeTier_intro_cap50000
    (h : HasEmployeesInTwentyOrMoreWeeks e n c) (hlo : 14 < n) (hhi : n < 101) :
    RespondentSizeTier e c := .cap50000 n h hlo hhi

theorem respondentSizeTier_intro_cap100000
    (h : HasEmployeesInTwentyOrMoreWeeks e n c) (hlo : 100 < n) (hhi : n < 201) :
    RespondentSizeTier e c := .cap100000 n h hlo hhi

theorem respondentSizeTier_intro_cap200000
    (h : HasEmployeesInTwentyOrMoreWeeks e n c) (hlo : 200 < n) (hhi : n < 501) :
    RespondentSizeTier e c := .cap200000 n h hlo hhi

theorem respondentSizeTier_intro_cap300000
    (h : HasEmployeesInTwentyOrMoreWeeks e n c) (hlo : 500 < n) :
    RespondentSizeTier e c := .cap300000 n h hlo

theorem punitiveDamagesEligibility_intro
    (h₁ : IsRespondent e c) (h₂ : ¬ IsGovernmentalRespondent e c)
    (h₃ : DiscriminatoryPractice prac c) (h₄ : IsAggrievedIndividual p c)
    (h₅ : IsPunitiveDamages dmg c) :
    PunitiveDamagesEligibility e prac p dmg c := ⟨h₁, h₂, h₃, h₄, h₅⟩

theorem compensatoryDamagesScope_intro
    (h₁ : IsCompensatoryDamages dmg c) (h₂ : ¬ IsBackpayOrSection706gRelief dmg c) :
    CompensatoryDamagesScope dmg c := ⟨h₁, h₂⟩



theorem protectedPropertyDealing_intro_inherit
    (h : IsInheritDealing deal c) : ProtectedPropertyDealing deal c := .inherit h

theorem protectedPropertyDealing_intro_purchase
    (h : IsPurchaseDealing deal c) : ProtectedPropertyDealing deal c := .purchase h

theorem protectedPropertyDealing_intro_lease
    (h : IsLeaseDealing deal c) : ProtectedPropertyDealing deal c := .lease h

theorem protectedPropertyDealing_intro_sell
    (h : IsSellDealing deal c) : ProtectedPropertyDealing deal c := .sell h

theorem protectedPropertyDealing_intro_hold
    (h : IsHoldDealing deal c) : ProtectedPropertyDealing deal c := .hold h

theorem protectedPropertyDealing_intro_convey
    (h : IsConveyDealing deal c) : ProtectedPropertyDealing deal c := .convey h

theorem section1982PropertyRight_intro
    (h₁ : IsCitizenOfUnitedStates p c) (h₂ : IsRealOrPersonalProperty pint c)
    (h₃ : ProtectedPropertyDealing deal c) :
    Section1982PropertyRight p pint deal c := ⟨h₁, h₂, h₃⟩



theorem colorOfLawSource_intro_statute
    (h : IsStatuteSource l c) : ColorOfLawSource l c := .statute h

theorem colorOfLawSource_intro_ordinance
    (h : IsOrdinanceSource l c) : ColorOfLawSource l c := .ordinance h

theorem colorOfLawSource_intro_regulation
    (h : IsRegulationSource l c) : ColorOfLawSource l c := .regulation h

theorem colorOfLawSource_intro_custom
    (h : IsCustomSource l c) : ColorOfLawSource l c := .custom h

theorem colorOfLawSource_intro_usage
    (h : IsUsageSource l c) : ColorOfLawSource l c := .usage h

theorem colorOfLawSource_intro_deemedDistrictOfColumbiaStatute
    (h : IsActOfCongressExclusiveToDistrictOfColumbia l c) :
    ColorOfLawSource l c := .deemedDistrictOfColumbiaStatute h

theorem section1983Deprivation_intro
    (h₁ : ColorOfLawSource l c) (h₂ : IsStateTerritoryOrDistrictOfColumbia st c)
    (h₃ : IsRightSecuredByConstitutionAndLaws r c) (h₄ : IsPartyInjured victim c) :
    Section1983Deprivation l st r victim c := ⟨h₁, h₂, h₃, h₄⟩

theorem judicialOfficerAct_intro
    (h₁ : IsJudicialOfficer p c) (h₂ : IsActOrOmissionInJudicialCapacity cdt c) :
    JudicialOfficerAct p cdt c := ⟨h₁, h₂⟩



theorem section1985Conspiracy_intro_preventingOfficeholding
    (hConsp : IsConspiracyOfTwoOrMorePersons k c)
    (hOffice : IsOfficeTrustOrPlaceOfConfidenceUnderUnitedStates o c)
    (hMeans : IsForceIntimidationOrThreat cdt c) :
    Section1985Conspiracy k c := .preventingOfficeholding o cdt hConsp hOffice hMeans

theorem section1985Conspiracy_intro_obstructingJustice
    (hConsp : IsConspiracyOfTwoOrMorePersons k c)
    (hVictim : IsPartyOrWitnessInUnitedStatesCourt victim c ∨ IsGrandOrPetitJuror victim c)
    (hEqualProtection : IsEqualProtectionOfTheLaws r c) :
    Section1985Conspiracy k c := .obstructingJustice victim r hConsp hVictim hEqualProtection

theorem section1985Conspiracy_intro_deprivingEqualProtection
    (hConsp : IsConspiracyOfTwoOrMorePersons k c ∨ IsGoingInDisguiseOnHighwayOrPremises k c)
    (hRight : IsEqualProtectionOfTheLaws r c ∨ IsCitizenLawfullyEntitledToVote victim c) :
    Section1985Conspiracy k c := .deprivingEqualProtection victim r hConsp hRight

theorem section1985DamagesAction_intro
    (h₁ : Section1985Conspiracy k c) (h₂ : IsActInFurtheranceOfConspiracy cdt k c)
    (h₃ : IsInjuryToPersonOrProperty inj c) (h₄ : IsPartyInjured p c) :
    Section1985DamagesAction k cdt inj p c := ⟨h₁, h₂, h₃, h₄⟩



theorem section1986Neglect_intro
    (h₁ : HasKnowledgeOfImpendingSection1985Wrong p k c)
    (h₂ : HasPowerToPreventOrAidInPreventing p k c)
    (h₃ : IsNeglectOrRefusalToPrevent cdt c)
    (h₄ : Section1985Conspiracy k c) :
    Section1986Neglect p k cdt c := ⟨h₁, h₂, h₃, h₄⟩

theorem section1986Claimant_intro_injuredParty
    (h : IsPartyInjured p c) : Section1986Claimant p dec c := .injuredParty h

theorem section1986Claimant_intro_legalRepresentative
    (h : IsLegalRepresentativeOfDeceased p dec c) :
    Section1986Claimant p dec c := .legalRepresentative h

theorem section1986Claimant_intro_widowOrNextOfKin
    (h : IsWidowOrNextOfKinOfDeceased p dec c) :
    Section1986Claimant p dec c := .widowOrNextOfKin h



theorem section1988GoverningLaw_intro_federalSuitable
    (h : IsFederalLawSuitableToCarryIntoEffect l c) :
    Section1988GoverningLaw l c := .federalSuitable h

theorem section1988GoverningLaw_intro_stateCommonLawGapFiller
    (h : IsStateModifiedCommonLawGapFiller l c) :
    Section1988GoverningLaw l c := .stateCommonLawGapFiller h

theorem section1988FeeAward_intro
    (h₁ : IsCivilRightsEnforcementProceeding proc c)
    (h₂ : IsPrevailingPartyOtherThanUnitedStates p proc c)
    (h₃ : IsReasonableAttorneysFee fee c) :
    Section1988FeeAward p proc fee c := ⟨h₁, h₂, h₃⟩

theorem section1988ExpertFeeInclusion_intro
    (h₁ : IsReasonableAttorneysFee fee c) (h₂ : IsExpertFee fee2 c) :
    Section1988ExpertFeeInclusion fee fee2 c := ⟨h₁, h₂⟩



theorem institutionCategory_intro_mentallyIllOrDisabled
    (h : IsFacilityForMentallyIllDisabledOrChronicallyIll fac c) :
    InstitutionCategory fac c := .mentallyIllOrDisabled h

theorem institutionCategory_intro_correctional
    (h : IsJailPrisonOrOtherCorrectionalFacility fac c) :
    InstitutionCategory fac c := .correctional h

theorem institutionCategory_intro_pretrialDetention
    (h : IsPretrialDetentionFacility fac c) :
    InstitutionCategory fac c := .pretrialDetention h

theorem institutionCategory_intro_juvenileAwaitingTrial
    (h : IsJuvenileFacilityAwaitingTrial fac c) :
    InstitutionCategory fac c := .juvenileAwaitingTrial h

theorem institutionCategory_intro_juvenileCareOrTreatment
    (h : IsJuvenileFacilityForCareOrTreatment fac c) :
    InstitutionCategory fac c := .juvenileCareOrTreatment h

theorem institutionCategory_intro_juvenileStatePurpose
    (h : IsJuvenileFacilityForStatePurpose fac c)
    (hExcept : ¬ IsEducationOnlyResidentialFacilityException fac c) :
    InstitutionCategory fac c := .juvenileStatePurpose h hExcept

theorem institutionCategory_intro_nursingOrResidentialCare
    (h : IsSkilledNursingIntermediateOrResidentialCareFacility fac c) :
    InstitutionCategory fac c := .nursingOrResidentialCare h

theorem institution_intro
    (h₁ : HasStateOwnershipOperationOrServiceNexus fac c) (h₂ : InstitutionCategory fac c) :
    Institution fac c := ⟨h₁, h₂⟩

theorem soleNexusPattern_intro_licensingOnly
    (h : HasSoleStateNexusByLicensing fac c) : SoleNexusPattern fac c := .licensingOnly h

theorem soleNexusPattern_intro_paymentsOnly
    (h : HasSoleStateNexusBySocialSecurityPayments fac c) :
    SoleNexusPattern fac c := .paymentsOnly h

theorem soleNexusPattern_intro_licensingAndPayments
    (h₁ : HasSoleStateNexusByLicensing fac c)
    (h₂ : HasSoleStateNexusBySocialSecurityPayments fac c) :
    SoleNexusPattern fac c := .licensingAndPayments h₁ h₂

theorem privateFacilityExclusion_intro
    (h₁ : IsPrivatelyOwnedAndOperatedFacility fac c) (h₂ : SoleNexusPattern fac c) :
    PrivateFacilityExclusion fac c := ⟨h₁, h₂⟩

theorem institutionUnderSubchapter_intro
    (h₁ : Institution fac c) (h₂ : ¬ PrivateFacilityExclusion fac c) :
    InstitutionUnderSubchapter fac c := ⟨h₁, h₂⟩

theorem statutoryPerson_intro_individual
    (h : IsIndividual p c) : StatutoryPerson p c := .individual h

theorem statutoryPerson_intro_trustOrEstate
    (h : IsTrustOrEstate p c) : StatutoryPerson p c := .trustOrEstate h

theorem statutoryPerson_intro_partnership
    (h : IsPartnership p c) : StatutoryPerson p c := .partnership h

theorem statutoryPerson_intro_association
    (h : IsAssociation p c) : StatutoryPerson p c := .association h

theorem statutoryPerson_intro_corporation
    (h : IsCorporation p c) : StatutoryPerson p c := .corporation h

theorem statutoryState_intro_severalStates
    (h : IsOneOfSeveralStates st c) : StatutoryState st c := .severalStates h

theorem statutoryState_intro_districtOfColumbia
    (h : IsDistrictOfColumbiaJurisdiction st c) : StatutoryState st c := .districtOfColumbia h

theorem statutoryState_intro_puertoRico
    (h : IsCommonwealthOfPuertoRico st c) : StatutoryState st c := .puertoRico h

theorem statutoryState_intro_territoryOrPossession
    (h : IsTerritoryOrPossessionOfUnitedStates st c) :
    StatutoryState st c := .territoryOrPossession h

theorem legislativeDay_intro
    (h : IsDayEitherHouseOfCongressInSession day c) : LegislativeDay day c := ⟨h⟩



theorem section1997aPredicateConditions_intro
    (h₁ : IsPersonActingOnBehalfOfState actor c)
    (h₂ : InstitutionUnderSubchapter fac c)
    (h₃ : IsPersonResidingInOrConfinedToInstitution resident fac c)
    (h₄ : IsEgregiousOrFlagrantCondition condn c)
    (h₅ : CausesGrievousHarm condn c)
    (h₆ : IsPatternOrPracticeOfResistance pp c) :
    Section1997aPredicateConditions actor fac resident condn pp c :=
  ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩

theorem correctionalFacilityReliefCarveBack_intro
    (h₁ : IsJailPrisonOrOtherCorrectionalFacility fac c)
    (h₂ : IsRightSecuredByConstitutionAndLaws r c)
    (h₃ : IsMinimumCorrectiveEquitableRelief rel c) :
    CorrectionalFacilityReliefCarveBack fac r rel c := ⟨h₁, h₂, h₃⟩

theorem subpoenaTarget_intro
    (h₁ : IsInstitutionUnderInvestigation fac c)
    (h₂ : IsSubpoenableInstitutionalRecord rec c) :
    SubpoenaTarget fac rec c := ⟨h₁, h₂⟩

theorem publicUseRedactionScope_intro
    (h₁ : IsSubpoenableInstitutionalRecord rec c)
    (h₂ : IsPersonallyIdentifiableInformation rec c) :
    PublicUseRedactionScope rec c := ⟨h₁, h₂⟩



theorem section1997bCertification_intro
    (h₁ : IsCertificationToCourt cert c)
    (h₂ : IsWrittenNoticeToResponsibleOfficials ntc c)
    (h₃ : IsResponsibleStateOrInstitutionOfficial official c) :
    Section1997bCertification cert ntc official c := ⟨h₁, h₂, h₃⟩

theorem section1997cIntervention_intro
    (h₁ : IsPendingInstitutionalConditionsAction pend c)
    (h₂ : IsMotionToIntervene mot c)
    (h₃ : IsCertificationToCourt cert c)
    (h₄ : IsPatternOrPracticeOfResistance pp c) :
    Section1997cIntervention pend mot cert pp c := ⟨h₁, h₂, h₃, h₄⟩



theorem prisoner_intro
    (h₁ : IsPersonIncarceratedOrDetained p c)
    (h₂ : IsAccusedConvictedSentencedOrAdjudicated p c) :
    Prisoner p c := ⟨h₁, h₂⟩

theorem section1997eExhaustion_intro
    (h₁ : Prisoner p c) (h₂ : IsPrisonConditionsAction proc c)
    (h₃ : IsAvailableAdministrativeRemedy rem c)
    (h₄ : IsExhaustedAdministrativeRemedy rem c) :
    Section1997eExhaustion p proc rem c := ⟨h₁, h₂, h₃, h₄⟩

theorem mentalOrEmotionalInjuryThreshold_intro_physicalInjury
    (h : IsPriorShowingOfPhysicalInjury inj c) :
    MentalOrEmotionalInjuryThreshold inj cdt c := .physicalInjury h

theorem mentalOrEmotionalInjuryThreshold_intro_sexualAct
    (h : IsSexualActUnderSection2246OfTitle18 cdt c) :
    MentalOrEmotionalInjuryThreshold inj cdt c := .sexualAct h

theorem section1997eDismissal_intro
    (h₁ : IsPrisonConditionsAction proc c) (h₂ : IsFrivolousMaliciousOrImmuneClaim proc c) :
    Section1997eDismissal proc c := ⟨h₁, h₂⟩



theorem section1997fReport_intro
    (h : IsAnnualReportToCongress rep c) : Section1997fReport rep c := ⟨h⟩

theorem section1997hConsultation_intro
    (h₁ : ReceivesFederalFinancialAssistance fac c)
    (h₂ : IsAppropriateFederalSecretary secretary c)
    (h₃ : IsWrittenNoticeToResponsibleOfficials ntc c) :
    Section1997hConsultation fac secretary ntc c := ⟨h₁, h₂, h₃⟩

theorem standardsOfCareDisclaimer_intro
    (h : IsRegulationDefiningStandardsOfCare l c) : StandardsOfCareDisclaimer l c := ⟨h⟩

theorem privateLitigationDisclaimer_intro
    (h : IsPartyOtherThanUnitedStates p c) : PrivateLitigationDisclaimer p c := ⟨h⟩

end Proving.USC.T42.Ch21Core.Ontology
