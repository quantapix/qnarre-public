





import Proving.USC.Common.Types
import Proving.USC.T18.Ch113.Reslice.Deontic.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch113.Reslice.Deontic

open Proving.USC.Common


theorem prohibitionViolated2315_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hCond : ConditionMet2315 p c)
    (hComm : EngagedInInterstateCommerce c) (hAct : RegulatedActOccurred2315 p c) :
    ProhibitionViolated2315 p c :=
  ⟨⟨hAddr, hCond, hComm⟩, hAct⟩


theorem prohibitionViolated2318_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hCond : ConditionMet2318 p c)
    (hAct : RegulatedActOccurred2318 p c) :
    ProhibitionViolated2318 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibitionViolated2320_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hCond : ConditionMet2320 p c)
    (hAct : RegulatedActOccurred2320 p c) :
    ProhibitionViolated2320 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permissionExercised2318e_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeCopyrightOwner p c) (hCond : PermissionCondition2318e p c)
    (hAct : PermittedActCivilAction2318e p c) :
    PermissionExercised2318e p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligationBreached2320h_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAttorneyGeneral p c) (hCond : ObligationCondition2320h c)
    (hOmit : ¬ ObligatedActReportAccounting2320h p c) :
    ObligationBreached2320h p c :=
  ⟨⟨hAddr, hCond⟩, hOmit⟩

end Proving.USC.T18.Ch113.Reslice.Deontic
