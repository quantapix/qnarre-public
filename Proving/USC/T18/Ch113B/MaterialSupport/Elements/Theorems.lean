import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113B.MaterialSupport.Elements.Types
import Proving.USC.T18.Ch113B.MaterialSupport.Elements.Predicates
import Proving.USC.T18.Ch113B.MaterialSupport.Elements.Statute

set_option autoImplicit false









namespace Proving.USC.T18.Ch113B.MaterialSupport.Elements

open Proving.USC.Common



theorem scienter2339_intro_knows {d t : Person} {c : ComplaintText}
    (h : KnowsOfOffenseStatus d t c) : Scienter2339 d t c := .knows h

theorem scienter2339_intro_reasonableGrounds {d t : Person} {c : ComplaintText}
    (h : HasReasonableGroundsToBelieveOffenseStatus d t c) : Scienter2339 d t c :=
  .reasonableGrounds h

theorem section2339a_intro {d t : Person} {o : PredicateOffense} {c : ComplaintText}
    (hHarbor : HarborsOrConceals d t c)
    (hOffense : IsEnumeratedOffenseUnder2339 o c)
    (hStatus : CommittedOrAboutToCommitOffense t o c)
    (hScienter : Scienter2339 d t c) : Section2339a d t o c :=
  ⟨hHarbor, hOffense, hStatus, hScienter⟩



theorem materialSupportCategory_intro_property {s : Support} {c : ComplaintText}
    (h : IsPropertyTangibleOrIntangible s c) : MaterialSupportCategory s c := .property h

theorem materialSupportCategory_intro_service {s : Support} {c : ComplaintText}
    (h : IsServiceOrListedResource s c) : MaterialSupportCategory s c := .service h

theorem materialSupportCategory_intro_training {s : Support} {c : ComplaintText}
    (h : IsTrainingSpecificSkill s c) : MaterialSupportCategory s c := .training h

theorem materialSupportCategory_intro_expertAdvice {s : Support} {c : ComplaintText}
    (h : IsExpertAdviceOrAssistance s c) : MaterialSupportCategory s c := .expertAdvice h

theorem materialSupportCategory_intro_personnel {s : Support} {c : ComplaintText}
    (h : IsPersonnelProvided s c) : MaterialSupportCategory s c := .personnel h

theorem materialSupportOrResources_intro {s : Support} {c : ComplaintText}
    (hCat : MaterialSupportCategory s c)
    (hNotExcepted : ¬ IsMedicineOrReligiousMaterials s c) :
    MaterialSupportOrResources s c := ⟨hCat, hNotExcepted⟩



theorem isMaterialSupportOrResources_of_leaves {s : Support} {c : ComplaintText}
    (hCat : MaterialSupportCategory s c)
    (hNotExcepted : ¬ IsMedicineOrReligiousMaterials s c) :
    IsMaterialSupportOrResources s c := ⟨hCat, hNotExcepted⟩



theorem conduct2339A_intro_provides {d : Person} {s : Support} {c : ComplaintText}
    (h : ProvidesMaterialSupport d s c) : Conduct2339A d s c := .provides h

theorem conduct2339A_intro_conceals {d : Person} {s : Support} {c : ComplaintText}
    (h : ConcealsOrDisguisesMaterialSupport d s c) : Conduct2339A d s c := .conceals h

theorem purpose2339A_intro_forOffense {d : Person} {s : Support}
    {o : PredicateOffense} {c : ComplaintText}
    (h : KnowsOrIntendsSupportUsedForOffense d s o c) : Purpose2339A d s o c := .forOffense h

theorem purpose2339A_intro_forEscapeConcealment {d : Person} {s : Support}
    {o : PredicateOffense} {c : ComplaintText}
    (h : KnowsOrIntendsSupportUsedToConcealEscape d s o c) : Purpose2339A d s o c :=
  .forEscapeConcealment h

theorem section2339Aa_intro {d : Person} {s : Support} {o : PredicateOffense}
    {c : ComplaintText}
    (hSupport : IsMaterialSupportOrResources s c)
    (hConduct : Conduct2339A d s c)
    (hOffense : IsEnumeratedPredicateOffenseUnder2339A o c)
    (hPurpose : Purpose2339A d s o c) : Section2339Aa d s o c :=
  ⟨hSupport, hConduct, hOffense, hPurpose⟩

theorem section2339AaAttempt_intro {d : Person} {s : Support} {o : PredicateOffense}
    {c : ComplaintText}
    (hSupport : IsMaterialSupportOrResources s c)
    (hAttempt : AttemptsToProvideMaterialSupport d s c)
    (hOffense : IsEnumeratedPredicateOffenseUnder2339A o c)
    (hPurpose : Purpose2339A d s o c) : Section2339AaAttempt d s o c :=
  ⟨hSupport, hAttempt, hOffense, hPurpose⟩

theorem section2339AaConspiracy_intro {d : Person} {ag : Agreement} {s : Support}
    {o : PredicateOffense} {c : ComplaintText}
    (hAgreement : AgreementAmongTwoOrMore ag c)
    (hSupport : IsMaterialSupportOrResources s c)
    (hOffense : IsEnumeratedPredicateOffenseUnder2339A o c)
    (hPurpose : Purpose2339A d s o c) : Section2339AaConspiracy d ag s o c :=
  ⟨hAgreement, hSupport, hOffense, hPurpose⟩

theorem section2339AaDeathResults_intro {d : Person} {s : Support}
    {o : PredicateOffense} {c : ComplaintText}
    (hOffense : Section2339Aa d s o c)
    (hDeath : DeathResultedFromOffense d c) : Section2339AaDeathResults d s o c :=
  ⟨hOffense, hDeath⟩



theorem knowledgeOfTerroristOrganization_intro_designated {d : Person}
    {o : Organization} {c : ComplaintText}
    (h : KnowsOrganizationIsDesignated d o c) : KnowledgeOfTerroristOrganization d o c :=
  .designated h

theorem knowledgeOfTerroristOrganization_intro_terroristActivity {d : Person}
    {o : Organization} {c : ComplaintText}
    (h : KnowsOrganizationEngagesInTerroristActivity d o c) :
    KnowledgeOfTerroristOrganization d o c := .terroristActivity h

theorem knowledgeOfTerroristOrganization_intro_terrorism {d : Person}
    {o : Organization} {c : ComplaintText}
    (h : KnowsOrganizationEngagesInTerrorism d o c) :
    KnowledgeOfTerroristOrganization d o c := .terrorism h

theorem jurisdictionOverOffense_intro_usNationalOrLPR {d : Person} {c : ComplaintText}
    (h : OffenderIsUSNationalOrLawfulPermanentResident d c) :
    JurisdictionOverOffense d c := .usNationalOrLPR h

theorem jurisdictionOverOffense_intro_statelessResident {d : Person} {c : ComplaintText}
    (h : OffenderIsStatelessHabitualResidentOfUS d c) :
    JurisdictionOverOffense d c := .statelessResident h

theorem jurisdictionOverOffense_intro_broughtOrFoundInUS {d : Person} {c : ComplaintText}
    (h : OffenderBroughtIntoOrFoundInUS d c) :
    JurisdictionOverOffense d c := .broughtOrFoundInUS h

theorem jurisdictionOverOffense_intro_occursInUS {d : Person} {c : ComplaintText}
    (h : OffenseOccursInWholeOrPartInUS d c) :
    JurisdictionOverOffense d c := .occursInUS h

theorem jurisdictionOverOffense_intro_affectsCommerce {d : Person} {c : ComplaintText}
    (h : OffenseAffectsInterstateOrForeignCommerce d c) :
    JurisdictionOverOffense d c := .affectsCommerce h

theorem jurisdictionOverOffense_intro_aidsAbetsOrConspires {d : Person} {c : ComplaintText}
    (h : AidsAbetsOrConspiresWithPersonSubjectToJurisdiction d c) :
    JurisdictionOverOffense d c := .aidsAbetsOrConspires h

theorem section2339Ba1_intro {d : Person} {s : Support} {o : Organization}
    {c : ComplaintText}
    (hSupport : IsMaterialSupportOrResources s c)
    (hProvides : ProvidesMaterialSupportToOrganization d s o c)
    (hDesignated : IsDesignatedForeignTerroristOrganization o c)
    (hKnowingly : ActedWithScienter d c)
    (hOrgKnowledge : KnowledgeOfTerroristOrganization d o c)
    (hJurisdiction : JurisdictionOverOffense d c)
    (hNotApproved : ¬ SecretaryApprovedProvisionOfSupport d o c)
    (hNotProtected : ¬ IsIndependentAdvocacyProtectedByFirstAmendment d c) :
    Section2339Ba1 d s o c :=
  ⟨hSupport, hProvides, hDesignated, hKnowingly, hOrgKnowledge, hJurisdiction,
   hNotApproved, hNotProtected⟩

theorem section2339Ba1Attempt_intro {d : Person} {s : Support} {o : Organization}
    {c : ComplaintText}
    (hSupport : IsMaterialSupportOrResources s c)
    (hAttempt : AttemptsToProvideSupportToOrganization d s o c)
    (hDesignated : IsDesignatedForeignTerroristOrganization o c)
    (hKnowingly : ActedWithScienter d c)
    (hOrgKnowledge : KnowledgeOfTerroristOrganization d o c)
    (hJurisdiction : JurisdictionOverOffense d c)
    (hNotApproved : ¬ SecretaryApprovedProvisionOfSupport d o c)
    (hNotProtected : ¬ IsIndependentAdvocacyProtectedByFirstAmendment d c) :
    Section2339Ba1Attempt d s o c :=
  ⟨hSupport, hAttempt, hDesignated, hKnowingly, hOrgKnowledge, hJurisdiction,
   hNotApproved, hNotProtected⟩

theorem section2339Ba1Conspiracy_intro {d : Person} {ag : Agreement} {s : Support}
    {o : Organization} {c : ComplaintText}
    (hAgreement : AgreementAmongTwoOrMore ag c)
    (hSupport : IsMaterialSupportOrResources s c)
    (hDesignated : IsDesignatedForeignTerroristOrganization o c)
    (hKnowingly : ActedWithScienter d c)
    (hOrgKnowledge : KnowledgeOfTerroristOrganization d o c)
    (hJurisdiction : JurisdictionOverOffense d c)
    (hNotApproved : ¬ SecretaryApprovedProvisionOfSupport d o c)
    (hNotProtected : ¬ IsIndependentAdvocacyProtectedByFirstAmendment d c) :
    Section2339Ba1Conspiracy d ag s o c :=
  ⟨hAgreement, hSupport, hDesignated, hKnowingly, hOrgKnowledge, hJurisdiction,
   hNotApproved, hNotProtected⟩

theorem section2339Ba1Personnel_intro {d : Person} {s : Support} {o : Organization}
    {c : ComplaintText}
    (hOffense : Section2339Ba1 d s o c)
    (hPersonnel : IsPersonnelProvided s c)
    (hControl : ProvidedPersonnelUnderDirectionOrControl d o c)
    (hNotIndependent : ¬ ActsEntirelyIndependentlyOfOrganization d o c) :
    Section2339Ba1Personnel d s o c :=
  ⟨hOffense, hPersonnel, hControl, hNotIndependent⟩

theorem section2339Ba1DeathResults_intro {d : Person} {s : Support} {o : Organization}
    {c : ComplaintText}
    (hOffense : Section2339Ba1 d s o c)
    (hDeath : DeathResultedFromOffense d c) : Section2339Ba1DeathResults d s o c :=
  ⟨hOffense, hDeath⟩

theorem failureToComply2339Ba2_intro_failsToRetain {fi : Person} {f : Funds}
    {c : ComplaintText} (h : KnowinglyFailsToRetainFunds fi f c) :
    FailureToComply2339Ba2 fi f c := .failsToRetain h

theorem failureToComply2339Ba2_intro_failsToReport {fi : Person} {f : Funds}
    {c : ComplaintText} (h : KnowinglyFailsToReportFundsToSecretary fi f c) :
    FailureToComply2339Ba2 fi f c := .failsToReport h

theorem section2339Bb_intro {fi : Person} {f : Funds} {o : Organization}
    {c : ComplaintText}
    (hFI : IsFinancialInstitution fi c)
    (hDesignated : IsDesignatedForeignTerroristOrganization o c)
    (hAware : AwareOfPossessionOrControlOfOrganizationFunds fi f o c)
    (hNotAuthorized : ¬ AuthorizedBySecretary fi f c)
    (hFailure : FailureToComply2339Ba2 fi f c) : Section2339Bb fi f o c :=
  ⟨hFI, hDesignated, hAware, hNotAuthorized, hFailure⟩

theorem section2339Bc_intro {d : Person} {c : ComplaintText}
    (h : EngagedOrAboutToEngageInViolation d c) : Section2339Bc d c := ⟨h⟩



theorem predicateActClauseB_intro {pa : PredicateAct} {c : ComplaintText}
    (hInjury : IntendedToCauseDeathOrSeriousBodilyInjury pa c)
    (hTarget : TargetIsCivilianOrPersonNotTakingActivePart pa c)
    (hPurpose : PurposeToIntimidatePopulationOrCompelGovernment pa c) :
    PredicateActClauseB pa c := ⟨hInjury, hTarget, hPurpose⟩

theorem predicateActUnder2339C_intro_treatyOffense {pa : PredicateAct} {c : ComplaintText}
    (h : IsTreatyOffenseUnderSection2339Ce7 pa c) : PredicateActUnder2339C pa c :=
  .treatyOffense h

theorem predicateActUnder2339C_intro_civilianTargeting {pa : PredicateAct}
    {c : ComplaintText} (h : PredicateActClauseB pa c) : PredicateActUnder2339C pa c :=
  .civilianTargeting h

theorem jurisdictionUnder2339Cb_intro_inUnitedStates {d : Person} {c : ComplaintText}
    (h : OffenseInUSWithForeignOrPredicateNexus d c) : JurisdictionUnder2339Cb d c :=
  .inUnitedStates h

theorem jurisdictionUnder2339Cb_intro_outsideUnitedStates {d : Person} {c : ComplaintText}
    (h : OffenseOutsideUSWithUnitedStatesNexus d c) : JurisdictionUnder2339Cb d c :=
  .outsideUnitedStates h

theorem jurisdictionUnder2339Cb_intro_usVesselOrAircraft {d : Person} {c : ComplaintText}
    (h : CommittedOnVesselOrAircraftOfUnitedStates d c) : JurisdictionUnder2339Cb d c :=
  .usVesselOrAircraft h

theorem jurisdictionUnder2339Cb_intro_usOperatedAircraft {d : Person} {c : ComplaintText}
    (h : CommittedOnAircraftOperatedByUnitedStates d c) : JurisdictionUnder2339Cb d c :=
  .usOperatedAircraft h

theorem jurisdictionUnder2339Cb_intro_compelUnitedStates {d : Person} {c : ComplaintText}
    (h : DirectedAtCompellingUnitedStates d c) : JurisdictionUnder2339Cb d c :=
  .compelUnitedStates h

theorem section2339Ca1_intro {d : Person} {f : Funds} {pa : PredicateAct}
    {c : ComplaintText}
    (hJurisdiction : JurisdictionUnder2339Cb d c)
    (hFunds : ProvidesOrCollectsFunds d f c)
    (hWillful : ActsUnlawfullyAndWillfully d c)
    (hIntent : IntendsOrKnowsFundsUsedForPredicateAct d f pa c)
    (hPredicate : PredicateActUnder2339C pa c) : Section2339Ca1 d f pa c :=
  ⟨hJurisdiction, hFunds, hWillful, hIntent, hPredicate⟩

theorem section2339Ca2Conspiracy_intro {d : Person} {ag : Agreement} {f : Funds}
    {pa : PredicateAct} {c : ComplaintText}
    (hAgreement : AgreementAmongTwoOrMore ag c)
    (hJurisdiction : JurisdictionUnder2339Cb d c)
    (hWillful : ActsUnlawfullyAndWillfully d c)
    (hIntent : IntendsOrKnowsFundsUsedForPredicateAct d f pa c)
    (hPredicate : PredicateActUnder2339C pa c) : Section2339Ca2Conspiracy d ag f pa c :=
  ⟨hAgreement, hJurisdiction, hWillful, hIntent, hPredicate⟩

theorem locus2339Cc1_intro_inUnitedStates {d : Person} {c : ComplaintText}
    (h : IsPersonInUS d c) : Locus2339Cc1 d c := .inUnitedStates h

theorem locus2339Cc1_intro_usNationalOrEntityAbroad {d : Person} {c : ComplaintText}
    (h : IsOutsideUSAndUSNationalOrEntity d c) : Locus2339Cc1 d c :=
  .usNationalOrEntityAbroad h

theorem knowledge2339Cc2_intro_regarding2339B {d : Person} {c : ComplaintText}
    (h : KnowsOrIntendsSupportProvidedInViolationOf2339B d c) : Knowledge2339Cc2 d c :=
  .regarding2339B h

theorem knowledge2339Cc2_intro_regardingFinancing {d : Person} {c : ComplaintText}
    (h : KnowsOrIntendsFundsProvidedInViolationOf2339Ca d c) : Knowledge2339Cc2 d c :=
  .regardingFinancing h

theorem section2339Cc_intro {d : Person} {c : ComplaintText}
    (hLocus : Locus2339Cc1 d c)
    (hConceals : KnowinglyConcealsOrDisguisesSupportOrFunds d c)
    (hKnowledge : Knowledge2339Cc2 d c) : Section2339Cc d c :=
  ⟨hLocus, hConceals, hKnowledge⟩

theorem section2339Cf_intro {d : Person} {le : LegalEntity} {f : Funds}
    {pa : PredicateAct} {c : ComplaintText}
    (hEntity : IsLegalEntityLocatedInOrOrganizedUnderUSLaw le c)
    (hRole : IsResponsibleForManagementOrControl d le c)
    (hCapacity : CommittedOffenseInThatCapacity d le c)
    (hOffense : Section2339Ca1 d f pa c) : Section2339Cf d le f pa c :=
  ⟨hEntity, hRole, hCapacity, hOffense⟩



theorem section2339Da_intro {d : Person} {t : Training} {o : Organization}
    {c : ComplaintText}
    (hReceives : ReceivesMilitaryTypeTraining d t o c)
    (hMilitary : IsMilitaryTypeTraining t c)
    (hDesignated : OrganizationDesignatedAtTimeOfTraining o t c)
    (hKnowingly : ActedWithScienter d c)
    (hOrgKnowledge : KnowledgeOfTerroristOrganization d o c)
    (hJurisdiction : JurisdictionOverOffense d c) : Section2339Da d t o c :=
  ⟨hReceives, hMilitary, hDesignated, hKnowingly, hOrgKnowledge, hJurisdiction⟩



theorem materialSupportTheory_intro_harboring {d t : Person} {o : PredicateOffense}
    {c : ComplaintText} (h : Section2339a d t o c) : MaterialSupportTheory c :=
  .harboring d t o h

theorem materialSupportTheory_intro_supportToTerrorists {d : Person} {s : Support}
    {o : PredicateOffense} {c : ComplaintText} (h : Section2339Aa d s o c) :
    MaterialSupportTheory c := .supportToTerrorists d s o h

theorem materialSupportTheory_intro_supportToOrganization {d : Person} {s : Support}
    {o : Organization} {c : ComplaintText} (h : Section2339Ba1 d s o c) :
    MaterialSupportTheory c := .supportToOrganization d s o h

theorem materialSupportTheory_intro_financing {d : Person} {f : Funds}
    {pa : PredicateAct} {c : ComplaintText} (h : Section2339Ca1 d f pa c) :
    MaterialSupportTheory c := .financing d f pa h

theorem materialSupportTheory_intro_concealingFinancing {d : Person} {c : ComplaintText}
    (h : Section2339Cc d c) : MaterialSupportTheory c := .concealingFinancing d h

theorem materialSupportTheory_intro_militaryTraining {d : Person} {t : Training}
    {o : Organization} {c : ComplaintText} (h : Section2339Da d t o c) :
    MaterialSupportTheory c := .militaryTraining d t o h

end Proving.USC.T18.Ch113B.MaterialSupport.Elements
