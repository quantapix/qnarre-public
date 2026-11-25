































import Proving.USC.T42.Ch6ASchI.Part3.Elements.Theorems
import Proving.USC.T42.Ch6ASchI.Part3.Deontic.Theorems
import Proving.USC.T42.Ch6ASchI.Part3.Ontology.Theorems
import Proving.USC.T42.Ch6ASchI.Part3.Procedure.Theorems
import Proving.USC.T42.Ch6ASchI.Part3.Structure.Theorems
import Proving.USC.Common.Types

namespace Proving.USC.T42.Ch6ASchI.Part3.Bridge

open Proving.USC.Common (Person Entity ComplaintText)












namespace Correspondence






axiom corr_233_phs {p : Person} {c : ComplaintText} :
    Elements.IsPHSOfficerOrEmployee p c → Ontology.IsCommissionedOfficerOrEmployee p c



axiom corr_233_scope {p : Person} {c : ComplaintText} :
    Elements.ActedWithinScopeOfEmployment p c → Ontology.ActsWithinScopeOfEmployment p c



axiom corr_233_deontic_cond {p : Person} {c : ComplaintText} :
    Elements.InjuryFromMedicalOrRelatedFunction p c →
    Elements.IsPHSOfficerOrEmployee p c →
    Elements.ActedWithinScopeOfEmployment p c →
    Deontic.Cond233aInjuryFromOfficerWithinScope p c




axiom corr_233_agcert {p : Person} {c : ComplaintText} :
    Elements.AttorneyGeneralCertifiedScopeOfEmployment p c →
    Procedure.AGCertifiedScopeOfEmployment c





axiom corr_234_license {p : Person} {c : ComplaintText} :
    Elements.ActWithinScopeOfLicense p c → Procedure.Sec234WithinScopeOfLicense c



axiom corr_234_deploy {p : Person} {c : ComplaintText} :
    Elements.StateAuthorizedDeployment p c → Procedure.Sec234AuthorizedByStateDeployment c



axiom corr_234_deontic_cond {p : Person} {c : ComplaintText} :
    Elements.Section234EmergencyResponderProtection p c →
    Deontic.Cond234RespondingWithinScope c





axiom corr_238l_20yr {e : Entity} {c : ComplaintText} :
    Elements.WithinTwentyYearRecoveryPeriod e c → Procedure.Sec238lWithinTwentyYears c




axiom corr_238l_trigger {e : Entity} {c : ComplaintText} :
    Elements.Section238lTrigger e c → Procedure.Sec238lRecoveryTriggeringDisposition c



axiom corr_238l_deontic_cond {e : Entity} {c : ComplaintText} :
    Elements.Section238lTrigger e c → Deontic.Cond238lFacilitySoldOrUseCeased c





axiom corr_218_120day {c : ComplaintText} :
    Procedure.Sec218AppointedWithin120Days c → Deontic.Cond218Within120Days c



axiom corr_218_member_appointed {p : Person} {c : ComplaintText} :
    Ontology.IsMigrantHealthCouncilMember p c → Deontic.AppointsMigrantHealthCouncil218 p c






axiom corr_237_credentials {p : Person} {c : ComplaintText} :
    Ontology.IsConteServiceMember p c → ¬ Deontic.Cond237IndividualLacksCredentials c




axiom corr_238g_wore {p : Person} {c : ComplaintText} :
    Elements.WorePHSInsigniaOrUniform p c → Deontic.WearsServiceUniform238g p c



axiom corr_238g_nonofficer {p : Person} {c : ComplaintText} :
    Elements.IsNotCommissionedOfficer p c → Deontic.IsUnauthorizedNonOfficer p c

end Correspondence

open Correspondence










theorem s233_elements_implies_ontology {p : Person} {c : ComplaintText}
    (h : Elements.Section233aExclusiveRemedy p c) : Ontology.ChanneledActor p c :=
  ⟨corr_233_phs h.phsStatus, corr_233_scope h.withinScope⟩



theorem s233_elements_implies_deontic {p : Person} {c : ComplaintText}
    (h : Elements.Section233aExclusiveRemedy p c) :
    Deontic.Cond233aInjuryFromOfficerWithinScope p c :=
  corr_233_deontic_cond h.medicalFunction h.phsStatus h.withinScope



theorem s233_elements_implies_procedure {p : Person} {c : ComplaintText}
    (h : Elements.Section233cFederalSubstitution p c) :
    Procedure.AGCertifiedScopeOfEmployment c :=
  corr_233_agcert h.certified







theorem s234_elements_implies_procedure {p : Person} {c : ComplaintText}
    (h : Elements.Section234EmergencyResponderProtection p c) :
    Procedure.Sec234WithinScopeOfLicense c ∧ Procedure.Sec234AuthorizedByStateDeployment c :=
  ⟨corr_234_license h.withinLicense, corr_234_deploy h.stateAuthorized⟩


theorem s234_elements_implies_deontic {p : Person} {c : ComplaintText}
    (h : Elements.Section234EmergencyResponderProtection p c) :
    Deontic.Cond234RespondingWithinScope c :=
  corr_234_deontic_cond h




theorem s234_elements_implies_procedure_window_modulo_gaps {p : Person} {c : ComplaintText}
    (h : Elements.Section234EmergencyResponderProtection p c)
    (gap_ninetyDayWindow : Procedure.Sec234WithinNinetyDayInitialPeriod c)
    (gap_onOrAfterEffective : Procedure.Sec234ActOnOrAfterEffectiveDate c) :
    Procedure.Sec234ImmunityWindowSatisfied c :=
  ⟨gap_ninetyDayWindow, gap_onOrAfterEffective,
   corr_234_deploy h.stateAuthorized, corr_234_license h.withinLicense⟩






theorem s238l_elements_implies_procedure {e : Entity} {c : ComplaintText}
    (h : Elements.Section238lRecovery e c) :
    Procedure.Sec238lWithinTwentyYears c ∧ Procedure.Sec238lRecoveryTriggeringDisposition c :=
  ⟨corr_238l_20yr h.withinPeriod, corr_238l_trigger h.trigger⟩



theorem s238l_elements_implies_deontic {e : Entity} {c : ComplaintText}
    (h : Elements.Section238lRecovery e c) :
    Deontic.Cond238lFacilitySoldOrUseCeased c :=
  corr_238l_deontic_cond h.trigger




theorem s238l_elements_implies_procedure_full_modulo_gaps {e : Entity} {c : ComplaintText}
    (h : Elements.Section238lRecovery e c)
    (gap_noticeTimely : Procedure.Sec238lNoticeTimely c) :
    Procedure.Sec238lRecoveryTriggered c :=
  ⟨corr_238l_trigger h.trigger, corr_238l_20yr h.withinPeriod, gap_noticeTimely⟩






theorem s218_procedure_implies_deontic {c : ComplaintText}
    (h : Procedure.Sec218TimelyCouncilAppointment c) :
    Deontic.Cond218Within120Days c :=
  corr_218_120day h.appointedTimely



theorem s218_ontology_implies_deontic {p : Person} {c : ComplaintText}
    (h : Ontology.IsMigrantHealthCouncilMember p c) :
    Deontic.AppointsMigrantHealthCouncil218 p c :=
  corr_218_member_appointed h







theorem s237_ontology_implies_deontic {p : Person} {c : ComplaintText}
    (h : Ontology.IsConteServiceMember p c) :
    ¬ Deontic.Cond237IndividualLacksCredentials c :=
  corr_237_credentials h









theorem s238g_elements_implies_deontic {p : Person} {c : ComplaintText}
    (h : Elements.Section238gUniformViolation p c) :
    Deontic.WearsServiceUniform238g p c ∧ Deontic.IsUnauthorizedNonOfficer p c :=
  ⟨corr_238g_wore h.wore, corr_238g_nonofficer h.notOfficer⟩

end Proving.USC.T42.Ch6ASchI.Part3.Bridge
