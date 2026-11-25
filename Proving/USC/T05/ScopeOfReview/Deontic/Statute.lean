









import Proving.USC.T05.ScopeOfReview.Deontic.Predicates

namespace Proving.USC.T05.ScopeOfReview.Deontic
open Proving.USC.Common





structure Permission705Agency (e : Entity) (c : ComplaintText) : Prop where
  addressee : AgencyIsAddressee705 e c
  condition : JusticeSoRequires705 e c



def Permission705AgencyExercised (e : Entity) (c : ComplaintText) : Prop :=
  Permission705Agency e c ∧ AgencyPostponedEffectiveDate705 e c



structure Permission705Court (p : Person) (c : ComplaintText) : Prop where
  condition : IrreparableInjuryToPrevent705 p c



def Permission705CourtExercised (p : Person) (c : ComplaintText) : Prop :=
  Permission705Court p c ∧ CourtIssuedNecessaryProcess705 p c





structure Obligation706Chapeau (c : ComplaintText) : Prop where
  addressee : ReviewingCourtIsAddressee706 c
  condition : QuestionOfLawPresented706 c



def Obligation706ChapeauDischarged (c : ComplaintText) : Prop :=
  Obligation706Chapeau c ∧ DecidedQuestionsOfLaw706 c



def Obligation706ChapeauBreached (c : ComplaintText) : Prop :=
  Obligation706Chapeau c ∧ ¬ DecidedQuestionsOfLaw706 c





structure Obligation706_1 (e : Entity) (c : ComplaintText) : Prop where
  addressee : ReviewingCourtIsAddressee706 c
  condition : ActionUnlawfullyWithheld706 e c



def Obligation706_1Discharged (e : Entity) (c : ComplaintText) : Prop :=
  Obligation706_1 e c ∧ CompelledWithheldAction706 e c



def Obligation706_1Breached (e : Entity) (c : ComplaintText) : Prop :=
  Obligation706_1 e c ∧ ¬ CompelledWithheldAction706 e c





structure Obligation706_2 (e : Entity) (d : Defect706) (c : ComplaintText) : Prop where
  addressee : ReviewingCourtIsAddressee706 c
  condition : ActionHasDefect706 e d c



def Obligation706_2Discharged (e : Entity) (d : Defect706) (c : ComplaintText) : Prop :=
  Obligation706_2 e d c ∧ HeldUnlawfulAndSetAside706 e c



def Obligation706_2Breached (e : Entity) (d : Defect706) (c : ComplaintText) : Prop :=
  Obligation706_2 e d c ∧ ¬ HeldUnlawfulAndSetAside706 e c






def Obligation706ClosingDischarged (c : ComplaintText) : Prop :=
  ReviewingCourtIsAddressee706 c
    ∧ ReviewedWholeRecord706 c
    ∧ TookAccountOfPrejudicialError706 c

end Proving.USC.T05.ScopeOfReview.Deontic
