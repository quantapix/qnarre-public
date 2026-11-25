






import Proving.USC.T18.Ch113B.Wmd.Part2.Elements.Types
import Proving.USC.T18.Ch113B.Wmd.Part2.Elements.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part2.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Elements

open Proving.USC.Common




theorem conductTranscendingNationalBoundaries_intro
    {o : Offense} {c : ComplaintText}
    (hAbroad : ConductOccurringOutsideTheUnitedStates o c)
    (hDomestic : ConductOccurringWithinTheUnitedStates o c) :
    ConductTranscendingNationalBoundaries o c :=
  ⟨hAbroad, hDomestic⟩




theorem commerceEffectCircumstance_intro_actual
    {o : Offense} {c : ComplaintText}
    (h : OffenseAffectsInterstateOrForeignCommerce o c) :
    CommerceEffectCircumstance o c := .actual h


theorem commerceEffectCircumstance_intro_ifConsummated
    {o : Offense} {c : ComplaintText}
    (h : OffenseWouldHaveAffectedCommerceIfConsummated o c) :
    CommerceEffectCircumstance o c := .ifConsummated h


theorem territorialSeaOfTheUnitedStates_intro
    {o : Offense} {c : ComplaintText}
    (hSeaward : OffenseCommittedInWatersSeawardOfTheBaselines o c)
    (hWithin : nauticalMilesSeawardFromTheBaselines o c ≤ 12) :
    TerritorialSeaOfTheUnitedStates o c :=
  ⟨hSeaward, hWithin⟩


theorem circumstanceUnderSubsectionB_intro_facilityOfCommerce
    {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h : MailOrFacilityOfCommerceUsedInFurtherance o c) :
    CircumstanceUnderSubsectionB o v pr c := .facilityOfCommerce h


theorem circumstanceUnderSubsectionB_intro_commerceEffect
    {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h : CommerceEffectCircumstance o c) :
    CircumstanceUnderSubsectionB o v pr c := .commerceEffect h


theorem circumstanceUnderSubsectionB_intro_federalVictim
    {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h : VictimIsUnitedStatesGovernmentOrFederalPersonnel v o c) :
    CircumstanceUnderSubsectionB o v pr c := .federalVictim h


theorem circumstanceUnderSubsectionB_intro_federalProperty
    {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h : PropertyOwnedPossessedOrLeasedToTheUnitedStates pr c) :
    CircumstanceUnderSubsectionB o v pr c := .federalProperty h


theorem circumstanceUnderSubsectionB_intro_territorialSea
    {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h : TerritorialSeaOfTheUnitedStates o c) :
    CircumstanceUnderSubsectionB o v pr c := .territorialSea h


theorem circumstanceUnderSubsectionB_intro_specialMaritime
    {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h : OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction o c) :
    CircumstanceUnderSubsectionB o v pr c := .specialMaritime h




theorem circumstanceProvedAgainstDefendant_intro
    {p : Person} {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h : CircumstanceUnderSubsectionB o v pr c) :
    CircumstanceProvedAgainstDefendant p o v pr c := h




theorem enumeratedViolentAct_intro_kills
    {p : Person} {o : Offense} {v : Person} {c : ComplaintText}
    (h : KillsPerson p o v c) : EnumeratedViolentAct p o v c := .kills h


theorem enumeratedViolentAct_intro_kidnaps
    {p : Person} {o : Offense} {v : Person} {c : ComplaintText}
    (h : KidnapsPerson p o v c) : EnumeratedViolentAct p o v c := .kidnaps h


theorem enumeratedViolentAct_intro_maims
    {p : Person} {o : Offense} {v : Person} {c : ComplaintText}
    (h : MaimsPerson p o v c) : EnumeratedViolentAct p o v c := .maims h


theorem enumeratedViolentAct_intro_assaultSeriousInjury
    {p : Person} {o : Offense} {v : Person} {c : ComplaintText}
    (h : CommitsAssaultResultingInSeriousBodilyInjury p o v c) :
    EnumeratedViolentAct p o v c := .assaultSeriousInjury h


theorem enumeratedViolentAct_intro_assaultDangerousWeapon
    {p : Person} {o : Offense} {v : Person} {c : ComplaintText}
    (h : AssaultsWithADangerousWeapon p o v c) :
    EnumeratedViolentAct p o v c := .assaultDangerousWeapon h


theorem violentActRoute_intro
    {p : Person} {o : Offense} {v : Person} {c : ComplaintText}
    (hAct : EnumeratedViolentAct p o v c) (hLocus : IsPersonInUS v c) :
    ViolentActRoute p o v c :=
  ⟨hAct, hLocus⟩




theorem propertyConductRoute_intro_destroysOrDamages
    {p : Person} {o : Offense} {pr : Property} {c : ComplaintText}
    (h : DestroysOrDamagesProperty p o pr c) :
    PropertyConductRoute p o pr c := .destroysOrDamages h


theorem propertyConductRoute_intro_attemptsOrConspires
    {p : Person} {o : Offense} {pr : Property} {c : ComplaintText}
    (h : AttemptsOrConspiresToDestroyOrDamageProperty p o pr c) :
    PropertyConductRoute p o pr c := .attemptsOrConspires h


theorem propertyRiskRoute_intro
    {p : Person} {o : Offense} {pr : Property} {c : ComplaintText}
    (hRisk : CreatesSubstantialRiskOfSeriousBodilyInjury p o c)
    (hClass : IsStructureConveyanceOrOtherProperty pr c)
    (hLocus : PropertyIsWithinTheUnitedStates pr c)
    (hMeans : PropertyConductRoute p o pr c)
    (hNexus : SubstantialRiskArisesFromThePropertyConduct o pr c) :
    PropertyRiskRoute p o pr c :=
  ⟨hRisk, hClass, hLocus, hMeans, hNexus⟩


theorem prohibitedConductUnderParagraph1_intro_violentAct
    {p : Person} {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h : ViolentActRoute p o v c) :
    ProhibitedConductUnderParagraph1 p o v pr c := .violentAct h


theorem prohibitedConductUnderParagraph1_intro_propertyRisk
    {p : Person} {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (h : PropertyRiskRoute p o pr c) :
    ProhibitedConductUnderParagraph1 p o v pr c := .propertyRisk h


theorem inViolationOfStateOrFederalLaw_intro_stateLaw
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : ViolatesTheLawOfAnyState p o c) :
    InViolationOfStateOrFederalLaw p o c := .stateLaw h


theorem inViolationOfStateOrFederalLaw_intro_federalLaw
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : ViolatesTheLawOfTheUnitedStates p o c) :
    InViolationOfStateOrFederalLaw p o c := .federalLaw h


theorem section2332bA1_intro
    {p : Person} {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (hTrans : ConductTranscendingNationalBoundaries o c)
    (hCirc : CircumstanceProvedAgainstDefendant p o v pr c)
    (hConduct : ProhibitedConductUnderParagraph1 p o v pr c)
    (hUnlawful : InViolationOfStateOrFederalLaw p o c) :
    Section2332bA1 p o v pr c :=
  ⟨hTrans, hCirc, hConduct, hUnlawful⟩




theorem threatRoute_intro
    {p : Person} {o : Offense} {obj : Offense} {c : ComplaintText}
    (hComm : CommunicatesAThreatToCommitTheObjectOffense p o obj c)
    (hTrue : ThreatIsATrueThreat p o c) :
    ThreatRoute p o obj c :=
  ⟨hComm, hTrue⟩


theorem attemptRoute_intro
    {p : Person} {o : Offense} {obj : Offense} {c : ComplaintText}
    (hIntent : IntendsToCommitTheObjectOffense p obj c)
    (hStep : TakesASubstantialStepTowardTheObjectOffense p o obj c) :
    AttemptRoute p o obj c :=
  ⟨hIntent, hStep⟩


theorem conspiracyRoute_intro
    {p : Person} {obj : Offense} {ag : Agreement} {c : ComplaintText}
    (hAgree : AgreementAmongTwoOrMore ag c)
    (hJoin : JoinsTheAgreement p ag c)
    (hObject : TheAgreementsObjectIsTheOffense ag obj c) :
    ConspiracyRoute p obj ag c :=
  ⟨hAgree, hJoin, hObject⟩


theorem inchoateModalityUnderParagraph2_intro_threat
    {p : Person} {o : Offense} {obj : Offense} {ag : Agreement} {c : ComplaintText}
    (h : ThreatRoute p o obj c) :
    InchoateModalityUnderParagraph2 p o obj ag c := .threat h


theorem inchoateModalityUnderParagraph2_intro_attempt
    {p : Person} {o : Offense} {obj : Offense} {ag : Agreement} {c : ComplaintText}
    (h : AttemptRoute p o obj c) :
    InchoateModalityUnderParagraph2 p o obj ag c := .attempt h


theorem inchoateModalityUnderParagraph2_intro_conspiracy
    {p : Person} {o : Offense} {obj : Offense} {ag : Agreement} {c : ComplaintText}
    (h : ConspiracyRoute p obj ag c) :
    InchoateModalityUnderParagraph2 p o obj ag c := .conspiracy h



theorem section2332bA2_intro
    {p : Person} {o : Offense} {obj : Offense} {v : Person} {pr : Property}
    {ag : Agreement} {c : ComplaintText}
    (hModality : InchoateModalityUnderParagraph2 p o obj ag c)
    (hObject : Section2332bA1 p obj v pr c) :
    Section2332bA2 p o obj v pr ag c :=
  ⟨hModality, hObject⟩


theorem section2332bA_intro_substantive
    {p : Person} {o : Offense} {obj : Offense} {v : Person} {pr : Property}
    {ag : Agreement} {c : ComplaintText}
    (h : Section2332bA1 p o v pr c) :
    Section2332bA p o obj v pr ag c := .substantive h


theorem section2332bA_intro_inchoate
    {p : Person} {o : Offense} {obj : Offense} {v : Person} {pr : Property}
    {ag : Agreement} {c : ComplaintText}
    (h : Section2332bA2 p o obj v pr ag c) :
    Section2332bA p o obj v pr ag c := .inchoate h




theorem offenderRoleUnderSubsectionB_intro_principal
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : IsAPrincipalOfTheOffense p o c) :
    OffenderRoleUnderSubsectionB p o c := .principal h


theorem offenderRoleUnderSubsectionB_intro_coconspirator
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : IsACoconspiratorOfTheOffense p o c) :
    OffenderRoleUnderSubsectionB p o c := .coconspirator h


theorem offenderRoleUnderSubsectionB_intro_accessoryAfterTheFact
    {p : Person} {o : Offense} {c : ComplaintText}
    (h : IsAnAccessoryAfterTheFactToTheOffense p o c) :
    OffenderRoleUnderSubsectionB p o c := .accessoryAfterTheFact h


theorem jurisdictionUnderSubsectionB_intro
    {p : Person} {o : Offense} {v : Person} {pr : Property} {c : ComplaintText}
    (hRole : OffenderRoleUnderSubsectionB p o c)
    (hCirc : CircumstanceUnderSubsectionB o v pr c) :
    JurisdictionUnderSubsectionB p o v pr c :=
  ⟨hRole, hCirc⟩




theorem capitalOrLifeExposure_intro_killing
    {p : Person} {o : Offense} {v : Person} {c : ComplaintText}
    (h : KillsPerson p o v c) : CapitalOrLifeExposure p o v c := .killing h


theorem capitalOrLifeExposure_intro_deathResults
    {p : Person} {o : Offense} {v : Person} {c : ComplaintText}
    (h : DeathResultsFromConductProhibitedByThisSection o v c) :
    CapitalOrLifeExposure p o v c := .deathResults h




theorem extraterritorialJurisdictionUnderSubsectionE_intro_offenseUnderSubsectionA
    {p : Person} {o : Offense} {obj : Offense} {v : Person} {pr : Property}
    {ag : Agreement} {c : ComplaintText}
    (h : Section2332bA p o obj v pr ag c) :
    ExtraterritorialJurisdictionUnderSubsectionE p o obj v pr ag c :=
  .offenseUnderSubsectionA h


theorem extraterritorialJurisdictionUnderSubsectionE_intro_accessoryAfterTheFact
    {p : Person} {o : Offense} {obj : Offense} {v : Person} {pr : Property}
    {ag : Agreement} {c : ComplaintText}
    (h : IsAnAccessoryAfterTheFactToTheOffense p o c) :
    ExtraterritorialJurisdictionUnderSubsectionE p o obj v pr ag c :=
  .accessoryAfterTheFact h




theorem terrorismMotive_intro_influenceGovernment
    {o : Offense} {c : ComplaintText}
    (h : CalculatedToInfluenceGovernmentByIntimidationOrCoercion o c) :
    TerrorismMotive o c := .influenceGovernment h


theorem terrorismMotive_intro_retaliate
    {o : Offense} {c : ComplaintText}
    (h : CalculatedToRetaliateAgainstGovernmentConduct o c) :
    TerrorismMotive o c := .retaliate h


theorem enumeratedTerrorismOffense_intro_title18
    {o : Offense} {c : ComplaintText}
    (h : ViolatesAnEnumeratedTitle18Provision o c) :
    EnumeratedTerrorismOffense o c := .title18 h


theorem enumeratedTerrorismOffense_intro_atomicEnergyAct
    {o : Offense} {c : ComplaintText}
    (h : ViolatesAnEnumeratedAtomicEnergyActProvision o c) :
    EnumeratedTerrorismOffense o c := .atomicEnergyAct h


theorem enumeratedTerrorismOffense_intro_title49
    {o : Offense} {c : ComplaintText}
    (h : ViolatesAnEnumeratedTitle49Provision o c) :
    EnumeratedTerrorismOffense o c := .title49 h


theorem enumeratedTerrorismOffense_intro_narcoTerrorism
    {o : Offense} {c : ComplaintText}
    (h : ViolatesSection1010ANarcoTerrorism o c) :
    EnumeratedTerrorismOffense o c := .narcoTerrorism h


theorem federalCrimeOfTerrorism_intro
    {o : Offense} {c : ComplaintText}
    (hMotive : TerrorismMotive o c)
    (hOffense : EnumeratedTerrorismOffense o c) :
    FederalCrimeOfTerrorism o c :=
  ⟨hMotive, hOffense⟩

end Proving.USC.T18.Ch113B.Wmd.Part2.Elements
