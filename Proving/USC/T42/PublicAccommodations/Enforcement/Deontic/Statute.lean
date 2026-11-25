











import Proving.USC.Common.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Deontic.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Deontic.Predicates

namespace Proving.USC.T42.PublicAccommodations.Enforcement.Deontic

open Proving.USC.Common






structure Power2000a4Investigate (c : ComplaintText) : Prop where
  addressee : AddresseeIsService c
  condition : ComplaintReferredByCourt c


def Power2000a4Investigate_exercised (c : ComplaintText) : Prop :=
  Power2000a4Investigate c ∧ InvestigationConducted c




structure Obligation2000a4ExecSession (c : ComplaintText) : Prop where
  addressee : AddresseeIsService c
  condition : ComplaintReferredByCourt c



def Obligation2000a4ExecSession_breached (c : ComplaintText) : Prop :=
  Obligation2000a4ExecSession c ∧ ¬ HearingsInExecutiveSession c




structure Prohibition2000a4Release (c : ComplaintText) : Prop where
  addressee : AddresseeIsService c



def Prohibition2000a4Release_violated (c : ComplaintText) : Prop :=
  Prohibition2000a4Release c ∧ TestimonyReleased c ∧ ¬ ReleaseAuthorized c



structure Obligation2000a4Settlement (c : ComplaintText) : Prop where
  addressee : AddresseeIsService c
  condition : ComplaintReferredByCourt c



def Obligation2000a4Settlement_breached (c : ComplaintText) : Prop :=
  Obligation2000a4Settlement c ∧ ¬ EndeavoredVoluntarySettlement c






structure Permission2000a5AGAction (c : ComplaintText) : Prop where
  condition : PatternOrPracticeCause c



def Permission2000a5AGAction_exercised (c : ComplaintText) : Prop :=
  Permission2000a5AGAction c ∧ AGBroughtCivilAction c



structure Obligation2000a5Designate (j : JudicialOfficer) (c : ComplaintText) : Prop where
  addressee : AddresseeIsChiefJudge j c
  condition : ThreeJudgeRequestFiled c



def Obligation2000a5Designate_breached (j : JudicialOfficer) (c : ComplaintText) : Prop :=
  Obligation2000a5Designate j c ∧ ¬ PanelDesignated j c

end Proving.USC.T42.PublicAccommodations.Enforcement.Deontic
