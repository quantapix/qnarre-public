






import Proving.USC.T18.Ch13.Ontology.Statute

namespace Proving.USC.T18.Ch13.Ontology

open Proving.USC.Common


theorem isFacility_intro {f s c}
    (hRHS : IsReproductiveHealthServices s c) (hFac : IsFacility f c)
    : FacilityMembership f s c := ⟨hRHS, hFac⟩


theorem isReproductiveHealthServices_intro {s f c}
    (hFac : IsFacility f c) (hRHS : IsReproductiveHealthServices s c)
    : ReproductiveHealthServicesMembership s f c := ⟨hFac, hRHS⟩


theorem isPhysicalObstruction_intro {a f c}
    (hFac : IsFacility f c) (hObs : IsPhysicalObstruction a c)
    : PhysicalObstructionMembership a f c := ⟨hFac, hObs⟩

end Proving.USC.T18.Ch13.Ontology
