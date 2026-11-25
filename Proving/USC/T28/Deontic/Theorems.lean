import Proving.USC.T28.Deontic.Types
import Proving.USC.T28.Deontic.Predicates
import Proving.USC.T28.Deontic.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T28.Deontic

open Proving.USC.Common




theorem power1343a_intro {ct : Court} {p : Person} {a : CivilAction} {c : ComplaintText}
    (hAddr : AddresseeIsDistrictCourt ct c)
    (hAuth : CivilActionAuthorizedByLaw a c)
    (hComm : CommencedByPerson p a c)
    (hBasis : JurisdictionalBasis1343 a c) :
    Power1343a ct p a c :=
  ⟨hAddr, hAuth, hComm, hBasis⟩


theorem permission1746_intro {m : Matter} {c : ComplaintText}
    (hCond : MatterRequiresSwornSupport1746 m c)
    (hExc : OutsideExceptedCategories1746 m c) :
    Permission1746 m c :=
  ⟨hCond, hExc⟩




theorem unswornDeclarationEffective1746_intro {p : Person} {m : Matter} {d : Declaration} {c : ComplaintText}
    (hPerm : Permission1746 m c)
    (hMade : UnswornWrittenDeclarationMade1746 p m d c)
    (hSub : SubscribedTrueUnderPenaltyOfPerjury p d c)
    (hDated : DeclarationDated1746 d c)
    (hForm : PrescribedForm1746 d c) :
    UnswornDeclarationEffective1746 p m d c :=
  ⟨hPerm, hMade, hSub, hDated, hForm⟩

end Proving.USC.T28.Deontic
