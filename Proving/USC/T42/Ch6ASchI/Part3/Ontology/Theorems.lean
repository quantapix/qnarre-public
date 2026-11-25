






import Proving.USC.T42.Ch6ASchI.Part3.Ontology.Statute

namespace Proving.USC.T42.Ch6ASchI.Part3.Ontology

open Proving.USC.Common



theorem channeledActor_intro {p : Person} {c : ComplaintText}
    (hOfficer : IsCommissionedOfficerOrEmployee p c)
    (hScope : ActsWithinScopeOfEmployment p c) : ChanneledActor p c :=
  ⟨hOfficer, hScope⟩



theorem deemedEmployeeMembership_intro {p : Person} {e : Entity} {c : ComplaintText}
    (hEntity : IsDeemedEmployeeEntity e c) (hDeemed : IsDeemedPHSEmployee p c)
    : DeemedEmployeeMembership p e c :=
  ⟨hEntity, hDeemed⟩



theorem coveredPersonMembership_intro {p : Person} {m : Countermeasure} {c : ComplaintText}
    (hPerson : IsCoveredPerson p c) (hCountermeasure : IsCoveredCountermeasure m c)
    : CoveredPersonMembership p m c :=
  ⟨hPerson, hCountermeasure⟩



theorem freeClinicProfessionalMembership_intro
    {p : Person} {e : Entity} {s : HealthService} {c : ComplaintText}
    (hProf : IsFreeClinicHealthProfessional p c) (hClinic : IsFreeClinic e c)
    (hService : IsQualifyingHealthService s c)
    : FreeClinicProfessionalMembership p e s c :=
  ⟨hProf, hClinic, hService⟩


theorem healthCareProfessionalService_intro
    {p : Person} {s : HealthService} {c : ComplaintText}
    (hProf : IsHealthCareProfessional p c) (hService : IsHealthCareService s c)
    : HealthCareProfessionalService p s c :=
  ⟨hProf, hService⟩


theorem giftClassification_unconditional_intro {g : Gift} {c : ComplaintText}
    (h : IsUnconditionalGift g c) : GiftClassification g c :=
  .unconditional h


theorem giftClassification_conditional_intro {g : Gift} {c : ComplaintText}
    (h : IsConditionalGift g c) : GiftClassification g c :=
  .conditional h

end Proving.USC.T42.Ch6ASchI.Part3.Ontology
