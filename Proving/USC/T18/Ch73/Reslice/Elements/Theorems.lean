






import Proving.USC.T18.Ch73.Reslice.Elements.Types
import Proving.USC.T18.Ch73.Reslice.Elements.Predicates
import Proving.USC.T18.Ch73.Reslice.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

open Proving.USC.Common (Person ComplaintText Entity Agreement ActedWithScienter
  ProximateCause AgreementAmongTwoOrMore EngagedInInterstateCommerce)

namespace Proving.USC.T18.Ch73.Reslice.Elements



theorem officialProceeding1515a1_judicial_intro {pr : OfficialProceeding} {c : ComplaintText}
    (h : IsFederalJudicialOrGrandJuryProceeding pr c) : OfficialProceeding1515a1 pr c :=
  .judicial h

theorem officialProceeding1515a1_congressional_intro {pr : OfficialProceeding}
    {c : ComplaintText} (h : IsCongressionalProceeding pr c) : OfficialProceeding1515a1 pr c :=
  .congressional h

theorem officialProceeding1515a1_agency_intro {pr : OfficialProceeding} {c : ComplaintText}
    (h : IsAuthorizedFederalAgencyProceeding pr c) : OfficialProceeding1515a1 pr c :=
  .agency h

theorem officialProceeding1515a1_insurance_intro {pr : OfficialProceeding} {e : Entity}
    {c : ComplaintText} (h : IsInsuranceRegulatoryProceeding pr c)
    (hc : EngagedInInterstateCommerce e c) : OfficialProceeding1515a1 pr c :=
  .insurance e h hc


theorem isOfficialProceeding_intro {pr : OfficialProceeding} {c : ComplaintText}
    (h : OfficialProceeding1515a1 pr c) : IsOfficialProceeding pr c := h



theorem misleadingConduct1515a3_falseStatement_intro {d v : Person} {c : ComplaintText}
    (h : KnowinglyMakesFalseStatement d v c) : MisleadingConduct1515a3 d v c :=
  .falseStatement h

theorem misleadingConduct1515a3_omissionOrConcealment_intro {d v : Person} {c : ComplaintText}
    (h : IntentionallyOmitsOrConcealsMaterialFact d v c) : MisleadingConduct1515a3 d v c :=
  .omissionOrConcealment h

theorem misleadingConduct1515a3_falseWriting_intro {d v : Person} {c : ComplaintText}
    (h : InvitesRelianceOnFalseWriting d v c) : MisleadingConduct1515a3 d v c :=
  .falseWriting h

theorem misleadingConduct1515a3_misleadingObject_intro {d v : Person} {c : ComplaintText}
    (h : InvitesRelianceOnMisleadingObject d v c) : MisleadingConduct1515a3 d v c :=
  .misleadingObject h

theorem misleadingConduct1515a3_trickSchemeOrDevice_intro {d v : Person} {c : ComplaintText}
    (h : KnowinglyUsesTrickSchemeOrDevice d v c) : MisleadingConduct1515a3 d v c :=
  .trickSchemeOrDevice h


theorem engagesInMisleadingConduct_intro {d v : Person} {c : ComplaintText}
    (h : MisleadingConduct1515a3 d v c) : EngagesInMisleadingConduct d v c := h



theorem killingConduct1512a1_kills_intro {d v : Person} {c : ComplaintText}
    (h : KillsAnotherPerson d v c) : KillingConduct1512a1 d v c := .kills h

theorem killingConduct1512a1_attempts_intro {d v : Person} {c : ComplaintText}
    (h : AttemptsToKillAnotherPerson d v c) : KillingConduct1512a1 d v c := .attempts h

theorem killingIntent1512a1_preventAttendanceOrTestimony_intro {d o : Person}
    {pr : OfficialProceeding} {c : ComplaintText} (hp : IsOfficialProceeding pr c)
    (h : IntentToPreventAttendanceOrTestimony d pr c) : KillingIntent1512a1 d pr o c :=
  .preventAttendanceOrTestimony hp h

theorem killingIntent1512a1_preventProduction_intro {d o : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (hp : IsOfficialProceeding pr c)
    (h : IntentToPreventProductionOfRecord d pr c) : KillingIntent1512a1 d pr o c :=
  .preventProduction hp h

theorem killingIntent1512a1_preventCommunication_intro {d o : Person}
    {pr : OfficialProceeding} {c : ComplaintText}
    (ho : IsFederalLawEnforcementOfficerOrJudge o c)
    (h : IntentToPreventCommunicationToFederalOfficer d o c) : KillingIntent1512a1 d pr o c :=
  .preventCommunication ho h

theorem section1512a1_intro {d v o : Person} {pr : OfficialProceeding} {c : ComplaintText}
    (hConduct : KillingConduct1512a1 d v c) (hIntent : KillingIntent1512a1 d pr o c) :
    Section1512a1 d v pr o c :=
  ⟨hConduct, hIntent⟩



theorem tamperingIntent1512_influenceTestimony_intro {d o : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (hp : IsOfficialProceeding pr c)
    (h : IntentToInfluenceDelayOrPreventTestimony d pr c) : TamperingIntent1512 d pr o c :=
  .influenceTestimony hp h

theorem tamperingIntent1512_causeWithholding_intro {d o : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (hp : IsOfficialProceeding pr c)
    (h : IntentToCauseWithholdingOfTestimonyOrObject d pr c) : TamperingIntent1512 d pr o c :=
  .causeWithholding hp h

theorem tamperingIntent1512_causeObjectImpairment_intro {d o : Person}
    {pr : OfficialProceeding} {c : ComplaintText} (hp : IsOfficialProceeding pr c)
    (h : IntentToCauseObjectImpairment d pr c) : TamperingIntent1512 d pr o c :=
  .causeObjectImpairment hp h

theorem tamperingIntent1512_causeEvasion_intro {d o : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (hp : IsOfficialProceeding pr c)
    (h : IntentToCauseEvasionOfLegalProcess d pr c) : TamperingIntent1512 d pr o c :=
  .causeEvasion hp h

theorem tamperingIntent1512_causeAbsence_intro {d o : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (hp : IsOfficialProceeding pr c)
    (h : IntentToCauseAbsenceFromProceeding d pr c) : TamperingIntent1512 d pr o c :=
  .causeAbsence hp h

theorem tamperingIntent1512_hinderCommunication_intro {d o : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (ho : IsFederalLawEnforcementOfficerOrJudge o c)
    (h : IntentToHinderCommunicationToFederalOfficer d o c) : TamperingIntent1512 d pr o c :=
  .hinderCommunication ho h

theorem forceConduct1512a2_uses_intro {d v : Person} {c : ComplaintText}
    (h : UsesPhysicalForce d v c) : ForceConduct1512a2 d v c := .uses h

theorem forceConduct1512a2_threatens_intro {d v : Person} {c : ComplaintText}
    (h : ThreatensPhysicalForce d v c) : ForceConduct1512a2 d v c := .threatens h

theorem forceConduct1512a2_attempts_intro {d v : Person} {c : ComplaintText}
    (h : AttemptsPhysicalForceOrThreat d v c) : ForceConduct1512a2 d v c := .attempts h

theorem section1512a2_intro {d v o : Person} {pr : OfficialProceeding} {c : ComplaintText}
    (hConduct : ForceConduct1512a2 d v c) (hIntent : TamperingIntent1512 d pr o c) :
    Section1512a2 d v pr o c :=
  ⟨hConduct, hIntent⟩



theorem tamperingConduct1512b_intimidation_intro {d v : Person} {c : ComplaintText}
    (h : UsesIntimidation d v c) : TamperingConduct1512b d v c := .intimidation h

theorem tamperingConduct1512b_threat_intro {d v : Person} {c : ComplaintText}
    (h : ThreatensAnotherPerson d v c) : TamperingConduct1512b d v c := .threat h

theorem tamperingConduct1512b_corruptPersuasion_intro {d v : Person} {c : ComplaintText}
    (h : CorruptlyPersuades d v c) : TamperingConduct1512b d v c := .corruptPersuasion h

theorem tamperingConduct1512b_attempt_intro {d v : Person} {c : ComplaintText}
    (h : AttemptsIntimidationThreatOrPersuasion d v c) : TamperingConduct1512b d v c :=
  .attempt h

theorem tamperingConduct1512b_misleadingConduct_intro {d v : Person} {c : ComplaintText}
    (h : EngagesInMisleadingConduct d v c) : TamperingConduct1512b d v c := .misleadingConduct h

theorem section1512b_intro {d v o : Person} {pr : OfficialProceeding} {c : ComplaintText}
    (hKnowingly : ActedWithScienter d c) (hConduct : TamperingConduct1512b d v c)
    (hIntent : TamperingIntent1512 d pr o c) : Section1512b d v pr o c :=
  ⟨hKnowingly, hConduct, hIntent⟩



theorem objectTampering1512c1_completed_intro {d : Person} {r : RecordOrObject}
    {c : ComplaintText} (h : AltersDestroysMutilatesOrConcealsObject d r c) :
    ObjectTampering1512c1 d r c := .completed h

theorem objectTampering1512c1_attempted_intro {d : Person} {r : RecordOrObject}
    {c : ComplaintText} (h : AttemptsToAlterOrConcealObject d r c) :
    ObjectTampering1512c1 d r c := .attempted h

theorem documentImpairment1512c1_intro {d : Person} {r : RecordOrObject}
    {pr : OfficialProceeding} {c : ComplaintText} (hConduct : ObjectTampering1512c1 d r c)
    (hIntent : IntentToImpairObjectForProceeding d r pr c)
    (hProceeding : IsOfficialProceeding pr c) : DocumentImpairment1512c1 d r pr c :=
  ⟨hConduct, hIntent, hProceeding⟩

theorem obstructionConduct1512c2_completed_intro {d : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (h : ObstructsInfluencesOrImpedesProceeding d pr c) :
    ObstructionConduct1512c2 d pr c := .completed h

theorem obstructionConduct1512c2_attempted_intro {d : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (h : AttemptsToObstructProceeding d pr c) :
    ObstructionConduct1512c2 d pr c := .attempted h

theorem proceedingObstruction1512c2_intro {d : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (hConduct : ObstructionConduct1512c2 d pr c)
    (hProceeding : IsOfficialProceeding pr c) : ProceedingObstruction1512c2 d pr c :=
  ⟨hConduct, hProceeding⟩

theorem section1512c_objectImpairment_intro {d : Person} {r : RecordOrObject}
    {pr : OfficialProceeding} {c : ComplaintText} (hCorrupt : ActsCorruptly d c)
    (h : DocumentImpairment1512c1 d r pr c) : Section1512c d r pr c :=
  .objectImpairment hCorrupt h

theorem section1512c_otherObstruction_intro {d : Person} {r : RecordOrObject}
    {pr : OfficialProceeding} {c : ComplaintText} (hCorrupt : ActsCorruptly d c)
    (h : ProceedingObstruction1512c2 d pr c) : Section1512c d r pr c :=
  .otherObstruction hCorrupt h



theorem harassmentEffect1512d_attendanceOrTestimony_intro {v o : Person}
    {pr : OfficialProceeding} {c : ComplaintText} (hp : IsOfficialProceeding pr c)
    (h : DissuadedFromAttendingOrTestifying v pr c) : HarassmentEffect1512d v pr o c :=
  .attendanceOrTestimony hp h

theorem harassmentEffect1512d_reporting_intro {v o : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (ho : IsFederalLawEnforcementOfficerOrJudge o c)
    (h : DissuadedFromReportingToFederalOfficer v o c) : HarassmentEffect1512d v pr o c :=
  .reporting ho h

theorem harassmentEffect1512d_arrest_intro {v o : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (h : DissuadedFromSeekingArrest v c) :
    HarassmentEffect1512d v pr o c := .arrest h

theorem harassmentEffect1512d_prosecutionOrRevocation_intro {v o : Person}
    {pr : OfficialProceeding} {c : ComplaintText}
    (h : DissuadedFromCausingProsecutionOrRevocation v c) :
    HarassmentEffect1512d v pr o c := .prosecutionOrRevocation h

theorem harassmentCompleted1512d_intro {d v o : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (hHarass : IntentionallyHarasses d v c)
    (hCause : ProximateCause d c) (hEffect : HarassmentEffect1512d v pr o c) :
    HarassmentCompleted1512d d v pr o c :=
  ⟨hHarass, hCause, hEffect⟩

theorem section1512d_completed_intro {d v o : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (h : HarassmentCompleted1512d d v pr o c) :
    Section1512d d v pr o c := .completed h

theorem section1512d_attempted_intro {d v o : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (h : IntentionallyHarasses d v c)
    (ha : AttemptsToHarassAndDissuade d v c) : Section1512d d v pr o c := .attempted h ha



theorem section1512k_intro {d : Person} {ag : Agreement} {c : ComplaintText}
    (hAgreement : AgreementAmongTwoOrMore ag c)
    (hObject : ObjectOfAgreementIsSection1512Offense ag c)
    (hJoined : KnowinglyJoinedAgreement d ag c) : Section1512k d ag c :=
  ⟨hAgreement, hObject, hJoined⟩



theorem section1512Offense_killing_intro {d v o : Person} {r : RecordOrObject}
    {pr : OfficialProceeding} {ag : Agreement} {c : ComplaintText}
    (h : Section1512a1 d v pr o c) : Section1512Offense d v r pr o ag c := .killing h

theorem section1512Offense_force_intro {d v o : Person} {r : RecordOrObject}
    {pr : OfficialProceeding} {ag : Agreement} {c : ComplaintText}
    (h : Section1512a2 d v pr o c) : Section1512Offense d v r pr o ag c := .force h

theorem section1512Offense_tampering_intro {d v o : Person} {r : RecordOrObject}
    {pr : OfficialProceeding} {ag : Agreement} {c : ComplaintText}
    (h : Section1512b d v pr o c) : Section1512Offense d v r pr o ag c := .tampering h

theorem section1512Offense_obstruction_intro {d v o : Person} {r : RecordOrObject}
    {pr : OfficialProceeding} {ag : Agreement} {c : ComplaintText}
    (h : Section1512c d r pr c) : Section1512Offense d v r pr o ag c := .obstruction h

theorem section1512Offense_harassment_intro {d v o : Person} {r : RecordOrObject}
    {pr : OfficialProceeding} {ag : Agreement} {c : ComplaintText}
    (h : Section1512d d v pr o c) : Section1512Offense d v r pr o ag c := .harassment h

theorem section1512Offense_conspiracy_intro {d v o : Person} {r : RecordOrObject}
    {pr : OfficialProceeding} {ag : Agreement} {c : ComplaintText}
    (h : Section1512k d ag c) : Section1512Offense d v r pr o ag c := .conspiracy h

theorem venue1512i_districtOfIntendedEffect_intro {d : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (h : ProsecutedWhereProceedingIntendedToBeAffected pr c) :
    Venue1512i d pr c := .districtOfIntendedEffect h

theorem venue1512i_districtOfConduct_intro {d : Person} {pr : OfficialProceeding}
    {c : ComplaintText} (h : ProsecutedWhereConductOccurred d c) :
    Venue1512i d pr c := .districtOfConduct h

theorem validSection1512Prosecution_intro {d v o : Person} {r : RecordOrObject}
    {pr : OfficialProceeding} {ag : Agreement} {c : ComplaintText}
    (hOffense : Section1512Offense d v r pr o ag c) (hVenue : VenueProper d pr c)
    (hNoDefense : ¬ LawfulConductSolelyToEncourageTruthfulTestimony d c)
    (hNoCarveOut : ¬ LawfulBonaFideLegalRepresentation d c) :
    ValidSection1512Prosecution d v r pr o ag c :=
  ⟨hOffense, hVenue, hNoDefense, hNoCarveOut⟩

end Proving.USC.T18.Ch73.Reslice.Elements
