











import Proving.USC.T18.Ch3.Structure.Statute

namespace Proving.USC.T18.Ch3.Structure

open Proving.USC.Common

theorem coherent41_intro {c : ComplaintText}
    (fineExists : ReferencedSectionExists edge_41_incorporates_3571 c)
    : Coherent41 c :=
  ⟨fineExists⟩

theorem coherent42_intro {c : ComplaintText}
    (phsaSaved   : SavingsPreserved edge_42_savings_phsa c)
    (ffdcaSaved  : SavingsPreserved edge_42_savings_ffdca c)
    (plantPestOk : IncorporationHonored edge_42_incorporates_plantpest c)
    (fineExists  : ReferencedSectionExists edge_42_incorporates_3571 c)
    : Coherent42 c :=
  ⟨phsaSaved, ffdcaSaved, plantPestOk, fineExists⟩

theorem coherent43_intro {c : ComplaintText}
    (familyOk       : IncorporationHonored edge_43_incorporates_115 c)
    (restitutionOk  : ReferencedSectionExists edge_43_incorporates_3663 c)
    (restitutionAOk : ReferencedSectionExists edge_43_incorporates_3663A c)
    (speechSaved    : SavingsPreserved edge_43_savings_firstamendment c)
    (stateLawSaved  : SavingsPreserved edge_43_savings_nonpreemption c)
    (fineExists     : ReferencedSectionExists edge_43_incorporates_3571 c)
    : Coherent43 c :=
  ⟨familyOk, restitutionOk, restitutionAOk, speechSaved, stateLawSaved, fineExists⟩

theorem coherent47_intro {c : ComplaintText}
    (fineExists : ReferencedSectionExists edge_47_incorporates_3571 c)
    : Coherent47 c :=
  ⟨fineExists⟩

theorem coherent48_intro {c : ComplaintText}
    (rfraExists    : ReferencedSectionExists edge_48_subjectTo_rfra c)
    (sbiOk         : IncorporationHonored edge_48_incorporates_1365 c)
    (s2241Exists   : ReferencedSectionExists edge_48_incorporates_2241 c)
    (s2242Exists   : ReferencedSectionExists edge_48_incorporates_2242 c)
    (stateLawSaved : SavingsPreserved edge_48_savings_nonpreemption c)
    (fineExists    : ReferencedSectionExists edge_48_incorporates_3571 c)
    : Coherent48 c :=
  ⟨rfraExists, sbiOk, s2241Exists, s2242Exists, stateLawSaved, fineExists⟩

theorem coherent49_intro {c : ComplaintText}
    (awaOk      : IncorporationHonored edge_49_incorporates_awa2156 c)
    (awaExists  : ReferencedSectionExists edge_49_incorporates_awa2156 c)
    (fineExists : ReferencedSectionExists edge_49_incorporates_3571 c)
    : Coherent49 c :=
  ⟨awaOk, awaExists, fineExists⟩

end Proving.USC.T18.Ch3.Structure
