import Proving.USC.Common.Types
import Proving.USC.T18.RacketeeringActs.Structure.Types
import Proving.USC.T18.RacketeeringActs.Structure.Predicates
import Proving.USC.T18.RacketeeringActs.Structure.Statute









namespace Proving.USC.T18.RacketeeringActs.Structure

open Proving.USC.Common

theorem coherent1961_intro {c : ComplaintText}
    (ex1951 : ReferencedSectionExists edge_1961_incorporates_1951 c)
    (ex1952 : ReferencedSectionExists edge_1961_incorporates_1952 c)
    (ex1956 : ReferencedSectionExists edge_1961_incorporates_1956 c)
    (ex1957 : ReferencedSectionExists edge_1961_incorporates_1957 c)
    (inc1951 : IncorporationHonored edge_1961_incorporates_1951 c)
    (inc1952 : IncorporationHonored edge_1961_incorporates_1952 c)
    (inc1956 : IncorporationHonored edge_1961_incorporates_1956 c)
    (inc1957 : IncorporationHonored edge_1961_incorporates_1957 c)
    : Coherent1961 c :=
  ⟨ex1951, ex1952, ex1956, ex1957, inc1951, inc1952, inc1956, inc1957⟩

theorem coherent1951_intro {c : ComplaintText}
    (resolvesAsTarget : ReferencedSectionExists edge_1961_incorporates_1951 c)
    : Coherent1951 c :=
  ⟨resolvesAsTarget⟩

theorem coherent1952_intro {c : ComplaintText}
    (ex1956 : ReferencedSectionExists edge_1952_incorporates_1956 c)
    (ex1957 : ReferencedSectionExists edge_1952_incorporates_1957 c)
    (inc1956 : IncorporationHonored edge_1952_incorporates_1956 c)
    (inc1957 : IncorporationHonored edge_1952_incorporates_1957 c)
    : Coherent1952 c :=
  ⟨ex1956, ex1957, inc1956, inc1957⟩

theorem coherent1956_intro {c : ComplaintText}
    (ex1961 : ReferencedSectionExists edge_1956_incorporates_1961 c)
    (inc1961 : IncorporationHonored edge_1956_incorporates_1961 c)
    (ex1957 : ReferencedSectionExists edge_1956_incorporates_1957 c)
    : Coherent1956 c :=
  ⟨ex1961, inc1961, ex1957⟩

theorem coherent1957_intro {c : ComplaintText}
    (ex1956 : ReferencedSectionExists edge_1957_incorporates_1956 c)
    (inc1956 : IncorporationHonored edge_1957_incorporates_1956 c)
    : Coherent1957 c :=
  ⟨ex1956, inc1956⟩

end Proving.USC.T18.RacketeeringActs.Structure
