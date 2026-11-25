







import Proving.USC.T18.Ch13.Reslice.Procedure.Statute
import Proving.USC.T18.Ch13.Reslice.Procedure.Predicates
import Proving.USC.T18.Ch13.Reslice.Procedure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reslice.Procedure

open Proving.USC.Common





theorem withinSevenYearLimitation_intro {o : Offense} {t : ComplaintText}
    (h : daysFromOffenseToChargingInstrument o t ≤ sevenYearsInDays) :
    WithinSevenYearLimitation o t := h



theorem section247LimitationBar_intro {o : Offense} {t : ComplaintText}
    (hNoncapital : NoncapitalOffenseCharged o t)
    (hLate : ¬ (daysFromOffenseToChargingInstrument o t ≤ sevenYearsInDays)) :
    Section247LimitationBar o t :=
  ⟨hNoncapital, hLate⟩


theorem propertyDamageExceedsStatutoryThreshold_intro {o : Offense} {t : ComplaintText}
    (h : propertyDamageThresholdDollars < propertyDamageAmountDollars o t) :
    PropertyDamageExceedsStatutoryThreshold o t := h


theorem isFirstOffenseUnderSection248_intro {o : Offense} {t : ComplaintText}
    (h : priorConvictionsUnderSectionBeforeOffense o t = 0) :
    IsFirstOffenseUnderSection248 o t := h


theorem isSubsequentOffenseUnderSection248_intro {o : Offense} {t : ComplaintText}
    (h : 1 ≤ priorConvictionsUnderSectionBeforeOffense o t) :
    IsSubsequentOffenseUnderSection248 o t := h


theorem electionBeforeFinalJudgment_intro {a : CivilAction} {t : ComplaintText}
    (h : statutoryDamagesElectionDay a t < finalJudgmentRenderedDay a t) :
    ElectionBeforeFinalJudgment a t := h




theorem withinSevenYearLimitation_or_bar {o : Offense} {t : ComplaintText}
    (hNoncapital : NoncapitalOffenseCharged o t) :
    WithinSevenYearLimitation o t ∨ Section247LimitationBar o t := by
  by_cases h : daysFromOffenseToChargingInstrument o t ≤ sevenYearsInDays
  · exact Or.inl h
  · exact Or.inr ⟨hNoncapital, h⟩




theorem section245CertificationPrerequisite_intro
    {k : Certification} {o : Offense} {t : ComplaintText}
    (hWriting : CertificationInWritingExecuted k t)
    (hOfficial : CertifierIsSection245DesignatedOfficial k t)
    (hJudgment : CertificationJudgmentPublicInterestAndSubstantialJustice k t)
    (hCovers : CertificationCoversOffense k o t)
    (hNotDelegated : ¬ CertificationFunctionDelegated k t) :
    Section245CertificationPrerequisite k o t :=
  ⟨hWriting, hOfficial, hJudgment, hCovers, hNotDelegated⟩


theorem section247CertificationPrerequisite_intro
    {k : Certification} {o : Offense} {t : ComplaintText}
    (hWriting : CertificationInWritingExecuted k t)
    (hOfficial : CertifierIsAttorneyGeneralOrDesignee k t)
    (hJudgment : CertificationJudgmentPublicInterestAndSubstantialJustice k t)
    (hCovers : CertificationCoversOffense k o t) :
    Section247CertificationPrerequisite k o t :=
  ⟨hWriting, hOfficial, hJudgment, hCovers⟩


theorem section245ProsecutionAuthorized_intro
    {k : Certification} {o : Offense} {t : ComplaintText}
    (hCharged : Section245OffenseCharged o t)
    (hUndertaken : FederalProsecutionUndertaken o t)
    (hCertified : Section245CertificationPrerequisite k o t) :
    Section245ProsecutionAuthorized k o t :=
  ⟨hCharged, hUndertaken, hCertified⟩


theorem section245UncertifiedProsecutionDefect_intro
    {o : Offense} {t : ComplaintText}
    (hCharged : Section245OffenseCharged o t)
    (hUndertaken : FederalProsecutionUndertaken o t)
    (hNoCert : ∀ k : Certification, ¬ Section245CertificationPrerequisite k o t) :
    Section245UncertifiedProsecutionDefect o t :=
  ⟨hCharged, hUndertaken, hNoCert⟩


theorem investigationAuthorizedWithoutCertification_intro
    {o : Offense} {t : ComplaintText}
    (hInvestigated : FederalInvestigationConducted o t)
    (hNoProsecution : ¬ FederalProsecutionUndertaken o t) :
    InvestigationAuthorizedWithoutCertification o t :=
  ⟨hInvestigated, hNoProsecution⟩



theorem section245ViolationAttributable_intro
    {p : Person} {o : Offense} {t : ComplaintText}
    (hCharged : Section245OffenseCharged o t)
    (hNoSafeHarbour :
      ¬ (ActorIsLawEnforcementOfficer p t ∧
         LawEnforcementOfficerLawfullyCarryingOutDuties p t)) :
    Section245ViolationAttributable p o t :=
  ⟨hCharged, hNoSafeHarbour⟩



theorem section245ViolationAttributable_of_nonOfficer
    {p : Person} {o : Offense} {t : ComplaintText}
    (hCharged : Section245OffenseCharged o t)
    (hNotOfficer : ¬ ActorIsLawEnforcementOfficer p t) :
    Section245ViolationAttributable p o t :=
  ⟨hCharged, fun h => hNotOfficer h.1⟩




theorem section247ProsecutionTimely_intro {o : Offense} {t : ComplaintText}
    (hCharged : Section247OffenseCharged o t)
    (hCommerce : OffenseInOrAffectingInterstateCommerce o t)
    (hInstrument : ChargingInstrumentInstituted o t)
    (hNoncapital : NoncapitalOffenseCharged o t)
    (hWindow : WithinSevenYearLimitation o t) :
    Section247ProsecutionTimely o t :=
  ⟨hCharged, hCommerce, hInstrument, hNoncapital, hWindow⟩


theorem section247ProsecutionAuthorized_intro
    {k : Certification} {o : Offense} {t : ComplaintText}
    (hTimely : Section247ProsecutionTimely o t)
    (hCertified : Section247CertificationPrerequisite k o t) :
    Section247ProsecutionAuthorized k o t :=
  ⟨hTimely, hCertified⟩




theorem section248SanctionsAvailable_intro
    {p : Person} {o : Offense} {t : ComplaintText}
    (hCharged : Section248OffenseCharged o t)
    (hNotParent : ¬ ParentOrGuardianActingExclusivelyTowardOwnMinor p t)
    (hNotProtected : ¬ ExpressiveConductProtectedByFirstAmendment p t) :
    Section248SanctionsAvailable p o t :=
  ⟨hCharged, hNotParent, hNotProtected⟩


theorem section248PrivateActionReproductiveHealth_intro
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (hAggrieved : PersonAggrievedByProhibitedConduct p t)
    (hCommenced : CivilActionCommenced a t)
    (hPredicate : ClaimPredicatedOnReproductiveHealthServicesInterference a t)
    (hStanding : PlaintiffInvolvedWithReproductiveHealthServicesAtFacility p t) :
    Section248PrivateActionReproductiveHealth p a t :=
  ⟨hAggrieved, hCommenced, hPredicate, hStanding⟩


theorem section248ReligiousFreedomStanding_intro_worshipper
    {p : Person} {t : ComplaintText}
    (h : PlaintiffExercisingReligiousFreedomAtPlaceOfWorship p t) :
    Section248ReligiousFreedomStanding p t :=
  .worshipper h


theorem section248ReligiousFreedomStanding_intro_owner
    {p : Person} {t : ComplaintText}
    (h : PlaintiffOwnsOrOperatesPlaceOfReligiousWorship p t) :
    Section248ReligiousFreedomStanding p t :=
  .owner h


theorem section248PrivateActionReligiousFreedom_intro
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (hAggrieved : PersonAggrievedByProhibitedConduct p t)
    (hCommenced : CivilActionCommenced a t)
    (hPredicate : ClaimPredicatedOnReligiousFreedomInterference a t)
    (hStanding : Section248ReligiousFreedomStanding p t) :
    Section248PrivateActionReligiousFreedom p a t :=
  ⟨hAggrieved, hCommenced, hPredicate, hStanding⟩


theorem section248PrivateActionPropertyDamage_intro
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (hAggrieved : PersonAggrievedByProhibitedConduct p t)
    (hCommenced : CivilActionCommenced a t)
    (hPredicate : ClaimPredicatedOnPropertyDamage a t) :
    Section248PrivateActionPropertyDamage p a t :=
  ⟨hAggrieved, hCommenced, hPredicate⟩


theorem section248PrivateAction_intro_reproductiveHealth
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (h : Section248PrivateActionReproductiveHealth p a t) :
    Section248PrivateAction p a t :=
  .reproductiveHealth h


theorem section248PrivateAction_intro_religiousFreedom
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (h : Section248PrivateActionReligiousFreedom p a t) :
    Section248PrivateAction p a t :=
  .religiousFreedom h


theorem section248PrivateAction_intro_propertyDamage
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (h : Section248PrivateActionPropertyDamage p a t) :
    Section248PrivateAction p a t :=
  .propertyDamage h


theorem section248AttorneyGeneralAction_intro
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (hIsAg : PlaintiffIsUnitedStatesAttorneyGeneral p t)
    (hCause : ReasonableCauseToBelievePersonsInjuredByViolation p t)
    (hCommenced : CivilActionCommenced a t)
    (hVenue : ActionCommencedInUnitedStatesDistrictCourt a t) :
    Section248AttorneyGeneralAction p a t :=
  ⟨hIsAg, hCause, hCommenced, hVenue⟩


theorem section248StateAttorneyGeneralAction_intro
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (hIsStateAg : PlaintiffIsStateAttorneyGeneral p t)
    (hCause : ReasonableCauseToBelievePersonsInjuredByViolation p t)
    (hCommenced : CivilActionCommenced a t)
    (hParens : ActionBroughtAsParensPatriaeForStateResidents a t)
    (hVenue : ActionCommencedInUnitedStatesDistrictCourt a t) :
    Section248StateAttorneyGeneralAction p a t :=
  ⟨hIsStateAg, hCause, hCommenced, hParens, hVenue⟩


theorem section248CivilEnforcement_intro_private
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (h : Section248PrivateAction p a t) : Section248CivilEnforcement p a t :=
  .private' h


theorem section248CivilEnforcement_intro_unitedStates
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (h : Section248AttorneyGeneralAction p a t) : Section248CivilEnforcement p a t :=
  .unitedStates h


theorem section248CivilEnforcement_intro_state
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (h : Section248StateAttorneyGeneralAction p a t) : Section248CivilEnforcement p a t :=
  .state h


theorem section248TimelyStatutoryDamagesElection_intro
    {a : CivilAction} {t : ComplaintText}
    (hElected : StatutoryDamagesElected a t)
    (hWindow : ElectionBeforeFinalJudgment a t) :
    Section248TimelyStatutoryDamagesElection a t :=
  ⟨hElected, hWindow⟩


theorem concurrentRemediesPreserved_intro {o : Offense} {t : ComplaintText}
    (hJurisdiction : StateWouldHaveJurisdictionAbsentSection o t)
    (hRemedy : StateOrLocalPenaltyOrRemedyAvailable o t) :
    ConcurrentRemediesPreserved o t :=
  ⟨hJurisdiction, hRemedy⟩




theorem criminalReachable_intro_investigated
    {k : Certification} {o : Offense} {t : ComplaintText}
    (h : FederalInvestigationConducted o t) :
    CriminalReachable k o t .Investigated :=
  .investigated h


theorem criminalReachable_intro_certified245
    {k : Certification} {o : Offense} {t : ComplaintText}
    (hPrev : CriminalReachable k o t .Investigated)
    (hCert : Section245CertificationPrerequisite k o t) :
    CriminalReachable k o t .Certified :=
  .certified245 hPrev hCert


theorem criminalReachable_intro_certified247
    {k : Certification} {o : Offense} {t : ComplaintText}
    (hPrev : CriminalReachable k o t .Investigated)
    (hCert : Section247CertificationPrerequisite k o t) :
    CriminalReachable k o t .Certified :=
  .certified247 hPrev hCert


theorem criminalReachable_intro_charged
    {k : Certification} {o : Offense} {t : ComplaintText}
    (hPrev : CriminalReachable k o t .Certified)
    (hInstrument : ChargingInstrumentInstituted o t) :
    CriminalReachable k o t .Charged :=
  .charged hPrev hInstrument


theorem criminalReachable_intro_timeBarred
    {k : Certification} {o : Offense} {t : ComplaintText}
    (hPrev : CriminalReachable k o t .Certified)
    (hBar : Section247LimitationBar o t) :
    CriminalReachable k o t .TimeBarred :=
  .timeBarred hPrev hBar


theorem criminalReachable_intro_adjudicated
    {k : Certification} {o : Offense} {t : ComplaintText}
    (hPrev : CriminalReachable k o t .Charged)
    (hNotBarred : ¬ Section247LimitationBar o t) :
    CriminalReachable k o t .Adjudicated :=
  .adjudicated hPrev hNotBarred




theorem criminalReachable_adjudicated_of_timelySection247
    {k : Certification} {o : Offense} {t : ComplaintText}
    (hInvestigated : FederalInvestigationConducted o t)
    (hCert : Section247CertificationPrerequisite k o t)
    (hTimely : Section247ProsecutionTimely o t) :
    CriminalReachable k o t .Adjudicated :=
  .adjudicated
    (.charged (.certified247 (.investigated hInvestigated) hCert) hTimely.instrumentInstituted)
    (fun hBar => hBar.2 hTimely.withinLimitation)


theorem civilReachable_intro_aggrieved
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (h : PersonAggrievedByProhibitedConduct p t) : CivilReachable p a t .Injured :=
  .aggrieved h


theorem civilReachable_intro_enforcerCause
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (h : ReasonableCauseToBelievePersonsInjuredByViolation p t) :
    CivilReachable p a t .Injured :=
  .enforcerCause h


theorem civilReachable_intro_filed
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (hPrev : CivilReachable p a t .Injured)
    (hEnforcement : Section248CivilEnforcement p a t) :
    CivilReachable p a t .Filed :=
  .filed hPrev hEnforcement


theorem civilReachable_intro_reliefAwarded
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (hPrev : CivilReachable p a t .Filed)
    (hVenue : ActionCommencedInUnitedStatesDistrictCourt a t) :
    CivilReachable p a t .ReliefAwarded :=
  .reliefAwarded hPrev hVenue


theorem civilReachable_intro_finalJudgment
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (hPrev : CivilReachable p a t .ReliefAwarded) :
    CivilReachable p a t .FinalJudgment :=
  .finalJudgment hPrev


theorem civilReachable_reliefAwarded_of_attorneyGeneralAction
    {p : Person} {a : CivilAction} {t : ComplaintText}
    (hAction : Section248AttorneyGeneralAction p a t) :
    CivilReachable p a t .ReliefAwarded :=
  .reliefAwarded
    (.filed (.enforcerCause hAction.reasonableCause) (.unitedStates hAction))
    hAction.venue

end Proving.USC.T18.Ch13.Reslice.Procedure
