
























import Proving.USC.T05.ScopeOfReview.Elements.Theorems
import Proving.USC.T05.ScopeOfReview.Deontic.Theorems
import Proving.USC.T05.ScopeOfReview.Ontology.Theorems
import Proving.USC.T05.ScopeOfReview.Procedure.Theorems
import Proving.USC.T05.ScopeOfReview.Structure.Theorems

import Proving.USC.T05.Elements.Theorems
import Proving.USC.T05.Remedy.Theorems

namespace Proving.USC.T05.ScopeOfReview.Bridge

open Proving.USC.Common













namespace S706

variable (p : Person) (c : ComplaintText)






axiom corr_elem_deontic_706
    (he : Elements.AgencyAction)
    (hSet : Elements.Section706SetAside p he c) :
    ∃ (e : Entity) (d : Deontic.Defect706),
      Deontic.Obligation706_2Discharged e d c


theorem s706_elements_implies_deontic
    (he : Elements.AgencyAction)
    (hSet : Elements.Section706SetAside p he c) :
    ∃ (e : Entity) (d : Deontic.Defect706),
      Deontic.Obligation706_2Discharged e d c :=
  corr_elem_deontic_706 p c he hSet




axiom corr_elem_ontology_706
    (he : Elements.AgencyAction)
    (hSet : Elements.Section706SetAside p he c) :
    ∃ (court : Ontology.ReviewingCourt) (a : Ontology.AgencyAction)
      (g : Ontology.SetAsideGround) (r : Ontology.Record),
      Ontology.SetAsideMembership court a g r c


theorem s706_elements_implies_ontology
    (he : Elements.AgencyAction)
    (hSet : Elements.Section706SetAside p he c) :
    ∃ (court : Ontology.ReviewingCourt) (a : Ontology.AgencyAction)
      (g : Ontology.SetAsideGround) (r : Ontology.Record),
      Ontology.SetAsideMembership court a g r c :=
  corr_elem_ontology_706 p c he hSet





axiom corr_elem_procedure_706
    (he : Elements.AgencyAction)
    (hSet : Elements.Section706SetAside p he c) :
    ∃ (a : Procedure.AgencyAction) (r : Procedure.AdminRecord),
      Procedure.ProperScopeOfReview a r c


theorem s706_elements_implies_procedure
    (he : Elements.AgencyAction)
    (hSet : Elements.Section706SetAside p he c) :
    ∃ (a : Procedure.AgencyAction) (r : Procedure.AdminRecord),
      Procedure.ProperScopeOfReview a r c :=
  corr_elem_procedure_706 p c he hSet





axiom corr_elem_structure_706
    (he : Elements.AgencyAction)
    (hSet : Elements.Section706SetAside p he c) :
    Structure.Coherent706E c


theorem s706_elements_implies_structure
    (he : Elements.AgencyAction)
    (hSet : Elements.Section706SetAside p he c) :
    Structure.Coherent706E c :=
  corr_elem_structure_706 p c he hSet

end S706








namespace S705

variable (p : Person) (c : ComplaintText)





axiom corr_elem_procedure_705
    (court : Elements.ReviewingCourt) (a : Elements.AgencyAction)
    (hSec : Elements.Section705 p court a c) :
    ∃ (pa : Procedure.AgencyAction), Procedure.ReliefPendingReview pa c


theorem s705_elements_implies_procedure
    (court : Elements.ReviewingCourt) (a : Elements.AgencyAction)
    (hSec : Elements.Section705 p court a c) :
    ∃ (pa : Procedure.AgencyAction), Procedure.ReliefPendingReview pa c :=
  corr_elem_procedure_705 p c court a hSec




axiom corr_elem_deontic_705
    (court : Elements.ReviewingCourt) (a : Elements.AgencyAction)
    (hSec : Elements.Section705 p court a c) :
    Deontic.Permission705CourtExercised p c


theorem s705_elements_implies_deontic
    (court : Elements.ReviewingCourt) (a : Elements.AgencyAction)
    (hSec : Elements.Section705 p court a c) :
    Deontic.Permission705CourtExercised p c :=
  corr_elem_deontic_705 p c court a hSec




axiom corr_elem_ontology_705
    (court : Elements.ReviewingCourt) (a : Elements.AgencyAction)
    (hSec : Elements.Section705 p court a c) :
    ∃ (oc : Ontology.ReviewingCourt) (oa : Ontology.AgencyAction),
      Ontology.ReliefPendingReviewMembership oc oa c


theorem s705_elements_implies_ontology
    (court : Elements.ReviewingCourt) (a : Elements.AgencyAction)
    (hSec : Elements.Section705 p court a c) :
    ∃ (oc : Ontology.ReviewingCourt) (oa : Ontology.AgencyAction),
      Ontology.ReliefPendingReviewMembership oc oa c :=
  corr_elem_ontology_705 p c court a hSec

end S705















namespace Corroboration706







axiom corr_setAsideTheory_to_bareGround
    (a : ScopeOfReview.Elements.AgencyAction) (c : ComplaintText)
    (hG : ScopeOfReview.Elements.SetAsideTheory a c) :
    ∃ (act : Proving.USC.T05.Elements.AgencyAction) (pr : Proving.USC.T05.Elements.Proceeding),
      Proving.USC.T05.Elements.Section706Ground act pr c




theorem s706_scopeOfReview_corroborates_bareT05
    (p : Person) (c : ComplaintText)
    (a : ScopeOfReview.Elements.AgencyAction)
    (hSet : ScopeOfReview.Elements.Section706SetAside p a c) :
    ∃ (act : Proving.USC.T05.Elements.AgencyAction) (pr : Proving.USC.T05.Elements.Proceeding),
      Proving.USC.T05.Elements.Section706Ground act pr c :=
  corr_setAsideTheory_to_bareGround a c hSet.ground

end Corroboration706









namespace Corroboration705

variable (p : Person) (c : ComplaintText)






axiom corr_section705_to_remedy
    (court : ScopeOfReview.Elements.ReviewingCourt) (a : ScopeOfReview.Elements.AgencyAction)
    (hSec : ScopeOfReview.Elements.Section705 p court a c) :
    Proving.USC.T05.Remedy.InterimRelief705 p c




theorem s705_scopeOfReview_corroborates_remedy
    (court : ScopeOfReview.Elements.ReviewingCourt) (a : ScopeOfReview.Elements.AgencyAction)
    (hSec : ScopeOfReview.Elements.Section705 p court a c) :
    Proving.USC.T05.Remedy.InterimRelief705 p c :=
  corr_section705_to_remedy p c court a hSec

end Corroboration705

end Proving.USC.T05.ScopeOfReview.Bridge
