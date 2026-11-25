








import Proving.USC.T08.Ontology.Types
import Proving.USC.T08.Ontology.Predicates
import Proving.USC.T08.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T08.Ontology

open Proving.USC.Common


theorem alienMembership_intro {p c}
    (hPerson : IsPerson p c) (hNotNat : ¬ IsNationalOfUS p c)
    : AlienMembership p c := ⟨hPerson, hNotNat⟩


theorem nationalOfUS_intro_citizen {p c}
    (h : IsCitizenOfUS p c) : NationalOfUSMembership p c :=
  .citizen h



theorem nationalOfUS_intro_allegiance {p c}
    (h : OwesPermanentAllegianceToUS p c) : NationalOfUSMembership p c :=
  .permanentAllegiance h


theorem personMembership_intro_individual {p c}
    (h : IsIndividual p c) : PersonMembership p c :=
  .individual h


theorem personMembership_intro_organization {p c} (e : Entity)
    (h : IsOrganization e c) : PersonMembership p c :=
  .organization e h


theorem immigrantMembership_intro {p c}
    (hAlien : IsAlien p c) (hNotNon : ¬ IsNonimmigrant p c)
    : ImmigrantMembership p c := ⟨hAlien, hNotNon⟩


theorem lprMembership_intro {p c}
    (hLPR : IsLawfulPermanentResident p c) (hImm : IsImmigrant p c)
    : LPRMembership p c := ⟨hLPR, hImm⟩


theorem refugeeMembership_intro {p c}
    (hPerson : IsPerson p c) (hRefugee : IsRefugee p c)
    : RefugeeMembership p c := ⟨hPerson, hRefugee⟩



theorem aggravatedFelonyMembership_intro {o cv c}
    (hAgg : IsAggravatedFelony o c) (hConv : IsConviction cv c)
    : AggravatedFelonyMembership o cv c := ⟨hAgg, hConv⟩

end Proving.USC.T08.Ontology
