




























import Proving.USC.T05.Remedy.Theorems
import Proving.USC.T05.Elements.Theorems
import Proving.USC.Common.Predicates

namespace Proving.USC.T05.Remedy.Bridge

open Proving.USC.Common
open Proving.USC.T05









axiom corr_challengedAction (p : Person) (c : ComplaintText) : Elements.AgencyAction



axiom corr_challengedProceeding (p : Person) (c : ComplaintText) : Elements.Proceeding










axiom corr_ground_A {p : Person} {c : ComplaintText} :
    AgencyActionSetAsideGround .arbitraryCapricious p c →
    Elements.ArbitraryOrCapricious (corr_challengedAction p c) c


axiom corr_ground_B {p : Person} {c : ComplaintText} :
    AgencyActionSetAsideGround .contraryToConstitution p c →
    Elements.ContraryToConstitutionalRight (corr_challengedAction p c) c


axiom corr_ground_C {p : Person} {c : ComplaintText} :
    AgencyActionSetAsideGround .inExcessOfAuthority p c →
    Elements.InExcessOfStatutoryAuthority (corr_challengedAction p c) c


axiom corr_ground_D {p : Person} {c : ComplaintText} :
    AgencyActionSetAsideGround .withoutProcedure p c →
    Elements.WithoutObservanceOfProcedure (corr_challengedAction p c)
      (corr_challengedProceeding p c) c


axiom corr_ground_E {p : Person} {c : ComplaintText} :
    AgencyActionSetAsideGround .unsupportedBySubstantialEvidence p c →
    Elements.UnsupportedBySubstantialEvidence (corr_challengedAction p c)
      (corr_challengedProceeding p c) c


axiom corr_ground_F {p : Person} {c : ComplaintText} :
    AgencyActionSetAsideGround .unwarrantedByFacts p c →
    Elements.UnwarrantedByFactsDeNovo (corr_challengedAction p c) c




theorem s706_2A_remedy_implies_elements
    {p : Person} {c : ComplaintText}
    (h : AgencyActionSetAsideGround .arbitraryCapricious p c) :
    Elements.ArbitraryOrCapricious (corr_challengedAction p c) c :=
  corr_ground_A h


theorem s706_2B_remedy_implies_elements
    {p : Person} {c : ComplaintText}
    (h : AgencyActionSetAsideGround .contraryToConstitution p c) :
    Elements.ContraryToConstitutionalRight (corr_challengedAction p c) c :=
  corr_ground_B h


theorem s706_2C_remedy_implies_elements
    {p : Person} {c : ComplaintText}
    (h : AgencyActionSetAsideGround .inExcessOfAuthority p c) :
    Elements.InExcessOfStatutoryAuthority (corr_challengedAction p c) c :=
  corr_ground_C h


theorem s706_2D_remedy_implies_elements
    {p : Person} {c : ComplaintText}
    (h : AgencyActionSetAsideGround .withoutProcedure p c) :
    Elements.WithoutObservanceOfProcedure (corr_challengedAction p c)
      (corr_challengedProceeding p c) c :=
  corr_ground_D h


theorem s706_2E_remedy_implies_elements
    {p : Person} {c : ComplaintText}
    (h : AgencyActionSetAsideGround .unsupportedBySubstantialEvidence p c) :
    Elements.UnsupportedBySubstantialEvidence (corr_challengedAction p c)
      (corr_challengedProceeding p c) c :=
  corr_ground_E h


theorem s706_2F_remedy_implies_elements
    {p : Person} {c : ComplaintText}
    (h : AgencyActionSetAsideGround .unwarrantedByFacts p c) :
    Elements.UnwarrantedByFactsDeNovo (corr_challengedAction p c) c :=
  corr_ground_F h








axiom corr_withheld {p : Person} {c : ComplaintText} :
    AgencyActionUnlawfullyWithheld p c →
    Elements.UnlawfullyWithheldOrDelayed (corr_challengedAction p c) c




theorem s706_1_remedy_implies_elements
    {p : Person} {c : ComplaintText}
    (h : AgencyActionUnlawfullyWithheld p c) :
    Elements.UnlawfullyWithheldOrDelayed (corr_challengedAction p c) c :=
  corr_withheld h
















axiom corr_privateRight {p : Person} {c : ComplaintText} :
    Remedy.HasPrivateRightOfAction p c → Common.HasPrivateRightOfAction p c



axiom corr_redressable {p : Person} {c : ComplaintText} :
    Remedy.ReliefRedressable p c → Common.ReliefRedressable p c




axiom corr_aggrieved {p : Person} {c : ComplaintText} :
    InjuryCognizable p c → CausedByViolation p c →
    Common.AggrievedByAgencyAction p c


theorem standing_privateRight_agrees
    {p : Person} {c : ComplaintText} (h : Remedy.HasPrivateRightOfAction p c) :
    Common.HasPrivateRightOfAction p c :=
  corr_privateRight h


theorem standing_redressable_agrees
    {p : Person} {c : ComplaintText} (h : Remedy.ReliefRedressable p c) :
    Common.ReliefRedressable p c :=
  corr_redressable h



theorem standing_aggrieved_agrees
    {p : Person} {c : ComplaintText}
    (hInj : InjuryCognizable p c) (hCaus : CausedByViolation p c) :
    Common.AggrievedByAgencyAction p c :=
  corr_aggrieved hInj hCaus









end Proving.USC.T05.Remedy.Bridge
