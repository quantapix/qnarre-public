





import Proving.USC.T18.Ch73.Reslice.Deontic.Types
import Proving.USC.T18.Ch73.Reslice.Deontic.Predicates
import Proving.USC.T18.Ch73.Reslice.Deontic.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Deontic

open Proving.USC.Common




theorem defense1512e_intro {p : Person} {c : ComplaintText}
    (hLawful : AffirmativeDefenseLawfulTruthfulPersuasion1512e p c)
    (hBurden : DefendantCarriedPreponderanceBurden1512e p c) :
    Defense1512e p c :=
  ⟨hLawful, hBurden⟩


theorem escape1512_defense_intro {p : Person} {c : ComplaintText}
    (h : Defense1512e p c) : Escape1512 p c :=
  Or.inl h


theorem escape1512_representation_intro {p : Person} {c : ComplaintText}
    (h : LawfulBonaFideLegalRepresentation1515c p c) : Escape1512 p c :=
  Or.inr h



theorem escape1512_none_intro {p : Person} {c : ComplaintText}
    (hNoDefense : ¬ Defense1512e p c)
    (hNoRepresentation : ¬ LawfulBonaFideLegalRepresentation1515c p c) :
    ¬ Escape1512 p c :=
  fun h => h.elim hNoDefense hNoRepresentation




theorem obstructiveIntent1512a1_proceeding_intro {p : Person} {c : ComplaintText}
    (pr : OfficialProceeding)
    (hProceeding : IsOfficialProceeding1515a1 pr c)
    (hIntent : IntentToPreventOrInfluenceTestimonyOrEvidence1512 p pr c) :
    ObstructiveIntent1512a1 p c :=
  .proceeding pr hProceeding hIntent


theorem obstructiveIntent1512a1_communication_intro {p : Person} {c : ComplaintText}
    (o : Person)
    (hOfficer : IsLawEnforcementOfficerOrJudge1515a4 o c)
    (hIntent : IntentToHinderLawEnforcementCommunication1512 p o c) :
    ObstructiveIntent1512a1 p c :=
  .communication o hOfficer hIntent


theorem prohibition1512a1_intro {p : Person} {c : ComplaintText}
    (hAddressee : IsPersonSubjectToSection1512 p c)
    (hCondition : ObstructiveIntent1512a1 p c) :
    Prohibition1512a1 p c :=
  ⟨hAddressee, hCondition⟩


theorem prohibition1512a1Violated_intro {p : Person} {v : Person} {c : ComplaintText}
    (hNorm : Prohibition1512a1 p c)
    (hAct : KillsOrAttemptsToKill1512a1 p v c)
    (hNoEscape : ¬ Escape1512 p c) :
    Prohibition1512a1Violated p v c :=
  ⟨hNorm, hAct, hNoEscape⟩




theorem obstructiveIntent1512a2b_proceeding_intro {p : Person} {c : ComplaintText}
    (pr : OfficialProceeding)
    (hProceeding : IsOfficialProceeding1515a1 pr c)
    (hIntent : IntentToPreventOrInfluenceTestimonyOrEvidence1512 p pr c) :
    ObstructiveIntent1512a2b p c :=
  .proceeding pr hProceeding hIntent


theorem obstructiveIntent1512a2b_inducement_intro {p : Person} {c : ComplaintText}
    (v : Person) (pr : OfficialProceeding)
    (hProceeding : IsOfficialProceeding1515a1 pr c)
    (hIntent : IntentToInduceWitnessNoncompliance1512 p v pr c) :
    ObstructiveIntent1512a2b p c :=
  .inducement v pr hProceeding hIntent


theorem obstructiveIntent1512a2b_communication_intro {p : Person} {c : ComplaintText}
    (o : Person)
    (hOfficer : IsLawEnforcementOfficerOrJudge1515a4 o c)
    (hIntent : IntentToHinderLawEnforcementCommunication1512 p o c) :
    ObstructiveIntent1512a2b p c :=
  .communication o hOfficer hIntent


theorem act1512a2_intro {p : Person} {v : Person} {c : ComplaintText}
    (hConduct : UsesOrThreatensPhysicalForce1512a2 p v c)
    (hQualifies : IsPhysicalForce1515a2 p v c) :
    Act1512a2 p v c :=
  ⟨hConduct, hQualifies⟩


theorem prohibition1512a2_intro {p : Person} {c : ComplaintText}
    (hAddressee : IsPersonSubjectToSection1512 p c)
    (hCondition : ObstructiveIntent1512a2b p c) :
    Prohibition1512a2 p c :=
  ⟨hAddressee, hCondition⟩


theorem prohibition1512a2Violated_intro {p : Person} {v : Person} {c : ComplaintText}
    (hNorm : Prohibition1512a2 p c)
    (hAct : Act1512a2 p v c)
    (hNoEscape : ¬ Escape1512 p c) :
    Prohibition1512a2Violated p v c :=
  ⟨hNorm, hAct, hNoEscape⟩




theorem act1512b_intimidation_intro {p : Person} {v : Person} {c : ComplaintText}
    (hAct : UsesIntimidationOrThreatens1512b p v c) :
    Act1512b p v c :=
  .intimidation hAct



theorem act1512b_corruptPersuasion_intro {p : Person} {v : Person} {c : ComplaintText}
    (hAct : CorruptlyPersuades1515a6 p v c)
    (hNotCarvedOut : ¬ WouldBeMisleadingConductButForStateOfMind1515a6 p v c) :
    Act1512b p v c :=
  .corruptPersuasion hAct hNotCarvedOut


theorem act1512b_misleadingConduct_intro {p : Person} {v : Person} {c : ComplaintText}
    (hAct : IsMisleadingConduct1515a3 p v c) :
    Act1512b p v c :=
  .misleadingConduct hAct


theorem prohibition1512b_intro {p : Person} {c : ComplaintText}
    (hAddressee : IsPersonSubjectToSection1512 p c)
    (hScienter : ActedKnowingly1512b p c)
    (hCondition : ObstructiveIntent1512a2b p c) :
    Prohibition1512b p c :=
  ⟨hAddressee, hScienter, hCondition⟩


theorem prohibition1512bViolated_intro {p : Person} {v : Person} {c : ComplaintText}
    (hNorm : Prohibition1512b p c)
    (hAct : Act1512b p v c)
    (hNoEscape : ¬ Escape1512 p c) :
    Prohibition1512bViolated p v c :=
  ⟨hNorm, hAct, hNoEscape⟩




theorem act1512c_recordImpairment_intro {p : Person} {c : ComplaintText}
    (pr : OfficialProceeding)
    (hProceeding : IsOfficialProceeding1515a1 pr c)
    (hAct : CorruptlyAltersDestroysOrConceals1512c1 p pr c)
    (hIntent : IntentToImpairObjectIntegrity1512c1 p pr c) :
    Act1512c p c :=
  .recordImpairment pr hProceeding hAct hIntent


theorem act1512c_otherObstruction_intro {p : Person} {c : ComplaintText}
    (pr : OfficialProceeding)
    (hProceeding : IsOfficialProceeding1515a1 pr c)
    (hAct : CorruptlyObstructsOfficialProceeding1512c2 p pr c) :
    Act1512c p c :=
  .otherObstruction pr hProceeding hAct


theorem prohibition1512c_intro {p : Person} {c : ComplaintText}
    (hAddressee : IsPersonSubjectToSection1512 p c)
    (hScienter : ActedCorruptly1512c p c) :
    Prohibition1512c p c :=
  ⟨hAddressee, hScienter⟩


theorem prohibition1512cViolated_intro {p : Person} {c : ComplaintText}
    (hNorm : Prohibition1512c p c)
    (hAct : Act1512c p c)
    (hNoEscape : ¬ Escape1512 p c) :
    Prohibition1512cViolated p c :=
  ⟨hNorm, hAct, hNoEscape⟩




theorem protectedActivity1512d_attendOrTestify_intro {v : Person} {c : ComplaintText}
    (h : DissuadedFromAttendingOrTestifying1512d1 v c) : ProtectedActivity1512d v c :=
  .attendOrTestify h


theorem protectedActivity1512d_reportToLawEnforcement_intro {v : Person} {c : ComplaintText}
    (h : DissuadedFromReportingToLawEnforcement1512d2 v c) : ProtectedActivity1512d v c :=
  .reportToLawEnforcement h


theorem protectedActivity1512d_seekArrest_intro {v : Person} {c : ComplaintText}
    (h : DissuadedFromSeekingArrest1512d3 v c) : ProtectedActivity1512d v c :=
  .seekArrest h


theorem protectedActivity1512d_causeProsecution_intro {v : Person} {c : ComplaintText}
    (h : DissuadedFromCausingProsecution1512d4 v c) : ProtectedActivity1512d v c :=
  .causeProsecution h


theorem prohibition1512d_intro {p : Person} {c : ComplaintText}
    (hAddressee : IsPersonSubjectToSection1512 p c)
    (hScienter : ActedIntentionally1512d p c) :
    Prohibition1512d p c :=
  ⟨hAddressee, hScienter⟩


theorem prohibition1512dViolated_intro {p : Person} {v : Person} {c : ComplaintText}
    (hNorm : Prohibition1512d p c)
    (hHarass : IntentionallyHarasses1512d p v c)
    (hCause : HarassmentCausedDissuasion1512d p v c)
    (hActivity : ProtectedActivity1512d v c)
    (hNoEscape : ¬ Escape1512 p c) :
    Prohibition1512dViolated p v c :=
  ⟨hNorm, hHarass, hCause, hActivity, hNoEscape⟩




theorem prohibition1512k_intro {p : Person} {c : ComplaintText}
    (hAddressee : IsPersonSubjectToSection1512 p c) :
    Prohibition1512k p c :=
  ⟨hAddressee⟩


theorem prohibition1512kViolated_intro {p : Person} {c : ComplaintText}
    (hNorm : Prohibition1512k p c)
    (hAct : ConspiresToCommitSection1512Offense1512k p c)
    (hNoEscape : ¬ Escape1512 p c) :
    Prohibition1512kViolated p c :=
  ⟨hNorm, hAct, hNoEscape⟩




theorem section1512Offense_killing_intro {p : Person} {c : ComplaintText}
    (v : Person) (h : Prohibition1512a1Violated p v c) : Section1512Offense p c :=
  .killing v h


theorem section1512Offense_force_intro {p : Person} {c : ComplaintText}
    (v : Person) (h : Prohibition1512a2Violated p v c) : Section1512Offense p c :=
  .force v h


theorem section1512Offense_tampering_intro {p : Person} {c : ComplaintText}
    (v : Person) (h : Prohibition1512bViolated p v c) : Section1512Offense p c :=
  .tampering v h


theorem section1512Offense_obstruction_intro {p : Person} {c : ComplaintText}
    (h : Prohibition1512cViolated p c) : Section1512Offense p c :=
  .obstruction h


theorem section1512Offense_harassment_intro {p : Person} {c : ComplaintText}
    (v : Person) (h : Prohibition1512dViolated p v c) : Section1512Offense p c :=
  .harassment v h


theorem section1512Offense_conspiracy_intro {p : Person} {c : ComplaintText}
    (h : Prohibition1512kViolated p c) : Section1512Offense p c :=
  .conspiracy h




theorem power1512h_intro {e : Entity} {p : Person} {c : ComplaintText}
    (hAddressee : IsUnitedStatesAsProsecutor1512 e c)
    (hOffense : Section1512Offense p c) :
    Power1512h e p c :=
  ⟨hAddressee, hOffense⟩


theorem extraterritorialPowerHeld1512h_intro {e : Entity} {p : Person} {c : ComplaintText}
    (hPower : Power1512h e p c)
    (hOutside : OffenseCommittedOutsideUnitedStates1512h p c) :
    ExtraterritorialPowerHeld1512h e p c :=
  ⟨hPower, hOutside⟩




theorem venueGround1512i_intendedProceeding_intro
    {d : District} {p : Person} {c : ComplaintText}
    (pr : OfficialProceeding)
    (hProceeding : IsOfficialProceeding1515a1 pr c)
    (hGround : DistrictWhereProceedingIntendedToBeAffected1512i d pr c) :
    VenueGround1512i d p c :=
  .intendedProceeding pr hProceeding hGround


theorem venueGround1512i_conductLocus_intro
    {d : District} {p : Person} {c : ComplaintText}
    (hGround : DistrictWhereConductOccurred1512i d p c) :
    VenueGround1512i d p c :=
  .conductLocus hGround


theorem permission1512i_intro
    {e : Entity} {d : District} {p : Person} {c : ComplaintText}
    (hAddressee : IsUnitedStatesAsProsecutor1512 e c)
    (hOffense : Section1512Offense p c)
    (hGround : VenueGround1512i d p c) :
    Permission1512i e d p c :=
  ⟨hAddressee, hOffense, hGround⟩


theorem permission1512iExercised_intro
    {e : Entity} {d : District} {p : Person} {c : ComplaintText}
    (hPermission : Permission1512i e d p c)
    (hAct : ProsecutionBroughtInDistrict1512i e d c) :
    Permission1512iExercised e d p c :=
  ⟨hPermission, hAct⟩




theorem obligation1512j_intro
    {e : Entity} {p : Person} {k : CriminalCase} {c : ComplaintText}
    (hAddressee : IsSentencingCourt1512j e c)
    (hOffense : Section1512Offense p c)
    (hCondition : OffenseOccurredInConnectionWithCriminalTrial1512j p k c) :
    Obligation1512j e p k c :=
  ⟨hAddressee, hOffense, hCondition⟩


theorem obligation1512jDischarged_intro
    {e : Entity} {p : Person} {k : CriminalCase} {c : ComplaintText}
    (hObligation : Obligation1512j e p k c)
    (hAct : MaximumTermSetToHigherAlternative1512j e p k c) :
    Obligation1512jDischarged e p k c :=
  ⟨hObligation, hAct⟩



theorem obligation1512jBreached_intro
    {e : Entity} {p : Person} {k : CriminalCase} {c : ComplaintText}
    (hObligation : Obligation1512j e p k c)
    (hNotDone : ¬ MaximumTermSetToHigherAlternative1512j e p k c) :
    Obligation1512jBreached e p k c :=
  ⟨hObligation, hNotDone⟩

end Proving.USC.T18.Ch73.Reslice.Deontic
