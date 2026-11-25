






import Proving.USC.T22.Ontology.Sub.Statute

namespace Proving.USC.T22.Ontology.Sub
open Proving.USC.Common



theorem satisfiesMinimumStandards_intro {g : Government} {c : ComplaintText}
    (hProhibit : ProhibitsAndPunishesTrafficking g c)
    (hCommensurate : PrescribesCommensuratePunishment g c)
    (hStringent : PrescribesStringentPunishment g c)
    (hEfforts : MakesSeriousAndSustainedEfforts g c)
    : SatisfiesMinimumStandards g c :=
  ⟨hProhibit, hCommensurate, hStringent, hEfforts⟩



theorem traffickingApparatusInhabited_intro
    {tf office grp : Entity} {dir : Person} {c : ComplaintText}
    (hTaskForce : IsInteragencyTaskForce tf c)
    (hOffice : IsOfficeToMonitorAndCombatTrafficking office c)
    (hDirector : IsTraffickingOfficeDirector dir c)
    (hGroup : IsSeniorPolicyOperatingGroup grp c)
    : TraffickingApparatusInhabited tf office grp dir c :=
  ⟨hTaskForce, hOffice, hDirector, hGroup⟩

end Proving.USC.T22.Ontology.Sub
