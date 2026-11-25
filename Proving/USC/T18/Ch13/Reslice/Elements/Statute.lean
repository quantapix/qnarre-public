






import Proving.USC.T18.Ch13.Reslice.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch13.Reslice.Elements




inductive FederalActivity245b1 (act : Activity) (c : ComplaintText) : Prop where
  | voting            (h : VotingOrElectionActivity act c)
  | federalBenefit    (h : FederalBenefitOrProgram act c)
  | federalEmployment (h : FederalEmployment act c)
  | federalJury       (h : FederalJuryService act c)
  | federallyAssisted (h : FederallyAssistedProgram act c)



structure Theory245b1 (d : Person) (v : Person) (act : Activity)
    (c : ComplaintText) : Prop where
  activity : FederalActivity245b1 act c
  nexus    : TargetedBecauseOfOrToDeterActivity d v act c




inductive StateOrPrivateActivity245b2 (d : Person) (a : Act) (act : Activity)
    (c : ComplaintText) : Prop where
  | school         (h : PublicSchoolOrCollegeAttendance act c)
  | stateBenefit   (h : StateBenefitOrProgram act c)
  | employment     (h : EmploymentOrLaborOrganization act c)
  | stateJury      (h : StateJuryService act c)
  | travel         (h : InterstateTravelOrCommonCarrier act c)
  | accommodations (h : EnjoymentOfPublicAccommodation act c)
                   (hNotExempt : ¬ SmallLodgingProprietorExemptionApplies d a c)



structure Theory245b2 (d : Person) (v : Person) (a : Act) (act : Activity)
    (c : ComplaintText) : Prop where
  protectedGroundMotive : IntentToDiscriminate d c
  activity              : StateOrPrivateActivity245b2 d a act c
  nexus                 : TargetedBecauseOfActivity d v act c



structure Theory245b3 (d : Person) (v : Person) (a : Act) (b : Entity)
    (c : ComplaintText) : Prop where
  riot     : DuringOrIncidentToRiotOrCivilDisorder a c
  business : VictimEngagedInBusiness v b c
  commerce : EngagedInInterstateCommerce b c




inductive NondiscriminatoryParticipation245b4 (d : Person) (a : Act)
    (v : Person) (act : Activity) (c : ComplaintText) : Prop where
  | participating (h : ParticipatingWithoutDiscrimination v act c)
                  (hNotExempt : ¬ SmallLodgingProprietorExemptionApplies d a c)
  | affording     (h : AffordingOpportunityOrProtectionToParticipate v c)


structure Theory245b4 (d : Person) (v : Person) (a : Act) (act : Activity)
    (c : ComplaintText) : Prop where
  participation : NondiscriminatoryParticipation245b4 d a v act c
  nexus         : TargetedBecauseOfOrToDeterActivity d v act c



inductive CitizenSupport245b5 (v : Person) (act : Activity)
    (c : ComplaintText) : Prop where
  | aiding (h : LawfullyAidingOrEncouragingParticipation v act c)
  | speech (h : ParticipatingLawfullyInSpeechOrAssembly v c)



structure Theory245b5 (d : Person) (v : Person) (act : Activity)
    (c : ComplaintText) : Prop where
  citizen : IsCitizen v c
  support : CitizenSupport245b5 v act c
  nexus   : TargetedBecauseOfOrToDeterActivity d v act c


inductive ProtectedActivityTheory245b (d : Person) (v : Person) (a : Act)
    (c : ComplaintText) : Prop where
  | federal           (act : Activity) (h : Theory245b1 d v act c)
  | stateOrPrivate    (act : Activity) (h : Theory245b2 d v a act c)
  | riotBusiness      (b : Entity)     (h : Theory245b3 d v a b c)
  | nondiscriminatory (act : Activity) (h : Theory245b4 d v a act c)
  | citizenSupport    (act : Activity) (h : Theory245b5 d v act c)






structure Section245b (d : Person) (v : Person) (a : Act)
    (c : ComplaintText) : Prop where
  certification     : AttorneyGeneralCertification245 c
  forceOrThreat     : UsedForceOrThreatOfForce d a c
  willful           : ActedWithScienter d c
  interference      : InjuredIntimidatedOrInterfered d v a c
  theory            : ProtectedActivityTheory245b d v a c
  notLawEnforcement : ¬ LawfullyCarryingOutLawEnforcementDuties d a c




structure Section247a1 (d : Person) (rp : ReligiousProperty) (a : Act)
    (c : ComplaintText) : Prop where
  certification     : AttorneyGeneralCertification247 c
  commerce          : OffenseAffectsInterstateCommerce a c
  religiousProperty : IsReligiousRealProperty rp c
  intent            : ActedWithScienter d c
  damage            : DefacedDamagedOrDestroyedProperty d rp a c
  motive            : BecauseOfReligiousCharacterOfProperty d rp c
  timely            : WithinSevenYearLimitations d a c


structure Section247a2 (d : Person) (v : Person) (a : Act)
    (c : ComplaintText) : Prop where
  certification : AttorneyGeneralCertification247 c
  commerce      : OffenseAffectsInterstateCommerce a c
  intent        : ActedWithScienter d c
  forceOrThreat : UsedForceOrThreatOfForce d a c
  obstruction   : ObstructedEnjoymentOfFreeExercise d v a c
  timely        : WithinSevenYearLimitations d a c




structure Section247c (d : Person) (rp : ReligiousProperty) (a : Act)
    (c : ComplaintText) : Prop where
  certification         : AttorneyGeneralCertification247 c
  religiousProperty     : IsReligiousRealProperty rp c
  intent                : ActedWithScienter d c
  damage                : DefacedDamagedOrDestroyedProperty d rp a c
  protectedGroundMotive : IntentToDiscriminate d c
  associatedIndividual  : MotiveDirectedAtIndividualAssociatedWithProperty d rp c
  timely                : WithinSevenYearLimitations d a c


inductive Section247Violation (d : Person) (a : Act)
    (c : ComplaintText) : Prop where
  | religiousCharacter  (rp : ReligiousProperty) (h : Section247a1 d rp a c)
  | freeExercise        (v : Person)             (h : Section247a2 d v a c)
  | raceColorEthnicity  (rp : ReligiousProperty) (h : Section247c d rp a c)





inductive Means248a (d : Person) (a : Act) (c : ComplaintText) : Prop where
  | forceOrThreat       (h : UsedForceOrThreatOfForce d a c)
  | physicalObstruction (h : UsedPhysicalObstruction d a c)


structure Conduct248a1 (d : Person) (v : Person) (a : Act)
    (c : ComplaintText) : Prop where
  means        : Means248a d a c
  intent       : ActedWithScienter d c
  interference : InjuredIntimidatedOrInterfered d v a c
  nexus        : TargetedBecauseOfOrToDeterReproductiveHealthServices d v c


structure Conduct248a2 (d : Person) (v : Person) (w : WorshipPlace) (a : Act)
    (c : ComplaintText) : Prop where
  means        : Means248a d a c
  intent       : ActedWithScienter d c
  interference : InjuredIntimidatedOrInterfered d v a c
  exercising   : LawfullyExercisingReligiousFreedomAtWorshipPlace v w c




inductive Conduct248a3 (d : Person) (a : Act) (c : ComplaintText) : Prop where
  | facility     (f : Facility)
                 (hProvides : FacilityProvidesReproductiveHealthServices f c)
                 (hIntent   : ActedWithScienter d c)
                 (hDamage   : DamagedOrDestroyedFacilityProperty d f a c)
                 (hMotive   : BecauseFacilityProvidesReproductiveHealthServices d f c)
  | worshipPlace (w : WorshipPlace)
                 (hIntent : ActedWithScienter d c)
                 (hDamage : DamagedOrDestroyedWorshipPlaceProperty d w a c)


inductive ProhibitedConduct248a (d : Person) (a : Act)
    (c : ComplaintText) : Prop where
  | reproductiveHealth (v : Person) (h : Conduct248a1 d v a c)
  | religiousFreedom   (v : Person) (w : WorshipPlace) (h : Conduct248a2 d v w a c)
  | propertyDamage     (h : Conduct248a3 d a c)




structure Section248a (d : Person) (a : Act) (c : ComplaintText) : Prop where
  conduct              : ProhibitedConduct248a d a c
  notParentalException : ¬ ParentOrGuardianActingExclusivelyTowardMinor d a c
  notProtectedSpeech   : ¬ ProtectedFirstAmendmentExpressiveConduct d a c



inductive StandingClass248c1 (pl : Person) (c : ComplaintText) : Prop where
  | reproductiveHealthParticipant (h : InvolvedInProvidingOrObtainingServices pl c)
  | worshipParticipant (w : WorshipPlace)
                       (h : LawfullyExercisingReligiousFreedomAtWorshipPlace pl w c)
  | worshipEntity      (w : WorshipPlace) (h : OwnsOrOperatesPlaceOfWorship pl w c)





structure ValidFaceActClaim (pl : Person) (d : Person) (a : Act)
    (c : ComplaintText) : Prop where
  violation : Section248a d a c
  standing  : StandingClass248c1 pl c
  aggrieved : AggrievedByProhibitedConduct pl a c
  causation : ProximateCause pl c
  timely    : WithinLimitations pl c


structure AttorneyGeneralCivilAction248c2 (d : Person) (a : Act)
    (c : ComplaintText) : Prop where
  violation       : Section248a d a c
  reasonableCause : ReasonableCauseToBelieveInjury c


structure StateAttorneyGeneralCivilAction248c3 (d : Person) (a : Act)
    (c : ComplaintText) : Prop where
  violation       : Section248a d a c
  reasonableCause : ReasonableCauseToBelieveInjury c
  parensPatriae   : ParensPatriaeOnBehalfOfResidents c

end Proving.USC.T18.Ch13.Reslice.Elements
