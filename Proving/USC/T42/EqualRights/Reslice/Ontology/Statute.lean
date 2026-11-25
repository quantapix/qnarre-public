











import Proving.USC.T42.EqualRights.Reslice.Ontology.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Ontology





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  deriving Repr



structure DanglingTerm where
  term      : String
  usedAt    : String


  definedAt : String
  deriving Repr


def edge_makeAndEnforceContracts_dependsOn_contractualRelationship : DefEdge :=
  { defined := "make and enforce contracts", dependsOn := "contractual relationship",
    citeDefine := "42 USC § 1981(b)" }
def edge_section1981Right_dependsOn_makeAndEnforceContracts : DefEdge :=
  { defined := "the same right (§ 1981(a))", dependsOn := "make and enforce contracts",
    citeDefine := "42 USC § 1981(a)" }
def edge_section1981Right_dependsOn_whiteCitizens : DefEdge :=
  { defined := "the same right (§ 1981(a))", dependsOn := "white citizens",
    citeDefine := "42 USC § 1981(a)" }
def edge_section1981Right_dependsOn_personWithinJurisdiction : DefEdge :=
  { defined := "the same right (§ 1981(a))",
    dependsOn := "all persons within the jurisdiction of the United States",
    citeDefine := "42 USC § 1981(a)" }
def edge_protectedRights_dependsOn_impairment : DefEdge :=
  { defined := "the rights protected by this section (§ 1981(c))",
    dependsOn := "impairment (nongovernmental / under color of State law)",
    citeDefine := "42 USC § 1981(c)" }


def edge_complainingParty_dependsOn_titleVIIClaimant : DefEdge :=
  { defined := "complaining party", dependsOn := "person who may bring an action under title VII",
    citeDefine := "42 USC § 1981a(d)(1)(A)" }
def edge_complainingParty_dependsOn_rehabClaimant : DefEdge :=
  { defined := "complaining party", dependsOn := "person who may sue under 29 USC § 794a(a)(1)",
    citeDefine := "42 USC § 1981a(d)(1)(B)" }
def edge_complainingParty_dependsOn_adaClaimant : DefEdge :=
  { defined := "complaining party", dependsOn := "person who may sue under ADA title I",
    citeDefine := "42 USC § 1981a(d)(1)(B)" }
def edge_discriminatoryPractice_dependsOn_intentionalDiscrimination : DefEdge :=
  { defined := "discriminatory practice", dependsOn := "unlawful intentional discrimination",
    citeDefine := "42 USC § 1981a(d)(2)" }
def edge_discriminatoryPractice_dependsOn_accommodationViolation : DefEdge :=
  { defined := "discriminatory practice",
    dependsOn := "violation of the reasonable-accommodation requirements",
    citeDefine := "42 USC § 1981a(d)(2)" }
def edge_intentionalDiscrimination_excludes_disparateImpact : DefEdge :=
  { defined := "unlawful intentional discrimination",
    dependsOn := "employment practice unlawful because of its disparate impact (EXCLUDED)",
    citeDefine := "42 USC § 1981a(a)(1)" }
def edge_compensatoryDamages_excludes_section706gRelief : DefEdge :=
  { defined := "compensatory damages awarded under this section",
    dependsOn := "backpay / interest on backpay / other § 706(g) relief (EXCLUDED)",
    citeDefine := "42 USC § 1981a(b)(2)" }
def edge_punitiveDamages_dependsOn_maliceOrRecklessIndifference : DefEdge :=
  { defined := "punitive damages under this section",
    dependsOn := "malice or reckless indifference to federally protected rights",
    citeDefine := "42 USC § 1981a(b)(1)" }
def edge_punitiveDamages_excludes_governmentRespondent : DefEdge :=
  { defined := "punitive damages under this section",
    dependsOn := "government, government agency or political subdivision (EXCLUDED)",
    citeDefine := "42 USC § 1981a(b)(1)" }
def edge_damagesCap_dependsOn_employeeCount : DefEdge :=
  { defined := "the cap on the sum of damages",
    dependsOn := "employees in each of 20 or more calendar weeks",
    citeDefine := "42 USC § 1981a(b)(3)" }
def edge_goodFaithDefense_dependsOn_reasonableAccommodation : DefEdge :=
  { defined := "good faith efforts (§ 1981a(a)(3))", dependsOn := "reasonable accommodation",
    citeDefine := "42 USC § 1981a(a)(3)" }
def edge_goodFaithDefense_dependsOn_undueHardship : DefEdge :=
  { defined := "good faith efforts (§ 1981a(a)(3))", dependsOn := "undue hardship",
    citeDefine := "42 USC § 1981a(a)(3)" }


def edge_section1982Right_dependsOn_propertyDealing : DefEdge :=
  { defined := "the same right (§ 1982)", dependsOn := "inherit / purchase / lease / sell / hold / convey",
    citeDefine := "42 USC § 1982" }
def edge_section1982Right_dependsOn_property : DefEdge :=
  { defined := "the same right (§ 1982)", dependsOn := "real and personal property",
    citeDefine := "42 USC § 1982" }
def edge_section1982Right_dependsOn_citizen : DefEdge :=
  { defined := "the same right (§ 1982)", dependsOn := "citizens of the United States",
    citeDefine := "42 USC § 1982" }


def edge_underColorOf_dependsOn_lawSource : DefEdge :=
  { defined := "under color of (§ 1983)",
    dependsOn := "statute / ordinance / regulation / custom / usage",
    citeDefine := "42 USC § 1983" }
def edge_underColorOf_dependsOn_jurisdiction : DefEdge :=
  { defined := "under color of (§ 1983)",
    dependsOn := "State / Territory / District of Columbia",
    citeDefine := "42 USC § 1983" }
def edge_deprivation_dependsOn_securedRight : DefEdge :=
  { defined := "deprivation (§ 1983)",
    dependsOn := "rights, privileges, or immunities secured by the Constitution and laws",
    citeDefine := "42 USC § 1983" }
def edge_statuteOfDC_dependsOn_actOfCongressDCOnly : DefEdge :=
  { defined := "statute of the District of Columbia",
    dependsOn := "Act of Congress applicable exclusively to the District of Columbia",
    citeDefine := "42 USC § 1983 (2d sentence)" }
def edge_judicialException_dependsOn_judicialCapacity : DefEdge :=
  { defined := "the judicial-officer injunctive-relief exception (§ 1983)",
    dependsOn := "act or omission taken in such officer's judicial capacity",
    citeDefine := "42 USC § 1983" }


def edge_actionableConspiracy_dependsOn_conspiracyClass : DefEdge :=
  { defined := "conspiracy set forth in this section (§ 1985)",
    dependsOn := "the eight enumerated conspiracy objects",
    citeDefine := "42 USC § 1985" }
def edge_conspiracyClass_dependsOn_coerciveMeans : DefEdge :=
  { defined := "the eight enumerated conspiracy objects",
    dependsOn := "force, intimidation, or threat",
    citeDefine := "42 USC § 1985(1)–(3)" }
def edge_actionableConspiracy_dependsOn_overtAct : DefEdge :=
  { defined := "conspiracy set forth in this section (§ 1985)",
    dependsOn := "act in furtherance of the object of such conspiracy",
    citeDefine := "42 USC § 1985 (flush clause)" }
def edge_actionableConspiracy_dependsOn_injury : DefEdge :=
  { defined := "conspiracy set forth in this section (§ 1985)",
    dependsOn := "injury in person or property / deprivation of a citizen's right",
    citeDefine := "42 USC § 1985 (flush clause)" }


def edge_neglectToPrevent_dependsOn_section1985Wrong : DefEdge :=
  { defined := "wrongful neglect or refusal (§ 1986)",
    dependsOn := "the wrongs conspired to be done, and mentioned in section 1985",
    citeDefine := "42 USC § 1986" }
def edge_neglectToPrevent_dependsOn_knowledge : DefEdge :=
  { defined := "wrongful neglect or refusal (§ 1986)",
    dependsOn := "knowledge that the wrongs are about to be committed",
    citeDefine := "42 USC § 1986" }
def edge_neglectToPrevent_dependsOn_power : DefEdge :=
  { defined := "wrongful neglect or refusal (§ 1986)",
    dependsOn := "power to prevent or aid in preventing",
    citeDefine := "42 USC § 1986" }
def edge_recoverableDamages_dependsOn_reasonableDiligence : DefEdge :=
  { defined := "all damages caused by such wrongful act (§ 1986)",
    dependsOn := "which such person by reasonable diligence could have prevented",
    citeDefine := "42 USC § 1986" }
def edge_deathBeneficiary_dependsOn_widowThenNextOfKin : DefEdge :=
  { defined := "the beneficiary of the § 1986 wrongful-death recovery",
    dependsOn := "widow, else next of kin, of the deceased",
    citeDefine := "42 USC § 1986" }


def edge_feeAward_dependsOn_feeEligibleStatute : DefEdge :=
  { defined := "action or proceeding to enforce a provision (§ 1988(b))",
    dependsOn := "§§ 1981, 1981a, 1982, 1983, 1985, 1986, title IX, RFRA, RLUIPA, title VI, 34 USC § 12361",
    citeDefine := "42 USC § 1988(b)" }
def edge_feeAward_dependsOn_prevailingParty : DefEdge :=
  { defined := "reasonable attorney's fee (§ 1988(b))", dependsOn := "the prevailing party",
    citeDefine := "42 USC § 1988(b)" }
def edge_attorneysFee_includes_expertFees : DefEdge :=
  { defined := "attorney's fee (in a § 1981 / § 1981a action)", dependsOn := "expert fees",
    citeDefine := "42 USC § 1988(c)" }
def edge_ruleOfDecision_dependsOn_stateCommonLaw : DefEdge :=
  { defined := "the rule of decision (§ 1988(a))",
    dependsOn := "the common law, as modified and changed by the constitution and statutes of the State",
    citeDefine := "42 USC § 1988(a)" }
def edge_ruleOfDecision_dependsOn_revisedStatutesJurisdiction : DefEdge :=
  { defined := "the rule of decision (§ 1988(a))",
    dependsOn := "jurisdiction conferred by titles 13, 24, and 70 of the Revised Statutes",
    citeDefine := "42 USC § 1988(a)" }


def definitionalEdges : List DefEdge :=
  [ edge_makeAndEnforceContracts_dependsOn_contractualRelationship
  , edge_section1981Right_dependsOn_makeAndEnforceContracts
  , edge_section1981Right_dependsOn_whiteCitizens
  , edge_section1981Right_dependsOn_personWithinJurisdiction
  , edge_protectedRights_dependsOn_impairment
  , edge_complainingParty_dependsOn_titleVIIClaimant
  , edge_complainingParty_dependsOn_rehabClaimant
  , edge_complainingParty_dependsOn_adaClaimant
  , edge_discriminatoryPractice_dependsOn_intentionalDiscrimination
  , edge_discriminatoryPractice_dependsOn_accommodationViolation
  , edge_intentionalDiscrimination_excludes_disparateImpact
  , edge_compensatoryDamages_excludes_section706gRelief
  , edge_punitiveDamages_dependsOn_maliceOrRecklessIndifference
  , edge_punitiveDamages_excludes_governmentRespondent
  , edge_damagesCap_dependsOn_employeeCount
  , edge_goodFaithDefense_dependsOn_reasonableAccommodation
  , edge_goodFaithDefense_dependsOn_undueHardship
  , edge_section1982Right_dependsOn_propertyDealing
  , edge_section1982Right_dependsOn_property
  , edge_section1982Right_dependsOn_citizen
  , edge_underColorOf_dependsOn_lawSource
  , edge_underColorOf_dependsOn_jurisdiction
  , edge_deprivation_dependsOn_securedRight
  , edge_statuteOfDC_dependsOn_actOfCongressDCOnly
  , edge_judicialException_dependsOn_judicialCapacity
  , edge_actionableConspiracy_dependsOn_conspiracyClass
  , edge_conspiracyClass_dependsOn_coerciveMeans
  , edge_actionableConspiracy_dependsOn_overtAct
  , edge_actionableConspiracy_dependsOn_injury
  , edge_neglectToPrevent_dependsOn_section1985Wrong
  , edge_neglectToPrevent_dependsOn_knowledge
  , edge_neglectToPrevent_dependsOn_power
  , edge_recoverableDamages_dependsOn_reasonableDiligence
  , edge_deathBeneficiary_dependsOn_widowThenNextOfKin
  , edge_feeAward_dependsOn_feeEligibleStatute
  , edge_feeAward_dependsOn_prevailingParty
  , edge_attorneysFee_includes_expertFees
  , edge_ruleOfDecision_dependsOn_stateCommonLaw
  , edge_ruleOfDecision_dependsOn_revisedStatutesJurisdiction ]



def danglingTerms : List DanglingTerm :=
  [ { term := "person", usedAt := "42 USC § 1983, § 1985, § 1986", definedAt := "" }
  , { term := "citizen of the United States", usedAt := "42 USC § 1982, § 1983, § 1985", definedAt := "" }
  , { term := "white citizens", usedAt := "42 USC § 1981(a), § 1982", definedAt := "" }
  , { term := "State / Territory", usedAt := "42 USC § 1981(a), § 1982, § 1983, § 1985", definedAt := "" }
  , { term := "contract", usedAt := "42 USC § 1981(b)", definedAt := "" }
  , { term := "employee", usedAt := "42 USC § 1981a(b)(3)", definedAt := "42 USC § 2000e(f)" }
  , { term := "covered entity", usedAt := "42 USC § 1981a(a)(3)", definedAt := "42 USC § 12111(2)" }
  , { term := "reasonable accommodation", usedAt := "42 USC § 1981a(a)(3)", definedAt := "42 USC § 12111(9)" }
  , { term := "undue hardship", usedAt := "42 USC § 1981a(a)(3)", definedAt := "42 USC § 12111(10)" }
  , { term := "aggrieved individual", usedAt := "42 USC § 1981a(b)(1)", definedAt := "" }
  , { term := "backpay", usedAt := "42 USC § 1981a(b)(2)", definedAt := "42 USC § 2000e-5(g)" }
  , { term := "malice", usedAt := "42 USC § 1981a(b)(1)", definedAt := "" }
  , { term := "reckless indifference", usedAt := "42 USC § 1981a(b)(1)", definedAt := "" }
  , { term := "unlawful intentional discrimination",
      usedAt := "42 USC § 1981a(a)(1)–(2)",
      definedAt := "42 USC § 2000e-2, 2000e-3, 2000e-16 (partially, by exclusion of disparate impact)" }
  , { term := "judicial officer", usedAt := "42 USC § 1983, § 1988(b)", definedAt := "" }
  , { term := "judicial capacity", usedAt := "42 USC § 1983, § 1988(b)", definedAt := "" }
  , { term := "declaratory decree / declaratory relief", usedAt := "42 USC § 1983", definedAt := "" }
  , { term := "conspire", usedAt := "42 USC § 1985", definedAt := "" }
  , { term := "equal protection of the laws", usedAt := "42 USC § 1985(2)–(3)", definedAt := "" }
  , { term := "rights, privileges, or immunities secured by the Constitution and laws",
      usedAt := "42 USC § 1983", definedAt := "" }
  , { term := "elector for President or Vice President / Member of Congress",
      usedAt := "42 USC § 1985(3)", definedAt := "" }
  , { term := "legal representatives", usedAt := "42 USC § 1986", definedAt := "" }
  , { term := "widow / next of kin", usedAt := "42 USC § 1986", definedAt := "" }
  , { term := "cause of action has accrued", usedAt := "42 USC § 1986", definedAt := "" }
  , { term := "prevailing party", usedAt := "42 USC § 1988(b)", definedAt := "" }
  , { term := "reasonable attorney's fee / costs", usedAt := "42 USC § 1988(b)", definedAt := "" }
  , { term := "expert fees", usedAt := "42 USC § 1988(c)", definedAt := "" }
  , { term := "common law", usedAt := "42 USC § 1988(a)", definedAt := "" }
  , { term := "titles 13, 24, and 70 of the Revised Statutes",
      usedAt := "42 USC § 1988(a)",
      definedAt := "Revised Statutes of 1874 (superseded; no current USC counterpart term)" } ]






structure MakeAndEnforceContractsMembership
    (x : ContractualActivity) (k : Contract) (asp : ContractsAspect)
    (c : ComplaintText) : Prop where
  aspect       : IsMakeAndEnforceContractsAspect x asp c
  relationship : IsContractualRelationship k c
  umbrella     : IsMakeAndEnforceContracts x c





structure Section1981EqualRight
    (p : Person) (bench : Person) (j : Jurisdiction) (a : ProtectedActivity)
    (k : Section1981Right) (c : ComplaintText) : Prop where
  holder    : IsPersonWithinJurisdictionOfUS p c
  locus     : IsStateOrTerritory j c
  activity  : IsSection1981ProtectedActivity a k c
  benchmark : IsWhiteCitizenBenchmark bench c



inductive Section1981ProtectedImpairment
    (r : SecuredRight) (i : Impairment) (c : ComplaintText) : Prop where

  | nongovernmental
      (protected_ : IsRightProtectedBySection1981 r c)
      (impair : IsImpairmentByNongovernmentalDiscrimination i c)

  | underColorOfStateLaw
      (protected_ : IsRightProtectedBySection1981 r c)
      (impair : IsImpairmentUnderColorOfStateLaw i c)




structure ComplainingPartyMembership
    (q : ComplainingParty) (k : ComplainingPartyCase) (c : ComplaintText) : Prop where
  case     : IsComplainingPartyOfCase q k c
  umbrella : IsComplainingParty q c





inductive DiscriminatoryPracticeMembership
    (d : DiscriminatoryPractice) (e : EmploymentPractice) (c : ComplaintText) : Prop where

  | titleVIIIntentional
      (intentional : IsUnlawfulIntentionalDiscrimination e c)
      (notDisparateImpact : ¬ IsDisparateImpactPractice e c)
      (umbrella : IsDiscriminatoryPractice d c)

  | disabilityIntentional
      (intentional : IsUnlawfulIntentionalDiscrimination e c)
      (notDisparateImpact : ¬ IsDisparateImpactPractice e c)
      (umbrella : IsDiscriminatoryPractice d c)

  | accommodationViolation
      (violation : IsReasonableAccommodationViolation e c)
      (umbrella : IsDiscriminatoryPractice d c)



inductive MaliceOrRecklessIndifference
    (d : DiscriminatoryPractice) (c : ComplaintText) : Prop where
  | malice (h : IsMalice d c)
  | recklessIndifference (h : IsRecklessIndifferenceToFederallyProtectedRights d c)



structure PunitiveDamagesQualification
    (r : Respondent) (d : DiscriminatoryPractice) (a : DamagesAward) (agg : Person)
    (c : ComplaintText) : Prop where
  respondent    : IsRespondent r c
  notGovernment : ¬ IsGovernmentRespondent r c
  mentalState   : MaliceOrRecklessIndifference d c
  aggrieved     : IsAggrievedIndividual agg c
  punitive      : IsPunitiveDamages a c



structure CompensatoryDamagesScope
    (a : DamagesAward) (c : ComplaintText) : Prop where
  compensatory  : IsCompensatoryDamages a c
  notSection706g : ¬ IsSection706gRelief a c


def damagesCapDollars : RespondentSizeBand → Nat
  | .moreThan14FewerThan101  =>  50000
  | .moreThan100FewerThan201 => 100000
  | .moreThan200FewerThan501 => 200000
  | .moreThan500             => 300000





def bandOfEmployeeCount (n : Nat) : Option RespondentSizeBand :=
  if n > 14 && n < 101 then some .moreThan14FewerThan101
  else if n > 100 && n < 201 then some .moreThan100FewerThan201
  else if n > 200 && n < 501 then some .moreThan200FewerThan501
  else if n > 500 then some .moreThan500
  else none




structure DamagesCapDetermination
    (r : Respondent) (b : RespondentSizeBand) (a : DamagesAward)
    (c : ComplaintText) : Prop where
  respondent : IsRespondent r c
  band       : bandOfEmployeeCount (employeesInTwentyOrMoreCalendarWeeks r c) = some b
  component  : IsCappedDamagesComponent a c





structure GoodFaithAccommodationBar
    (t : Entity) (m : Accommodation) (p : Person) (c : ComplaintText) : Prop where
  coveredEntity  : IsCoveredEntity t c
  informed       : IsPersonWithDisabilityWhoRequestedAccommodation p c
  goodFaith      : IsGoodFaithEffortToAccommodate m c
  accommodation  : IsReasonableAccommodation m c
  noUndueHardship : ¬ IsUndueHardshipOnBusinessOperation m c






structure Section1982PropertyRight
    (p : Person) (bench : Person) (t : PropertyTransaction) (i : PropertyInterest)
    (k : PropertyDealing) (pk : PropertyKind) (c : ComplaintText) : Prop where
  holder    : IsCitizenOfTheUnitedStates p c
  benchmark : IsWhiteCitizenBenchmark bench c
  dealing   : IsProtectedPropertyDealing t k c
  property  : IsPropertyOfKind i pk c





structure ColorOfLawMembership
    (s : LawSource) (j : Jurisdiction) (k : ColorOfLawSourceKind)
    (jk : JurisdictionKind) (c : ComplaintText) : Prop where
  source : IsColorOfLawSourceOfKind s k c
  locus  : IsJurisdictionOfKind j jk c







structure DistrictOfColumbiaStatuteDeeming
    (s : LawSource) (c : ComplaintText) : Prop where
  actOfCongressDCOnly : IsActOfCongressApplicableExclusivelyToDC s c
  deemedStatuteOfDC   : IsStatuteOfTheDistrictOfColumbia s c



structure SecuredRightMembership
    (r : SecuredRight) (k : SecuredInterestKind) (c : ComplaintText) : Prop where
  kind    : IsSecuredInterestOfKind r k c
  secured : IsSecuredByConstitutionAndLaws r c





structure JudicialOfficerInjunctionBar
    (o : JudicialOfficer) (g : Proceeding) (c : ComplaintText) : Prop where
  officer          : IsJudicialOfficer o c
  judicialCapacity : IsActOrOmissionInJudicialCapacity o c
  noDeclaratoryEscape : ¬ IsDeclaratoryDecreeViolatedOrReliefUnavailable g c



structure RedressProceedingMembership
    (g : Proceeding) (k : RedressProceedingKind) (c : ComplaintText) : Prop where
  kind : IsRedressProceedingOfKind g k c





structure Section1985ConspiracyMembership
    (k : Conspiracy) (cl : Section1985ConspiracyClass) (c : ComplaintText) : Prop where
  twoOrMore : IsConspiracyOfTwoOrMorePersons k c
  objectOf  : IsSection1985ConspiracyOfClass k cl c



inductive Section1985Consequence (n : Injury) (c : ComplaintText) : Prop where
  | injuredInPersonOrProperty (h : IsInjuryToPersonOrProperty n c)
  | deprivedOfCitizenRight (h : IsDeprivationOfRightOrPrivilegeOfCitizen n c)



structure Section1985ActionableConspiracy
    (k : Conspiracy) (cl : Section1985ConspiracyClass) (o : OvertAct) (n : Injury)
    (c : ComplaintText) : Prop where
  conspiracy  : Section1985ConspiracyMembership k cl c
  overtAct    : IsActInFurtheranceOfConspiracy o c
  consequence : Section1985Consequence n c



structure CoerciveMeansMembership (m : CoerciveMeans) (c : ComplaintText) : Prop where
  means : IsForceIntimidationOrThreat m c






structure Section1986NeglectToPrevent
    (p : Person) (w : Wrong1985) (c : ComplaintText) : Prop where
  wrong      : IsWrongMentionedInSection1985 w c
  knowledge  : HasKnowledgeThatWrongIsAboutToBeCommitted p c
  power      : HasPowerToPreventOrAidInPreventing p c
  neglect    : NeglectsOrRefusesToPrevent p c
  preventable : IsPreventableByReasonableDiligence w c


def section1986DeathDamagesCapDollars : Nat := 5000



inductive Section1986DeathBeneficiary (p : Person) (c : ComplaintText) : Prop where
  | widow (h : IsWidowOfDeceased p c)
  | nextOfKin (h : IsNextOfKinOfDeceased p c) (noWidow : ∀ q : Person, ¬ IsWidowOfDeceased q c)



structure Section1986LegalRepresentative
    (l : LegalRepresentative) (c : ComplaintText) : Prop where
  representative : IsLegalRepresentativeOfInjuredParty l c






structure FeeAwardEligibility
    (a : Action) (s : FeeEligibleStatute) (p : Person) (f : FeeAward)
    (c : ComplaintText) : Prop where
  action       : IsActionToEnforceFeeEligibleStatute a s c
  prevailing   : IsPrevailingParty p c
  notUnitedStates : ¬ IsTheUnitedStatesAsParty p c
  reasonableFee : IsReasonableAttorneysFee f c
  partOfCosts  : IsPartOfTheCosts f c




structure JudicialOfficerFeeImmunity
    (o : JudicialOfficer) (c : ComplaintText) : Prop where
  officer          : IsJudicialOfficer o c
  judicialCapacity : IsActOrOmissionInJudicialCapacity o c
  notInExcess      : ¬ IsClearlyInExcessOfJudicialJurisdiction o c



def expertFeesIncludable : FeeEligibleStatute → Bool
  | .section1981  => true
  | .section1981a => true
  | _             => false



structure ExpertFeeInclusion
    (a : Action) (s : FeeEligibleStatute) (f : FeeAward) (c : ComplaintText) : Prop where
  action     : IsActionToEnforceFeeEligibleStatute a s c
  includable : expertFeesIncludable s = true
  expertFee  : IsExpertFee f c




inductive Section1988RuleOfDecision
    (d : RuleOfDecision) (t : Court) (c : ComplaintText) : Prop where


  | federalLaw
      (jurisdiction : IsRevisedStatutesCivilRightsJurisdiction t c)
      (kind : IsRuleOfDecisionOfKind d .lawsOfTheUnitedStates c)
      (suitable : IsSuitableToCarryIntoEffect d c)



  | stateCommonLaw
      (jurisdiction : IsRevisedStatutesCivilRightsJurisdiction t c)
      (kind : IsRuleOfDecisionOfKind d .stateCommonLawAsModified c)
      (notInconsistent : ¬ IsInconsistentWithConstitutionAndLawsOfUS d c)

end Proving.USC.T42.EqualRights.Reslice.Ontology
