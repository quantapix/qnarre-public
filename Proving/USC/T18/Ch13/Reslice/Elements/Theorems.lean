






import Proving.USC.T18.Ch13.Reslice.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch13.Reslice.Elements



theorem federalActivity245b1_intro_voting {act : Activity} {c : ComplaintText}
    (h : VotingOrElectionActivity act c) : FederalActivity245b1 act c := .voting h

theorem federalActivity245b1_intro_federalBenefit {act : Activity} {c : ComplaintText}
    (h : FederalBenefitOrProgram act c) : FederalActivity245b1 act c := .federalBenefit h

theorem federalActivity245b1_intro_federalEmployment {act : Activity} {c : ComplaintText}
    (h : FederalEmployment act c) : FederalActivity245b1 act c := .federalEmployment h

theorem federalActivity245b1_intro_federalJury {act : Activity} {c : ComplaintText}
    (h : FederalJuryService act c) : FederalActivity245b1 act c := .federalJury h

theorem federalActivity245b1_intro_federallyAssisted {act : Activity} {c : ComplaintText}
    (h : FederallyAssistedProgram act c) : FederalActivity245b1 act c := .federallyAssisted h

theorem theory245b1_intro {d v : Person} {act : Activity} {c : ComplaintText}
    (hAct : FederalActivity245b1 act c)
    (hNexus : TargetedBecauseOfOrToDeterActivity d v act c) :
    Theory245b1 d v act c := ⟨hAct, hNexus⟩

theorem stateOrPrivateActivity245b2_intro_school
    {d : Person} {a : Act} {act : Activity} {c : ComplaintText}
    (h : PublicSchoolOrCollegeAttendance act c) :
    StateOrPrivateActivity245b2 d a act c := .school h

theorem stateOrPrivateActivity245b2_intro_stateBenefit
    {d : Person} {a : Act} {act : Activity} {c : ComplaintText}
    (h : StateBenefitOrProgram act c) :
    StateOrPrivateActivity245b2 d a act c := .stateBenefit h

theorem stateOrPrivateActivity245b2_intro_employment
    {d : Person} {a : Act} {act : Activity} {c : ComplaintText}
    (h : EmploymentOrLaborOrganization act c) :
    StateOrPrivateActivity245b2 d a act c := .employment h

theorem stateOrPrivateActivity245b2_intro_stateJury
    {d : Person} {a : Act} {act : Activity} {c : ComplaintText}
    (h : StateJuryService act c) :
    StateOrPrivateActivity245b2 d a act c := .stateJury h

theorem stateOrPrivateActivity245b2_intro_travel
    {d : Person} {a : Act} {act : Activity} {c : ComplaintText}
    (h : InterstateTravelOrCommonCarrier act c) :
    StateOrPrivateActivity245b2 d a act c := .travel h

theorem stateOrPrivateActivity245b2_intro_accommodations
    {d : Person} {a : Act} {act : Activity} {c : ComplaintText}
    (h : EnjoymentOfPublicAccommodation act c)
    (hNotExempt : ¬ SmallLodgingProprietorExemptionApplies d a c) :
    StateOrPrivateActivity245b2 d a act c := .accommodations h hNotExempt

theorem theory245b2_intro {d v : Person} {a : Act} {act : Activity} {c : ComplaintText}
    (hMotive : IntentToDiscriminate d c)
    (hAct : StateOrPrivateActivity245b2 d a act c)
    (hNexus : TargetedBecauseOfActivity d v act c) :
    Theory245b2 d v a act c := ⟨hMotive, hAct, hNexus⟩

theorem theory245b3_intro {d v : Person} {a : Act} {b : Entity} {c : ComplaintText}
    (hRiot : DuringOrIncidentToRiotOrCivilDisorder a c)
    (hBiz : VictimEngagedInBusiness v b c)
    (hCommerce : EngagedInInterstateCommerce b c) :
    Theory245b3 d v a b c := ⟨hRiot, hBiz, hCommerce⟩

theorem nondiscriminatoryParticipation245b4_intro_participating
    {d : Person} {a : Act} {v : Person} {act : Activity} {c : ComplaintText}
    (h : ParticipatingWithoutDiscrimination v act c)
    (hNotExempt : ¬ SmallLodgingProprietorExemptionApplies d a c) :
    NondiscriminatoryParticipation245b4 d a v act c := .participating h hNotExempt

theorem nondiscriminatoryParticipation245b4_intro_affording
    {d : Person} {a : Act} {v : Person} {act : Activity} {c : ComplaintText}
    (h : AffordingOpportunityOrProtectionToParticipate v c) :
    NondiscriminatoryParticipation245b4 d a v act c := .affording h

theorem theory245b4_intro {d v : Person} {a : Act} {act : Activity} {c : ComplaintText}
    (hPart : NondiscriminatoryParticipation245b4 d a v act c)
    (hNexus : TargetedBecauseOfOrToDeterActivity d v act c) :
    Theory245b4 d v a act c := ⟨hPart, hNexus⟩

theorem citizenSupport245b5_intro_aiding
    {v : Person} {act : Activity} {c : ComplaintText}
    (h : LawfullyAidingOrEncouragingParticipation v act c) :
    CitizenSupport245b5 v act c := .aiding h

theorem citizenSupport245b5_intro_speech
    {v : Person} {act : Activity} {c : ComplaintText}
    (h : ParticipatingLawfullyInSpeechOrAssembly v c) :
    CitizenSupport245b5 v act c := .speech h

theorem theory245b5_intro {d v : Person} {act : Activity} {c : ComplaintText}
    (hCitizen : IsCitizen v c)
    (hSupport : CitizenSupport245b5 v act c)
    (hNexus : TargetedBecauseOfOrToDeterActivity d v act c) :
    Theory245b5 d v act c := ⟨hCitizen, hSupport, hNexus⟩

theorem protectedActivityTheory245b_intro_federal
    {d v : Person} {a : Act} {act : Activity} {c : ComplaintText}
    (h : Theory245b1 d v act c) :
    ProtectedActivityTheory245b d v a c := .federal act h

theorem protectedActivityTheory245b_intro_stateOrPrivate
    {d v : Person} {a : Act} {act : Activity} {c : ComplaintText}
    (h : Theory245b2 d v a act c) :
    ProtectedActivityTheory245b d v a c := .stateOrPrivate act h

theorem protectedActivityTheory245b_intro_riotBusiness
    {d v : Person} {a : Act} {b : Entity} {c : ComplaintText}
    (h : Theory245b3 d v a b c) :
    ProtectedActivityTheory245b d v a c := .riotBusiness b h

theorem protectedActivityTheory245b_intro_nondiscriminatory
    {d v : Person} {a : Act} {act : Activity} {c : ComplaintText}
    (h : Theory245b4 d v a act c) :
    ProtectedActivityTheory245b d v a c := .nondiscriminatory act h

theorem protectedActivityTheory245b_intro_citizenSupport
    {d v : Person} {a : Act} {act : Activity} {c : ComplaintText}
    (h : Theory245b5 d v act c) :
    ProtectedActivityTheory245b d v a c := .citizenSupport act h

theorem section245b_intro {d v : Person} {a : Act} {c : ComplaintText}
    (hCert : AttorneyGeneralCertification245 c)
    (hForce : UsedForceOrThreatOfForce d a c)
    (hWillful : ActedWithScienter d c)
    (hInterference : InjuredIntimidatedOrInterfered d v a c)
    (hTheory : ProtectedActivityTheory245b d v a c)
    (hNotLE : ¬ LawfullyCarryingOutLawEnforcementDuties d a c) :
    Section245b d v a c := ⟨hCert, hForce, hWillful, hInterference, hTheory, hNotLE⟩



theorem section247a1_intro
    {d : Person} {rp : ReligiousProperty} {a : Act} {c : ComplaintText}
    (hCert : AttorneyGeneralCertification247 c)
    (hCommerce : OffenseAffectsInterstateCommerce a c)
    (hProp : IsReligiousRealProperty rp c)
    (hIntent : ActedWithScienter d c)
    (hDamage : DefacedDamagedOrDestroyedProperty d rp a c)
    (hMotive : BecauseOfReligiousCharacterOfProperty d rp c)
    (hTimely : WithinSevenYearLimitations d a c) :
    Section247a1 d rp a c :=
  ⟨hCert, hCommerce, hProp, hIntent, hDamage, hMotive, hTimely⟩

theorem section247a2_intro {d v : Person} {a : Act} {c : ComplaintText}
    (hCert : AttorneyGeneralCertification247 c)
    (hCommerce : OffenseAffectsInterstateCommerce a c)
    (hIntent : ActedWithScienter d c)
    (hForce : UsedForceOrThreatOfForce d a c)
    (hObstruct : ObstructedEnjoymentOfFreeExercise d v a c)
    (hTimely : WithinSevenYearLimitations d a c) :
    Section247a2 d v a c :=
  ⟨hCert, hCommerce, hIntent, hForce, hObstruct, hTimely⟩

theorem section247c_intro
    {d : Person} {rp : ReligiousProperty} {a : Act} {c : ComplaintText}
    (hCert : AttorneyGeneralCertification247 c)
    (hProp : IsReligiousRealProperty rp c)
    (hIntent : ActedWithScienter d c)
    (hDamage : DefacedDamagedOrDestroyedProperty d rp a c)
    (hMotive : IntentToDiscriminate d c)
    (hAssoc : MotiveDirectedAtIndividualAssociatedWithProperty d rp c)
    (hTimely : WithinSevenYearLimitations d a c) :
    Section247c d rp a c :=
  ⟨hCert, hProp, hIntent, hDamage, hMotive, hAssoc, hTimely⟩

theorem section247Violation_intro_religiousCharacter
    {d : Person} {rp : ReligiousProperty} {a : Act} {c : ComplaintText}
    (h : Section247a1 d rp a c) : Section247Violation d a c := .religiousCharacter rp h

theorem section247Violation_intro_freeExercise
    {d v : Person} {a : Act} {c : ComplaintText}
    (h : Section247a2 d v a c) : Section247Violation d a c := .freeExercise v h

theorem section247Violation_intro_raceColorEthnicity
    {d : Person} {rp : ReligiousProperty} {a : Act} {c : ComplaintText}
    (h : Section247c d rp a c) : Section247Violation d a c := .raceColorEthnicity rp h



theorem means248a_intro_forceOrThreat {d : Person} {a : Act} {c : ComplaintText}
    (h : UsedForceOrThreatOfForce d a c) : Means248a d a c := .forceOrThreat h

theorem means248a_intro_physicalObstruction {d : Person} {a : Act} {c : ComplaintText}
    (h : UsedPhysicalObstruction d a c) : Means248a d a c := .physicalObstruction h

theorem conduct248a1_intro {d v : Person} {a : Act} {c : ComplaintText}
    (hMeans : Means248a d a c)
    (hIntent : ActedWithScienter d c)
    (hInterference : InjuredIntimidatedOrInterfered d v a c)
    (hNexus : TargetedBecauseOfOrToDeterReproductiveHealthServices d v c) :
    Conduct248a1 d v a c := ⟨hMeans, hIntent, hInterference, hNexus⟩

theorem conduct248a2_intro
    {d v : Person} {w : WorshipPlace} {a : Act} {c : ComplaintText}
    (hMeans : Means248a d a c)
    (hIntent : ActedWithScienter d c)
    (hInterference : InjuredIntimidatedOrInterfered d v a c)
    (hExercising : LawfullyExercisingReligiousFreedomAtWorshipPlace v w c) :
    Conduct248a2 d v w a c := ⟨hMeans, hIntent, hInterference, hExercising⟩

theorem conduct248a3_intro_facility
    {d : Person} {f : Facility} {a : Act} {c : ComplaintText}
    (hProvides : FacilityProvidesReproductiveHealthServices f c)
    (hIntent : ActedWithScienter d c)
    (hDamage : DamagedOrDestroyedFacilityProperty d f a c)
    (hMotive : BecauseFacilityProvidesReproductiveHealthServices d f c) :
    Conduct248a3 d a c := .facility f hProvides hIntent hDamage hMotive

theorem conduct248a3_intro_worshipPlace
    {d : Person} {w : WorshipPlace} {a : Act} {c : ComplaintText}
    (hIntent : ActedWithScienter d c)
    (hDamage : DamagedOrDestroyedWorshipPlaceProperty d w a c) :
    Conduct248a3 d a c := .worshipPlace w hIntent hDamage

theorem prohibitedConduct248a_intro_reproductiveHealth
    {d v : Person} {a : Act} {c : ComplaintText}
    (h : Conduct248a1 d v a c) : ProhibitedConduct248a d a c := .reproductiveHealth v h

theorem prohibitedConduct248a_intro_religiousFreedom
    {d v : Person} {w : WorshipPlace} {a : Act} {c : ComplaintText}
    (h : Conduct248a2 d v w a c) : ProhibitedConduct248a d a c := .religiousFreedom v w h

theorem prohibitedConduct248a_intro_propertyDamage
    {d : Person} {a : Act} {c : ComplaintText}
    (h : Conduct248a3 d a c) : ProhibitedConduct248a d a c := .propertyDamage h

theorem section248a_intro {d : Person} {a : Act} {c : ComplaintText}
    (hConduct : ProhibitedConduct248a d a c)
    (hNotParental : ¬ ParentOrGuardianActingExclusivelyTowardMinor d a c)
    (hNotSpeech : ¬ ProtectedFirstAmendmentExpressiveConduct d a c) :
    Section248a d a c := ⟨hConduct, hNotParental, hNotSpeech⟩

theorem standingClass248c1_intro_reproductiveHealthParticipant
    {pl : Person} {c : ComplaintText}
    (h : InvolvedInProvidingOrObtainingServices pl c) :
    StandingClass248c1 pl c := .reproductiveHealthParticipant h

theorem standingClass248c1_intro_worshipParticipant
    {pl : Person} {w : WorshipPlace} {c : ComplaintText}
    (h : LawfullyExercisingReligiousFreedomAtWorshipPlace pl w c) :
    StandingClass248c1 pl c := .worshipParticipant w h

theorem standingClass248c1_intro_worshipEntity
    {pl : Person} {w : WorshipPlace} {c : ComplaintText}
    (h : OwnsOrOperatesPlaceOfWorship pl w c) :
    StandingClass248c1 pl c := .worshipEntity w h

theorem validFaceActClaim_intro {pl d : Person} {a : Act} {c : ComplaintText}
    (hViolation : Section248a d a c)
    (hStanding : StandingClass248c1 pl c)
    (hAggrieved : AggrievedByProhibitedConduct pl a c)
    (hCausation : ProximateCause pl c)
    (hTimely : WithinLimitations pl c) :
    ValidFaceActClaim pl d a c :=
  ⟨hViolation, hStanding, hAggrieved, hCausation, hTimely⟩

theorem attorneyGeneralCivilAction248c2_intro
    {d : Person} {a : Act} {c : ComplaintText}
    (hViolation : Section248a d a c)
    (hCause : ReasonableCauseToBelieveInjury c) :
    AttorneyGeneralCivilAction248c2 d a c := ⟨hViolation, hCause⟩

theorem stateAttorneyGeneralCivilAction248c3_intro
    {d : Person} {a : Act} {c : ComplaintText}
    (hViolation : Section248a d a c)
    (hCause : ReasonableCauseToBelieveInjury c)
    (hParens : ParensPatriaeOnBehalfOfResidents c) :
    StateAttorneyGeneralCivilAction248c3 d a c := ⟨hViolation, hCause, hParens⟩

end Proving.USC.T18.Ch13.Reslice.Elements
