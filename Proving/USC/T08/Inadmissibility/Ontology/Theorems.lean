





import Proving.USC.T08.Inadmissibility.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T08.Inadmissibility.Ontology

open Proving.USC.Common


theorem unauthorizedAlienMembership_intro {a c}
    (hAlien : IsAlien a c) (hNotLPR : ¬ IsLawfulPermanentResident a c)
    (hNotAuth : ¬ IsAuthorizedToWork a c) (hUnauth : IsUnauthorizedAlien a c)
    : UnauthorizedAlienMembership a c :=
  ⟨hAlien, hNotLPR, hNotAuth, hUnauth⟩



theorem terroristOrganizationMembership_intro {o act c}
    (hAct : IsTerroristActivity act c) (hOrg : IsTerroristOrganization o c)
    : TerroristOrganizationMembership o act c :=
  ⟨hAct, hOrg⟩



theorem representativeMembership_intro {a o c}
    (hOrg : IsTerroristOrganization o c) (hRep : IsRepresentative a o c)
    : RepresentativeMembership a o c :=
  ⟨hOrg, hRep⟩


theorem securityGroundMembership_intro {a c}
    (hEng : EngagesInTerroristActivity a c) (hSec : IsSecurityGround a c)
    : SecurityGroundMembership a c :=
  ⟨hEng, hSec⟩


theorem entityMembership_intro {e c}
    (hEntity : IsEntity e c) : EntityMembership e c :=
  ⟨hEntity⟩




theorem isInadmissibleAlien_ofSecurity_intro {a c}
    (hSec : IsSecurityGround a c) : IsInadmissibleAlien a c :=
  .security hSec


theorem isInadmissibleAlien_ofCriminal_intro {a c}
    (hCrim : IsCriminalGround a c) : IsInadmissibleAlien a c :=
  .criminal hCrim

end Proving.USC.T08.Inadmissibility.Ontology
