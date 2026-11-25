







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T29.SelfOrgRep.Elements.Types
import Proving.USC.T29.SelfOrgRep.Elements.Predicates
import Proving.USC.T29.SelfOrgRep.Elements.Statute

namespace Proving.USC.T29.SelfOrgRep.Elements

open Proving.USC.Common


theorem section157_intro {resp p : Person} {a : ProtectedActivity} {c : ComplaintText}
    (hEmp : IsProtectedEmployee p c)
    (hAct : EngagedInProtectedActivity p a c)
    (hInt : InterferedWithExercise resp p a c)
    (hNot : ¬ JustifiedByUnionSecurityAgreement resp a c) :
    Section157 resp p a c :=
  ⟨hEmp, hAct, hInt, hNot⟩


theorem section159a_intro {rep : Person} {u : BargainingUnit} {c : ComplaintText}
    (hMaj : DesignatedByMajority rep u c)
    (hApp : IsAppropriateUnit u c)
    (hScope : WithinBargainingScope c) :
    Section159a rep u c :=
  ⟨hMaj, hApp, hScope⟩


theorem section159cCore_intro {u : BargainingUnit} {c : ComplaintText}
    (hApp : IsAppropriateUnit u c)
    (hComm : QuestionOfRepresentationAffectingCommerce u c)
    (hNoElec : ¬ ValidElectionWithinTwelveMonths u c) :
    Section159cCore u c :=
  ⟨hApp, hComm, hNoElec⟩


theorem validRepresentationCase_employeeSide_intro {u : BargainingUnit} {c : ComplaintText}
    (pet : RepresentationPetition)
    (hFiled : EmployeeSidePetitionFiled pet c)
    (hCore : Section159cCore u c) :
    ValidRepresentationCase u c :=
  .employeeSide pet hFiled hCore


theorem validRepresentationCase_employerSide_intro {u : BargainingUnit} {c : ComplaintText}
    (pet : RepresentationPetition)
    (hFiled : EmployerSidePetitionFiled pet c)
    (hCore : Section159cCore u c) :
    ValidRepresentationCase u c :=
  .employerSide pet hFiled hCore

end Proving.USC.T29.SelfOrgRep.Elements
