







import Proving.USC.T18.Ch113B.Wmd.Part2.Ontology.Types
import Proving.USC.T18.Ch113B.Wmd.Part2.Ontology.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part2.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Ontology

open Proving.USC.Common




theorem conductTranscendingNationalBoundaries_intro
    {x : Conduct} {c : ComplaintText}
    (domestic : OccursWithinTheUnitedStates x c)
    (foreign : OccursOutsideTheUnitedStates x c) :
    ConductTranscendingNationalBoundaries x c :=
  ⟨domestic, foreign⟩


theorem territorialSeaOfTheUnitedStates_intro
    {l : Locale} {c : ComplaintText}
    (seawardExtent : ExtendsSeawardWithinTwelveNauticalMilesOfBaselines l c)
    (baselineRule : BaselinesDeterminedInAccordanceWithInternationalLaw l c) :
    TerritorialSeaOfTheUnitedStates l c :=
  ⟨seawardExtent, baselineRule⟩


theorem terrorismMotive_intro {o : Offense} {c : ComplaintText}
    (h : IsCalculatedToInfluenceGovernmentConductByIntimidationOrCoercion o c) :
    TerrorismMotive o c :=
  .influenceOrCoerce h


theorem terrorismMotive_intro_retaliate {o : Offense} {c : ComplaintText}
    (h : IsCalculatedToRetaliateAgainstGovernmentConduct o c) :
    TerrorismMotive o c :=
  .retaliate h


theorem enumeratedTerrorismProvisionViolation_intro {o : Offense} {c : ComplaintText}
    (h : ViolatesEnumeratedTitle18TerrorismProvision o c) :
    EnumeratedTerrorismProvisionViolation o c :=
  .title18 h


theorem enumeratedTerrorismProvisionViolation_intro_atomicEnergyAct
    {o : Offense} {c : ComplaintText}
    (h : ViolatesEnumeratedAtomicEnergyActProvision o c) :
    EnumeratedTerrorismProvisionViolation o c :=
  .atomicEnergyAct h


theorem enumeratedTerrorismProvisionViolation_intro_title49
    {o : Offense} {c : ComplaintText}
    (h : ViolatesEnumeratedTitle49Provision o c) :
    EnumeratedTerrorismProvisionViolation o c :=
  .title49 h


theorem enumeratedTerrorismProvisionViolation_intro_narcoterrorism
    {o : Offense} {c : ComplaintText}
    (h : ViolatesNarcoterrorismProvision o c) :
    EnumeratedTerrorismProvisionViolation o c :=
  .narcoterrorism h


theorem federalCrimeOfTerrorism_intro {o : Offense} {c : ComplaintText}
    (motive : TerrorismMotive o c)
    (provision : EnumeratedTerrorismProvisionViolation o c) :
    FederalCrimeOfTerrorism o c :=
  ⟨motive, provision⟩




theorem assaultResultingInSeriousBodilyInjury_intro
    {x : Conduct} {p : Person} {i : Injury} {c : ComplaintText}
    (assault : AssaultsPerson x p c)
    (causation : InjuryResultsToPersonFromConduct x p i c)
    (serious : IsSeriousBodilyInjury i c) :
    AssaultResultingInSeriousBodilyInjury x p i c :=
  ⟨assault, causation, serious⟩


theorem assaultWithDangerousWeapon_intro
    {x : Conduct} {p : Person} {c : ComplaintText}
    (assault : AssaultsPerson x p c)
    (weapon : AssaultCommittedWithDangerousWeapon x c) :
    AssaultWithDangerousWeapon x p c :=
  ⟨assault, weapon⟩


theorem prohibitedActAgainstPerson_intro
    {x : Conduct} {p : Person} {c : ComplaintText}
    (h : KillsPerson x p c) (locus : IsPersonWithinTheUnitedStates p c) :
    ProhibitedActAgainstPerson x p c :=
  .kills h locus


theorem prohibitedActAgainstPerson_intro_kidnaps
    {x : Conduct} {p : Person} {c : ComplaintText}
    (h : KidnapsPerson x p c) (locus : IsPersonWithinTheUnitedStates p c) :
    ProhibitedActAgainstPerson x p c :=
  .kidnaps h locus


theorem prohibitedActAgainstPerson_intro_maims
    {x : Conduct} {p : Person} {c : ComplaintText}
    (h : MaimsPerson x p c) (locus : IsPersonWithinTheUnitedStates p c) :
    ProhibitedActAgainstPerson x p c :=
  .maims h locus


theorem prohibitedActAgainstPerson_intro_assaultSeriousBodilyInjury
    {x : Conduct} {p : Person} {i : Injury} {c : ComplaintText}
    (h : AssaultResultingInSeriousBodilyInjury x p i c)
    (locus : IsPersonWithinTheUnitedStates p c) :
    ProhibitedActAgainstPerson x p c :=
  .assaultSeriousBodilyInjury i h locus


theorem prohibitedActAgainstPerson_intro_assaultDangerousWeapon
    {x : Conduct} {p : Person} {c : ComplaintText}
    (h : AssaultWithDangerousWeapon x p c)
    (locus : IsPersonWithinTheUnitedStates p c) :
    ProhibitedActAgainstPerson x p c :=
  .assaultDangerousWeapon h locus




theorem proscribedPropertyWithinTheUnitedStates_intro
    {q : PropertyObject} {c : ComplaintText}
    (kind : IsStructureConveyanceOrOtherRealOrPersonalProperty q c)
    (locus : IsLocatedWithinTheUnitedStates q c) :
    ProscribedPropertyWithinTheUnitedStates q c :=
  ⟨kind, locus⟩


theorem proscribedPropertyMeans_intro
    {x : Conduct} {q : PropertyObject} {c : ComplaintText}
    (h : DestroysOrDamagesProperty x q c) :
    ProscribedPropertyMeans x q c :=
  .destroysOrDamages h


theorem proscribedPropertyMeans_intro_attemptsOrConspires
    {x : Conduct} {q : PropertyObject} {c : ComplaintText}
    (h : AttemptsOrConspiresToDestroyOrDamageProperty x q c) :
    ProscribedPropertyMeans x q c :=
  .attemptsOrConspires h


theorem riskCreatingPropertyConduct_intro
    {x : Conduct} {q : PropertyObject} {p : Person} {c : ComplaintText}
    (risk : CreatesSubstantialRiskOfSeriousBodilyInjuryToAnotherPerson x p c)
    (means : ProscribedPropertyMeans x q c)
    (object : ProscribedPropertyWithinTheUnitedStates q c) :
    RiskCreatingPropertyConduct x q p c :=
  ⟨risk, means, object⟩


theorem prohibitedConductUnderParagraphA1_intro
    {x : Conduct} {p : Person} {c : ComplaintText}
    (h : ProhibitedActAgainstPerson x p c) :
    ProhibitedConductUnderParagraphA1 x c :=
  .againstPerson p h


theorem prohibitedConductUnderParagraphA1_intro_againstProperty
    {x : Conduct} {q : PropertyObject} {p : Person} {c : ComplaintText}
    (h : RiskCreatingPropertyConduct x q p c) :
    ProhibitedConductUnderParagraphA1 x c :=
  .againstProperty q p h




theorem lawOfAStateOrOfTheUnitedStates_intro
    {l : LawProvision} {c : ComplaintText} (h : IsLawOfAState l c) :
    LawOfAStateOrOfTheUnitedStates l c :=
  .state h


theorem lawOfAStateOrOfTheUnitedStates_intro_federal
    {l : LawProvision} {c : ComplaintText} (h : IsLawOfTheUnitedStates l c) :
    LawOfAStateOrOfTheUnitedStates l c :=
  .federal h


theorem violationOfStateOrFederalLaw_intro
    {x : Conduct} {l : LawProvision} {c : ComplaintText}
    (source : LawOfAStateOrOfTheUnitedStates l c)
    (violation : ViolatesLawProvision x l c) :
    ViolationOfStateOrFederalLaw x l c :=
  ⟨source, violation⟩


theorem adoptedStateLawContent_intro
    {l : LawProvision} {c : ComplaintText}
    (element : IsElementOfTheOffenseUnderStateLaw l c)
    (notProceduralOrEvidentiary :
      ¬ IsProvisionPertainingToCriminalProcedureOrEvidence l c) :
    AdoptedStateLawContent l c :=
  ⟨element, notProceduralOrEvidentiary⟩




theorem mailOrCommerceFacility_intro
    {f : Facility} {c : ComplaintText} (h : IsTheMail f c) :
    MailOrCommerceFacility f c :=
  .mail h


theorem mailOrCommerceFacility_intro_commerceFacility
    {f : Facility} {c : ComplaintText}
    (h : IsFacilityOfInterstateOrForeignCommerce f c) :
    MailOrCommerceFacility f c :=
  .commerceFacility h


theorem mailOrCommerceFacilityUseInFurtherance_intro
    {f : Facility} {o : Offense} {c : ComplaintText}
    (facility : MailOrCommerceFacility f c)
    (use : UsedInFurtheranceOfOffense f o c) :
    MailOrCommerceFacilityUseInFurtherance f o c :=
  ⟨facility, use⟩


theorem commerceEffectOfOffense_intro
    {o : Offense} {c : ComplaintText}
    (h : ObstructsDelaysOrAffectsInterstateOrForeignCommerce o c) :
    CommerceEffectOfOffense o c :=
  .actual h


theorem commerceEffectOfOffense_intro_counterfactual
    {o : Offense} {c : ComplaintText}
    (h : WouldHaveAffectedInterstateOrForeignCommerceIfConsummated o c) :
    CommerceEffectOfOffense o c :=
  .counterfactual h


theorem federalVictimOfOffense_intro
    {e : Entity} {o : Offense} {c : ComplaintText}
    (victim : IsEntityVictimOrIntendedVictimOfOffense e o c)
    (h : IsTheUnitedStatesGovernment e c) :
    FederalVictimOfOffense o c :=
  .unitedStatesGovernment e victim h


theorem federalVictimOfOffense_intro_uniformedServicesMember
    {p : Person} {o : Offense} {c : ComplaintText}
    (victim : IsVictimOrIntendedVictimOfOffense p o c)
    (h : IsMemberOfTheUniformedServices p c) :
    FederalVictimOfOffense o c :=
  .uniformedServicesMember p victim h


theorem federalVictimOfOffense_intro_federalOfficerEmployeeOrAgent
    {p : Person} {o : Offense} {c : ComplaintText}
    (victim : IsVictimOrIntendedVictimOfOffense p o c)
    (h : IsFederalOfficialOfficerEmployeeOrAgent p c) :
    FederalVictimOfOffense o c :=
  .federalOfficerEmployeeOrAgent p victim h


theorem unitedStatesOrItsDepartmentOrAgency_intro
    {e : Entity} {c : ComplaintText} (h : IsTheUnitedStates e c) :
    UnitedStatesOrItsDepartmentOrAgency e c :=
  .unitedStates h


theorem unitedStatesOrItsDepartmentOrAgency_intro_departmentOrAgency
    {e : Entity} {c : ComplaintText}
    (h : IsDepartmentOrAgencyOfTheUnitedStates e c) :
    UnitedStatesOrItsDepartmentOrAgency e c :=
  .departmentOrAgency h


theorem federalPropertyInterest_intro
    {q : PropertyObject} {e : Entity} {c : ComplaintText}
    (kind : IsStructureConveyanceOrOtherRealOrPersonalProperty q c)
    (holder : UnitedStatesOrItsDepartmentOrAgency e c)
    (interest : IsOwnedPossessedOrLeasedInWholeOrInPartTo q e c) :
    FederalPropertyInterest q e c :=
  ⟨kind, holder, interest⟩


theorem territorialSeaLocus_intro
    {l : Locale} {c : ComplaintText} (h : TerritorialSeaOfTheUnitedStates l c) :
    TerritorialSeaLocus l c :=
  .sea h


theorem territorialSeaLocus_intro_appurtenance
    {l : Locale} {c : ComplaintText} (h : IsAppurtenanceOfTheTerritorialSea l c) :
    TerritorialSeaLocus l c :=
  .appurtenance h


theorem circumstanceDescribedInSubsectionB_intro
    {s : Circumstance} {o : Offense} {f : Facility} {c : ComplaintText}
    (attaches : IsTheCircumstanceOfOffense s o c)
    (h : MailOrCommerceFacilityUseInFurtherance f o c) :
    CircumstanceDescribedInSubsectionB s o c :=
  .mailOrCommerceFacility f attaches h


theorem circumstanceDescribedInSubsectionB_intro_commerceEffect
    {s : Circumstance} {o : Offense} {c : ComplaintText}
    (attaches : IsTheCircumstanceOfOffense s o c)
    (h : CommerceEffectOfOffense o c) :
    CircumstanceDescribedInSubsectionB s o c :=
  .commerceEffect attaches h


theorem circumstanceDescribedInSubsectionB_intro_federalVictim
    {s : Circumstance} {o : Offense} {c : ComplaintText}
    (attaches : IsTheCircumstanceOfOffense s o c)
    (h : FederalVictimOfOffense o c) :
    CircumstanceDescribedInSubsectionB s o c :=
  .federalVictim attaches h


theorem circumstanceDescribedInSubsectionB_intro_federalProperty
    {s : Circumstance} {o : Offense} {q : PropertyObject} {e : Entity}
    {c : ComplaintText}
    (attaches : IsTheCircumstanceOfOffense s o c)
    (h : FederalPropertyInterest q e c) :
    CircumstanceDescribedInSubsectionB s o c :=
  .federalProperty q e attaches h


theorem circumstanceDescribedInSubsectionB_intro_territorialSea
    {s : Circumstance} {o : Offense} {l : Locale} {c : ComplaintText}
    (attaches : IsTheCircumstanceOfOffense s o c)
    (committed : OffenseCommittedInLocale o l c)
    (h : TerritorialSeaLocus l c) :
    CircumstanceDescribedInSubsectionB s o c :=
  .territorialSea l attaches committed h


theorem circumstanceDescribedInSubsectionB_intro_specialMaritimeJurisdiction
    {s : Circumstance} {o : Offense} {l : Locale} {c : ComplaintText}
    (attaches : IsTheCircumstanceOfOffense s o c)
    (committed : OffenseCommittedInLocale o l c)
    (h : IsWithinSpecialMaritimeAndTerritorialJurisdiction l c) :
    CircumstanceDescribedInSubsectionB s o c :=
  .specialMaritimeJurisdiction l attaches committed h




theorem offenseUnderParagraphA1_intro
    {o : Offense} {x : Conduct} {s : Circumstance} {l : LawProvision}
    {c : ComplaintText}
    (constitutes : OffenseConsistsOfConduct o x c)
    (transcends : ConductTranscendingNationalBoundaries x c)
    (circumstance : CircumstanceDescribedInSubsectionB s o c)
    (proscribed : ProhibitedConductUnderParagraphA1 x c)
    (unlawful : ViolationOfStateOrFederalLaw x l c) :
    OffenseUnderParagraphA1 o x s l c :=
  ⟨constitutes, transcends, circumstance, proscribed, unlawful⟩


theorem inchoateOffenseUnderParagraphA2_intro
    {y : Conduct} {o : Offense} {x : Conduct} {s : Circumstance}
    {l : LawProvision} {c : ComplaintText}
    (object : OffenseUnderParagraphA1 o x s l c)
    (h : ThreatensToCommitOffense y o c) :
    InchoateOffenseUnderParagraphA2 y o c :=
  .threatens x s l object h


theorem inchoateOffenseUnderParagraphA2_intro_attempts
    {y : Conduct} {o : Offense} {x : Conduct} {s : Circumstance}
    {l : LawProvision} {c : ComplaintText}
    (object : OffenseUnderParagraphA1 o x s l c)
    (h : AttemptsToCommitOffense y o c) :
    InchoateOffenseUnderParagraphA2 y o c :=
  .attempts x s l object h


theorem inchoateOffenseUnderParagraphA2_intro_conspires
    {y : Conduct} {o : Offense} {x : Conduct} {s : Circumstance}
    {l : LawProvision} {c : ComplaintText}
    (object : OffenseUnderParagraphA1 o x s l c)
    (h : ConspiresToCommitOffense y o c) :
    InchoateOffenseUnderParagraphA2 y o c :=
  .conspires x s l object h


theorem offenseUnderSubsectionA_intro
    {o : Offense} {x : Conduct} {s : Circumstance} {l : LawProvision}
    {c : ComplaintText}
    (h : OffenseUnderParagraphA1 o x s l c) :
    OffenseUnderSubsectionA o c :=
  .paragraph1 x s l h


theorem offenseUnderSubsectionA_intro_paragraph2
    {o : Offense} {y : Conduct} {target : Offense} {c : ComplaintText}
    (constitutes : OffenseConsistsOfConduct o y c)
    (h : InchoateOffenseUnderParagraphA2 y target c) :
    OffenseUnderSubsectionA o c :=
  .paragraph2 y target constitutes h




theorem offenderRoleUnderThisSection_intro
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : IsPrincipalOfOffense p o c) :
    OffenderRoleUnderThisSection p o c :=
  .principal h


theorem offenderRoleUnderThisSection_intro_coconspirator
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : IsCoconspiratorOfOffense p o c) :
    OffenderRoleUnderThisSection p o c :=
  .coconspirator h


theorem offenderRoleUnderThisSection_intro_accessoryAfterTheFact
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : IsAccessoryAfterTheFactToOffense p o c) :
    OffenderRoleUnderThisSection p o c :=
  .accessoryAfterTheFact h


theorem jurisdictionOverOffenderUnderB2_intro
    {p : Person} {o : Offense} {s : Circumstance} {q : Person}
    {c : ComplaintText}
    (role : OffenderRoleUnderThisSection p o c)
    (circumstance : CircumstanceDescribedInSubsectionB s o c)
    (someOffender : OffenderRoleUnderThisSection q o c)
    (applicable : CircumstanceApplicableToOffender s q c) :
    JurisdictionOverOffenderUnderB2 p o s q c :=
  ⟨role, circumstance, someOffender, applicable⟩




theorem deathResultingFromProhibitedConduct_intro
    {x : Conduct} {p : Person} {c : ComplaintText}
    (prohibited : ProhibitedConductUnderParagraphA1 x c)
    (death : DeathResultsToPersonFromConduct x p c) :
    DeathResultingFromProhibitedConduct x p c :=
  ⟨prohibited, death⟩


theorem jurisdictionalBaseAllegation_intro
    {s : Circumstance} {o : Offense} {ind : Indictment} {c : ComplaintText}
    (circumstance : CircumstanceDescribedInSubsectionB s o c)
    (alleged : IsAllegedInTheIndictment s ind c) :
    JurisdictionalBaseAllegation s o ind c :=
  ⟨circumstance, alleged⟩


theorem prosecutionBasedOnAdoptedStateLaw_intro
    {pr : Prosecution} {o : Offense} {l : LawProvision} {c : ComplaintText}
    (prosecution : IsProsecutionUnderThisSection pr o c)
    (adoption : IsProsecutionBasedOnAdoptionOfStateLaw pr l c)
    (content : AdoptedStateLawContent l c) :
    ProsecutionBasedOnAdoptedStateLaw pr o l c :=
  ⟨prosecution, adoption, content⟩


theorem extraterritorialJurisdictionUnderSubsectionE_intro
    {o : Offense} {c : ComplaintText} (h : OffenseUnderSubsectionA o c) :
    ExtraterritorialJurisdictionUnderSubsectionE o c :=
  .overOffense h


theorem extraterritorialJurisdictionUnderSubsectionE_intro_overAccessory
    {o : Offense} {p : Person} {c : ComplaintText}
    (offense : OffenseUnderSubsectionA o c)
    (h : IsAccessoryAfterTheFactToOffense p o c) :
    ExtraterritorialJurisdictionUnderSubsectionE o c :=
  .overAccessory p offense h


theorem attorneyGeneralPrimaryInvestigativeSubject_intro
    {o : Offense} {c : ComplaintText} (h : FederalCrimeOfTerrorism o c) :
    AttorneyGeneralPrimaryInvestigativeSubject o c :=
  .federalCrimeOfTerrorism h


theorem attorneyGeneralPrimaryInvestigativeSubject_intro_listedOffense
    {o : Offense} {c : ComplaintText}
    (h : IsListedAttorneyGeneralResponsibilityOffense o c) :
    AttorneyGeneralPrimaryInvestigativeSubject o c :=
  .listedOffense h

end Proving.USC.T18.Ch113B.Wmd.Part2.Ontology
