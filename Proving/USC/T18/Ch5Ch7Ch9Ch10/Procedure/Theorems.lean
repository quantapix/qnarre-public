








import Proving.USC.T18.Ch5Ch7Ch9Ch10.Procedure.Statute

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Procedure
open Proving.USC.Common

theorem habitualOffenderStatus_intro {p : Person} {c : ComplaintText}
    (hLocus : DomesticAssaultInSpecialJurisdiction p c)
    (hPriors : TwoPriorFinalConvictions p c)
    : HabitualOffenderStatus p c :=
  ⟨hLocus, hPriors⟩

theorem restrictedPersonTransferBar_intro {p : Person} {c : ComplaintText}
    (hStatus : AdjudicativeStatusRestricted p c)
    (hCommerce : InterstateCommerceNexus p c)
    : RestrictedPersonTransferBar p c :=
  ⟨hStatus, hCommerce⟩

theorem unregisteredSelectAgentPossession_intro {p : Person} {c : ComplaintText}
    (hReq : SelectAgentRegistrationRequired p c)
    (hNot : ¬ SelectAgentRegistrationObtained p c)
    : UnregisteredSelectAgentPossession p c :=
  ⟨hReq, hNot⟩

theorem cognizableBankruptcyConduct_intro {p : Person} {c : ComplaintText}
    (hFiled : Title11PetitionFiled p c)
    (hWindow : BankruptcyCaseConductWindow p c)
    : CognizableBankruptcyConduct p c :=
  ⟨hFiled, hWindow⟩

theorem enforcementFrameworkEstablished_intro {c : ComplaintText}
    (hDes : AttorneyGeneralDesignation c)
    (hRef : BankruptcyCourtReferralProcedures c)
    : EnforcementFrameworkEstablished c :=
  ⟨hDes, hRef⟩

theorem emergencyMilitaryAssistanceRequest_intro {c : ComplaintText}
    (hEm : EmergencyInvolvingBiologicalWMD c)
    (hReq : AttorneyGeneralRequestedMilitaryAssistance c)
    : EmergencyMilitaryAssistanceRequest c :=
  ⟨hEm, hReq⟩

theorem validBiologicalWeaponForfeiture_intro {item : SeizableItem} {c : ComplaintText}
    (hSeiz : LawfulSeizure item c)
    (hNotice : NoticeToClaimantsGiven item c)
    (hHearing : ForfeitureHearingOpportunity item c)
    (hBurden : GovernmentMetPreponderanceBurden item c)
    : ValidBiologicalWeaponForfeiture item c :=
  ⟨hSeiz, hNotice, hHearing, hBurden⟩

theorem civilInjunctionAction_intro {c : ComplaintText}
    (hBrought : UnitedStatesBroughtCivilAction c)
    (hTargets : TargetsProhibitedBiologicalConduct c)
    : CivilInjunctionAction c :=
  ⟨hBrought, hTargets⟩

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Procedure
