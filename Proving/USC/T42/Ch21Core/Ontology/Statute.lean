import Proving.USC.T42.Ch21Core.Ontology.Predicates

set_option autoImplicit false














namespace Proving.USC.T42.Ch21Core.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  deriving Repr


def defEdges : List DefEdge :=
  [ { defined := "make and enforce contracts", dependsOn := "contract",
      citeDefine := "42 USC § 1981(b)" },
    { defined := "make and enforce contracts", dependsOn := "contractual relationship",
      citeDefine := "42 USC § 1981(b)" },
    { defined := "§ 1981 protected right", dependsOn := "make and enforce contracts",
      citeDefine := "42 USC § 1981(a)" },
    { defined := "§ 1981 protected right", dependsOn := "person within the jurisdiction of the United States",
      citeDefine := "42 USC § 1981(a)" },
    { defined := "§ 1981 protected right", dependsOn := "white citizens",
      citeDefine := "42 USC § 1981(a)" },
    { defined := "impairment", dependsOn := "under color of State law",
      citeDefine := "42 USC § 1981(c)" },
    { defined := "complaining party", dependsOn := "title VII of the Civil Rights Act of 1964",
      citeDefine := "42 USC § 1981a(d)(1)(A)" },
    { defined := "complaining party", dependsOn := "section 794a(a)(1) of title 29",
      citeDefine := "42 USC § 1981a(d)(1)(B)" },
    { defined := "complaining party", dependsOn := "title I of the Americans with Disabilities Act of 1990",
      citeDefine := "42 USC § 1981a(d)(1)(B)" },
    { defined := "discriminatory practice", dependsOn := "unlawful intentional discrimination",
      citeDefine := "42 USC § 1981a(d)(2)" },
    { defined := "discriminatory practice", dependsOn := "violation described in subsection (a)(2)",
      citeDefine := "42 USC § 1981a(d)(2)" },
    { defined := "compensatory damages", dependsOn := "relief authorized under section 706(g)",
      citeDefine := "42 USC § 1981a(b)(2)" },
    { defined := "damages cap", dependsOn := "respondent employee count",
      citeDefine := "42 USC § 1981a(b)(3)" },
    { defined := "§ 1982 property right", dependsOn := "citizens of the United States",
      citeDefine := "42 USC § 1982" },
    { defined := "§ 1982 property right", dependsOn := "real and personal property",
      citeDefine := "42 USC § 1982" },
    { defined := "§ 1982 property right", dependsOn := "white citizens",
      citeDefine := "42 USC § 1982" },
    { defined := "under color of any statute, ordinance, regulation, custom, or usage",
      dependsOn := "State or Territory or the District of Columbia",
      citeDefine := "42 USC § 1983" },
    { defined := "statute of the District of Columbia",
      dependsOn := "Act of Congress applicable exclusively to the District of Columbia",
      citeDefine := "42 USC § 1983 (final sentence)" },
    { defined := "§ 1983 deprivation", dependsOn := "rights, privileges, or immunities secured by the Constitution and laws",
      citeDefine := "42 USC § 1983" },
    { defined := "§ 1985 conspiracy", dependsOn := "two or more persons",
      citeDefine := "42 USC § 1985" },
    { defined := "§ 1985(1) conspiracy", dependsOn := "office, trust, or place of confidence under the United States",
      citeDefine := "42 USC § 1985(1)" },
    { defined := "§ 1985(2) conspiracy", dependsOn := "party or witness in any court of the United States",
      citeDefine := "42 USC § 1985(2)" },
    { defined := "§ 1985(2) conspiracy", dependsOn := "grand or petit juror",
      citeDefine := "42 USC § 1985(2)" },
    { defined := "§ 1985(3) conspiracy", dependsOn := "equal protection of the laws",
      citeDefine := "42 USC § 1985(3)" },
    { defined := "§ 1985 damages action", dependsOn := "act in furtherance of the object of such conspiracy",
      citeDefine := "42 USC § 1985 (final clause)" },
    { defined := "§ 1986 neglect", dependsOn := "wrongs conspired to be done, and mentioned in section 1985",
      citeDefine := "42 USC § 1986" },
    { defined := "§ 1986 claimant", dependsOn := "legal representatives",
      citeDefine := "42 USC § 1986" },
    { defined := "§ 1986 beneficiary", dependsOn := "widow / next of kin",
      citeDefine := "42 USC § 1986" },
    { defined := "§ 1988 fee award", dependsOn := "prevailing party, other than the United States",
      citeDefine := "42 USC § 1988(b)" },
    { defined := "§ 1988 fee award", dependsOn := "sections 1981, 1981a, 1982, 1983, 1985, 1986",
      citeDefine := "42 USC § 1988(b)" },
    { defined := "attorney's fee", dependsOn := "expert fees",
      citeDefine := "42 USC § 1988(c)" },
    { defined := "§ 1988(a) governing law", dependsOn := "common law as modified by State constitution and statutes",
      citeDefine := "42 USC § 1988(a)" },
    { defined := "institution", dependsOn := "State",
      citeDefine := "42 USC § 1997(1)(A)" },
    { defined := "institution", dependsOn := "jail, prison, or other correctional facility",
      citeDefine := "42 USC § 1997(1)(B)(ii)" },
    { defined := "institution", dependsOn := "pretrial detention facility",
      citeDefine := "42 USC § 1997(1)(B)(iii)" },
    { defined := "institution", dependsOn := "juvenile facility",
      citeDefine := "42 USC § 1997(1)(B)(iv)" },
    { defined := "institution", dependsOn := "skilled nursing / long-term / custodial or residential care facility",
      citeDefine := "42 USC § 1997(1)(B)(v)" },
    { defined := "institution (exclusion)", dependsOn := "sole nexus",
      citeDefine := "42 USC § 1997(2)" },
    { defined := "person", dependsOn := "individual / trust or estate / partnership / association / corporation",
      citeDefine := "42 USC § 1997(3)" },
    { defined := "State", dependsOn := "several States / District of Columbia / Commonwealth of Puerto Rico / territories and possessions",
      citeDefine := "42 USC § 1997(4)" },
    { defined := "legislative days", dependsOn := "calendar day on which either House of Congress is in session",
      citeDefine := "42 USC § 1997(5)" },
    { defined := "§ 1997a action", dependsOn := "institution",
      citeDefine := "42 USC § 1997a(a) (expressly: \"as defined in section 1997 of this title\")" },
    { defined := "§ 1997a action", dependsOn := "pattern or practice of resistance",
      citeDefine := "42 USC § 1997a(a)" },
    { defined := "§ 1997a(a) correctional-facility carve-back", dependsOn := "section 1997(1)(B)(ii)",
      citeDefine := "42 USC § 1997a(a)" },
    { defined := "subpoena", dependsOn := "institution that is the subject of an investigation",
      citeDefine := "42 USC § 1997a-1(a)" },
    { defined := "certification", dependsOn := "notice to responsible officials",
      citeDefine := "42 USC § 1997b(a)(1)" },
    { defined := "motion to intervene", dependsOn := "certification",
      citeDefine := "42 USC § 1997c(b)(1)" },
    { defined := "prisoner", dependsOn := "jail, prison, or other correctional facility",
      citeDefine := "42 USC § 1997e(h)" },
    { defined := "prison-conditions action", dependsOn := "section 1983 of this title",
      citeDefine := "42 USC § 1997e(a)" },
    { defined := "§ 1997e(d) fee limit", dependsOn := "section 1988 of this title",
      citeDefine := "42 USC § 1997e(d)(1)" },
    { defined := "sexual act", dependsOn := "section 2246 of title 18",
      citeDefine := "42 USC § 1997e(e)" },
    { defined := "§ 1997h consultation", dependsOn := "Federal financial assistance",
      citeDefine := "42 USC § 1997h" } ]






inductive MakeAndEnforceContracts (a : ContractActivity) (c : ComplaintText) : Prop where
  | making        (h : IsContractMaking a c)
  | performance   (h : IsContractPerformance a c)
  | modification  (h : IsContractModification a c)
  | termination   (h : IsContractTermination a c)
  | benefits      (h : IsContractualBenefitEnjoyment a c)




structure Section1981ContractRight
    (p : Person) (a : ContractActivity) (r : Right) (c : ComplaintText) : Prop where
  personCovered : IsPersonWithinJurisdictionOfUS p c
  activity      : MakeAndEnforceContracts a c
  comparator    : IsWhiteCitizenComparatorRight r c



inductive Section1981Impairment (r : Right) (c : ComplaintText) : Prop where
  | nongovernmental (h : IsNongovernmentalDiscriminationImpairment r c)
  | underColorOfStateLaw (h : IsImpairmentUnderColorOfStateLaw r c)





inductive ComplainingPartyUnderSubsectionA1 (p : Person) (c : ComplaintText) : Prop where
  | agency    (h : IsEEOCOrAttorneyGeneral p c)
  | claimant  (h : IsTitleVIIEligibleClaimant p c)



inductive ComplainingPartyUnderSubsectionA2 (p : Person) (c : ComplaintText) : Prop where
  | agency    (h : IsEEOCOrAttorneyGeneral p c)
  | claimant  (h : IsDisabilityStatuteEligibleClaimant p c)




inductive DiscriminatoryPractice (pr : Practice) (c : ComplaintText) : Prop where
  | intentional (h : IsUnlawfulIntentionalDiscrimination pr c)
                (hNotImpact : ¬ IsDisparateImpactPractice pr c)
  | disability  (h : IsDisabilityStatuteViolation pr c)



inductive RespondentSizeTier (e : Entity) (c : ComplaintText) : Prop where
  | cap50000  (n : Nat) (h : HasEmployeesInTwentyOrMoreWeeks e n c)
              (hlo : 14 < n) (hhi : n < 101)
  | cap100000 (n : Nat) (h : HasEmployeesInTwentyOrMoreWeeks e n c)
              (hlo : 100 < n) (hhi : n < 201)
  | cap200000 (n : Nat) (h : HasEmployeesInTwentyOrMoreWeeks e n c)
              (hlo : 200 < n) (hhi : n < 501)
  | cap300000 (n : Nat) (h : HasEmployeesInTwentyOrMoreWeeks e n c)
              (hlo : 500 < n)




structure PunitiveDamagesEligibility
    (e : Entity) (pr : Practice) (p : Person) (d : Damages) (c : ComplaintText) : Prop where
  respondent      : IsRespondent e c
  notGovernmental : ¬ IsGovernmentalRespondent e c
  practice        : DiscriminatoryPractice pr c
  aggrieved       : IsAggrievedIndividual p c
  punitive        : IsPunitiveDamages d c



structure CompensatoryDamagesScope (d : Damages) (c : ComplaintText) : Prop where
  compensatory : IsCompensatoryDamages d c
  notBackpay   : ¬ IsBackpayOrSection706gRelief d c





inductive ProtectedPropertyDealing (d : PropertyDealing) (c : ComplaintText) : Prop where
  | inherit  (h : IsInheritDealing d c)
  | purchase (h : IsPurchaseDealing d c)
  | lease    (h : IsLeaseDealing d c)
  | sell     (h : IsSellDealing d c)
  | hold     (h : IsHoldDealing d c)
  | convey   (h : IsConveyDealing d c)



structure Section1982PropertyRight
    (p : Person) (pi : PropertyInterest) (d : PropertyDealing) (c : ComplaintText) : Prop where
  citizen  : IsCitizenOfUnitedStates p c
  property : IsRealOrPersonalProperty pi c
  dealing  : ProtectedPropertyDealing d c






inductive ColorOfLawSource (l : LawSource) (c : ComplaintText) : Prop where
  | statute    (h : IsStatuteSource l c)
  | ordinance  (h : IsOrdinanceSource l c)
  | regulation (h : IsRegulationSource l c)
  | custom     (h : IsCustomSource l c)
  | usage      (h : IsUsageSource l c)
  | deemedDistrictOfColumbiaStatute (h : IsActOfCongressExclusiveToDistrictOfColumbia l c)




structure Section1983Deprivation
    (l : LawSource) (s : StateOrTerritory) (r : Right) (victim : Person)
    (c : ComplaintText) : Prop where
  source       : ColorOfLawSource l c
  jurisdiction : IsStateTerritoryOrDistrictOfColumbia s c
  securedRight : IsRightSecuredByConstitutionAndLaws r c
  injuredParty : IsPartyInjured victim c



structure JudicialOfficerAct (p : Person) (a : Conduct) (c : ComplaintText) : Prop where
  officer  : IsJudicialOfficer p c
  capacity : IsActOrOmissionInJudicialCapacity a c




inductive Section1985Conspiracy (k : Conspiracy) (c : ComplaintText) : Prop where


  | preventingOfficeholding (o : Office) (a : Conduct)
      (hConsp : IsConspiracyOfTwoOrMorePersons k c)
      (hOffice : IsOfficeTrustOrPlaceOfConfidenceUnderUnitedStates o c)
      (hMeans : IsForceIntimidationOrThreat a c)


  | obstructingJustice (victim : Person) (r : Right)
      (hConsp : IsConspiracyOfTwoOrMorePersons k c)
      (hVictim : IsPartyOrWitnessInUnitedStatesCourt victim c ∨ IsGrandOrPetitJuror victim c)
      (hEqualProtection : IsEqualProtectionOfTheLaws r c)


  | deprivingEqualProtection (victim : Person) (r : Right)
      (hConsp : IsConspiracyOfTwoOrMorePersons k c
                ∨ IsGoingInDisguiseOnHighwayOrPremises k c)
      (hRight : IsEqualProtectionOfTheLaws r c
                ∨ IsCitizenLawfullyEntitledToVote victim c)



structure Section1985DamagesAction
    (k : Conspiracy) (a : Conduct) (inj : Injury) (p : Person) (c : ComplaintText) : Prop where
  conspiracy    : Section1985Conspiracy k c
  overtAct      : IsActInFurtheranceOfConspiracy a k c
  injury        : IsInjuryToPersonOrProperty inj c
  injuredParty  : IsPartyInjured p c





structure Section1986Neglect
    (p : Person) (k : Conspiracy) (a : Conduct) (c : ComplaintText) : Prop where
  knowledge  : HasKnowledgeOfImpendingSection1985Wrong p k c
  power      : HasPowerToPreventOrAidInPreventing p k c
  neglect    : IsNeglectOrRefusalToPrevent a c
  conspiracy : Section1985Conspiracy k c




inductive Section1986Claimant (p : Person) (dec : Person) (c : ComplaintText) : Prop where
  | injuredParty (h : IsPartyInjured p c)
  | legalRepresentative (h : IsLegalRepresentativeOfDeceased p dec c)
  | widowOrNextOfKin (h : IsWidowOrNextOfKinOfDeceased p dec c)





inductive Section1988GoverningLaw (l : LawSource) (c : ComplaintText) : Prop where
  | federalSuitable (h : IsFederalLawSuitableToCarryIntoEffect l c)
  | stateCommonLawGapFiller (h : IsStateModifiedCommonLawGapFiller l c)





structure Section1988FeeAward
    (p : Person) (pr : Proceeding) (f : Fee) (c : ComplaintText) : Prop where
  enforcement : IsCivilRightsEnforcementProceeding pr c
  prevailing  : IsPrevailingPartyOtherThanUnitedStates p pr c
  fee         : IsReasonableAttorneysFee f c



structure Section1988ExpertFeeInclusion (f : Fee) (g : Fee) (c : ComplaintText) : Prop where
  attorneysFee : IsReasonableAttorneysFee f c
  expertFee    : IsExpertFee g c






inductive InstitutionCategory (f : Facility) (c : ComplaintText) : Prop where
  | mentallyIllOrDisabled (h : IsFacilityForMentallyIllDisabledOrChronicallyIll f c)
  | correctional (h : IsJailPrisonOrOtherCorrectionalFacility f c)
  | pretrialDetention (h : IsPretrialDetentionFacility f c)
  | juvenileAwaitingTrial (h : IsJuvenileFacilityAwaitingTrial f c)
  | juvenileCareOrTreatment (h : IsJuvenileFacilityForCareOrTreatment f c)
  | juvenileStatePurpose (h : IsJuvenileFacilityForStatePurpose f c)
      (hExcept : ¬ IsEducationOnlyResidentialFacilityException f c)
  | nursingOrResidentialCare (h : IsSkilledNursingIntermediateOrResidentialCareFacility f c)



structure Institution (f : Facility) (c : ComplaintText) : Prop where
  stateNexus : HasStateOwnershipOperationOrServiceNexus f c
  category   : InstitutionCategory f c



inductive SoleNexusPattern (f : Facility) (c : ComplaintText) : Prop where
  | licensingOnly (h : HasSoleStateNexusByLicensing f c)
  | paymentsOnly  (h : HasSoleStateNexusBySocialSecurityPayments f c)
  | licensingAndPayments (h₁ : HasSoleStateNexusByLicensing f c)
                         (h₂ : HasSoleStateNexusBySocialSecurityPayments f c)



structure PrivateFacilityExclusion (f : Facility) (c : ComplaintText) : Prop where
  private_ : IsPrivatelyOwnedAndOperatedFacility f c
  soleNexus : SoleNexusPattern f c



structure InstitutionUnderSubchapter (f : Facility) (c : ComplaintText) : Prop where
  institution : Institution f c
  notExcluded : ¬ PrivateFacilityExclusion f c



inductive StatutoryPerson (p : Person) (c : ComplaintText) : Prop where
  | individual   (h : IsIndividual p c)
  | trustOrEstate (h : IsTrustOrEstate p c)
  | partnership  (h : IsPartnership p c)
  | association  (h : IsAssociation p c)
  | corporation  (h : IsCorporation p c)




inductive StatutoryState (s : StateOrTerritory) (c : ComplaintText) : Prop where
  | severalStates (h : IsOneOfSeveralStates s c)
  | districtOfColumbia (h : IsDistrictOfColumbiaJurisdiction s c)
  | puertoRico (h : IsCommonwealthOfPuertoRico s c)
  | territoryOrPossession (h : IsTerritoryOrPossessionOfUnitedStates s c)


structure LegislativeDay (d : CalendarDay) (c : ComplaintText) : Prop where
  inSession : IsDayEitherHouseOfCongressInSession d c





structure Section1997aPredicateConditions
    (actor : Person) (f : Facility) (resident : Person)
    (cond : Condition) (pp : PatternOrPractice) (c : ComplaintText) : Prop where
  stateActor   : IsPersonActingOnBehalfOfState actor c
  institution  : InstitutionUnderSubchapter f c
  resident_    : IsPersonResidingInOrConfinedToInstitution resident f c
  egregious    : IsEgregiousOrFlagrantCondition cond c
  grievousHarm : CausesGrievousHarm cond c
  pattern      : IsPatternOrPracticeOfResistance pp c




structure CorrectionalFacilityReliefCarveBack
    (f : Facility) (r : Right) (rel : Relief) (c : ComplaintText) : Prop where
  correctional  : IsJailPrisonOrOtherCorrectionalFacility f c
  securedRight  : IsRightSecuredByConstitutionAndLaws r c
  minimumRelief : IsMinimumCorrectiveEquitableRelief rel c





structure SubpoenaTarget
    (f : Facility) (rec : InstitutionalRecord) (c : ComplaintText) : Prop where
  underInvestigation : IsInstitutionUnderInvestigation f c
  record_            : IsSubpoenableInstitutionalRecord rec c




structure PublicUseRedactionScope
    (rec : InstitutionalRecord) (c : ComplaintText) : Prop where
  subpoenaed : IsSubpoenableInstitutionalRecord rec c
  pii        : IsPersonallyIdentifiableInformation rec c





structure Section1997bCertification
    (cert : Certification) (n : Notice) (official : Person) (c : ComplaintText) : Prop where
  certification : IsCertificationToCourt cert c
  notice        : IsWrittenNoticeToResponsibleOfficials n c
  recipient     : IsResponsibleStateOrInstitutionOfficial official c



structure Section1997cIntervention
    (pending : Proceeding) (motion : Proceeding) (cert : Certification)
    (pp : PatternOrPractice) (c : ComplaintText) : Prop where
  pendingAction : IsPendingInstitutionalConditionsAction pending c
  motion_       : IsMotionToIntervene motion c
  certification : IsCertificationToCourt cert c
  pattern       : IsPatternOrPracticeOfResistance pp c





structure Prisoner (p : Person) (c : ComplaintText) : Prop where
  inCustody : IsPersonIncarceratedOrDetained p c
  status    : IsAccusedConvictedSentencedOrAdjudicated p c



structure Section1997eExhaustion
    (p : Person) (pr : Proceeding) (rem : AdministrativeRemedy) (c : ComplaintText) : Prop where
  prisoner  : Prisoner p c
  action    : IsPrisonConditionsAction pr c
  available : IsAvailableAdministrativeRemedy rem c
  exhausted : IsExhaustedAdministrativeRemedy rem c



inductive MentalOrEmotionalInjuryThreshold
    (inj : Injury) (a : Conduct) (c : ComplaintText) : Prop where
  | physicalInjury (h : IsPriorShowingOfPhysicalInjury inj c)
  | sexualAct (h : IsSexualActUnderSection2246OfTitle18 a c)


structure Section1997eDismissal (pr : Proceeding) (c : ComplaintText) : Prop where
  action    : IsPrisonConditionsAction pr c
  defective : IsFrivolousMaliciousOrImmuneClaim pr c




structure Section1997fReport (rep : Report) (c : ComplaintText) : Prop where
  annualReport : IsAnnualReportToCongress rep c



structure Section1997hConsultation
    (f : Facility) (secretary : Person) (n : Notice) (c : ComplaintText) : Prop where
  federalAssistance : ReceivesFederalFinancialAssistance f c
  secretary_        : IsAppropriateFederalSecretary secretary c
  notice            : IsWrittenNoticeToResponsibleOfficials n c




structure StandardsOfCareDisclaimer (l : LawSource) (c : ComplaintText) : Prop where
  standardsOfCare : IsRegulationDefiningStandardsOfCare l c



structure PrivateLitigationDisclaimer (p : Person) (c : ComplaintText) : Prop where
  nonFederalParty : IsPartyOtherThanUnitedStates p c

end Proving.USC.T42.Ch21Core.Ontology
