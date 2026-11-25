












import Proving.USC.T18.Ch13.Elements.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Ch13.Elements

open Proving.USC.Common




structure Section241Conspiracy (ag : Agreement) (victim : Person) (c : ComplaintText) : Prop where
  agreement    : AgreementAmongTwoOrMore ag c
  object       : ConspiracyToInjureOppressThreatenIntimidate ag c
  victim       : IsPersonInUS victim c
  federalRight : RightSecuredByConstitutionOrLaws c
  aim          : AimedAtFederalRightExercise c


structure Section241Disguise (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  disguise     : GoInDisguiseToHinderRight p c
  federalRight : RightSecuredByConstitutionOrLaws c
  victim       : IsPersonInUS victim c


inductive ViolationOfSection241 (ag : Agreement) (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  | conspiracy (h : Section241Conspiracy ag victim c)
  | disguise   (h : Section241Disguise p victim c)




inductive Section242Wrong (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  | deprivation (h : DeprivesOfSecuredRight p victim c)
  | disparate   (h : SubjectsToDifferentPunishmentByRaceOrAlienage p victim c)


structure Section242 (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  colorOfLaw    : ActsUnderColorOfStateLaw p c
  willful       : ActedWithScienter p c
  victimIsPerson : IsPersonInUS victim c
  wrong         : Section242Wrong p victim c




structure Section243 (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  officer   : IsOfficerChargedWithJurorSelection p c
  exclusion : ExcludesOrFailsToSummonCitizen p victim c
  qualified : CitizenPossessesJurorQualifications victim c
  ground    : OnProtectedGround victim c





structure Section244 (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  proprietor    : IsProprietorOfPublicEntertainmentPlace p c
  locus         : LocatedInFederalEnclaveJurisdiction c
  discriminates : CausesDiscriminationAgainstUniformedPerson p victim c
  becauseUniform : BecauseOfArmedForcesUniform c




inductive FederallyProtectedActivity (c : ComplaintText) : Prop where
  | federal       (h : InterferesWithFederalActivity c)
  | state         (h : InterferesWithStateActivityOnProtectedGround c)
  | riot          (h : InterferesWithCommerceParticipantDuringRiot c)
  | participation (h : InterferesWithProtectedParticipationOrAiding c)



structure Section245 (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  force            : ByForceOrThreatOfForce p c
  act              : InjuresIntimidatesOrInterferes p victim c
  willful          : ActedWithScienter p c
  activity         : FederallyProtectedActivity c
  certification    : AttorneyGeneralCertification c
  notLawEnforcement : ¬ LawfullyActingLawEnforcementOfficer p c





structure Section246 (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  deprives : DeprivesOfReliefBenefit p victim c
  funded   : BenefitFundedByReliefAppropriation c
  ground   : OnProhibitedGround246 victim c





structure Section247DamageReligiousCharacter (p : Person) (rp : ReligiousRealProperty) (c : ComplaintText) : Prop where
  act      : IntentionallyDamagesReligiousProperty p rp c
  motive   : BecauseOfReligiousCharacter rp c
  commerce : FederalJurisdictionalNexus c



structure Section247Obstruction (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  act      : IntentionallyObstructsFreeExerciseByForce p victim c
  commerce : FederalJurisdictionalNexus c



structure Section247DamageRacial (p : Person) (rp : ReligiousRealProperty) (c : ComplaintText) : Prop where
  act    : IntentionallyDamagesReligiousProperty p rp c
  motive : BecauseOfRaceColorEthnicityOfAssociated rp c


inductive Section247Offense (p : Person) (rp : ReligiousRealProperty) (victim : Person) (c : ComplaintText) : Prop where
  | religiousCharacter (h : Section247DamageReligiousCharacter p rp c)
  | obstruction        (h : Section247Obstruction p victim c)
  | racial             (h : Section247DamageRacial p rp c)



def Section247WithinLimitations (c : ComplaintText) : Prop :=
  ∃ n : Nat, ChargeFiledYearsAfterOffense n c ∧ n ≤ 7



structure ProsecutableSection247 (p : Person) (rp : ReligiousRealProperty) (victim : Person) (c : ComplaintText) : Prop where
  offense       : Section247Offense p rp victim c
  certification : AttorneyGeneralCertification c
  timely        : Section247WithinLimitations c





inductive ProhibitedConductSection248 (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  | reproductive (force : ByForceThreatOrPhysicalObstruction p c)
                 (h : IntentionallyInterferesWithReproductiveHealthAccess p victim c)
  | worship      (force : ByForceThreatOrPhysicalObstruction p c)
                 (h : IntentionallyInterferesWithReligiousWorship p victim c)
  | property     (h : IntentionallyDamagesFacilityOrWorshipProperty p c)



structure Section248CivilClaim (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  conduct      : ProhibitedConductSection248 p victim c
  intent       : ActedWithScienter p c
  standing     : IsPersonAggrievedByProhibitedConduct victim c
  privateRight : HasPrivateRightOfAction victim c





inductive BiasMotivation249 (victim : Person) (c : ComplaintText) : Prop where
  | core     (h : OnProtectedGround victim c)
  | expanded (h : BecauseOfExpandedProtectedCharacteristic victim c)


inductive Section249Offense (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  | racialViolence   (act : CausesOrAttemptsBodilyInjury p victim c) (willful : ActedWithScienter p c)
                     (bias : OnProtectedGround victim c)
  | expandedViolence (act : CausesOrAttemptsBodilyInjury p victim c) (willful : ActedWithScienter p c)
                     (bias : BecauseOfExpandedProtectedCharacteristic victim c)
                     (commerce : FederalJurisdictionalNexus c)
  | maritime         (act : CausesOrAttemptsBodilyInjury p victim c) (willful : ActedWithScienter p c)
                     (bias : BiasMotivation249 victim c)
                     (juris : WithinSpecialMaritimeTerritorialJurisdiction c)



def Section249WithinLimitations (c : ComplaintText) : Prop :=
  OffenseResultedInDeath c ∨ (∃ n : Nat, ChargeFiledYearsAfterOffense n c ∧ n ≤ 7)



structure ProsecutableSection249 (p : Person) (victim : Person) (c : ComplaintText) : Prop where
  offense       : Section249Offense p victim c
  certification : AttorneyGeneralCertification c
  timely        : Section249WithinLimitations c





structure Section250 (p : Person) (c : ComplaintText) : Prop where
  predicateOffense : CommitsUnderlyingCivilRightsOffense p c
  misconduct       : EngagesInSexualMisconductDuringOffense p c

end Proving.USC.T18.Ch13.Elements
