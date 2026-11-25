import Proving.USC.T18.Ch73.Ontology.Types
import Proving.USC.T18.Ch73.Ontology.Predicates
import Proving.USC.T18.Ch73.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false









namespace Proving.USC.T18.Ch73.Ontology

open Proving.USC.Common



theorem federalOfficialProceeding_intro
    {p : OfficialProceeding} {c : ComplaintText}
    (hProceeding : IsOfficialProceeding p c) (hNexus : HasFederalNexus p c)
    : FederalOfficialProceeding p c :=
  ⟨hProceeding, hNexus⟩



theorem witnessInProceeding_intro
    {w : Witness} {p : OfficialProceeding} {c : ComplaintText}
    (hWitness : IsWitness w c) (hProceeding : IsOfficialProceeding p c)
    : WitnessInProceeding w p c :=
  ⟨hWitness, hProceeding⟩



def section1503Protectee_courtOfficer_intro
    {c : ComplaintText} (o : CourtOfficer) (h : IsCourtOfficer o c)
    : Section1503Protectee c :=
  .asCourtOfficer o h


def section1503Protectee_juror_intro
    {c : ComplaintText} (j : Juror) (h : IsGrandOrPetitJuror j c)
    : Section1503Protectee c :=
  .asJuror j h

end Proving.USC.T18.Ch73.Ontology
