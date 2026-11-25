









import Proving.USC.T18.Ch113B.Wmd.Part2.Ontology.Types
import Proving.USC.T18.Ch113B.Wmd.Part2.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Ontology

open Proving.USC.Common






structure ConductTranscendingNationalBoundaries (x : Conduct) (c : ComplaintText) : Prop where

  domestic : OccursWithinTheUnitedStates x c

  foreign : OccursOutsideTheUnitedStates x c


abbrev IsConductTranscendingNationalBoundaries (x : Conduct) (c : ComplaintText) : Prop :=
  ConductTranscendingNationalBoundaries x c






structure TerritorialSeaOfTheUnitedStates (l : Locale) (c : ComplaintText) : Prop where

  seawardExtent : ExtendsSeawardWithinTwelveNauticalMilesOfBaselines l c

  baselineRule : BaselinesDeterminedInAccordanceWithInternationalLaw l c


abbrev IsTerritorialSeaOfTheUnitedStates (l : Locale) (c : ComplaintText) : Prop :=
  TerritorialSeaOfTheUnitedStates l c






inductive TerrorismMotive (o : Offense) (c : ComplaintText) : Prop where


  | influenceOrCoerce (h : IsCalculatedToInfluenceGovernmentConductByIntimidationOrCoercion o c)

  | retaliate (h : IsCalculatedToRetaliateAgainstGovernmentConduct o c)



inductive EnumeratedTerrorismProvisionViolation (o : Offense) (c : ComplaintText) : Prop where

  | title18 (h : ViolatesEnumeratedTitle18TerrorismProvision o c)

  | atomicEnergyAct (h : ViolatesEnumeratedAtomicEnergyActProvision o c)

  | title49 (h : ViolatesEnumeratedTitle49Provision o c)

  | narcoterrorism (h : ViolatesNarcoterrorismProvision o c)




structure FederalCrimeOfTerrorism (o : Offense) (c : ComplaintText) : Prop where

  motive : TerrorismMotive o c

  provision : EnumeratedTerrorismProvisionViolation o c


abbrev IsFederalCrimeOfTerrorism (o : Offense) (c : ComplaintText) : Prop :=
  FederalCrimeOfTerrorism o c







structure AssaultResultingInSeriousBodilyInjury
    (x : Conduct) (p : Person) (i : Injury) (c : ComplaintText) : Prop where

  assault : AssaultsPerson x p c

  causation : InjuryResultsToPersonFromConduct x p i c

  serious : IsSeriousBodilyInjury i c


structure AssaultWithDangerousWeapon
    (x : Conduct) (p : Person) (c : ComplaintText) : Prop where

  assault : AssaultsPerson x p c

  weapon : AssaultCommittedWithDangerousWeapon x c



inductive ProhibitedActAgainstPerson
    (x : Conduct) (p : Person) (c : ComplaintText) : Prop where

  | kills (h : KillsPerson x p c) (locus : IsPersonWithinTheUnitedStates p c)

  | kidnaps (h : KidnapsPerson x p c) (locus : IsPersonWithinTheUnitedStates p c)

  | maims (h : MaimsPerson x p c) (locus : IsPersonWithinTheUnitedStates p c)

  | assaultSeriousBodilyInjury (i : Injury)
      (h : AssaultResultingInSeriousBodilyInjury x p i c)
      (locus : IsPersonWithinTheUnitedStates p c)

  | assaultDangerousWeapon (h : AssaultWithDangerousWeapon x p c)
      (locus : IsPersonWithinTheUnitedStates p c)






structure ProscribedPropertyWithinTheUnitedStates
    (q : PropertyObject) (c : ComplaintText) : Prop where

  kind : IsStructureConveyanceOrOtherRealOrPersonalProperty q c

  locus : IsLocatedWithinTheUnitedStates q c


abbrev IsProscribedPropertyWithinTheUnitedStates
    (q : PropertyObject) (c : ComplaintText) : Prop :=
  ProscribedPropertyWithinTheUnitedStates q c



inductive ProscribedPropertyMeans
    (x : Conduct) (q : PropertyObject) (c : ComplaintText) : Prop where


  | destroysOrDamages (h : DestroysOrDamagesProperty x q c)

  | attemptsOrConspires (h : AttemptsOrConspiresToDestroyOrDamageProperty x q c)




structure RiskCreatingPropertyConduct
    (x : Conduct) (q : PropertyObject) (p : Person) (c : ComplaintText) : Prop where


  risk : CreatesSubstantialRiskOfSeriousBodilyInjuryToAnotherPerson x p c


  means : ProscribedPropertyMeans x q c


  object : ProscribedPropertyWithinTheUnitedStates q c


inductive ProhibitedConductUnderParagraphA1
    (x : Conduct) (c : ComplaintText) : Prop where

  | againstPerson (p : Person) (h : ProhibitedActAgainstPerson x p c)

  | againstProperty (q : PropertyObject) (p : Person) (h : RiskCreatingPropertyConduct x q p c)





inductive LawOfAStateOrOfTheUnitedStates (l : LawProvision) (c : ComplaintText) : Prop where

  | state (h : IsLawOfAState l c)

  | federal (h : IsLawOfTheUnitedStates l c)



structure ViolationOfStateOrFederalLaw
    (x : Conduct) (l : LawProvision) (c : ComplaintText) : Prop where

  source : LawOfAStateOrOfTheUnitedStates l c

  violation : ViolatesLawProvision x l c










structure AdoptedStateLawContent (l : LawProvision) (c : ComplaintText) : Prop where

  element : IsElementOfTheOffenseUnderStateLaw l c

  notProceduralOrEvidentiary : ¬ IsProvisionPertainingToCriminalProcedureOrEvidence l c





inductive MailOrCommerceFacility (f : Facility) (c : ComplaintText) : Prop where

  | mail (h : IsTheMail f c)

  | commerceFacility (h : IsFacilityOfInterstateOrForeignCommerce f c)



structure MailOrCommerceFacilityUseInFurtherance
    (f : Facility) (o : Offense) (c : ComplaintText) : Prop where

  facility : MailOrCommerceFacility f c

  use : UsedInFurtheranceOfOffense f o c



inductive CommerceEffectOfOffense (o : Offense) (c : ComplaintText) : Prop where

  | actual (h : ObstructsDelaysOrAffectsInterstateOrForeignCommerce o c)


  | counterfactual (h : WouldHaveAffectedInterstateOrForeignCommerceIfConsummated o c)





inductive FederalVictimOfOffense (o : Offense) (c : ComplaintText) : Prop where

  | unitedStatesGovernment (e : Entity)
      (victim : IsEntityVictimOrIntendedVictimOfOffense e o c)
      (h : IsTheUnitedStatesGovernment e c)

  | uniformedServicesMember (p : Person)
      (victim : IsVictimOrIntendedVictimOfOffense p o c)
      (h : IsMemberOfTheUniformedServices p c)



  | federalOfficerEmployeeOrAgent (p : Person)
      (victim : IsVictimOrIntendedVictimOfOffense p o c)
      (h : IsFederalOfficialOfficerEmployeeOrAgent p c)



inductive UnitedStatesOrItsDepartmentOrAgency (e : Entity) (c : ComplaintText) : Prop where

  | unitedStates (h : IsTheUnitedStates e c)

  | departmentOrAgency (h : IsDepartmentOrAgencyOfTheUnitedStates e c)




structure FederalPropertyInterest
    (q : PropertyObject) (e : Entity) (c : ComplaintText) : Prop where

  kind : IsStructureConveyanceOrOtherRealOrPersonalProperty q c

  holder : UnitedStatesOrItsDepartmentOrAgency e c

  interest : IsOwnedPossessedOrLeasedInWholeOrInPartTo q e c






inductive TerritorialSeaLocus (l : Locale) (c : ComplaintText) : Prop where

  | sea (h : TerritorialSeaOfTheUnitedStates l c)

  | appurtenance (h : IsAppurtenanceOfTheTerritorialSea l c)





inductive CircumstanceDescribedInSubsectionB
    (s : Circumstance) (o : Offense) (c : ComplaintText) : Prop where

  | mailOrCommerceFacility (f : Facility)
      (attaches : IsTheCircumstanceOfOffense s o c)
      (h : MailOrCommerceFacilityUseInFurtherance f o c)

  | commerceEffect
      (attaches : IsTheCircumstanceOfOffense s o c)
      (h : CommerceEffectOfOffense o c)

  | federalVictim
      (attaches : IsTheCircumstanceOfOffense s o c)
      (h : FederalVictimOfOffense o c)

  | federalProperty (q : PropertyObject) (e : Entity)
      (attaches : IsTheCircumstanceOfOffense s o c)
      (h : FederalPropertyInterest q e c)

  | territorialSea (l : Locale)
      (attaches : IsTheCircumstanceOfOffense s o c)
      (committed : OffenseCommittedInLocale o l c)
      (h : TerritorialSeaLocus l c)

  | specialMaritimeJurisdiction (l : Locale)
      (attaches : IsTheCircumstanceOfOffense s o c)
      (committed : OffenseCommittedInLocale o l c)
      (h : IsWithinSpecialMaritimeAndTerritorialJurisdiction l c)


abbrev IsCircumstanceDescribedInSubsectionB
    (s : Circumstance) (o : Offense) (c : ComplaintText) : Prop :=
  CircumstanceDescribedInSubsectionB s o c






structure OffenseUnderParagraphA1
    (o : Offense) (x : Conduct) (s : Circumstance) (l : LawProvision)
    (c : ComplaintText) : Prop where

  constitutes : OffenseConsistsOfConduct o x c

  transcends : ConductTranscendingNationalBoundaries x c

  circumstance : CircumstanceDescribedInSubsectionB s o c

  proscribed : ProhibitedConductUnderParagraphA1 x c

  unlawful : ViolationOfStateOrFederalLaw x l c




inductive InchoateOffenseUnderParagraphA2
    (y : Conduct) (o : Offense) (c : ComplaintText) : Prop where

  | threatens (x : Conduct) (s : Circumstance) (l : LawProvision)
      (object : OffenseUnderParagraphA1 o x s l c)
      (h : ThreatensToCommitOffense y o c)

  | attempts (x : Conduct) (s : Circumstance) (l : LawProvision)
      (object : OffenseUnderParagraphA1 o x s l c)
      (h : AttemptsToCommitOffense y o c)

  | conspires (x : Conduct) (s : Circumstance) (l : LawProvision)
      (object : OffenseUnderParagraphA1 o x s l c)
      (h : ConspiresToCommitOffense y o c)



inductive OffenseUnderSubsectionA (o : Offense) (c : ComplaintText) : Prop where

  | paragraph1 (x : Conduct) (s : Circumstance) (l : LawProvision)
      (h : OffenseUnderParagraphA1 o x s l c)

  | paragraph2 (y : Conduct) (target : Offense)
      (constitutes : OffenseConsistsOfConduct o y c)
      (h : InchoateOffenseUnderParagraphA2 y target c)


abbrev IsOffenseUnderSubsectionA (o : Offense) (c : ComplaintText) : Prop :=
  OffenseUnderSubsectionA o c






inductive OffenderRoleUnderThisSection
    (p : Person) (o : Offense) (c : ComplaintText) : Prop where

  | principal (h : IsPrincipalOfOffense p o c)

  | coconspirator (h : IsCoconspiratorOfOffense p o c)

  | accessoryAfterTheFact (h : IsAccessoryAfterTheFactToOffense p o c)





structure JurisdictionOverOffenderUnderB2
    (p : Person) (o : Offense) (s : Circumstance) (q : Person)
    (c : ComplaintText) : Prop where

  role : OffenderRoleUnderThisSection p o c

  circumstance : CircumstanceDescribedInSubsectionB s o c

  someOffender : OffenderRoleUnderThisSection q o c

  applicable : CircumstanceApplicableToOffender s q c






structure DeathResultingFromProhibitedConduct
    (x : Conduct) (p : Person) (c : ComplaintText) : Prop where

  prohibited : ProhibitedConductUnderParagraphA1 x c

  death : DeathResultsToPersonFromConduct x p c











structure JurisdictionalBaseAllegation
    (s : Circumstance) (o : Offense) (ind : Indictment) (c : ComplaintText) : Prop where

  circumstance : CircumstanceDescribedInSubsectionB s o c

  alleged : IsAllegedInTheIndictment s ind c




structure ProsecutionBasedOnAdoptedStateLaw
    (pr : Prosecution) (o : Offense) (l : LawProvision) (c : ComplaintText) : Prop where

  prosecution : IsProsecutionUnderThisSection pr o c

  adoption : IsProsecutionBasedOnAdoptionOfStateLaw pr l c


  content : AdoptedStateLawContent l c




inductive ExtraterritorialJurisdictionUnderSubsectionE
    (o : Offense) (c : ComplaintText) : Prop where


  | overOffense (h : OffenseUnderSubsectionA o c)


  | overAccessory (p : Person)
      (offense : OffenseUnderSubsectionA o c)
      (h : IsAccessoryAfterTheFactToOffense p o c)






inductive AttorneyGeneralPrimaryInvestigativeSubject
    (o : Offense) (c : ComplaintText) : Prop where

  | federalCrimeOfTerrorism (h : FederalCrimeOfTerrorism o c)


  | listedOffense (h : IsListedAttorneyGeneralResponsibilityOffense o c)




def defEdges : List DefEdge :=
  [ { defined := "conduct transcending national boundaries",
      dependsOn := "conduct occurring in the United States",
      citeDefine := "18 USC § 2332b(g)(1)" },
    { defined := "conduct transcending national boundaries",
      dependsOn := "conduct occurring outside of the United States",
      citeDefine := "18 USC § 2332b(g)(1)" },
    { defined := "facility of interstate or foreign commerce",
      dependsOn := "facility of interstate or foreign commerce (18 USC § 1958(b)(2))",
      citeDefine := "18 USC § 2332b(g)(2)" },
    { defined := "serious bodily injury",
      dependsOn := "serious bodily injury (18 USC § 1365, cite flagged by editorial footnote 1)",
      citeDefine := "18 USC § 2332b(g)(3)" },
    { defined := "territorial sea of the United States",
      dependsOn := "waters extending seaward to 12 nautical miles from the baselines",
      citeDefine := "18 USC § 2332b(g)(4)" },
    { defined := "territorial sea of the United States",
      dependsOn := "baselines determined in accordance with international law",
      citeDefine := "18 USC § 2332b(g)(4)" },
    { defined := "Federal crime of terrorism",
      dependsOn := "calculated to influence or affect the conduct of government by intimidation or coercion",
      citeDefine := "18 USC § 2332b(g)(5)(A)" },
    { defined := "Federal crime of terrorism",
      dependsOn := "calculated to retaliate against government conduct",
      citeDefine := "18 USC § 2332b(g)(5)(A)" },
    { defined := "Federal crime of terrorism",
      dependsOn := "violation of a listed title 18 provision",
      citeDefine := "18 USC § 2332b(g)(5)(B)(i)" },
    { defined := "Federal crime of terrorism",
      dependsOn := "violation of Atomic Energy Act of 1954 § 92 or § 236",
      citeDefine := "18 USC § 2332b(g)(5)(B)(ii)" },
    { defined := "Federal crime of terrorism",
      dependsOn := "violation of a listed title 49 provision",
      citeDefine := "18 USC § 2332b(g)(5)(B)(iii)" },
    { defined := "Federal crime of terrorism",
      dependsOn := "violation of Controlled Substances Import and Export Act § 1010A",
      citeDefine := "18 USC § 2332b(g)(5)(B)(iv)" },
    { defined := "offense under paragraph (1)",
      dependsOn := "conduct transcending national boundaries",
      citeDefine := "18 USC § 2332b(a)(1)" },
    { defined := "offense under paragraph (1)",
      dependsOn := "circumstance described in subsection (b)",
      citeDefine := "18 USC § 2332b(a)(1)" },
    { defined := "offense under paragraph (1)",
      dependsOn := "prohibited act against a person within the United States",
      citeDefine := "18 USC § 2332b(a)(1)(A)" },
    { defined := "offense under paragraph (1)",
      dependsOn := "risk-creating conduct against property within the United States",
      citeDefine := "18 USC § 2332b(a)(1)(B)" },
    { defined := "offense under paragraph (1)",
      dependsOn := "violation of the laws of any State, or the United States",
      citeDefine := "18 USC § 2332b(a)(1)" },
    { defined := "prohibited act against a person within the United States",
      dependsOn := "person within the United States",
      citeDefine := "18 USC § 2332b(a)(1)(A)" },
    { defined := "assault resulting in serious bodily injury",
      dependsOn := "serious bodily injury",
      citeDefine := "18 USC § 2332b(a)(1)(A)" },
    { defined := "risk-creating conduct against property within the United States",
      dependsOn := "structure, conveyance, or other real or personal property",
      citeDefine := "18 USC § 2332b(a)(1)(B)" },
    { defined := "offense under paragraph (2)",
      dependsOn := "offense under paragraph (1)",
      citeDefine := "18 USC § 2332b(a)(2)" },
    { defined := "offense under subsection (a)",
      dependsOn := "offense under paragraph (1)",
      citeDefine := "18 USC § 2332b(a)" },
    { defined := "offense under subsection (a)",
      dependsOn := "offense under paragraph (2)",
      citeDefine := "18 USC § 2332b(a)" },
    { defined := "circumstance described in subsection (b)",
      dependsOn := "the mail or any facility of interstate or foreign commerce used in furtherance",
      citeDefine := "18 USC § 2332b(b)(1)(A)" },
    { defined := "circumstance described in subsection (b)",
      dependsOn := "obstruction, delay, or effect on interstate or foreign commerce",
      citeDefine := "18 USC § 2332b(b)(1)(B)" },
    { defined := "circumstance described in subsection (b)",
      dependsOn := "United States Government, uniformed-services member, or federal officer as victim",
      citeDefine := "18 USC § 2332b(b)(1)(C)" },
    { defined := "circumstance described in subsection (b)",
      dependsOn := "property owned, possessed, or leased to the United States",
      citeDefine := "18 USC § 2332b(b)(1)(D)" },
    { defined := "circumstance described in subsection (b)",
      dependsOn := "territorial sea of the United States (with appurtenances)",
      citeDefine := "18 USC § 2332b(b)(1)(E)" },
    { defined := "circumstance described in subsection (b)",
      dependsOn := "special maritime and territorial jurisdiction of the United States",
      citeDefine := "18 USC § 2332b(b)(1)(F)" },
    { defined := "territorial sea circumstance",
      dependsOn := "territorial sea of the United States",
      citeDefine := "18 USC § 2332b(b)(1)(E)" },
    { defined := "jurisdiction over principals, co-conspirators, and accessories",
      dependsOn := "circumstance described in subsection (b)",
      citeDefine := "18 USC § 2332b(b)(2)" },
    { defined := "jurisdiction over principals, co-conspirators, and accessories",
      dependsOn := "accessory after the fact (18 USC § 3)",
      citeDefine := "18 USC § 2332b(b)(2)" },
    { defined := "conduct prohibited by this section",
      dependsOn := "offense under paragraph (1)",
      citeDefine := "18 USC § 2332b(c)(1)(A)" },
    { defined := "jurisdictional base alleged in the indictment",
      dependsOn := "circumstance described in subsection (b)",
      citeDefine := "18 USC § 2332b(d)(1)" },
    { defined := "prosecution based upon the adoption of State law",
      dependsOn := "elements of the offense under State law",
      citeDefine := "18 USC § 2332b(d)(2)" },
    { defined := "prosecution based upon the adoption of State law",
      dependsOn := "provisions pertaining to criminal procedure or evidence (excluded)",
      citeDefine := "18 USC § 2332b(d)(2)" },
    { defined := "extraterritorial Federal jurisdiction",
      dependsOn := "offense under subsection (a)",
      citeDefine := "18 USC § 2332b(e)(1)" },
    { defined := "extraterritorial Federal jurisdiction",
      dependsOn := "accessory after the fact (18 USC § 3)",
      citeDefine := "18 USC § 2332b(e)(2)" },
    { defined := "Attorney General primary investigative responsibility",
      dependsOn := "Federal crime of terrorism",
      citeDefine := "18 USC § 2332b(f)" },
    { defined := "Attorney General primary investigative responsibility",
      dependsOn := "violation of §§ 351(e), 844(e), 844(f)(1), 956(b), 1361, 1366(b), 1366(c), 1751(e), 2152, 2156",
      citeDefine := "18 USC § 2332b(f)" } ]


def danglingRefs : List DanglingRef :=
  [ { term := "facility of interstate or foreign commerce",
      usedAt := "18 USC § 2332b(b)(1)(A)", definedAt := "18 USC § 1958(b)(2)" },
    { term := "serious bodily injury",
      usedAt := "18 USC § 2332b(a)(1)(A), (a)(1)(B), (c)(1)(D)",
      definedAt := "18 USC § 1365(g)(3) — cite flagged by editorial footnote 1" },
    { term := "special maritime and territorial jurisdiction of the United States",
      usedAt := "18 USC § 2332b(b)(1)(F)", definedAt := "(none)" },
    { term := "accessory after the fact",
      usedAt := "18 USC § 2332b(b)(2), (e)(2)", definedAt := "18 USC § 3" },
    { term := "United States",
      usedAt := "18 USC § 2332b(a)(1)(A), (a)(1)(B), (g)(1)", definedAt := "(none)" },
    { term := "State",
      usedAt := "18 USC § 2332b(a)(1), (d)(2)", definedAt := "(none)" },
    { term := "uniformed services",
      usedAt := "18 USC § 2332b(b)(1)(C)", definedAt := "(none)" },
    { term := "dangerous weapon",
      usedAt := "18 USC § 2332b(a)(1)(A), (c)(1)(D)", definedAt := "(none)" },
    { term := "listed § 2332b(g)(5)(B) offence provisions",
      usedAt := "18 USC § 2332b(g)(5)(B)(i)–(iv)",
      definedAt := "the listed sections of titles 18/49, the Atomic Energy Act of 1954, and the Controlled Substances Import and Export Act" } ]

end Proving.USC.T18.Ch113B.Wmd.Part2.Ontology
