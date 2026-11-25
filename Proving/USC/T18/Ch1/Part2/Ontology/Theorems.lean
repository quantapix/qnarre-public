







import Proving.USC.T18.Ch1.Part2.Ontology.Statute

namespace Proving.USC.T18.Ch1.Part2.Ontology

open Proving.USC.Common




theorem crimeOfViolenceCase_force {o : Offense} {c : ComplaintText}
    (h : HasPhysicalForceElement o c) : CrimeOfViolenceCase o c :=
  .forceElement h


theorem crimeOfViolenceCase_felony {o : Offense} {c : ComplaintText}
    (h : IsFelonyRiskingPhysicalForce o c) : CrimeOfViolenceCase o c :=
  .felonyRisk h

theorem isCrimeOfViolence_intro {o : Offense} {c : ComplaintText}
    (hM : IsCrimeOfViolence o c) (w : CrimeOfViolenceCase o c) :
    CrimeOfViolenceMembership o c :=
  ⟨hM, w⟩



theorem isOrganization_intro {p : Person} {c : ComplaintText}
    (hM : IsOrganization p c) (hn : ¬ IsIndividual p c) :
    OrganizationMembership p c :=
  ⟨hM, hn⟩



theorem pettyOffenseClass_classB {o : Offense} {c : ComplaintText}
    (h : IsClassBMisdemeanor o c) : PettyOffenseClass o c := .classB h

theorem pettyOffenseClass_classC {o : Offense} {c : ComplaintText}
    (h : IsClassCMisdemeanor o c) : PettyOffenseClass o c := .classC h

theorem pettyOffenseClass_infraction {o : Offense} {c : ComplaintText}
    (h : IsInfraction o c) : PettyOffenseClass o c := .infraction h

theorem isPettyOffense_intro {o : Offense} {c : ComplaintText}
    (hM : IsPettyOffense o c) (w : PettyOffenseClass o c)
    (hf : WithinPettyOffenseFineCap o c) : PettyOffenseMembership o c :=
  ⟨hM, w, hf⟩



theorem isFinancialInstitution_intro {e : Entity} {c : ComplaintText}
    (hM : IsFinancialInstitution e c) (he : IsEnumeratedFinancialInstitutionKind e c) :
    FinancialInstitutionMembership e c :=
  ⟨hM, he⟩



theorem isStolenOrCounterfeitProperty_intro {pr : Property} {c : ComplaintText}
    (hM : IsStolenOrCounterfeitProperty pr c) (hs : WasStolenOrCounterfeited pr c)
    (hk : DefendantKnewStolenCharacter pr c) :
    StolenOrCounterfeitPropertyMembership pr c :=
  ⟨hM, hs, hk⟩



theorem isFederalHealthCareOffense_intro {o : Offense} {c : ComplaintText}
    (hM : IsFederalHealthCareOffense o c) (hv : ViolatesEnumeratedHealthCareStatute o c)
    (hr : RelatesToHealthCareBenefitProgram o c) :
    FederalHealthCareOffenseMembership o c :=
  ⟨hM, hv, hr⟩



theorem isMortgageLendingBusiness_intro {p : Person} {c : ComplaintText}
    (hM : IsMortgageLendingBusiness p c) (ho : IsOrganization p c)
    (hf : FinancesOrRefinancesRealEstateDebt p c) (hc : AffectsInterstateOrForeignCommerce p c) :
    MortgageLendingBusinessMembership p c :=
  ⟨hM, ho, hf, hc⟩

end Proving.USC.T18.Ch1.Part2.Ontology
