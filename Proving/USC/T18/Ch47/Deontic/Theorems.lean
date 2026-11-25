








import Proving.USC.Common.Types
import Proving.USC.T18.Ch47.Deontic.Types
import Proving.USC.T18.Ch47.Deontic.Predicates
import Proving.USC.T18.Ch47.Deontic.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch47.Deontic

open Proving.USC.Common





theorem prohibition1028a_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1028a p c) (hCond : Circumstance1028c p c) :
    Prohibition1028a p c :=
  ⟨hAddr, hCond⟩



theorem prohibitionViolated1028a_intro {p : Person} {c : ComplaintText}
    (hNorm : Prohibition1028a p c) (hAct : ProhibitedAct1028a p c)
    (hNoEscape : ¬ LawfullyAuthorizedActivityExempt1028e p c) :
    ProhibitionViolated1028a p c :=
  ⟨hNorm, hAct, hNoEscape⟩




theorem prohibition1028f_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1028a p c) : Prohibition1028f p c :=
  ⟨hAddr⟩


theorem prohibitionViolated1028f_intro {p : Person} {c : ComplaintText}
    (hNorm : Prohibition1028f p c) (hAct : InchoateAct1028f p c)
    (hNoEscape : ¬ LawfullyAuthorizedActivityExempt1028e p c) :
    ProhibitionViolated1028f p c :=
  ⟨hNorm, hAct, hNoEscape⟩




theorem obligation1028g_intro {p : Person} {c : ComplaintText}
    (hCond : ForfeitureProceedingUnderSection1028 p c) : Obligation1028g p c :=
  ⟨hCond⟩


theorem obligationDischarged1028g_intro {p : Person} {c : ComplaintText}
    (hNorm : Obligation1028g p c)
    (hAct : ForfeitureGovernedByReferencedActProvision1028g p c) :
    ObligationDischarged1028g p c :=
  ⟨hNorm, hAct⟩


theorem obligationBreached1028g_intro {p : Person} {c : ComplaintText}
    (hNorm : Obligation1028g p c)
    (hNoAct : ¬ ForfeitureGovernedByReferencedActProvision1028g p c) :
    ObligationBreached1028g p c :=
  ⟨hNorm, hNoAct⟩




theorem obligation1028h_intro {p : Person} {c : ComplaintText}
    (hCond : ConvictedOfSubsectionAViolation1028h p c) : Obligation1028h p c :=
  ⟨hCond⟩


theorem obligationDischarged1028h_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hNorm : Obligation1028h p c)
    (hAct : CourtOrderedForfeitureAndDisposition1028h ct p c) :
    ObligationDischarged1028h ct p c :=
  ⟨hNorm, hAct⟩


theorem obligationBreached1028h_intro
    {ct : Court} {p : Person} {c : ComplaintText}
    (hNorm : Obligation1028h p c)
    (hNoAct : ¬ CourtOrderedForfeitureAndDisposition1028h ct p c) :
    ObligationBreached1028h ct p c :=
  ⟨hNorm, hNoAct⟩




theorem power1028b_intro {p : Person} {t : Tier1028b} {c : ComplaintText}
    (hCond : ProhibitionViolated1028a p c) (hTier : TierApplicable1028b p t c) :
    Power1028b p t c :=
  ⟨hCond, hTier⟩


theorem powerExercised1028b_intro
    {ct : Court} {p : Person} {t : Tier1028b} {c : ComplaintText}
    (hPower : Power1028b p t c)
    (hAct : PunishmentImposedWithinTier1028b ct p t c) :
    PowerExercised1028b ct p t c :=
  ⟨hPower, hAct⟩




theorem prohibition1029a_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1029a p c)
    (hCond : AffectsInterstateOrForeignCommerce1029a p c) :
    Prohibition1029a p c :=
  ⟨hAddr, hCond⟩


theorem prohibitionViolated1029a_intro {p : Person} {c : ComplaintText}
    (hNorm : Prohibition1029a p c) (hAct : ProhibitedAct1029a p c)
    (hNoEscape : ¬ LawfullyAuthorizedActivityExempt1029f p c) :
    ProhibitionViolated1029a p c :=
  ⟨hNorm, hAct, hNoEscape⟩




theorem permission1029g1_intro {p : Person} {c : ComplaintText}
    (hActor : CarrierAffiliatedActor1029g1 p c)
    (hConduct : ProtectiveConductForCarrier1029g1 p c)
    (hNotUnless : ¬ PurposeUnauthorizedServiceFromOtherCarrier1029g1 p c) :
    Permission1029g1 p c :=
  ⟨hActor, hConduct, hNotUnless⟩


theorem defense1029g2_intro {p : Person} {c : ComplaintText}
    (hPurpose : ResearchOrDevelopmentPurpose1029g2 p c)
    (hBurden : EstablishedByPreponderance1029g2 p c)
    (hNotCarveOut : ¬ ConductIsProducingOrTrafficking1029g2 p c) :
    Defense1029g2 p c :=
  ⟨hPurpose, hBurden, hNotCarveOut⟩



theorem prohibitionViolated1029a9_intro
    {p : Person} {d : AccessArtifact} {c : ComplaintText}
    (hNorm : Prohibition1029a p c)
    (hAct : UsesConfiguredHardwareOrSoftware1029a9 p d c)
    (hNoExempt : ¬ LawfullyAuthorizedActivityExempt1029f p c)
    (hNoPermission : ¬ Permission1029g1 p c)
    (hNoDefense : ¬ Defense1029g2 p c) :
    ProhibitionViolated1029a9 p d c :=
  ⟨hNorm, hAct, hNoExempt, hNoPermission, hNoDefense⟩




theorem prohibitionViolated1029b_intro {p : Person} {c : ComplaintText}
    (hAct : InchoateAct1029b p c)
    (hNoEscape : ¬ LawfullyAuthorizedActivityExempt1029f p c) :
    ProhibitionViolated1029b p c :=
  ⟨hAct, hNoEscape⟩




theorem prohibition1029h_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever1029a p c)
    (hOutside : ActsOutsideUnitedStatesJurisdiction1029h p c)
    (hDevice : InvolvesUnitedStatesConnectedAccessDevice1029h p c) :
    Prohibition1029h p c :=
  ⟨hAddr, hOutside, hDevice⟩


theorem prohibitionViolated1029h_intro {p : Person} {c : ComplaintText}
    (hNorm : Prohibition1029h p c)
    (hAct : ConductWouldConstituteOffenseIfDomestic1029h p c)
    (hNoEscape : ¬ LawfullyAuthorizedActivityExempt1029f p c) :
    ProhibitionViolated1029h p c :=
  ⟨hNorm, hAct, hNoEscape⟩




theorem power1029c_intro {p : Person} {t : Tier1029c} {c : ComplaintText}
    (hCond : ProhibitionViolated1029a p c) (hTier : TierApplicable1029c p t c) :
    Power1029c p t c :=
  ⟨hCond, hTier⟩


theorem powerExercised1029c_intro
    {ct : Court} {p : Person} {t : Tier1029c} {c : ComplaintText}
    (hPower : Power1029c p t c)
    (hAct : PunishmentImposedWithinTier1029c ct p t c) :
    PowerExercised1029c ct p t c :=
  ⟨hPower, hAct⟩


theorem obligation1029c2_intro {p : Person} {c : ComplaintText}
    (hCond : ForfeitureProceedingUnderSection1029 p c) : Obligation1029c2 p c :=
  ⟨hCond⟩


theorem obligationDischarged1029c2_intro {p : Person} {c : ComplaintText}
    (hNorm : Obligation1029c2 p c)
    (hAct : ForfeitureGovernedByReferencedActProvision1029c2 p c) :
    ObligationDischarged1029c2 p c :=
  ⟨hNorm, hAct⟩


theorem obligationBreached1029c2_intro {p : Person} {c : ComplaintText}
    (hNorm : Obligation1029c2 p c)
    (hNoAct : ¬ ForfeitureGovernedByReferencedActProvision1029c2 p c) :
    ObligationBreached1029c2 p c :=
  ⟨hNorm, hNoAct⟩




theorem power1029d_intro {ag : Agency} {c : ComplaintText}
    (hAddr : IsUnitedStatesSecretService ag c) : Power1029d ag c :=
  ⟨hAddr⟩


theorem powerExercised1029d_intro
    {ag : Agency} {p : Person} {c : ComplaintText}
    (hPower : Power1029d ag c)
    (hAct : InvestigatesOffenseUnderSection1029 ag p c) :
    PowerExercised1029d ag p c :=
  ⟨hPower, hAct⟩


theorem obligation1029dExercise_intro {ag : Agency} {c : ComplaintText}
    (hPower : Power1029d ag c) : Obligation1029dExercise ag c :=
  ⟨hPower⟩


theorem obligationDischarged1029dExercise_intro {ag : Agency} {c : ComplaintText}
    (hNorm : Obligation1029dExercise ag c)
    (hAct : AuthorityExercisedInAccordanceWithAgreement1029d ag c) :
    ObligationDischarged1029dExercise ag c :=
  ⟨hNorm, hAct⟩


theorem obligationBreached1029dExercise_intro {ag : Agency} {c : ComplaintText}
    (hNorm : Obligation1029dExercise ag c)
    (hNoAct : ¬ AuthorityExercisedInAccordanceWithAgreement1029d ag c) :
    ObligationBreached1029dExercise ag c :=
  ⟨hNorm, hNoAct⟩


theorem obligationDischarged1029dAgreement_intro {c : ComplaintText}
    (hAct : AgreementEnteredByTreasuryAndAttorneyGeneral1029d c) :
    ObligationDischarged1029dAgreement c :=
  hAct


theorem obligationBreached1029dAgreement_intro {c : ComplaintText}
    (hNoAct : ¬ AgreementEnteredByTreasuryAndAttorneyGeneral1029d c) :
    ObligationBreached1029dAgreement c :=
  hNoAct










theorem exempt1028e_precludes_violation1028a {p : Person} {c : ComplaintText}
    (hExempt : LawfullyAuthorizedActivityExempt1028e p c) :
    ¬ ProhibitionViolated1028a p c :=
  fun hViol => hViol.2.2 hExempt


theorem exempt1028e_precludes_violation1028f {p : Person} {c : ComplaintText}
    (hExempt : LawfullyAuthorizedActivityExempt1028e p c) :
    ¬ ProhibitionViolated1028f p c :=
  fun hViol => hViol.2.2 hExempt



theorem exempt1029f_precludes_violation1029a {p : Person} {c : ComplaintText}
    (hExempt : LawfullyAuthorizedActivityExempt1029f p c) :
    ¬ ProhibitionViolated1029a p c :=
  fun hViol => hViol.2.2 hExempt



theorem permission1029g1_precludes_violation1029a9
    {p : Person} {d : AccessArtifact} {c : ComplaintText}
    (hPerm : Permission1029g1 p c) : ¬ ProhibitionViolated1029a9 p d c :=
  fun hViol => hViol.2.2.2.1 hPerm



theorem defense1029g2_precludes_violation1029a9
    {p : Person} {d : AccessArtifact} {c : ComplaintText}
    (hDef : Defense1029g2 p c) : ¬ ProhibitionViolated1029a9 p d c :=
  fun hViol => hViol.2.2.2.2 hDef

end Proving.USC.T18.Ch47.Deontic
