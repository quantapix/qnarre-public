










import Proving.USC.T42.CRIPA.Deontic.Statute

namespace Proving.USC.T42.CRIPA.Deontic

open Proving.USC.Common


theorem permission1997aExercised_intro {p i c}
    (hAddr : IsAttorneyGeneral p c) (hInst : IsCripaInstitution i c)
    (hCond : ReasonableCauseEgregiousCondition i c)
    (hAct : CivilActionInstituted p i c) :
    Permission1997aExercised p i c :=
  ⟨⟨hAddr, hInst, hCond⟩, hAct⟩


theorem power1997a1Exercised_intro {p i c}
    (hAddr : IsAttorneyGeneral p c) (hCond : InstitutionUnderInvestigation i c)
    (hAct : SubpoenaIssued p i c) :
    Power1997a1Exercised p i c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation1997bBreached_intro {p i c}
    (hAddr : IsAttorneyGeneral p c) (hInst : IsCripaInstitution i c)
    (hOmit : ¬ (CertificationMade p i c ∧ PersonallySigned p c)) :
    Obligation1997bBreached p i c :=
  ⟨⟨hAddr, hInst⟩, hOmit⟩


theorem prohibition1997cViolated_intro {p c}
    (hAddr : IsAttorneyGeneral p c) (hAct : PrematureInterventionFiled p c) :
    Prohibition1997cViolated p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition1997dViolated_intro {p c}
    (hAddr : IsProtectedReporter p c) (hAct : RetaliationOccurred p c) :
    Prohibition1997dViolated p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition1997e_aViolated_intro {p c}
    (hAddr : IsPrisonerBringingAction p c) (hCond : AdministrativeRemediesUnexhausted p c)
    (hAct : PrisonConditionsActionBrought p c) :
    Prohibition1997e_aViolated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1997e_eViolated_intro {p c}
    (hAddr : IsPrisonerBringingAction p c) (hCond : NoPhysicalInjuryShowing p c)
    (hAct : MentalEmotionalInjuryActionBrought p c) :
    Prohibition1997e_eViolated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T42.CRIPA.Deontic
