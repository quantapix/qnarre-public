















import Proving.USC.T42.CRIPA.Deontic.Types

namespace Proving.USC.T42.CRIPA.Deontic

open Proving.USC.Common







axiom IsAttorneyGeneral (p : Person) (c : ComplaintText) : Prop





axiom CivilActionInstituted (p : Person) (i : Institution) (c : ComplaintText) : Prop






axiom ReasonableCauseEgregiousCondition (i : Institution) (c : ComplaintText) : Prop






axiom IsCripaInstitution (i : Institution) (c : ComplaintText) : Prop







axiom SubpoenaIssued (p : Person) (i : Institution) (c : ComplaintText) : Prop





axiom InstitutionUnderInvestigation (i : Institution) (c : ComplaintText) : Prop








axiom PersonallySigned (p : Person) (c : ComplaintText) : Prop







axiom CertificationMade (p : Person) (i : Institution) (c : ComplaintText) : Prop








axiom PrematureInterventionFiled (p : Person) (c : ComplaintText) : Prop









axiom IsProtectedReporter (p : Person) (c : ComplaintText) : Prop





axiom RetaliationOccurred (p : Person) (c : ComplaintText) : Prop









axiom IsPrisonerBringingAction (p : Person) (c : ComplaintText) : Prop





axiom PrisonConditionsActionBrought (p : Person) (c : ComplaintText) : Prop






axiom AdministrativeRemediesUnexhausted (p : Person) (c : ComplaintText) : Prop









axiom MentalEmotionalInjuryActionBrought (p : Person) (c : ComplaintText) : Prop






axiom NoPhysicalInjuryShowing (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.CRIPA.Deontic
