import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113B.MaterialSupport.Elements.Types
import Proving.USC.T18.Ch113B.MaterialSupport.Elements.Predicates

set_option autoImplicit false











namespace Proving.USC.T18.Ch113B.MaterialSupport.Elements

open Proving.USC.Common





inductive Scienter2339 (d : Person) (t : Person) (c : ComplaintText) : Prop where
  | knows (h : KnowsOfOffenseStatus d t c)
  | reasonableGrounds (h : HasReasonableGroundsToBelieveOffenseStatus d t c)


structure Section2339a (d : Person) (t : Person) (o : PredicateOffense)
    (c : ComplaintText) : Prop where
  harbors : HarborsOrConceals d t c
  enumeratedOffense : IsEnumeratedOffenseUnder2339 o c
  offenderStatus : CommittedOrAboutToCommitOffense t o c
  scienter : Scienter2339 d t c





inductive MaterialSupportCategory (s : Support) (c : ComplaintText) : Prop where
  | property (h : IsPropertyTangibleOrIntangible s c)
  | service (h : IsServiceOrListedResource s c)
  | training (h : IsTrainingSpecificSkill s c)
  | expertAdvice (h : IsExpertAdviceOrAssistance s c)
  | personnel (h : IsPersonnelProvided s c)



structure MaterialSupportOrResources (s : Support) (c : ComplaintText) : Prop where
  category : MaterialSupportCategory s c
  notExcepted : ¬ IsMedicineOrReligiousMaterials s c



abbrev IsMaterialSupportOrResources (s : Support) (c : ComplaintText) : Prop :=
  MaterialSupportOrResources s c




inductive Conduct2339A (d : Person) (s : Support) (c : ComplaintText) : Prop where
  | provides (h : ProvidesMaterialSupport d s c)
  | conceals (h : ConcealsOrDisguisesMaterialSupport d s c)



inductive Purpose2339A (d : Person) (s : Support) (o : PredicateOffense)
    (c : ComplaintText) : Prop where
  | forOffense (h : KnowsOrIntendsSupportUsedForOffense d s o c)
  | forEscapeConcealment (h : KnowsOrIntendsSupportUsedToConcealEscape d s o c)


structure Section2339Aa (d : Person) (s : Support) (o : PredicateOffense)
    (c : ComplaintText) : Prop where
  materialSupport : IsMaterialSupportOrResources s c
  conduct : Conduct2339A d s c
  enumeratedOffense : IsEnumeratedPredicateOffenseUnder2339A o c
  purpose : Purpose2339A d s o c


structure Section2339AaAttempt (d : Person) (s : Support) (o : PredicateOffense)
    (c : ComplaintText) : Prop where
  materialSupport : IsMaterialSupportOrResources s c
  attempt : AttemptsToProvideMaterialSupport d s c
  enumeratedOffense : IsEnumeratedPredicateOffenseUnder2339A o c
  purpose : Purpose2339A d s o c



structure Section2339AaConspiracy (d : Person) (ag : Agreement) (s : Support)
    (o : PredicateOffense) (c : ComplaintText) : Prop where
  agreement : AgreementAmongTwoOrMore ag c
  materialSupport : IsMaterialSupportOrResources s c
  enumeratedOffense : IsEnumeratedPredicateOffenseUnder2339A o c
  purpose : Purpose2339A d s o c



structure Section2339AaDeathResults (d : Person) (s : Support) (o : PredicateOffense)
    (c : ComplaintText) : Prop where
  offense : Section2339Aa d s o c
  death : DeathResultedFromOffense d c





inductive KnowledgeOfTerroristOrganization (d : Person) (o : Organization)
    (c : ComplaintText) : Prop where
  | designated (h : KnowsOrganizationIsDesignated d o c)
  | terroristActivity (h : KnowsOrganizationEngagesInTerroristActivity d o c)
  | terrorism (h : KnowsOrganizationEngagesInTerrorism d o c)



inductive JurisdictionOverOffense (d : Person) (c : ComplaintText) : Prop where
  | usNationalOrLPR (h : OffenderIsUSNationalOrLawfulPermanentResident d c)
  | statelessResident (h : OffenderIsStatelessHabitualResidentOfUS d c)
  | broughtOrFoundInUS (h : OffenderBroughtIntoOrFoundInUS d c)
  | occursInUS (h : OffenseOccursInWholeOrPartInUS d c)
  | affectsCommerce (h : OffenseAffectsInterstateOrForeignCommerce d c)
  | aidsAbetsOrConspires (h : AidsAbetsOrConspiresWithPersonSubjectToJurisdiction d c)



structure Section2339Ba1 (d : Person) (s : Support) (o : Organization)
    (c : ComplaintText) : Prop where
  materialSupport : IsMaterialSupportOrResources s c
  provides : ProvidesMaterialSupportToOrganization d s o c
  designated : IsDesignatedForeignTerroristOrganization o c
  knowingly : ActedWithScienter d c
  organizationKnowledge : KnowledgeOfTerroristOrganization d o c
  jurisdiction : JurisdictionOverOffense d c
  notApproved : ¬ SecretaryApprovedProvisionOfSupport d o c
  notProtectedAdvocacy : ¬ IsIndependentAdvocacyProtectedByFirstAmendment d c


structure Section2339Ba1Attempt (d : Person) (s : Support) (o : Organization)
    (c : ComplaintText) : Prop where
  materialSupport : IsMaterialSupportOrResources s c
  attempt : AttemptsToProvideSupportToOrganization d s o c
  designated : IsDesignatedForeignTerroristOrganization o c
  knowingly : ActedWithScienter d c
  organizationKnowledge : KnowledgeOfTerroristOrganization d o c
  jurisdiction : JurisdictionOverOffense d c
  notApproved : ¬ SecretaryApprovedProvisionOfSupport d o c
  notProtectedAdvocacy : ¬ IsIndependentAdvocacyProtectedByFirstAmendment d c


structure Section2339Ba1Conspiracy (d : Person) (ag : Agreement) (s : Support)
    (o : Organization) (c : ComplaintText) : Prop where
  agreement : AgreementAmongTwoOrMore ag c
  materialSupport : IsMaterialSupportOrResources s c
  designated : IsDesignatedForeignTerroristOrganization o c
  knowingly : ActedWithScienter d c
  organizationKnowledge : KnowledgeOfTerroristOrganization d o c
  jurisdiction : JurisdictionOverOffense d c
  notApproved : ¬ SecretaryApprovedProvisionOfSupport d o c
  notProtectedAdvocacy : ¬ IsIndependentAdvocacyProtectedByFirstAmendment d c



structure Section2339Ba1Personnel (d : Person) (s : Support) (o : Organization)
    (c : ComplaintText) : Prop where
  offense : Section2339Ba1 d s o c
  personnel : IsPersonnelProvided s c
  directionOrControl : ProvidedPersonnelUnderDirectionOrControl d o c
  notEntirelyIndependent : ¬ ActsEntirelyIndependentlyOfOrganization d o c


structure Section2339Ba1DeathResults (d : Person) (s : Support) (o : Organization)
    (c : ComplaintText) : Prop where
  offense : Section2339Ba1 d s o c
  death : DeathResultedFromOffense d c



inductive FailureToComply2339Ba2 (fi : Person) (f : Funds) (c : ComplaintText) : Prop where
  | failsToRetain (h : KnowinglyFailsToRetainFunds fi f c)
  | failsToReport (h : KnowinglyFailsToReportFundsToSecretary fi f c)



structure Section2339Bb (fi : Person) (f : Funds) (o : Organization)
    (c : ComplaintText) : Prop where
  financialInstitution : IsFinancialInstitution fi c
  designated : IsDesignatedForeignTerroristOrganization o c
  awareness : AwareOfPossessionOrControlOfOrganizationFunds fi f o c
  notAuthorized : ¬ AuthorizedBySecretary fi f c
  failure : FailureToComply2339Ba2 fi f c


structure Section2339Bc (d : Person) (c : ComplaintText) : Prop where
  engagedOrAboutToEngage : EngagedOrAboutToEngageInViolation d c





structure PredicateActClauseB (pa : PredicateAct) (c : ComplaintText) : Prop where
  deathOrSeriousInjury : IntendedToCauseDeathOrSeriousBodilyInjury pa c
  protectedTarget : TargetIsCivilianOrPersonNotTakingActivePart pa c
  coercivePurpose : PurposeToIntimidatePopulationOrCompelGovernment pa c


inductive PredicateActUnder2339C (pa : PredicateAct) (c : ComplaintText) : Prop where
  | treatyOffense (h : IsTreatyOffenseUnderSection2339Ce7 pa c)
  | civilianTargeting (h : PredicateActClauseB pa c)


inductive JurisdictionUnder2339Cb (d : Person) (c : ComplaintText) : Prop where
  | inUnitedStates (h : OffenseInUSWithForeignOrPredicateNexus d c)
  | outsideUnitedStates (h : OffenseOutsideUSWithUnitedStatesNexus d c)
  | usVesselOrAircraft (h : CommittedOnVesselOrAircraftOfUnitedStates d c)
  | usOperatedAircraft (h : CommittedOnAircraftOperatedByUnitedStates d c)
  | compelUnitedStates (h : DirectedAtCompellingUnitedStates d c)



structure Section2339Ca1 (d : Person) (f : Funds) (pa : PredicateAct)
    (c : ComplaintText) : Prop where
  jurisdiction : JurisdictionUnder2339Cb d c
  providesOrCollects : ProvidesOrCollectsFunds d f c
  unlawfullyAndWillfully : ActsUnlawfullyAndWillfully d c
  intentOrKnowledge : IntendsOrKnowsFundsUsedForPredicateAct d f pa c
  predicateAct : PredicateActUnder2339C pa c


structure Section2339Ca2Conspiracy (d : Person) (ag : Agreement) (f : Funds)
    (pa : PredicateAct) (c : ComplaintText) : Prop where
  agreement : AgreementAmongTwoOrMore ag c
  jurisdiction : JurisdictionUnder2339Cb d c
  unlawfullyAndWillfully : ActsUnlawfullyAndWillfully d c
  intentOrKnowledge : IntendsOrKnowsFundsUsedForPredicateAct d f pa c
  predicateAct : PredicateActUnder2339C pa c


inductive Locus2339Cc1 (d : Person) (c : ComplaintText) : Prop where
  | inUnitedStates (h : IsPersonInUS d c)
  | usNationalOrEntityAbroad (h : IsOutsideUSAndUSNationalOrEntity d c)


inductive Knowledge2339Cc2 (d : Person) (c : ComplaintText) : Prop where
  | regarding2339B (h : KnowsOrIntendsSupportProvidedInViolationOf2339B d c)
  | regardingFinancing (h : KnowsOrIntendsFundsProvidedInViolationOf2339Ca d c)


structure Section2339Cc (d : Person) (c : ComplaintText) : Prop where
  locus : Locus2339Cc1 d c
  conceals : KnowinglyConcealsOrDisguisesSupportOrFunds d c
  knowledge : Knowledge2339Cc2 d c



structure Section2339Cf (d : Person) (le : LegalEntity) (f : Funds)
    (pa : PredicateAct) (c : ComplaintText) : Prop where
  entityNexus : IsLegalEntityLocatedInOrOrganizedUnderUSLaw le c
  managerialRole : IsResponsibleForManagementOrControl d le c
  inThatCapacity : CommittedOffenseInThatCapacity d le c
  underlyingOffense : Section2339Ca1 d f pa c





structure Section2339Da (d : Person) (t : Training) (o : Organization)
    (c : ComplaintText) : Prop where
  receives : ReceivesMilitaryTypeTraining d t o c
  militaryType : IsMilitaryTypeTraining t c
  designatedAtTime : OrganizationDesignatedAtTimeOfTraining o t c
  knowingly : ActedWithScienter d c
  organizationKnowledge : KnowledgeOfTerroristOrganization d o c
  jurisdiction : JurisdictionOverOffense d c





inductive MaterialSupportTheory (c : ComplaintText) : Prop where
  | harboring (d t : Person) (o : PredicateOffense) (h : Section2339a d t o c)
  | supportToTerrorists (d : Person) (s : Support) (o : PredicateOffense)
      (h : Section2339Aa d s o c)
  | supportToOrganization (d : Person) (s : Support) (o : Organization)
      (h : Section2339Ba1 d s o c)
  | financing (d : Person) (f : Funds) (pa : PredicateAct) (h : Section2339Ca1 d f pa c)
  | concealingFinancing (d : Person) (h : Section2339Cc d c)
  | militaryTraining (d : Person) (t : Training) (o : Organization)
      (h : Section2339Da d t o c)

end Proving.USC.T18.Ch113B.MaterialSupport.Elements
