




















import Proving.USC.T42.CRIPA.Deontic.Predicates

namespace Proving.USC.T42.CRIPA.Deontic

open Proving.USC.Common





structure Permission1997a (p : Person) (i : Institution) (c : ComplaintText) : Prop where
  addressee : IsAttorneyGeneral p c
  institution : IsCripaInstitution i c
  condition : ReasonableCauseEgregiousCondition i c



def Permission1997aExercised (p : Person) (i : Institution) (c : ComplaintText) : Prop :=
  Permission1997a p i c ∧ CivilActionInstituted p i c





structure Power1997a1 (p : Person) (i : Institution) (c : ComplaintText) : Prop where
  addressee : IsAttorneyGeneral p c
  condition : InstitutionUnderInvestigation i c



def Power1997a1Exercised (p : Person) (i : Institution) (c : ComplaintText) : Prop :=
  Power1997a1 p i c ∧ SubpoenaIssued p i c





structure Obligation1997b (p : Person) (i : Institution) (c : ComplaintText) : Prop where
  addressee : IsAttorneyGeneral p c
  institution : IsCripaInstitution i c




def Obligation1997bBreached (p : Person) (i : Institution) (c : ComplaintText) : Prop :=
  Obligation1997b p i c ∧ ¬ (CertificationMade p i c ∧ PersonallySigned p c)





structure Prohibition1997c (p : Person) (c : ComplaintText) : Prop where
  addressee : IsAttorneyGeneral p c



def Prohibition1997cViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1997c p c ∧ PrematureInterventionFiled p c




structure Prohibition1997d (p : Person) (c : ComplaintText) : Prop where
  addressee : IsProtectedReporter p c



def Prohibition1997dViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1997d p c ∧ RetaliationOccurred p c







structure Prohibition1997e_a (p : Person) (c : ComplaintText) : Prop where
  addressee : IsPrisonerBringingAction p c
  condition : AdministrativeRemediesUnexhausted p c



def Prohibition1997e_aViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1997e_a p c ∧ PrisonConditionsActionBrought p c






structure Prohibition1997e_e (p : Person) (c : ComplaintText) : Prop where
  addressee : IsPrisonerBringingAction p c
  condition : NoPhysicalInjuryShowing p c



def Prohibition1997e_eViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1997e_e p c ∧ MentalEmotionalInjuryActionBrought p c

end Proving.USC.T42.CRIPA.Deontic
