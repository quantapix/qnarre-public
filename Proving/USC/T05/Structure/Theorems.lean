





import Proving.USC.T05.Structure.Statute
import Proving.USC.T05.Structure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T05.Structure

open Proving.USC.Common

theorem coherent554_intro {c : ComplaintText}
    (inc556 : IncorporationHonored edge_554_incorporates_556 c)
    (inc557 : IncorporationHonored edge_554_incorporates_557 c)
    (exc556Exists : ReferencedSectionExists edge_554_incorporates_556 c)
    (exc557Exists : ReferencedSectionExists edge_554_incorporates_557 c)
    (carveout : ExceptionApplies edge_554_exceptAsProvided_carveouts c)
    : Coherent554 c :=
  ⟨inc556, inc557, exc556Exists, exc557Exists, carveout⟩

theorem coherent556_intro {c : ComplaintText}
    (inc557 : IncorporationHonored edge_556_incorporates_557 c)
    (inc557d : IncorporationHonored edge_556_incorporates_557d c)
    (app554Exists : ReferencedSectionExists edge_556_incorporates_554 c)
    (off3105Exists : ReferencedSectionExists edge_556_incorporates_3105 c)
    (burdenExc : ExceptionApplies edge_556d_exceptAsProvided_statute c)
    : Coherent556 c :=
  ⟨inc557, inc557d, app554Exists, off3105Exists, burdenExc⟩

theorem coherent557_intro {c : ComplaintText}
    (inc556 : IncorporationHonored edge_557_incorporates_556 c)
    (inc556Exists : ReferencedSectionExists edge_557_incorporates_556 c)
    (sub554d : OverrideTriggered edge_557_subjectTo_554d c)
    (exParte : OverrideTriggered edge_557d_subjectTo_557a c)
    : Coherent557 c :=
  ⟨inc556, inc556Exists, sub554d, exParte⟩

theorem coherent701_intro {c : ComplaintText}
    (inc551 : IncorporationHonored edge_701_incorporates_551 c)
    (def551Exists : ReferencedSectionExists edge_701_incorporates_551 c)
    (reviewExc : ExceptionApplies edge_701_exceptAsProvided_preclusion c)
    : Coherent701 c :=
  ⟨inc551, def551Exists, reviewExc⟩

theorem coherent702_intro {c : ComplaintText}
    (savingsExists : ReferencedSectionExists edge_702_savings_otherLaw c)
    (savingsHonored : OverrideTriggered edge_702_savings_otherLaw c)
    : Coherent702 c :=
  ⟨savingsExists, savingsHonored⟩

theorem coherent704_intro {c : ComplaintText}
    (finalityExc : ExceptionApplies edge_704_exceptAsProvided_statute c)
    : Coherent704 c :=
  ⟨finalityExc⟩

theorem coherent706_intro {c : ComplaintText}
    (inc556 : IncorporationHonored edge_706_incorporates_556 c)
    (inc557 : IncorporationHonored edge_706_incorporates_557 c)
    (rec556Exists : ReferencedSectionExists edge_706_incorporates_556 c)
    (rec557Exists : ReferencedSectionExists edge_706_incorporates_557 c)
    : Coherent706 c :=
  ⟨inc556, inc557, rec556Exists, rec557Exists⟩


theorem reviewBarred_byPreclusion_intro {c : ComplaintText}
    (h : ExceptionApplies edge_701_exceptAsProvided_preclusion c)
    : ReviewBarred c :=
  .byPreclusion h


theorem reviewBarred_byFinality_intro {c : ComplaintText}
    (h : ExceptionApplies edge_704_exceptAsProvided_statute c)
    : ReviewBarred c :=
  .byFinality h

end Proving.USC.T05.Structure
