













import Proving.USC.T18.Ch113B.Wmd.Part2.Elements.Types
import Proving.USC.T18.Ch113B.Wmd.Part2.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Elements

open Proving.USC.Common






structure ConductTranscendingNationalBoundaries
    (o : Offense) (c : ComplaintText) : Prop where
  abroad   : ConductOccurringOutsideTheUnitedStates o c
  domestic : ConductOccurringWithinTheUnitedStates o c






inductive CommerceEffectCircumstance (o : Offense) (c : ComplaintText) : Prop where
  | actual        (h : OffenseAffectsInterstateOrForeignCommerce o c)
  | ifConsummated (h : OffenseWouldHaveAffectedCommerceIfConsummated o c)




structure TerritorialSeaOfTheUnitedStates
    (o : Offense) (c : ComplaintText) : Prop where
  seaward           : OffenseCommittedInWatersSeawardOfTheBaselines o c
  withinTwelveMiles : nauticalMilesSeawardFromTheBaselines o c ≤ 12


inductive CircumstanceUnderSubsectionB
    (o : Offense) (v : Person) (pr : Property) (c : ComplaintText) : Prop where
  | facilityOfCommerce (h : MailOrFacilityOfCommerceUsedInFurtherance o c)
  | commerceEffect     (h : CommerceEffectCircumstance o c)
  | federalVictim      (h : VictimIsUnitedStatesGovernmentOrFederalPersonnel v o c)
  | federalProperty    (h : PropertyOwnedPossessedOrLeasedToTheUnitedStates pr c)
  | territorialSea     (h : TerritorialSeaOfTheUnitedStates o c)
  | specialMaritime
      (h : OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction o c)






abbrev CircumstanceProvedAgainstDefendant
    (_p : Person) (o : Offense) (v : Person) (pr : Property) (c : ComplaintText) : Prop :=
  CircumstanceUnderSubsectionB o v pr c




inductive EnumeratedViolentAct
    (p : Person) (o : Offense) (v : Person) (c : ComplaintText) : Prop where
  | kills                    (h : KillsPerson p o v c)
  | kidnaps                  (h : KidnapsPerson p o v c)
  | maims                    (h : MaimsPerson p o v c)
  | assaultSeriousInjury     (h : CommitsAssaultResultingInSeriousBodilyInjury p o v c)
  | assaultDangerousWeapon   (h : AssaultsWithADangerousWeapon p o v c)



structure ViolentActRoute
    (p : Person) (o : Offense) (v : Person) (c : ComplaintText) : Prop where
  act                : EnumeratedViolentAct p o v c
  victimWithinTheUS  : IsPersonInUS v c


inductive PropertyConductRoute
    (p : Person) (o : Offense) (pr : Property) (c : ComplaintText) : Prop where
  | destroysOrDamages  (h : DestroysOrDamagesProperty p o pr c)
  | attemptsOrConspires (h : AttemptsOrConspiresToDestroyOrDamageProperty p o pr c)





structure PropertyRiskRoute
    (p : Person) (o : Offense) (pr : Property) (c : ComplaintText) : Prop where
  risk              : CreatesSubstantialRiskOfSeriousBodilyInjury p o c
  propertyClass     : IsStructureConveyanceOrOtherProperty pr c
  propertyWithinTheUS : PropertyIsWithinTheUnitedStates pr c
  means             : PropertyConductRoute p o pr c
  riskFromMeans     : SubstantialRiskArisesFromThePropertyConduct o pr c


inductive ProhibitedConductUnderParagraph1
    (p : Person) (o : Offense) (v : Person) (pr : Property) (c : ComplaintText) : Prop where
  | violentAct   (h : ViolentActRoute p o v c)
  | propertyRisk (h : PropertyRiskRoute p o pr c)



inductive InViolationOfStateOrFederalLaw
    (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  | stateLaw   (h : ViolatesTheLawOfAnyState p o c)
  | federalLaw (h : ViolatesTheLawOfTheUnitedStates p o c)


structure Section2332bA1
    (p : Person) (o : Offense) (v : Person) (pr : Property) (c : ComplaintText) : Prop where
  transnational     : ConductTranscendingNationalBoundaries o c
  circumstance      : CircumstanceProvedAgainstDefendant p o v pr c
  prohibitedConduct : ProhibitedConductUnderParagraph1 p o v pr c
  unlawful          : InViolationOfStateOrFederalLaw p o c




structure ThreatRoute
    (p : Person) (o : Offense) (obj : Offense) (c : ComplaintText) : Prop where
  communicates : CommunicatesAThreatToCommitTheObjectOffense p o obj c
  trueThreat   : ThreatIsATrueThreat p o c



structure AttemptRoute
    (p : Person) (o : Offense) (obj : Offense) (c : ComplaintText) : Prop where
  intent         : IntendsToCommitTheObjectOffense p obj c
  substantialStep : TakesASubstantialStepTowardTheObjectOffense p o obj c



structure ConspiracyRoute
    (p : Person) (obj : Offense) (ag : Agreement) (c : ComplaintText) : Prop where
  agreement  : AgreementAmongTwoOrMore ag c
  membership : JoinsTheAgreement p ag c
  object     : TheAgreementsObjectIsTheOffense ag obj c


inductive InchoateModalityUnderParagraph2
    (p : Person) (o : Offense) (obj : Offense) (ag : Agreement) (c : ComplaintText) : Prop where
  | threat     (h : ThreatRoute p o obj c)
  | attempt    (h : AttemptRoute p o obj c)
  | conspiracy (h : ConspiracyRoute p obj ag c)





structure Section2332bA2
    (p : Person) (o : Offense) (obj : Offense) (v : Person) (pr : Property)
    (ag : Agreement) (c : ComplaintText) : Prop where
  modality      : InchoateModalityUnderParagraph2 p o obj ag c
  objectOffense : Section2332bA1 p obj v pr c


inductive Section2332bA
    (p : Person) (o : Offense) (obj : Offense) (v : Person) (pr : Property)
    (ag : Agreement) (c : ComplaintText) : Prop where
  | substantive (h : Section2332bA1 p o v pr c)
  | inchoate    (h : Section2332bA2 p o obj v pr ag c)




inductive OffenderRoleUnderSubsectionB
    (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  | principal            (h : IsAPrincipalOfTheOffense p o c)
  | coconspirator        (h : IsACoconspiratorOfTheOffense p o c)
  | accessoryAfterTheFact (h : IsAnAccessoryAfterTheFactToTheOffense p o c)




structure JurisdictionUnderSubsectionB
    (p : Person) (o : Offense) (v : Person) (pr : Property) (c : ComplaintText) : Prop where
  role         : OffenderRoleUnderSubsectionB p o c
  circumstance : CircumstanceUnderSubsectionB o v pr c





inductive CapitalOrLifeExposure
    (p : Person) (o : Offense) (v : Person) (c : ComplaintText) : Prop where
  | killing      (h : KillsPerson p o v c)
  | deathResults (h : DeathResultsFromConductProhibitedByThisSection o v c)






inductive ExtraterritorialJurisdictionUnderSubsectionE
    (p : Person) (o : Offense) (obj : Offense) (v : Person) (pr : Property)
    (ag : Agreement) (c : ComplaintText) : Prop where
  | offenseUnderSubsectionA (h : Section2332bA p o obj v pr ag c)
  | accessoryAfterTheFact   (h : IsAnAccessoryAfterTheFactToTheOffense p o c)




inductive TerrorismMotive (o : Offense) (c : ComplaintText) : Prop where
  | influenceGovernment
      (h : CalculatedToInfluenceGovernmentByIntimidationOrCoercion o c)
  | retaliate (h : CalculatedToRetaliateAgainstGovernmentConduct o c)



inductive EnumeratedTerrorismOffense (o : Offense) (c : ComplaintText) : Prop where
  | title18         (h : ViolatesAnEnumeratedTitle18Provision o c)
  | atomicEnergyAct (h : ViolatesAnEnumeratedAtomicEnergyActProvision o c)
  | title49         (h : ViolatesAnEnumeratedTitle49Provision o c)
  | narcoTerrorism  (h : ViolatesSection1010ANarcoTerrorism o c)




structure FederalCrimeOfTerrorism (o : Offense) (c : ComplaintText) : Prop where
  motive            : TerrorismMotive o c
  enumeratedOffense : EnumeratedTerrorismOffense o c

end Proving.USC.T18.Ch113B.Wmd.Part2.Elements
