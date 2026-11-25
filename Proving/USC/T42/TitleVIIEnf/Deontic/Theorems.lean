







import Proving.USC.T42.TitleVIIEnf.Deontic.Types
import Proving.USC.T42.TitleVIIEnf.Deontic.Predicates
import Proving.USC.T42.TitleVIIEnf.Deontic.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIEnf.Deontic

open Proving.USC.Common



theorem obligation2000e5b_breached_intro {com : Commission} {c : ComplaintText}
    (hCond : ChargeFiled c) (hNoAct : ¬ CommissionServedAndInvestigated com c) :
    Obligation2000e5b_Breached com c :=
  ⟨⟨hCond⟩, hNoAct⟩


theorem obligation2000e5e_breached_intro {c : ComplaintText}
    (hCond : ChargeFiled c) (hUntimely : ¬ ChargeTimelyFiled c) :
    Obligation2000e5e_Breached c :=
  ⟨⟨hCond⟩, hUntimely⟩


theorem prohibitionDisclosure_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : DisclosureAddresseeInClass p c) (hAct : MadeProtectedInfoPublic p c) :
    ProhibitionDisclosure_Violated p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem obligation2000e8c_breached_intro {e : Entity} {c : ComplaintText}
    (hCond : IsCoveredRecordKeeper e c) (hNoAct : ¬ RecordsMaintained e c) :
    Obligation2000e8c_Breached e c :=
  ⟨⟨hCond⟩, hNoAct⟩


theorem prohibition2000e16a_violated_intro {a : FederalAgency} {c : ComplaintText}
    (hAddr : IsCoveredFederalAgency a c) (hCond : PersonnelActionTaken a c)
    (hAct : PersonnelActionDiscriminatory a c) :
    Prohibition2000e16a_Violated a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem powerCommission_intro {com : Commission} {c : ComplaintText}
    (hEx : CommissionPowerExercised com c) : PowerCommission com c :=
  ⟨hEx⟩


theorem permission2000e6a_intro {c : ComplaintText}
    (hCond : AgReasonableCausePattern c) : Permission2000e6a c :=
  ⟨hCond⟩

end Proving.USC.T42.TitleVIIEnf.Deontic
