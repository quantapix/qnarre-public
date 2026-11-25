








import Proving.USC.T18.Obstruction.Ontology.Statute

namespace Proving.USC.T18.Obstruction.Ontology

open Proving.USC.Common (ComplaintText Person Time)


theorem section1503Object_intro {cp j c}
    (hPersonnel : IsCourtPersonnel cp c)
    (hJustice : IsDueAdministrationOfJustice j c)
    (hNexus : HasObstructionNexus c)
    : Section1503Object cp j c :=
  ⟨hPersonnel, hJustice, hNexus⟩


theorem section1512WitnessObject_intro {op w c}
    (hProceeding : IsOfficialProceeding op c)
    (hWitness : IsWitness w c)
    (hNexus : HasObstructionNexus c)
    : Section1512WitnessObject op w c :=
  ⟨hProceeding, hWitness, hNexus⟩


theorem section1512InformantObject_intro {o fo c}
    (hOfficer : IsLawEnforcementOfficer o c)
    (hOffense : IsFederalOffense fo c)
    (hNexus : HasObstructionNexus c)
    : Section1512InformantObject o fo c :=
  ⟨hOfficer, hOffense, hNexus⟩


theorem section1512DocumentObject_intro {r op c}
    (hObject : IsEvidentiaryObject r c)
    (hProceeding : IsOfficialProceeding op c)
    (hNexus : HasObstructionNexus c)
    : Section1512DocumentObject r op c :=
  ⟨hObject, hProceeding, hNexus⟩


theorem section1513Object_intro {w op c}
    (hWitness : IsWitness w c)
    (hProceeding : IsOfficialProceeding op c)
    (hNexus : HasObstructionNexus c)
    : Section1513Object w op c :=
  ⟨hWitness, hProceeding, hNexus⟩



theorem chapter73_of_witnessTampering {op w c}
    (h : Section1512WitnessObject op w c) : Chapter73ObstructionObject c :=
  .witnessTampering h


theorem chapter73_of_officerOrJuror {cp j c}
    (h : Section1503Object cp j c) : Chapter73ObstructionObject c :=
  .officerOrJuror h


theorem chapter73_of_retaliation {w op c}
    (h : Section1513Object w op c) : Chapter73ObstructionObject c :=
  .retaliation h

end Proving.USC.T18.Obstruction.Ontology
