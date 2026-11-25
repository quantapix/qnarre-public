

























import Proving.USC.T42.CRIPA.Elements.Statute
import Proving.USC.T42.CRIPA.Elements.Theorems
import Proving.USC.T42.CRIPA.Deontic.Statute
import Proving.USC.T42.CRIPA.Deontic.Theorems
import Proving.USC.T42.CRIPA.Ontology.Statute
import Proving.USC.T42.CRIPA.Ontology.Theorems
import Proving.USC.T42.CRIPA.Procedure.Statute
import Proving.USC.T42.CRIPA.Procedure.Theorems
import Proving.USC.T42.CRIPA.Structure.Statute
import Proving.USC.T42.CRIPA.Structure.Theorems

namespace Proving.USC.T42.CRIPA.Bridge

open Proving.USC.Common (Person ComplaintText)










namespace S1997a

variable {ag defendant : Person}
variable {iE : Proving.USC.T42.CRIPA.Elements.Institution}
variable {iD : Proving.USC.T42.CRIPA.Deontic.Institution}
variable {iP : Proving.USC.T42.CRIPA.Procedure.Institution}
variable {iO : Proving.USC.T42.CRIPA.Ontology.Institution}
variable {pO : Proving.USC.T42.CRIPA.Ontology.InstitutionalizedPerson}
variable {xO : Proving.USC.T42.CRIPA.Ontology.Conditions}
variable {patO : Proving.USC.T42.CRIPA.Ontology.PatternOrPractice}
variable {aP : Proving.USC.T42.CRIPA.Procedure.Action}
variable {certE : Proving.USC.T42.CRIPA.Elements.Certification}
variable {c : ComplaintText}





axiom corr_ag_isAttorneyGeneral :
    Proving.USC.T42.CRIPA.Elements.Section1997aAction ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Deontic.IsAttorneyGeneral ag c



axiom corr_inst_isCripaInstitution :
    Proving.USC.T42.CRIPA.Elements.Section1997aAction ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Deontic.IsCripaInstitution iD c





axiom corr_reasonableCauseEgregious :
    Proving.USC.T42.CRIPA.Elements.Section1997aAction ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Deontic.ReasonableCauseEgregiousCondition iD c




axiom corr_civilActionInstituted :
    Proving.USC.T42.CRIPA.Elements.Section1997aAction ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Deontic.CivilActionInstituted ag iD c





theorem elements_implies_deontic
    (h : Proving.USC.T42.CRIPA.Elements.Section1997aAction ag defendant iE certE c) :
    Proving.USC.T42.CRIPA.Deontic.Permission1997aExercised ag iD c :=
  ⟨⟨corr_ag_isAttorneyGeneral h, corr_inst_isCripaInstitution h,
    corr_reasonableCauseEgregious h⟩, corr_civilActionInstituted h⟩




axiom corr_timelyCertification :
    Proving.USC.T42.CRIPA.Elements.Section1997aAction ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Procedure.TimelyCertification iP aP c



axiom corr_complaintFiled :
    Proving.USC.T42.CRIPA.Elements.Section1997aAction ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Procedure.ComplaintFiled aP c



axiom corr_agSignedComplaint :
    Proving.USC.T42.CRIPA.Elements.Section1997aAction ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Procedure.AGPersonallySignedComplaint aP c





theorem elements_implies_procedure
    (h : Proving.USC.T42.CRIPA.Elements.Section1997aAction ag defendant iE certE c) :
    Proving.USC.T42.CRIPA.Procedure.ValidCommencement iP aP c :=
  ⟨corr_timelyCertification h, corr_complaintFiled h, corr_agSignedComplaint h⟩



axiom corr_isInstitution :
    Proving.USC.T42.CRIPA.Elements.Section1997aAction ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Ontology.IsInstitution iO c




axiom corr_isInstitutionalizedPerson :
    Proving.USC.T42.CRIPA.Elements.Section1997aAction ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Ontology.IsInstitutionalizedPerson pO c



axiom corr_isConditions :
    Proving.USC.T42.CRIPA.Elements.Section1997aAction ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Ontology.IsEgregiousOrFlagrantConditions xO c



axiom corr_isPattern :
    Proving.USC.T42.CRIPA.Elements.Section1997aAction ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Ontology.IsPatternOrPracticeOfResistance patO c





theorem elements_implies_ontology
    (h : Proving.USC.T42.CRIPA.Elements.Section1997aAction ag defendant iE certE c) :
    Proving.USC.T42.CRIPA.Ontology.AGActionObjects iO pO xO patO c :=
  ⟨corr_isInstitution h, corr_isInstitutionalizedPerson h,
   corr_isConditions h, corr_isPattern h⟩

end S1997a











namespace S1997b

variable {ag : Person}
variable {iP : Proving.USC.T42.CRIPA.Procedure.Institution}
variable {aP : Proving.USC.T42.CRIPA.Procedure.Action}
variable {certE : Proving.USC.T42.CRIPA.Elements.Certification}
variable {c : ComplaintText}







axiom corr_certPackage_timelyCertification :
    Proving.USC.T42.CRIPA.Elements.Section1997bCertification ag certE c →
    Proving.USC.T42.CRIPA.Procedure.TimelyCertification iP aP c




theorem elements_implies_procedure
    (h : Proving.USC.T42.CRIPA.Elements.Section1997bCertification ag certE c) :
    Proving.USC.T42.CRIPA.Procedure.TimelyCertification iP aP c :=
  corr_certPackage_timelyCertification h

end S1997b










namespace S1997c

variable {ag defendant : Person}
variable {iE : Proving.USC.T42.CRIPA.Elements.Institution}
variable {certE : Proving.USC.T42.CRIPA.Elements.Certification}
variable {aP : Proving.USC.T42.CRIPA.Procedure.Action}
variable {c : ComplaintText}




axiom corr_hostActionCommenced :
    Proving.USC.T42.CRIPA.Elements.Section1997cIntervention ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Procedure.HostActionCommenced aP c



axiom corr_motionFiled :
    Proving.USC.T42.CRIPA.Elements.Section1997cIntervention ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Procedure.MotionToInterveneFiled aP c



axiom corr_after90 :
    Proving.USC.T42.CRIPA.Elements.Section1997cIntervention ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Procedure.After90DayInterventionWindow aP c




axiom corr_interventionCertSigned :
    Proving.USC.T42.CRIPA.Elements.Section1997cIntervention ag defendant iE certE c →
    Proving.USC.T42.CRIPA.Procedure.InterventionCertificationSigned aP c




theorem elements_implies_procedure
    (h : Proving.USC.T42.CRIPA.Elements.Section1997cIntervention ag defendant iE certE c) :
    Proving.USC.T42.CRIPA.Procedure.TimelyIntervention aP c :=
  ⟨corr_hostActionCommenced h, corr_motionFiled h, corr_after90 h,
   corr_interventionCertSigned h⟩

end S1997c








namespace S1997d

variable {p : Person} {c : ComplaintText}




axiom corr_isProtectedReporter :
    Proving.USC.T42.CRIPA.Elements.Section1997dRetaliation p c →
    Proving.USC.T42.CRIPA.Deontic.IsProtectedReporter p c



axiom corr_retaliationOccurred :
    Proving.USC.T42.CRIPA.Elements.Section1997dRetaliation p c →
    Proving.USC.T42.CRIPA.Deontic.RetaliationOccurred p c





theorem elements_implies_deontic
    (h : Proving.USC.T42.CRIPA.Elements.Section1997dRetaliation p c) :
    Proving.USC.T42.CRIPA.Deontic.Prohibition1997dViolated p c :=
  ⟨⟨corr_isProtectedReporter h⟩, corr_retaliationOccurred h⟩

end S1997d

















namespace S1997e

variable {p : Person}
variable {prO : Proving.USC.T42.CRIPA.Ontology.Prisoner}
variable {aP : Proving.USC.T42.CRIPA.Procedure.Action}
variable {c : ComplaintText}



axiom corr_isPrisoner :
    Proving.USC.T42.CRIPA.Elements.Section1997ePrisonerSuitGate p c →
    Proving.USC.T42.CRIPA.Ontology.IsPrisoner prO c




theorem elements_implies_ontology
    (h : Proving.USC.T42.CRIPA.Elements.Section1997ePrisonerSuitGate p c) :
    Proving.USC.T42.CRIPA.Ontology.PrisonerSuit prO c :=
  ⟨corr_isPrisoner h⟩



axiom corr_prisonerActionBrought :
    Proving.USC.T42.CRIPA.Elements.Section1997ePrisonerSuitGate p c →
    Proving.USC.T42.CRIPA.Procedure.PrisonerActionBrought aP c




axiom corr_remediesExhausted :
    Proving.USC.T42.CRIPA.Elements.Section1997ePrisonerSuitGate p c →
    Proving.USC.T42.CRIPA.Procedure.AdministrativeRemediesExhausted aP c




axiom corr_physicalInjuryMet :
    Proving.USC.T42.CRIPA.Elements.Section1997ePrisonerSuitGate p c →
    Proving.USC.T42.CRIPA.Procedure.PhysicalInjuryPrerequisiteMet aP c






axiom corr_survivesScreening :
    Proving.USC.T42.CRIPA.Elements.Section1997ePrisonerSuitGate p c →
    Proving.USC.T42.CRIPA.Procedure.SurvivesScreeningDismissal aP c









theorem elements_implies_procedure_modulo_gaps
    (h : Proving.USC.T42.CRIPA.Elements.Section1997ePrisonerSuitGate p c) :
    Proving.USC.T42.CRIPA.Procedure.MaintainablePrisonerSuit aP c :=
  ⟨corr_prisonerActionBrought h, corr_remediesExhausted h,
   corr_physicalInjuryMet h, corr_survivesScreening h⟩

end S1997e

end Proving.USC.T42.CRIPA.Bridge
