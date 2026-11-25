






import Proving.USC.T05.Ontology.Statute
import Proving.USC.T05.Ontology.Predicates
import Proving.USC.T05.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T05.Ontology

open Proving.USC.Common


theorem partyMembership_intro {x : Party} {p : Person} {e : Entity} {c : ComplaintText}
    (hPerson : IsPerson p c) (hAgency : IsAgency e c) (hParty : IsParty x c)
    : PartyMembership x p e c :=
  ⟨hPerson, hAgency, hParty⟩


theorem ruleMakingMembership_intro {rm : RuleMaking} {r : Rule} {c : ComplaintText}
    (hRule : IsRule r c) (hRM : IsRuleMaking rm c)
    : RuleMakingMembership rm r c :=
  ⟨hRule, hRM⟩


theorem adjudicationMembership_intro {a : Adjudication} {o : Order} {c : ComplaintText}
    (hOrder : IsOrder o c) (hAdj : IsAdjudication a c)
    : AdjudicationMembership a o c :=
  ⟨hOrder, hAdj⟩


theorem licensingMembership_intro {l : Licensing} {lic : License} {c : ComplaintText}
    (hLic : IsLicense lic c) (hLicensing : IsLicensing l c)
    : LicensingMembership l lic c :=
  ⟨hLic, hLicensing⟩


theorem agencyProceedingDef_intro_ruleMaking {c : ComplaintText}
    (rm : RuleMaking) (h : IsRuleMaking rm c) : AgencyProceedingDef c :=
  .viaRuleMaking rm h


theorem agencyProceedingDef_intro_adjudication {c : ComplaintText}
    (a : Adjudication) (h : IsAdjudication a c) : AgencyProceedingDef c :=
  .viaAdjudication a h


theorem agencyProceedingDef_intro_licensing {c : ComplaintText}
    (l : Licensing) (h : IsLicensing l c) : AgencyProceedingDef c :=
  .viaLicensing l h


theorem agencyActionDef_intro_rule {c : ComplaintText}
    (r : Rule) (h : IsRule r c) : AgencyActionDef c :=
  .viaRule r h


theorem agencyActionDef_intro_order {c : ComplaintText}
    (o : Order) (h : IsOrder o c) : AgencyActionDef c :=
  .viaOrder o h


theorem agencyActionDef_intro_license {c : ComplaintText}
    (l : License) (h : IsLicense l c) : AgencyActionDef c :=
  .viaLicense l h


theorem agencyActionDef_intro_sanction {c : ComplaintText}
    (s : ApaSanction) (h : IsApaSanction s c) : AgencyActionDef c :=
  .viaSanction s h


theorem agencyActionDef_intro_relief {c : ComplaintText}
    (rl : Relief) (h : IsRelief rl c) : AgencyActionDef c :=
  .viaRelief rl h

end Proving.USC.T05.Ontology
