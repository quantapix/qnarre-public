






import Proving.USC.T42.EqualRights.Reslice.Ontology.Statute

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Ontology




theorem makeAndEnforceContractsMembership_intro
    {x : ContractualActivity} {k : Contract} {asp : ContractsAspect} {c : ComplaintText}
    (hAspect : IsMakeAndEnforceContractsAspect x asp c)
    (hRel : IsContractualRelationship k c)
    (hUmbrella : IsMakeAndEnforceContracts x c)
    : MakeAndEnforceContractsMembership x k asp c :=
  ⟨hAspect, hRel, hUmbrella⟩


theorem section1981EqualRight_intro
    {p bench : Person} {j : Jurisdiction} {a : ProtectedActivity}
    {k : Section1981Right} {c : ComplaintText}
    (hHolder : IsPersonWithinJurisdictionOfUS p c)
    (hLocus : IsStateOrTerritory j c)
    (hActivity : IsSection1981ProtectedActivity a k c)
    (hBench : IsWhiteCitizenBenchmark bench c)
    : Section1981EqualRight p bench j a k c :=
  ⟨hHolder, hLocus, hActivity, hBench⟩


theorem section1981ProtectedImpairment_intro_nongovernmental
    {r : SecuredRight} {i : Impairment} {c : ComplaintText}
    (hProtected : IsRightProtectedBySection1981 r c)
    (hImpair : IsImpairmentByNongovernmentalDiscrimination i c)
    : Section1981ProtectedImpairment r i c :=
  .nongovernmental hProtected hImpair


theorem section1981ProtectedImpairment_intro_underColorOfStateLaw
    {r : SecuredRight} {i : Impairment} {c : ComplaintText}
    (hProtected : IsRightProtectedBySection1981 r c)
    (hImpair : IsImpairmentUnderColorOfStateLaw i c)
    : Section1981ProtectedImpairment r i c :=
  .underColorOfStateLaw hProtected hImpair




theorem complainingPartyMembership_intro
    {q : ComplainingParty} {k : ComplainingPartyCase} {c : ComplaintText}
    (hCase : IsComplainingPartyOfCase q k c)
    (hUmbrella : IsComplainingParty q c)
    : ComplainingPartyMembership q k c :=
  ⟨hCase, hUmbrella⟩


theorem discriminatoryPracticeMembership_intro_titleVIIIntentional
    {d : DiscriminatoryPractice} {e : EmploymentPractice} {c : ComplaintText}
    (hIntentional : IsUnlawfulIntentionalDiscrimination e c)
    (hNotImpact : ¬ IsDisparateImpactPractice e c)
    (hUmbrella : IsDiscriminatoryPractice d c)
    : DiscriminatoryPracticeMembership d e c :=
  .titleVIIIntentional hIntentional hNotImpact hUmbrella


theorem discriminatoryPracticeMembership_intro_disabilityIntentional
    {d : DiscriminatoryPractice} {e : EmploymentPractice} {c : ComplaintText}
    (hIntentional : IsUnlawfulIntentionalDiscrimination e c)
    (hNotImpact : ¬ IsDisparateImpactPractice e c)
    (hUmbrella : IsDiscriminatoryPractice d c)
    : DiscriminatoryPracticeMembership d e c :=
  .disabilityIntentional hIntentional hNotImpact hUmbrella


theorem discriminatoryPracticeMembership_intro_accommodationViolation
    {d : DiscriminatoryPractice} {e : EmploymentPractice} {c : ComplaintText}
    (hViolation : IsReasonableAccommodationViolation e c)
    (hUmbrella : IsDiscriminatoryPractice d c)
    : DiscriminatoryPracticeMembership d e c :=
  .accommodationViolation hViolation hUmbrella


theorem maliceOrRecklessIndifference_intro_malice
    {d : DiscriminatoryPractice} {c : ComplaintText}
    (h : IsMalice d c) : MaliceOrRecklessIndifference d c :=
  .malice h


theorem maliceOrRecklessIndifference_intro_recklessIndifference
    {d : DiscriminatoryPractice} {c : ComplaintText}
    (h : IsRecklessIndifferenceToFederallyProtectedRights d c)
    : MaliceOrRecklessIndifference d c :=
  .recklessIndifference h


theorem punitiveDamagesQualification_intro
    {r : Respondent} {d : DiscriminatoryPractice} {a : DamagesAward} {agg : Person}
    {c : ComplaintText}
    (hRespondent : IsRespondent r c)
    (hNotGovernment : ¬ IsGovernmentRespondent r c)
    (hMentalState : MaliceOrRecklessIndifference d c)
    (hAggrieved : IsAggrievedIndividual agg c)
    (hPunitive : IsPunitiveDamages a c)
    : PunitiveDamagesQualification r d a agg c :=
  ⟨hRespondent, hNotGovernment, hMentalState, hAggrieved, hPunitive⟩


theorem compensatoryDamagesScope_intro
    {a : DamagesAward} {c : ComplaintText}
    (hCompensatory : IsCompensatoryDamages a c)
    (hNot706g : ¬ IsSection706gRelief a c)
    : CompensatoryDamagesScope a c :=
  ⟨hCompensatory, hNot706g⟩


theorem damagesCapDetermination_intro
    {r : Respondent} {b : RespondentSizeBand} {a : DamagesAward} {c : ComplaintText}
    (hRespondent : IsRespondent r c)
    (hBand : bandOfEmployeeCount (employeesInTwentyOrMoreCalendarWeeks r c) = some b)
    (hComponent : IsCappedDamagesComponent a c)
    : DamagesCapDetermination r b a c :=
  ⟨hRespondent, hBand, hComponent⟩


theorem goodFaithAccommodationBar_intro
    {t : Entity} {m : Accommodation} {p : Person} {c : ComplaintText}
    (hEntity : IsCoveredEntity t c)
    (hInformed : IsPersonWithDisabilityWhoRequestedAccommodation p c)
    (hGoodFaith : IsGoodFaithEffortToAccommodate m c)
    (hAccommodation : IsReasonableAccommodation m c)
    (hNoHardship : ¬ IsUndueHardshipOnBusinessOperation m c)
    : GoodFaithAccommodationBar t m p c :=
  ⟨hEntity, hInformed, hGoodFaith, hAccommodation, hNoHardship⟩




theorem section1982PropertyRight_intro
    {p bench : Person} {t : PropertyTransaction} {i : PropertyInterest}
    {k : PropertyDealing} {pk : PropertyKind} {c : ComplaintText}
    (hHolder : IsCitizenOfTheUnitedStates p c)
    (hBench : IsWhiteCitizenBenchmark bench c)
    (hDealing : IsProtectedPropertyDealing t k c)
    (hProperty : IsPropertyOfKind i pk c)
    : Section1982PropertyRight p bench t i k pk c :=
  ⟨hHolder, hBench, hDealing, hProperty⟩




theorem colorOfLawMembership_intro
    {s : LawSource} {j : Jurisdiction} {k : ColorOfLawSourceKind}
    {jk : JurisdictionKind} {c : ComplaintText}
    (hSource : IsColorOfLawSourceOfKind s k c)
    (hLocus : IsJurisdictionOfKind j jk c)
    : ColorOfLawMembership s j k jk c :=
  ⟨hSource, hLocus⟩


theorem districtOfColumbiaStatuteDeeming_intro
    {s : LawSource} {c : ComplaintText}
    (hDCOnly : IsActOfCongressApplicableExclusivelyToDC s c)
    (hDeemed : IsStatuteOfTheDistrictOfColumbia s c)
    : DistrictOfColumbiaStatuteDeeming s c :=
  ⟨hDCOnly, hDeemed⟩


theorem securedRightMembership_intro
    {r : SecuredRight} {k : SecuredInterestKind} {c : ComplaintText}
    (hKind : IsSecuredInterestOfKind r k c)
    (hSecured : IsSecuredByConstitutionAndLaws r c)
    : SecuredRightMembership r k c :=
  ⟨hKind, hSecured⟩


theorem judicialOfficerInjunctionBar_intro
    {o : JudicialOfficer} {g : Proceeding} {c : ComplaintText}
    (hOfficer : IsJudicialOfficer o c)
    (hCapacity : IsActOrOmissionInJudicialCapacity o c)
    (hNoEscape : ¬ IsDeclaratoryDecreeViolatedOrReliefUnavailable g c)
    : JudicialOfficerInjunctionBar o g c :=
  ⟨hOfficer, hCapacity, hNoEscape⟩


theorem redressProceedingMembership_intro
    {g : Proceeding} {k : RedressProceedingKind} {c : ComplaintText}
    (hKind : IsRedressProceedingOfKind g k c)
    : RedressProceedingMembership g k c :=
  ⟨hKind⟩




theorem section1985ConspiracyMembership_intro
    {k : Conspiracy} {cl : Section1985ConspiracyClass} {c : ComplaintText}
    (hTwoOrMore : IsConspiracyOfTwoOrMorePersons k c)
    (hObject : IsSection1985ConspiracyOfClass k cl c)
    : Section1985ConspiracyMembership k cl c :=
  ⟨hTwoOrMore, hObject⟩


theorem section1985Consequence_intro_injuredInPersonOrProperty
    {n : Injury} {c : ComplaintText}
    (h : IsInjuryToPersonOrProperty n c) : Section1985Consequence n c :=
  .injuredInPersonOrProperty h


theorem section1985Consequence_intro_deprivedOfCitizenRight
    {n : Injury} {c : ComplaintText}
    (h : IsDeprivationOfRightOrPrivilegeOfCitizen n c) : Section1985Consequence n c :=
  .deprivedOfCitizenRight h


theorem section1985ActionableConspiracy_intro
    {k : Conspiracy} {cl : Section1985ConspiracyClass} {o : OvertAct} {n : Injury}
    {c : ComplaintText}
    (hConspiracy : Section1985ConspiracyMembership k cl c)
    (hOvertAct : IsActInFurtheranceOfConspiracy o c)
    (hConsequence : Section1985Consequence n c)
    : Section1985ActionableConspiracy k cl o n c :=
  ⟨hConspiracy, hOvertAct, hConsequence⟩


theorem coerciveMeansMembership_intro
    {m : CoerciveMeans} {c : ComplaintText}
    (h : IsForceIntimidationOrThreat m c) : CoerciveMeansMembership m c :=
  ⟨h⟩




theorem section1986NeglectToPrevent_intro
    {p : Person} {w : Wrong1985} {c : ComplaintText}
    (hWrong : IsWrongMentionedInSection1985 w c)
    (hKnowledge : HasKnowledgeThatWrongIsAboutToBeCommitted p c)
    (hPower : HasPowerToPreventOrAidInPreventing p c)
    (hNeglect : NeglectsOrRefusesToPrevent p c)
    (hPreventable : IsPreventableByReasonableDiligence w c)
    : Section1986NeglectToPrevent p w c :=
  ⟨hWrong, hKnowledge, hPower, hNeglect, hPreventable⟩


theorem section1986DeathBeneficiary_intro_widow
    {p : Person} {c : ComplaintText}
    (h : IsWidowOfDeceased p c) : Section1986DeathBeneficiary p c :=
  .widow h


theorem section1986DeathBeneficiary_intro_nextOfKin
    {p : Person} {c : ComplaintText}
    (h : IsNextOfKinOfDeceased p c)
    (hNoWidow : ∀ q : Person, ¬ IsWidowOfDeceased q c)
    : Section1986DeathBeneficiary p c :=
  .nextOfKin h hNoWidow


theorem section1986LegalRepresentative_intro
    {l : LegalRepresentative} {c : ComplaintText}
    (h : IsLegalRepresentativeOfInjuredParty l c)
    : Section1986LegalRepresentative l c :=
  ⟨h⟩




theorem feeAwardEligibility_intro
    {a : Action} {s : FeeEligibleStatute} {p : Person} {f : FeeAward} {c : ComplaintText}
    (hAction : IsActionToEnforceFeeEligibleStatute a s c)
    (hPrevailing : IsPrevailingParty p c)
    (hNotUS : ¬ IsTheUnitedStatesAsParty p c)
    (hFee : IsReasonableAttorneysFee f c)
    (hCosts : IsPartOfTheCosts f c)
    : FeeAwardEligibility a s p f c :=
  ⟨hAction, hPrevailing, hNotUS, hFee, hCosts⟩


theorem judicialOfficerFeeImmunity_intro
    {o : JudicialOfficer} {c : ComplaintText}
    (hOfficer : IsJudicialOfficer o c)
    (hCapacity : IsActOrOmissionInJudicialCapacity o c)
    (hNotInExcess : ¬ IsClearlyInExcessOfJudicialJurisdiction o c)
    : JudicialOfficerFeeImmunity o c :=
  ⟨hOfficer, hCapacity, hNotInExcess⟩


theorem expertFeeInclusion_intro
    {a : Action} {s : FeeEligibleStatute} {f : FeeAward} {c : ComplaintText}
    (hAction : IsActionToEnforceFeeEligibleStatute a s c)
    (hIncludable : expertFeesIncludable s = true)
    (hExpert : IsExpertFee f c)
    : ExpertFeeInclusion a s f c :=
  ⟨hAction, hIncludable, hExpert⟩


theorem section1988RuleOfDecision_intro_federalLaw
    {d : RuleOfDecision} {t : Court} {c : ComplaintText}
    (hJurisdiction : IsRevisedStatutesCivilRightsJurisdiction t c)
    (hKind : IsRuleOfDecisionOfKind d RuleOfDecisionKind.lawsOfTheUnitedStates c)
    (hSuitable : IsSuitableToCarryIntoEffect d c)
    : Section1988RuleOfDecision d t c :=
  .federalLaw hJurisdiction hKind hSuitable


theorem section1988RuleOfDecision_intro_stateCommonLaw
    {d : RuleOfDecision} {t : Court} {c : ComplaintText}
    (hJurisdiction : IsRevisedStatutesCivilRightsJurisdiction t c)
    (hKind : IsRuleOfDecisionOfKind d RuleOfDecisionKind.stateCommonLawAsModified c)
    (hNotInconsistent : ¬ IsInconsistentWithConstitutionAndLawsOfUS d c)
    : Section1988RuleOfDecision d t c :=
  .stateCommonLaw hJurisdiction hKind hNotInconsistent

end Proving.USC.T42.EqualRights.Reslice.Ontology
