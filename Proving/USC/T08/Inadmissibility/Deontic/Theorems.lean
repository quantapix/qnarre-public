







import Proving.USC.T08.Inadmissibility.Deontic.Statute

namespace Proving.USC.T08.Inadmissibility.Deontic

open Proving.USC.Common


theorem prohibition1324a_a1A_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsEmployer p c) (hCond : KnewAlienUnauthorized p c)
    (hAct : HiredOrReferredAlien p c) (hNoDef : ¬ GoodFaithVerificationDefense p c)
    : Prohibition1324a_a1A_Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNoDef⟩


theorem prohibition1324a_a2_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsEmployer p c) (hCond : KnewAlienUnauthorized p c)
    (hAct : ContinuedToEmployAlien p c)
    : Prohibition1324a_a2_Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1324a_g1_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsEmployer p c) (hAct : RequiredEmployeeIndemnityBond p c)
    : Prohibition1324a_g1_Violated p c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem obligation1324a_b_breached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsEmployer p c) (hCond : HiringForUSEmployment p c)
    (hNoAct : ¬ CompletedEmploymentVerification p c)
    : Obligation1324a_b_Breached p c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩


theorem prohibition1182_a_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeIsAdmittingAuthority p c) (hCond : AlienIsInadmissible p c)
    (hAct : IssuedVisaOrAdmitted p c)
    : Prohibition1182_a_Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T08.Inadmissibility.Deontic
